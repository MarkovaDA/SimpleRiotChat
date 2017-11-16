<chat-body>

    <div class="ui attached segment" id="wrapper">
        <message each={ item in messages } text={ item } whose={ false } />
    </div>


    <script>
        import './message.tag';

        this.store = this.mixin();

        this.messages = [];//chat messages

        this.store.subscribe(() => {
            this.messages = [...this.messages, this.store.getState().lastMessage];
            this.update();
        });

        this.on('mount', () => {
            this.container = $('#wrapper');
        });

        this.on('updated', () => {
            this.scrollChat();
        });

        this.scrollChat = () => {
            //scroll the chat content to bottom
            this.container.animate({
                scrollTop: this.container.prop('scrollHeight')
            }, 300);
        }
    </script>
    <style>
        .segment {
            border-bottom:none !important;
            height: 400px;
            overflow-y:scroll;
        }
    </style>
</chat-body>