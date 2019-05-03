$(document).on("turbolinks:load", function(){
  // スムーススクロール //
  $('a[href^="#"]').click(function(){
    var speed = 500;
    var href= $(this).attr("href");
    var target = $(href == "#" || href == "" ? 'html' : href);
    var position = target.offset().top;
    $("html, body").animate({scrollTop:position}, speed, "swing");
    return false;
  });

  // Topへ戻るボタンの出現 //
  var TopBtn = $('#return-top');
  TopBtn.hide();
  // スクロール位置が100でボタンを表示
  $(window).scroll(function() {
    if ($(this).scrollTop() > 100) {
      TopBtn.fadeIn();
    }
    else {
      TopBtn.fadeOut();
    }
  });
  // ボタンを押下するとトップへ移動
  TopBtn.click(function() {
    $('body,html').animate({
      scrollTop: 0
    }, 300);
    return false;
  });
});
