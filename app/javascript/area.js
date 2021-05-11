function area_search() {

  const RegionParent1 = document.getElementById("region-1")
  const RegionParent2 = document.getElementById("region-2")
  const RegionParent3 = document.getElementById("region-3")
  const RegionParent4 = document.getElementById("region-4")
  const RegionParent5 = document.getElementById("region-5")
  const RegionParent6 = document.getElementById("region-6")
  
  const RegionChild1 = document.getElementById("area-1")
  const RegionChild2 = document.getElementById("area-2")
  const RegionChild3 = document.getElementById("area-3")
  const RegionChild4 = document.getElementById("area-4")
  const RegionChild5 = document.getElementById("area-5")
  const RegionChild6 = document.getElementById("area-6")

  RegionParent1.addEventListener('click', function() {
      if (RegionChild1.getAttribute("style") == "display:none;") {
        RegionChild1.removeAttribute("style", "display:none;")
        RegionParent1.innerHTML =  "▼北海道・東北エリア"
      }
      else{
       RegionChild1.setAttribute("style", "display:none;")
       RegionParent1.innerHTML =  "▶︎北海道・東北エリア"
    }
  })


  RegionParent2.addEventListener('click', function() {
    if (RegionChild2.getAttribute("style") == "display:none;") {
      RegionChild2.removeAttribute("style", "display:none;")
      RegionParent2.innerHTML =  "▼関東甲信越エリア"
    }
    else{
      RegionChild2.setAttribute("style", "display:none;")
      RegionParent2.innerHTML =  "▶︎関東甲信越エリア"
    }
  })
  RegionParent3.addEventListener('click', function() {
    if (RegionChild3.getAttribute("style") == "display:none;") {
      RegionChild3.removeAttribute("style", "display:none;")
      RegionParent3.innerHTML =  "▼東海・北陸エリア"
    }
    else{
      RegionChild3.setAttribute("style", "display:none;")
      RegionParent3.innerHTML =  "▶︎東海・北陸エリア"
    }
  })
  RegionParent4.addEventListener('click', function() {
    if (RegionChild4.getAttribute("style") == "display:none;") {
      RegionChild4.removeAttribute("style", "display:none;")
      RegionParent4.innerHTML =  "▼近畿エリア"
    }
    else{
      RegionChild4.setAttribute("style", "display:none;")
      RegionParent4.innerHTML =  "▶︎近畿エリア"
    }
  })
  RegionParent5.addEventListener('click', function() {
    if (RegionChild5.getAttribute("style") == "display:none;") {
      RegionChild5.removeAttribute("style", "display:none;")
      RegionParent5.innerHTML =  "▼中国四国エリア"
    }
    else{
      RegionChild5.setAttribute("style", "display:none;")
      RegionParent5.innerHTML =  "▶︎中国四国エリア"
    }
  })
  RegionParent6.addEventListener('click', function() {
    if (RegionChild6.getAttribute("style") == "display:none;") {
      RegionChild6.removeAttribute("style", "display:none;")
      RegionParent6.innerHTML =  "▼九州・沖縄エリア"
    }
    else{
      RegionChild6.setAttribute("style", "display:none;")
      RegionParent6.innerHTML =  "▶︎九州・沖縄エリア"
    }
  })

}

window.addEventListener('load', area_search)