export const messageHandler = (state = {}, action) => {
  switch(action.type) {
    case 'NEW_MESSAGE':

      return {
        ...state,
        //messages: [...state.messages, action.newMessage]
        lastMessage:action.newMessage
      };

    default:
      return state;
  }
};