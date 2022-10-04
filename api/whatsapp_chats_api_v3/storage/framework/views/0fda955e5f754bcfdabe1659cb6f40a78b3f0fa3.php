<?php if($image != null): ?>
    <div class="row messagge_me">
        <div class="card" style="width: 18rem;">
            <img class="card-img-top" src="data:image/jpeg;base64,<?php echo e($image); ?>" alt="Card image cap">
            <div class="card-body">
                <p class="card-text"><?php echo e($text); ?></p>
                <small class="info-data-me"><?php echo e($data); ?></small>
            </div>
        </div>
    </div>
<?php else: ?>
    <div class="row messagge_me">
        <p class="text-data-me"><?php echo e($text); ?></p>
        <small class="info-data-me"><?php echo e($data); ?></small>
    </div>
<?php endif; ?>
<?php /**PATH C:\xampp\htdocs\bot_whatsapp\api\whatsapp_chats_api_v3\resources\views/messages/message_me.blade.php ENDPATH**/ ?>