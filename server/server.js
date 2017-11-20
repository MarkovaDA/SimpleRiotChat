const io = require('socket.io')();

let messages = [];//буфер сообщений

const size = 10; //размер буфера

io.on('connection', (socket) => {
  //сообщаем о подключении
  socket.emit('server-connect');

  if (messages.length > 0) {
    //только что подключившемуся клиенту отправляем накопленные сообщения из буфера
    let savedMessage;
    for(let index in messages) {
      savedMessage = messages[index];
      socket.emit('NEW_MESSAGE', savedMessage);
    }
  }

  socket.on('SEND_MESSAGE', (message) => {
    console.log('RECEIVE', message);
    saveMessageToBuffer(message, socket.id);

    let newMessage = {};

    //рассылаем сообщение всем подключенным клиентам
    io.sockets.emit('NEW_MESSAGE', message);

    //обрезаем буфер сообщений до  размера size, сохраняя последние сообщения
    if (messages.length >= size) {
      messages = messages.slice(-1*size);
    }
  });

  //server-disconnect
  socket.on('disconnect', (reason) => {
    socket.emit('server-disconnect', reason);
  });
});

saveMessageToBuffer = (msgText, socketId) => {
  //messages.push({text:msgText, clientId: socketId});
  messages.push(msgText);
};
const port = 3003;
io.listen(port);

console.log('listening on port ', port);