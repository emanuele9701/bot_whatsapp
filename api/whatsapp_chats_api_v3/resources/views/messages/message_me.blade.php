@if ($image != null)
    <div class="row messagge_me">
        <div class="card card_to" style="width: 18rem;">
            <img class="card-img-top" src="data:image/jpeg;base64,{{ $image }}" style="width: 250px !important;">
            <div class="card-body">
                <p class="card-text">{{ $text }}</p>
                <small class="info-data-me">{{ $data }}</small>
            </div>
        </div>
    </div>
@else
    <div class="row messagge_me">
        <p class="text-data-me">{{ $text }}</p>
        <small class="info-data-me">{{ $data }}</small>
    </div>
@endif
