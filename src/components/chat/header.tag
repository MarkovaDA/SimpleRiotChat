<chat-header>
    <div class='ui attached segment'>
        <div class='chat-title'>
            <h2 class='ui header'>Simple chat</h2>
        </div>
        <div class='chat-control'>
            <i class="alarm large icon"></i>
            <button class='ui circular icon tiny button' if = {isShown} onclick = {onSlideUp}>
                <i class='window minimize icon'></i>
            </button>
            <button class='ui circular icon tiny button' if = {!isShown} onclick = {onSlideDown}>
                <i class='window maximize icon'></i>
            </button>
            <button class='ui circular icon  tiny button'>
                <i class='maximize icon'></i>
            </button>
        </div>
    </div>

    <script>
        import { emitterService } from  '../../service/EmitterService';
        //this.emitter = this.mixin('emitter');
        this.isShown = true;

        this.onSlideDown = () => {
            emitterService.emit('SLIDE_DOWN_CHAT');
            this.isShown = !this.isShown;
        };

        this.onSlideUp = () => {
            emitterService.emit('SLIDE_UP_CHAT');
            this.isShown = !this.isShown;
        }

    </script>

    <style>
        .segment {
            border-bottom:none !important;
            border-radius: 5px 5px 0px 0px!important;
            display: flex;
            justify-content: space-between;
            background-color:lightgray !important;
        }
        .chat-control .icon {
        }
    </style>


</chat-header>