<simple-chat>
    <div class='chat-container'>
        <chat-header />
        <chat-body  ref='body'/>
        <chat-footer  ref='footer'/>
    </div>

    <script>
        import './chat/header.tag';
        import './chat/body.tag';
        import './chat/footer.tag';
        import { messageService } from './../service/MessageService';
        import { emitterService } from  './../service/EmitterService';
        import { movingService } from './../service/MovingService';
        import { receiveMessageAction } from '../actions/ReceiveMessageAction';

        this.store = this.mixin('store');

        this.on('mount', () => {
            this.chat = $('.chat-container');

            movingService.registNode(this.chat);

            messageService.on('new-message', (data) => {
                this.store.dispatch(receiveMessageAction(data));
            });
        });
    </script>

    <style>
        .chat-container {
            position: absolute;
            width: 40%;
            height: auto;
            left: 58%;
            bottom: 5px;
        }
    </style>
</simple-chat>
