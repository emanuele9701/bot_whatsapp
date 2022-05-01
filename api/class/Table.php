<?php



/**
 * Rappresenta una tabella sul database.
 * 
 * Questa classe ha anche lo scopo di fornire metodi
 * per rimuovere il più possibile l'SQL dalle query 
 * più comuni, e fornire metodi legacy per poter essere
 * integrata con il codice già esistente.
 * 
 * @author Stefano <buico@archivium.digital>
 */
class Table
{
    protected $conn;
    protected $name;
    protected $executes;

    /**
     * @param Connection $conn  Istanza di connessione
     * @param string $name  Nome della tabella
     * @param boolean $executes se false, non esegue la query ma ne ritorna la stringa
     */
    public function __construct(Connection $conn = null, $name, $executes = true)
    {
        $this->conn = $conn;
        $this->name = $name;
        $this->executes = $executes;
    }

    /**
     * Esattamente come nel suo comportamento legacy, esegue una select
     * sulla tabella, con le colonne specificate e i parametri passati
     *
     * @param string $where     Stringa di query da appendere dopo
     *                          'SELECT [columns] FROM [table]'
     * @param array $columns    Array delle colonne da selezionare
     * @param array $params     Array delle variabili da passare alla query
     * @param boolean $execute  Se impostato, non esegue la query e la restituisce
     * 
     * @return array    Array associativo dei risultati della query
     */
    public function select($where = "", $columns = null, $params = [])
    {
        if (!isset($columns) || empty($columns)) {
            $columns = ['*'];
        }
        
        $columns = implode(', ', $columns);

        // Rispetta il comportamento legacy, andrà espansa più avanti
        return $this->query("SELECT $columns FROM {$this->name} $where;", $params);
    }

    /**
     * Effettua un insert nella tabella
     *
     * @param array|Object $what   Array chiave => valore dei dati da inserire
     * @param boolean $execute  Se impostato, non esegue la query e la restituisce
     * @return integer  ID auto-increment del record inserito  
     */
    public function insert(array $what)
    {

        $columns = implode(', ', array_keys($what));

        $params = "";
        $params = implode(', ', array_map(function ($value) {
            return ":$value";
        }, array_keys($what)));
        return $this->query("INSERT INTO {$this->name} ($columns) VALUES ($params);", $what);
    }

    /**
     * Aggiorna un record con dati forniti secondo le condizioni stabilite
     *
     * @param array $what   Array chiave => valore dei dati da aggiornare
     * @param array $where  Array chiave => valore delle condizioni di update
     * @param boolean $execute  Se impostato, non esegue la query e la restituisce
     * @return integer  Numero di righe su cui ha avuto effetto
     */
    public function update(array $what, $where)
    {

        $params = array_map(function ($column) {
            return "$column = :$column";
        }, array_keys($what));
        $sets = implode(', ', $params);

        $update = "UPDATE {$this->name} SET $sets";

        if (!isset($where) || empty($where)) {
            $query = $this->conn->getQuery($update, $what, false); // Non esegue la query
            throw new Exception("Nessuna condizione specificata per l'update, la query: '$query' non verrà eseguita");
        }

        foreach ($where as $column => $value) {
            if (isset($what[$column])) {
                $tmp = $value;
                unset($where[$column]);
                $where[$column . "___" . uniqid()] = $tmp;
            }
        }

        $conditions = array_map(function ($column) {
            $columnname = explode("___", $column)[0];
            return "$columnname = :$column";
        }, array_keys($where));
        $condition = implode(' AND ', $conditions);


        return $this->query("$update WHERE $condition;", array_merge($what, $where));
    }

    /**
     * 
     *
     * @param array $where  Array chiave => valore delle condizioni di delete
     * @param boolean $execute  Se impostato, non esegue la query e la restituisce
     * @return integer  Numero di righe su cui ha avuto effetto
     */
    public function delete(array $where)
    {
        $delete = "DELETE FROM {$this->name}";

        if (!isset($where) || empty($where)) {
            throw new Exception("Nessuna condizione specificata per il delete, la query: '$delete' non verrà eseguita");
        }

        $conditions = array_map(function ($column) {
            return "$column = :$column";
        }, array_keys($where));
        $condition = implode(' AND ', $conditions);

        return $this->query("$delete WHERE $condition;", $where);
    }

    /**
     * Interfaccia diretta con la funzione query della classe Database.  
     * Da usare con parsimonia. Per la documentazione fare riferimento
     * al metodo originale
     * 
     * @return mixed|string
     */
    public function query($sql, $params = [], $type = null)
    {
        $conn = $this->conn;
        
        if ($this->executes === false) {
            return $conn->getQuery($sql, $params);
        }
        
        return $conn->query($sql, $params, $type);
    }

    /**
     * Ritorna una lista di colonne
     *
     * @return array
     */
    public function getColumns()
    {
        $conn = $this->conn;

        $driver = isset($conn) ? $conn->getDriver() : null;

        $columns = [];
        switch ($driver) {
            case 'sqlite':
                $columns = array_column($this->query("PRAGMA table_info({$this->name})", null, 'select'), 'name');
                break;
            case 'mysql':
                $columns = array_column($this->query("DESCRIBE {$this->name}", null, 'select'), 'Field');
                break;
        }

        return $columns;
    }
}
