<?php

namespace App\Http\Controllers;

use App\Models\Message;
use App\Models\Reaction;
use Illuminate\Http\Request;

class ReactionController extends Controller
{
    public function newReaction(Request $input)
    {
        $dati = json_decode(base64_decode($input->input('data')), true);
        $findMex = Message::where("message_id", $dati['message_id'])->count() > 0 ? true : false;
        if ($findMex) {
            $reaction = new Reaction();
            $reaction->reaction_id = $dati['reaction_id'];
            $reaction->message_id = $dati['message_id'];
            $reaction->reaction = $dati['reaction'];
            $reaction->reaction_time = date("Y-m-d H:i:s", $dati['reaction_time']);
            $reaction->save();
        } else {
            return ['esito' => false];
        }
        return ['esito' => true];
    }
}
