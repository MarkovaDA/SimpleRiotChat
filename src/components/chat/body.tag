<chat-body>

    <div class="ui attached segment" id="wrapper">
        <message each={ item in messages } text={ item } whose={ false } />
    </div>

    <script>
        import './message.tag';

        this.store = this.mixin();//redux storage

        this.messages = [];//chat messages

        //catch new message from server and update view
        this.store.subscribe(() => {
            this.messages = [...this.messages, this.store.getState().lastMessage];
            this.update();
        });

        this.on('mount', () => {
            this.container = $('#wrapper');
        });

        this.on('updated', () => {
            //scroll the chat content if only user doesn't scroll to up himself
            if (this.container.scrollTop() + this.container.height() >= this.container.prop('scrollHeight')) {
                this.scrollChat();
            }
        });

        //scroll the chat content to bottom
        this.scrollChat = () => {
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