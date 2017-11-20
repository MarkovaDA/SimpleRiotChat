<chat-body>

    <div class='ui attached ui segment' id='wrapper'>
        <message each={ item in messages } text={ item } whose={ false } />
    </div>

    <script>
        import './message.tag';

        this.store = this.mixin('store');//redux storage

        this.messages = [];

        this.store.subscribe(() => {
            this.messages = [...this.messages, this.store.getState().lastMessage];
            this.update();
        });

        this.on('mount', () => {
            this.container = $('#wrapper');
        });

        this.on('updated', () => {
            //скроллим чат, если клиент не прокрутил выше ранее
            if (this.container.scrollTop() + this.container.height() >= this.container.prop('scrollHeight')) {
                this.scrollChat();
            }
        });

        this.scrollChat = () => {
            this.container.animate({
                scrollTop: this.container.prop('scrollHeight')
            }, 300);
        };

        this.getContainer = () => {
            return this.container;
        };

        this.slideUp = () => {
            this.container.slideUpContent(300);
        };

        this.slideDown = () => {
            this.container.slideDownContent(300);
        };
    </script>
    <style>
        .segment {
            border-bottom:none !important;
            height: 400px;
            overflow-y:scroll;
        }
    </style>
</chat-body>