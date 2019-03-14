$(document).on("turbolinks:load", function(){
  var mainSlider = "#slider"; //メインスライダーid
  var thumbnailSlider = "#thumbnail_slider" //サムネイルスライダーid
  $(mainSlider).slick({
    arrows: false,
    prevArrow: '<button class="slide-arrow prev-arrow"></button>',
    nextArrow: '<button class="slide-arrow next-arrow"></button>',
    autoplay: false,
    speed: 800,
    infinite: true,
    slidesToShow: 1,
    slidesToScroll: 1,
    fade: false,
    asNavFor: thumbnailSlider //サムネイルのクラス名
  });
  $(thumbnailSlider).slick({
    accessibility: true,
    speed: 400,
    arrows: false,
    infinite: true,
    slidesToShow: 4,
    slidesToScroll: 1,
    focusOnSelect: true,
    asNavFor: mainSlider
  });
  // $(thumbnailSlider + " .slick-slide").on('click',function(){
  //    var index = $(this).attr("data-slick-index");
  //   $(thumbnailSlider).slick("slickGoTo",index,false);
  //  });
});
