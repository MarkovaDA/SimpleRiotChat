<chat-footer>
    <div class="ui  attached segment">
        <div class="ui action input">
            <input type="text" placeholder="input your message..." ref="msgField" onkeypress = {enterPressOnField}>
            <button class="ui button" onclick ={ sendMessage }>send</button>
        </div>
    </div>

    <script>
        import { sendMessageAction } from '../../actions/SendMessageAction';

        this.store = this.mixin();

        this.sendMessage = () => {
            const message = this.refs.msgField.value;
            this.store.dispatch(sendMessageAction(message));
            this.clearField();
        };

        this.enterPressOnField = (e) => {
            if (e.key === 'Enter')
                this.sendMessage();
        };

        this.clearField = () => {
            this.refs.msgField.value = '';
        };

    </script>

    <style>
        .ui.action {
            width: 100%;
        }
    </style>
</chat-footer>