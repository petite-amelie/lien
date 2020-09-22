window.addEventListener("load", function(){
  const pullDownButton = document.getElementById("genre-lists")
  const pullDownBar = document.getElementById("genre-bar")

  pullDownButton.addEventListener('mouseover', function(){
    pullDownButton.setAttribute("style", "background-color:black;")
  })

  pullDownButton.addEventListener('mouseout', function(){
    pullDownButton.removeAttribute("style", "background-color:white;")
  })

  pullDownButton.addEventListener('click', function() {
    if (pullDownBar.getAttribute("style") == "display:block;") {
      pullDownBar.removeAttribute("style", "display:block;")
    } else {
      pullDownBar.setAttribute("style", "display:block;")
    }
  })

})