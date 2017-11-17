import './styles.css';
import './components/simple-chat.tag';
import 'riot-hot-reload';
import { appStore } from './config/store';
import { emitterService } from  './service/EmitterService';

riot.mixin('store', appStore);//share store through all the components
//riot.mixin('emitter', emitterService);

riot.mount('simple-chat');






