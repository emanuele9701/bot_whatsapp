<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;

class MediaController extends Controller
{
    //

    public function playAudio($idAudio)
    {
        $audioData = DB::table('media_messages')->where("id", '=', $idAudio)->get()->toArray();

        if (empty($audioData) || (!empty($audioData) && $audioData[0]->type !== "audio")) {
            return ['esito' => false, 'msg' => "Audio not found"];
        }
        // var_dump($audioData[0]->name);die;
        $file = Storage::disk('local2')->path($audioData[0]->name);
        if (File::isFile($file)) {
            return response(Storage::disk('local2')->get($audioData[0]->name), 200, ['Content-Type' => 'audio/ogg']);
        }
        return response()->json(['esito' => false, 'msg' => "no audio"]);
    }
}
