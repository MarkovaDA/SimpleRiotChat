export const receiveMessageAction = (message) => {
  return  {
    type: 'NEW_MESSAGE',
    newMessage: message
  };
};