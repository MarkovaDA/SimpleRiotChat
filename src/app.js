import './styles.css';
import './components/greeting.tag';
import './components/simple-chat.tag';
import 'riot-hot-reload';
import { AppStore } from './config/store';

riot.mixin(AppStore);//share store through all the components

riot.mount('simple-chat');





