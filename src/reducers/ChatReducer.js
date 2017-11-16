export const messageHandler = (state = {}, action) => {
  switch(action.type) {
    case 'NEW_MESSAGE':
      return {
        ...state,
        lastMessage:action.newMessage
      };

    default:
      return state;
  }
};