<message>
    <div class='message-container'>
        <div class='user-icon'>

        </div>
        <div class={'right pointing basic blue offseted' : opts.whose, 'left pointing' : !opts.whose, 'ui label large': true}>
           {opts.text}
        </div>

    </div>

    <div class='ui divider'></div>

    <style>
        .offseted {
            margin-left: 50% !important;
        }
        .user-icon {
            width: 50px;
            height: 50px;
            background: url('./src/images/user-icon-grey.svg ') no-repeat center;
            background-size: 100%;
        }
        .message-container {
            display: flex;
            align-items: center;
        }
        .pointing {
            height: 35px !important;
            font-size: 16px !important;
            font-weight:bold !important;
        }
    </style>
</message>