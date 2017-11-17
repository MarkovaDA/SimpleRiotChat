<chat-body>

    <div class='ui attached ui segment' id='wrapper'>
        <message each={ item in messages } text={ item } whose={ false } />
    </div>

    <script>
        import './message.tag';
        import { emitterService } from  '../../service/EmitterService';


        this.store = this.mixin('store');//redux storage
        //this.emitter = this.mixin('emitter');

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
        };

        this.slideUp = () => {
            this.container.slideUp(300);
        };

        this.slideDown = () => {
            this.container.slideDown(300);
        };

        emitterService.on('SLIDE_UP_CHAT', () => {
            this.slideUp();
        });

        emitterService.on('SLIDE_DOWN_CHAT', () => {
            this.slideDown();
        });
    </script>
    <style>
        .segment {
            border-bottom:none !important;
            height: 400px;
            overflow-y:scroll;
        }
    </style>
</chat-body>