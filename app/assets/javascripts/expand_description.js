(function(){
  'use strict'

  $(document).ready(init);

  function init(){
    $('.expand-description').readmore({
      speed: 75,
      maxHeight: 60
    });
  }

})();
