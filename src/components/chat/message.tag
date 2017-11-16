<message>

    <div class= {"right pointing basic blue offseted" : opts.whose, "left pointing" : !opts.whose, "ui label large": true}>
        {opts.text}
    </div>
    <div class="ui divider"></div>

    <style>
        .offseted {
            margin-left: 50% !important;
        }
        .label {

        }
    </style>
    <script>
        this.userStyle = 'right pointing basic blue offseted';
        this.unknownStyle = 'left pointing';
        //this.on('mount', () => {})
    </script>
</message>