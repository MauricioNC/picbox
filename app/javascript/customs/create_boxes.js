import { getBoxItem  } from "./search_item";
import  * as Request  from "./remote_requests";

document.addEventListener('turbolinks:load', () => {

  const openListBoxesBtn = document.querySelectorAll(".fa-plus");

  openListBoxesBtn.forEach(btn => {
    const imageId = btn.parentElement.dataset.imageId;

    btn.addEventListener("click", async () => {
      const addToBoxBtnList = await getBoxItem(".box-item .actions .add", 300);
      const removeToBoxBtnList = await getBoxItem(".box-item .actions .remove", 300);

      if(addToBoxBtnList != -1 && removeToBoxBtnList != -1)
      {
        Request.highlightBox(imageId, addToBoxBtnList, removeToBoxBtnList);

        Request.call([addToBoxBtnList, removeToBoxBtnList], imageId, btn, {url: "/add_image", method: "POST"});
        Request.call([removeToBoxBtnList, addToBoxBtnList], imageId, btn, {url: "/remove_image", method: "DELETE"});
      }
    });
  });
});

