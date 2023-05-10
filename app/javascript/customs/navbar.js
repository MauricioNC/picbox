document.addEventListener('turbolinks:load', () => {
  const hamburguerIcon = document.querySelector(".nav__hamburguer");
  const closeIcon = document.querySelector(".nav__close");
  const searchForm = document.querySelector(".search__bar");
  const showFormIcon = document.querySelector(".fa-magnifying-glass");
  const hideFormIcon = document.querySelector(".fa-arrow-right");

  hamburguerIconEvent("click", hamburguerIcon, closeIcon);
  closeIconEvent("click", closeIcon, hamburguerIcon);

  if(window.screen.width <= 320)
  {
    hideSearchForm("click", searchForm, hideFormIcon);
    showSearchForm("click", searchForm, showFormIcon);
  }
});

function hamburguerIconEvent(event, hamburguerIcon, closeIcon)
{
  const navLinks = document.querySelector(".nav__links");

  hamburguerIcon.addEventListener(event, (e) => {
    e.preventDefault();

    hamburguerIcon.style.transform = "scale(0)";
    closeIcon.style.transform = "scale(1)";
    navLinks.style.transform = "translate(0%)";
  });
}

function closeIconEvent(event, hamburguerIcon, closeIcon)
{
  const navLinks = document.querySelector(".nav__links");

  hamburguerIcon.addEventListener(event, (e) => {
    e.preventDefault();

    hamburguerIcon.style.transform = "scale(0)";
    closeIcon.style.transform = "scale(1)";
    navLinks.style.transform = "translate(-100%)";
  });
}

function showSearchForm(event, searchForm, showFormIcon)
{
  showFormIcon.addEventListener(event, () => {
    searchForm.style.transform = "translate(0%)";
  });
}

function hideSearchForm(event, searchForm, hideFormIcon)
{
  hideFormIcon.addEventListener(event, () => {
    searchForm.style.transform = "translate(100%)";
  });
}
