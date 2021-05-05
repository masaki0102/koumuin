function like() {
  const likes = document.querySelectorAll(".fa-star");
  likes.forEach(function(like){
    if (like.getAttribute("data-load") != null) {
      return null;
    }
    like.setAttribute("data-load", "true");
    like.addEventListener("click",()=>{
      // ここにクリックした時の処理
      const likeId = like.getAttribute("data-id");
      const XHR = new XMLHttpRequest();
      // リクエストを指定
      XHR.open("GET", `/exams/${likeId}/likes`, true);
      XHR.responseType = "json";
      XHR.send();
      // レスポンスがあった場合の処理
      XHR.onload = () => {
        if (XHR.status != 200) {
          alert(`Error ${XHR.status}: ${XHR.statusText}`);
          return null;          
        }
        const item = XHR.response.like;
        if (item) {
          like.setAttribute( "style", "color:gold" ); 
        }  else{
          like.removeAttribute("style")
         }
      };
    });
   
  });
}
  setInterval(like, 1000);
// window.addEventListener("load", like);

