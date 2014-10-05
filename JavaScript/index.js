var main = function() {
  $(".main-menu>li").hover(
    function() {
      $(".sub-menu", this).css('visibility', 'visible');
    },
    function() {
      $(".sub-menu", this).css('visibility', 'hidden');
    }
  );
};

$(document).ready(main);