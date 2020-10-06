// 個展作成画面のプレビュー機能
if (document.URL.match( /new/ ) && document.URL.match( /rooms/ ) && document.URL.match(/^(?!.*items).*$/)) {
document.addEventListener('DOMContentLoaded', function(){
  const ImageList = document.getElementById('image-list');
  const ClickUpload = document.getElementById('click-upload');
  document.getElementById('room-image').addEventListener('change', function(e){

    // 選択した画像を表示する関数
    const createImageHTML = (blob) => {
      // 画像を表示するためのdiv要素を生成
     const imageElement = document.createElement('div');
     // 表示する画像を生成
     const blobImage = document.createElement('img');
     blobImage.setAttribute('src', blob);
      blobImage.setAttribute('id', 'img-1')
     // 生成したHTMLの要素をブラウザに表示させる
     imageElement.appendChild(blobImage);
     ImageList.appendChild(imageElement);
    };

    // 画像が表示されている場合のみ、すでに存在している画像を削除する
    const imageContent = document.getElementById('img-1');
    if (imageContent){
      imageContent.remove();
    }

    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);
    
    if (ClickUpload.getAttribute("style") == "display:block;") {
      ClickUpload.removeAttribute("style", "display:block;")
    } else {
      ClickUpload.setAttribute("style", "display:none;")
    };
    
    createImageHTML(blob);
  });
});
}

// 作品登録画面のプレビュー機能
if (document.URL.match( /new/ ) && document.URL.match( /items/ ) || document.URL.match( /edit/ ) && document.URL.match( /items/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById('image-list');
    const ClickUpload = document.getElementById('click-upload');
    document.getElementById('item-image').addEventListener('change', function(e){
      // 選択した画像を表示する関数
    const createImageHTML = (blob) => {
      // 画像を表示するためのdiv要素を生成
     const imageElement = document.createElement('div');
     // 表示する画像を生成
     const blobImage = document.createElement('img');
     blobImage.setAttribute('src', blob);
      blobImage.setAttribute('id', 'img-1')
     // 生成したHTMLの要素をブラウザに表示させる
     imageElement.appendChild(blobImage);
     ImageList.appendChild(imageElement);
    };

      // 画像が表示されている場合のみ、すでに存在している画像を削除する
      const imageContent = document.getElementById('img-1');
      if (imageContent){
        imageContent.remove();
      }
  
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      
      if (ClickUpload != null &&ClickUpload.getAttribute("style") == "display:block;") {
        ClickUpload.removeAttribute("style", "display:block;")
      } else if (ClickUpload != null) {
        ClickUpload.setAttribute("style", "display:none;")
      };
      
      createImageHTML(blob);
    });
  });
  }

  // ユーザー登録画面のプレビュー機能
if (document.URL.match( /users/ ) && document.URL.match( /sign_up/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById('image-list');
    const ClickUpload = document.getElementById('click-upload');
    document.getElementById('avatar').addEventListener('change', function(e){
      // 選択した画像を表示する関数
    const createImageHTML = (blob) => {
      // 画像を表示するためのdiv要素を生成
     const imageElement = document.createElement('div');
     // 表示する画像を生成
     const blobImage = document.createElement('img');
     blobImage.setAttribute('src', blob);
      blobImage.setAttribute('id', 'img-1')
     // 生成したHTMLの要素をブラウザに表示させる
     imageElement.appendChild(blobImage);
     ImageList.appendChild(imageElement);
    };

      // 画像が表示されている場合のみ、すでに存在している画像を削除する
      const imageContent = document.getElementById('img-1');
      if (imageContent){
        imageContent.remove();
      }
  
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      
      if (ClickUpload.getAttribute("style") == "display:block;") {
        ClickUpload.removeAttribute("style", "display:block;")
      } else {
        ClickUpload.setAttribute("style", "display:none;")
      };
      
      createImageHTML(blob);
    });
  });
  }

