import riot from 'riot';
import {
  applyMiddleware,
  createStore,
  compose
}  from 'redux';
import thunk from 'redux-thunk';
import promise from 'redux-promise-middleware';
import { messageHandler } from '../reducers/ChatReducer';


const middleware = applyMiddleware(
  thunk,
  promise()
);

const store = createStore(
  messageHandler,
  compose(middleware)
);

store.subscribe(() => riot.update());

export const appStore = store;