<?php

namespace App\Http\Controllers;

use App\Models\Chat;
use App\Models\Message;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller as BaseController;

class ChatMessagesController extends BaseController
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
    }

    public function all($idChat) {
        $allMex = Chat::getChatsLastMessagge($idChat);
        return $allMex;
    }

    public function insertNewMessage(Request $request)
    {
        $messages = json_decode(base64_decode($request->input('message')), true);
        if(empty($messages)) {
            return ['esito' => false,'msg' => 'No message!'];
        }
        if(isset($messages['fromMe'])) {
            $probMex = Message::findForMessageId($messages['message_id']);
            if (!$probMex) {
                Message::insert($messages);
            }
        } else {
            foreach ($messages as $message) {
                $probMex = Message::findForMessageId($message['message_id']);
                if (!$probMex) {
                    Message::insert($message);
                }
            }
        }
        return ['esito' => true, 'msg' => 'Ok'];
    }


    /**
     * Ritorna i messaggi che contengono un immagine
     */
    public function getMessageImage() {
        $idMessaggi = Message::getImageMessages();
        return $idMessaggi;
    }

    public function saveMessageImage(Request $request) {
        $imagesMessages = json_decode(base64_decode($request->input('data')),true)[0];
        $stream64Image = $imagesMessages['base64data'];
        // Storage::disk('local')->put("image_prova.jpeg",base64_decode($stream64Image));
        // var_dump(Storage::disk('local')->url('image_prova.jpeg'));
        die('here');
    }

    private function base64_to_jpeg($base64_string, $output_file) {
        // open the output file for writing
        $ifp = fopen( $output_file, 'wb' ); 
    
        // split the string on commas
        // $data[ 0 ] == "data:image/png;base64"
        // $data[ 1 ] == <actual base64 string>
        $data = explode( ',', $base64_string );
    
        // we could add validation here with ensuring count( $data ) > 1
        fwrite( $ifp, base64_decode( $data[ 1 ] ) );
    
        // clean up the file resource
        fclose( $ifp ); 
    
        return $output_file; 
    }
}
