<div class="row messagge_me" v-for="message in messages_to">
    <div class="card card_to" style="width: 18rem;">
        <img v-if="message.image" class="card-img-top" :src="'data:image/jpeg;base64,' + message.image"
            style="width: 250px !important;">
        <div class="card-body">
            <p class="card-text">@{{ message.text }}</p>
            <small class="info-data-me">@{{ message.data }}</small>
        </div>
    </div>
</div>
