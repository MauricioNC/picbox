import * as Request from "./remote_requests"

document.addEventListener('turbolinks:load', () => {
  const download_btn_list = document.querySelectorAll(".download-btn")
  handleEvent(download_btn_list)
});

function handleEvent(download_btn_list)
{
  download_btn_list.forEach(item => {
     const img_id = item.dataset.imageId;

    item.addEventListener("click", () => {
      Request.addImageToDownload(img_id);
    });
  });
}
