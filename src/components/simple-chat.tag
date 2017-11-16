<simple-chat>
    <div  class="chat-container">
        <chat-header/>
        <chat-body/>
        <chat-footer/>
    </div>

    <script>
        import './chat/header.tag';
        import './chat/body.tag';
        import './chat/footer.tag';
        import { service } from './../service/MessageService';
        import { receiveMessageAction } from '../actions/ReceiveMessageAction';

        this.store = this.mixin();

        this.on('mount', () => {
            //subscribing on server events
            service.on('new-message', (data) => {
                this.store.dispatch(receiveMessageAction(data));
            });
        });
    </script>

    <style>
        .chat-container {
            width: 60%;
            height: 640px;
            margin: 5% 20%;
        }
    </style>
</simple-chat>
