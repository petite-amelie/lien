window.addEventListener("load", function(){
  const searchButton = document.getElementById("search-icon")
  const searchForm = document.getElementById("search-form")

  searchButton.addEventListener('click', function() {
    if (searchForm.getAttribute("style") == "display:block;") {
      searchForm.removeAttribute("style", "display:block;")
    } else {
      searchForm.setAttribute("style", "display:block;")
    }
  })

})