import riot from 'riot';
import {
  combineReducers,
  applyMiddleware,
  createStore,
  compose
} from 'redux';
import thunk from 'redux-thunk';
import promise from 'redux-promise-middleware';
import { messageHandler } from '../reducers/ChatReducer';

/*const reducers = combineReducers({
  messageHandler
});*/

const middleware = applyMiddleware(
  thunk,
  promise()
);

const store = createStore(
  messageHandler,
  compose(middleware)
);

store.subscribe(() => {riot.update()});

export const AppStore = store;