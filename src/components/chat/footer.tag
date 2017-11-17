<chat-footer>
    <div class='ui attached segment' id ='footer'>
        <div class='ui action input'>
            <input type='text' placeholder='input your message...' ref='msgField' onkeypress = {enterPressOnField}>
            <button class='ui large button' onclick ={sendMessage}>send</button>
        </div>
    </div>

    <script>
        import { sendMessageAction } from '../../actions/SendMessageAction';
        import { emitterService } from  '../../service/EmitterService';

        this.store = this.mixin('store');
        //this.emitter = this.mixin('emitter');

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

        this.slideUp = () => {
            this.container.slideUp(100);
        };

        this.slideDown = () => {
            this.container.slideDown(100);
        };

        emitterService.on('SLIDE_UP_CHAT', () => {
            this.slideUp();
        });

        emitterService.on('SLIDE_DOWN_CHAT', () => {
            this.slideDown();
        });
    </script>

    <style>
        .ui.action {
            width: 100%;
        }
    </style>
</chat-footer>