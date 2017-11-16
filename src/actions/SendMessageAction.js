import {service} from  '../service/MessageService';

export const sendMessageAction = (message) => {
  return () => {
    service.sendMessage(message);
  };
};