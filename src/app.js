import './styles.css';
import './components/simple-chat.tag';
import 'riot-hot-reload';

import { movingService } from './service/MovingService';
import { expandService } from './service/ExpandService';
import { messageService } from './service/MessageService';

import { appStore } from './config/store';



riot.mixin('store', appStore);//share store through all the components
riot.mixin('movingService', movingService);
riot.mixin('expandService', expandService);
riot.mixin('messageService', messageService);

riot.mount('simple-chat');







