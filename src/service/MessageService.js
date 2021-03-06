import socketIOClient from 'socket.io-client';

class MessageService {
  static instance = null;

  constructor() {
    if (!MessageService.instance) {
      MessageService.instance = this;
      this.getConnection();
    }
  }

  getConnection = () => {
    this.socket = socketIOClient('http://localhost:3003');
  };

  closeConnection = () => {
    this.socket.close();
  };

  subscribe = (eventTitle, eventHandler) => {
    this.socket.on(eventTitle, (data) => {eventHandler(data)});
  };

  sendMessage = (msgText) => {
    this.socket.emit('SEND_MESSAGE', msgText);
  };

}
export const messageService = new MessageService();
