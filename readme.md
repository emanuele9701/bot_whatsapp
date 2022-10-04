#Init 

## Requisiti minimi

- Node 14
- PHP = 7.4

## Passaggi per attivare il servizio

1. Eseguire il comando <em>npm update</em> nella cartella principale
2. Entrare nella cartella <em>api/whatsapp_chats_api_v3</em>
3. Eseguire il comando <em>composer update</em>
4. Eseguire il comando <em>php artisan key:generate</em>
5. Eseguire il comando <em>php artisan migrate</em>
6. Infine, tornare nella root principale ed eseguire il comando <em>node start.js</em>