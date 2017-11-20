import {messageService} from  '../service/MessageService';

export const sendMessageAction = (message) => {
  return () => {
    messageService.sendMessage(message);
  };
};