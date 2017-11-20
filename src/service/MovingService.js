
class MovingService {
  constructor() {
    this.dragging = false;
  }

  registNode(element) {
    let prevX, prevY;
    this.element = element; //the node will being moving

    this.element.mousedown((e) => {
      this.dragging = true;
      prevX = e.clientX - this.element.offset().left;
      prevY = e.clientY - this.element.offset().top;
      this.element.css('cursor', 'move');
      //this.element.setCapture();
    });

    $(document).mousemove((e) => {
      if (this.dragging) {
        var e = e || window.event;
        var newX = e.clientX - prevX;
        var newY = e.clientY - prevY;
        this.element.offset({top: newY, left: newX});
      }
    });

    $(document).mouseup((e) => {
      this.dragging = false;
      this.element.css('cursor', 'default');
      //this.element.releaseCapture();
      e.cancelBubble = true;
    })
  }
}
export const movingService = new MovingService();