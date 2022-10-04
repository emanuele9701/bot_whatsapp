@if ($image != null)
    <div class="row messagge_from">
        <div class="card card_from" style="width: auto;">
            <img class="card-img-top" src="data:image/jpeg;base64, {{ $image }}" style="width: 250px !important;">
            <div class="card-body">
                <p class="card-text">{{ $text }}</p>
                <small class="info-data-me">{{ $data }}</small>
            </div>
        </div>
    </div>
@else
    <div class="row messagge_from">
        <p class=".text-data-from">{{ $text }}</p>
        <small class="info-data-from">{{ $data }}</small>
    </div>
@endif
