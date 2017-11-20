class ExpandService {
  slideUpContent = (node, time) => {
    node.slideUp(time);
  };

  slideDownContent = (node, time) => {
    node.slideDown(time);
  }
}
export const expandService = new ExpandService();