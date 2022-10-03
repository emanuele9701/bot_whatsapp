@if ($image != null)
    <div class="row messagge_me">
        <div class="card" style="width: 18rem;">
            <img class="card-img-top" src="{{ $image }}" alt="Card image cap">
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
