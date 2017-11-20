<simple-chat>
    <div class='chat-container'>
        <chat-header ref = 'header'/>
        <chat-body   ref = 'body' />
        <chat-footer ref = 'footer' />
    </div>

    <script>
        import './chat/header.tag';
        import './chat/body.tag';
        import './chat/footer.tag';

        import { receiveMessageAction } from '../actions/ReceiveMessageAction';

        this.store = this.mixin('store');

        this.movingService = this.mixin('movingService');
        this.expandService = this.mixin('expandService');
        this.messageService = this.mixin('messageService');

        this.on('mount', () => {
            //составные компоненты чата
            this.header = this.refs.header;
            this.body = this.refs.body;
            this.footer = this.refs.footer;

            //прослушиваем события движения мыши по чату для его перемещения
            this.movingService.registNode($('.chat-container'));

            //прослушиваем события сокета
            this.messageService.subscribe('NEW_MESSAGE', (data) => {
                this.store.dispatch(receiveMessageAction(data));
            });

            //нажата кнопка "развернуть чат" в заголовке чата
            this.header.on('SLIDE_DOWN', () => {
                this.expandService.slideDownContent(this.body.getContainer(), 300);
                this.expandService.slideDownContent(this.footer.getContainer(),100);
            });

            //нажата кнопка "свернуть чат" в заголовке чата
            this.header.on('SLIDE_UP', () => {
                this.expandService.slideUpContent(this.body.getContainer(), 300);
                this.expandService.slideUpContent(this.footer.getContainer(), 100);
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
