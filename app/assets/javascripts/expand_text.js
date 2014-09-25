(function(){
  'use strict'

  $(document).on("ready page:load", init);

  function init(){
    $('.expand-description, .expand-comment').readmore({
      speed: 75,
      maxHeight: 60
    });
  }

})();
