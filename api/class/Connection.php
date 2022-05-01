<?php

/**
 * Wrapper di una connessione PDO, con astrazione delle query
 * 
 * @author Stefano  <buico@archivium.digital>
 */
class Connection
{
    /** @var PDO    Istanza di connessione al DB */
    protected $pdo;

    public function __construct($driver, $database, $host = null, $username = null, $password = null)
    {
        $dsn = "";
        switch ($driver) {
            case 'mysql':
                $dsn = "mysql:host=$host;dbname=$database";
                break;

            case 'sqlite':
                $dsn = "sqlite:$database";
                break;
        }

        $this->pdo = new PDO($dsn, $username, $password, [
            PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES   => false,
        ]);
    }

    /**
     * Fornisce l'istanza corrente di PDO
     *
     * @return PDO
     */
    public function getPDO()
    {
        return $this->pdo;
    }

    /**
     * Fornisce il nome del driver utilizzato dalla connessione attiva
     *
     * @return string
     */
    public function getDriver()
    {
        return $this->getPDO()->getAttribute(PDO::ATTR_DRIVER_NAME);
    }

    /**
     * Esegue una query e ne restituisce il risultato.
     * 
     * Il rilevamento della tipologia di query si basa sul fatto che, a
     * prescindere dal numero di innestamenti che puo' assumere una query,
     * il tipo di risultato che verra' restituito si basera' sempre sulla
     * prima parola dell'intera stringa di query
     *
     * @param string $sql           La query da eseguire
     * @param mixed|array $data     I dati per eseguire il prepared statement
     * @param string $type          Forza il tipo di query per comportarsi come una select, 
     *                              insert...
     * @return array|int|string     Differisce a seconda della prima parola della query.
     *                              - **SELECT**: Array associativo dei risultati
     *                              - **INSERT**: ID AUTO_INCREMENT dell'elemento inserito
     *                              - **UPDATE** e **DELETE**: Numero di righe su cui la
     *                                query è stata eseguita  
     */
    public function query($sql, $data = [], $type = null)
    {
        if (!isset($type)) {
            // Preleva la prima parola della query (lowercase) per capirne il tipo
            $type = explode(' ', trim(mb_strtolower($sql)))[0]; // -> select,insert...
        }

        // Accetta anche un singolo valore fuori da un array
        if (is_string($data) || is_numeric($data)) {
            $data = [$data];
        }

        if (!isset($data)) {
            $data = [];
        }

        // Si assicura che ogni query si concluda sempre con un ;
        $sql = rtrim(trim($sql), ';') . ';';

        $stmt = $this->pdo->prepare($sql);
        foreach ($data as $key => $value) {
            if (array_keys($data) === range(0, count($data) - 1)) {
                // Array non associativo
                $stmt->bindValue($key + 1, $value);
            } else {
                // Array associativo
                $stmt->bindValue(":$key", $value);
            }
        }
        $stmt->execute();

        if ($type === 'select') {
            return $stmt->fetchAll();
        } else if ($type === 'insert') {
            return $this->pdo->lastInsertId();
        }


        return $stmt->rowCount();
    }

    /**
     * Anziché eseguire una query, ne restituisce la stringa
     * che verrebbe eseguita, completa di parametri
     *
     * @param string La query da eseguire
     * @param mixed|array $data     I dati per eseguire il prepared statement
     * @return string
     */
    public function getQuery($sql, $data = [])
    {
        // Accetta anche un singolo valore fuori da un array
        if (is_string($data) || is_numeric($data)) {
            $data = [$data];
        }

        $keys = [];
        $formattedData = [];
        foreach ($data as $key => $value) {
            if (is_string($key)) {
                $keys[] = '/:' . $key . '/';
            } else {
                $keys[] = '/[?]/';
            }

            if (is_string($value)) {
                $formattedData[$key] = "'$value'";
            } else {
                $formattedData[$key] = $value;
            }
        }

        $query = preg_replace($keys, $formattedData, $sql, 1);

        return $query;
    }
}
