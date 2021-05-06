function like() {
  // クラス名から要素を取得
  const likes = document.querySelectorAll(".like");
  likes.forEach(function(like){
    //イベント発火の重複を回避
    if (like.getAttribute("data-load") != null) {
      return null;
    }
    like.setAttribute("data-load", "true");
    // クリックしてイベント発火
    like.addEventListener("click",()=>{
      const likeId = like.getAttribute("data-id");
      const likeCount = countToNumber(like);
      const XHR = new XMLHttpRequest();
      // リクエストを指定
      XHR.open("GET", `/exams/${likeId}/likes`, true);
      XHR.responseType = "json";
      XHR.send();
      // レスポンスがあった場合の処理
      XHR.onload = () => {
        // レスポンスのHTTPステータスを解析し、該当するエラーメッセージをアラートで表示
        if (XHR.status != 200) {
          alert(`Error ${XHR.status}: ${XHR.statusText}`);
          return null;          
        }
        // レスポンスされたデータを変数itemに代入
        const item = XHR.response.like;
        if (item) {
          like.setAttribute("class","fas fa-star");
          like.setAttribute( "style", "color:gold" );
          like.innerHTML =  likeCount + 1;
        }  else{
          like.setAttribute("class","far fa-star");
          like.removeAttribute("style");
          like.innerHTML =  likeCount - 1;
         }
      };
    });
   
  });
}

// お気に入りカウントの取得と数値への変換
function countToNumber(count){
   var countNumber = count.innerHTML;
   countNumber = Number(countNumber);
   return countNumber;
}

setInterval(like, 1000);


