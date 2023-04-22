const Rails = require("@rails/ujs");
document.addEventListener('turbolinks:load', () => {

  const btn_like = document.querySelectorAll(".btn_like");

  if(btn_like != undefined)
  {
    btn_like.forEach(el => {
      const image_identifier = el.dataset.imageId;

      set_image_liked(el, image_identifier)
    })
  }
});

function like_image(element, image_identifier)
  {
    let like_icon = element.querySelector("i");

    Rails.ajax({
      url: "/like",
      type: "POST",
      data: `image_liked=${image_identifier}`,
      success: () => {
        $(like_icon).toggleClass("fa-regular fa-heart")
        $(like_icon).toggleClass("fa-solid fa-heart")
      }
    })
  }

  function unlike_image(element, image_identifier)
  {
    let like_icon = element.querySelector("i");
    Rails.ajax({
      url: "/unlike",
      type: "POST",
      data: `image_liked=${image_identifier}`,
      success: () => {
        $(like_icon).toggleClass("fa-solid fa-heart")
        $(like_icon).toggleClass("fa-regular fa-heart")
      }
    })
  }

  // Base case data-liked on load page
  function set_image_liked(element, image_identifier)
  {
    let like_icon = element.querySelector("i");

    Rails.ajax({
      url: "/image_liked",
      type: "POST",
      dataType: "json",
      data: `image_liked=${image_identifier}`,
      success: (data) => {
        $(element).attr('data-liked', `${data.img_liked}`)

        like_icon.className = element.dataset.liked == "false" ? "fa-regular fa-heart" : "fa-solid fa-heart";
      },
      complete: () => {
        resolveLike(element, image_identifier)
      }
    })
  }

  function resolveLike(element, image_identifier)
  {
    let like_icon = element.querySelector("i");

    $(element).on("click", function(event) {
      event.preventDefault();
      if(element.dataset.liked == "false")
      {
        like_icon.className = "fa-regular fa-heart";

        $(element).attr('data-liked', "true")

        like_image(element, image_identifier);
      }
      else
      {
        like_icon.className = "fa-solid fa-heart";

        $(element).attr('data-liked', "false")

        unlike_image(element, image_identifier)
      }
    })
  }
