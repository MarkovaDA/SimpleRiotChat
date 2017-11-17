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
        import { service } from './../service/MessageService';
        import { receiveMessageAction } from '../actions/ReceiveMessageAction';

        this.store = this.mixin('store');

        this.on('mount', () => {
            //subscribing on server events
            service.on('new-message', (data) => {
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
