<chat-footer>
    <div class='ui attached segment' id='footer'>
        <div class='ui action input'>
            <input type='text' placeholder='input your message...' ref='msgField' onkeypress = {enterPressOnField}>
            <button class='ui large button' onclick ={sendMessage}>send</button>
        </div>
    </div>

    <script>
        import { sendMessageAction } from '../../actions/SendMessageAction';

        this.store = this.mixin('store');

        this.on('mount', () => {
            this.container = $('#footer');
        });

        this.sendMessage = () => {
            const message = this.refs.msgField.value;
            if (message !== '') {
                this.store.dispatch(sendMessageAction(message));
                this.clearField();
            }
        };

        this.enterPressOnField = (e) => {
            if (e.key === 'Enter')
                this.sendMessage();
        };

        this.clearField = () => {
            this.refs.msgField.value = '';
        };

        this.getContainer = () => {
            return this.container;
        };
    </script>

    <style>
        .ui.action {
            width: 100%;
        }
    </style>
</chat-footer>