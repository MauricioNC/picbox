export function getBoxItem(selector, time)
{
  let boxes_element = undefined;
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      boxes_element = document.querySelectorAll(selector);

      if(boxes_element == null)
        reject(new Error(-1));

      resolve(boxes_element);
    }, time);
  });
}
