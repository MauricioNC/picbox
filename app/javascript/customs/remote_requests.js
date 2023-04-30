import { getBoxItem  } from "./search_item";

const Rails = require("@rails/ujs");

export async function highlightBox(image_id)
{
  const boxItemContainer = await getBoxItem(".box-item", 300);

  boxItemContainer.forEach(bxI => {
    const box_item_data = bxI.closest("div.box-item").dataset.identifier;

    Rails.ajax({
      url: "/image_in_box",
      type: "POST",
      data: `image_identifier=${image_id}&box_identifier=${box_item_data}`,
      success: (data) => {
        if(data.response)
        {
          bxI.style.backgroundColor = "#00C853";
          bxI.style.color = "#FBFBFB";

          bxI.querySelector(".add").style.display = "none"
        }
        else
        {
          bxI.style.backgroundColor = "";
          bxI.style.color = "";

          bxI.querySelector(".remove").style.display = "none"
        }
      }
    });
  });
}

export function call(boxActionsList, image_id, openListBoxesBtn, params = {})
{
  if(Object.entries(params).length > 0)
  {
    boxActionsList[0].forEach(bxI => {
      bxI.addEventListener("click", () => {
        const box_item_data = bxI.closest("div.box-item").dataset.identifier;

        Rails.ajax({
          url: params.url,
          type: params.method,
          data: `image_identifier=${image_id}&box_identifier=${box_item_data}`,
          success: (data) => {
            if(data.response)
            {
              if(params.url == "/add_image")
              {
                setBtnAdd(bxI)
                openListBoxesBtn.dataset.boxImage = "true";
              }
              else
              {
                setBtnRemove(bxI)
                openListBoxesBtn.dataset.boxImage = "false";
              }
            }
          }
        });
      });
    });
  }
}

function setBtnAdd(element)
{
  element.closest("div.box-item").style.backgroundColor = "#00C853";
  element.closest("div.box-item").style.color = "#FBFBFB";

  element.nextElementSibling.style.display = "block"
  element.style.display = "none"
}

function setBtnRemove(element)
{
  element.closest("div.box-item").style.backgroundColor = "";
  element.closest("div.box-item").style.color = "";

  element.previousElementSibling.style.display = "block"
  element.style.display = "none"
}


export function addImageToDownload(img_id)
{
  Rails.ajax({
    url: "/download",
    type: "POST",
    data: `image_identifier=${img_id}`,
    success: (data) => {
      if(data.response)
        alert("Image downloaded successfully");
      else
        alert("Something went wrong, try again");
    }
  });
}
