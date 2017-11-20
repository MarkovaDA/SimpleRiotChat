<chat-header>
    <div class='ui attached segment header'>
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
        </div>
    </div>

    <script>
        this.isShown = true;

        this.onSlideDown = () => {
            this.trigger('SLIDE_DOWN');
            this.isShown = !this.isShown;
        };

        this.onSlideUp = () => {
            this.trigger('SLIDE_UP');
            this.isShown = !this.isShown;
        };
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