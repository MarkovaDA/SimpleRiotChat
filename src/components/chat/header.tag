<chat-header>
    <div class='ui attached segment'>
        <div class='chat-title'>
            <h2 class='ui header'>Simple chat</h2>
        </div>
        <div class='chat-control'>
            <button class='ui circular icon tiny button' onclick = {onSlideUp}>
                <i class='window minimize icon'></i>
            </button>
            <button class='ui circular icon tiny button' onclick = {onSlideDown}>
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

        this.onSlideDown = () => {
            emitterService.emit('SLIDE_DOWN_CHAT');
        };

        this.onSlideUp = () => {
            emitterService.emit('SLIDE_UP_CHAT');
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