class EventEmitter {
  //static instance = null;

  constructor() {
     this.events = {};
    /*if (!EventEmitter.instance) {
      this.events = {};
      EventEmitter.instance = this;
    }*/
  }

  emit(eventName, data) {
    const event = this.events[eventName];
    if(event) {
      event.forEach(fn => {
        fn.call(null, data);
      });
    }
  }

  on(eventName, fn) {
    if(!this.events[eventName]) {
      this.events[eventName] = [];
    }
    this.events[eventName].push(fn);
    return () => {
      this.events[eventName] = this.events[eventName]
        .filter(eventFn => fn !== eventFn);
    }
  }
}
export const emitterService = new EventEmitter();