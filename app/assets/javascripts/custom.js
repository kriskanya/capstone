// (function(){
//   'use strict'
//
//   $(document).ready(init);
//
//   function init(){
//     $('.expand-description').on('click', expandDescription);
//   }
//
//   function expandDescription(){
//     getDescription($(this).parent());
//   }
//
//   function getDescription($descriptionDiv){
//     var courseId = $descriptionDiv.data('courseid');
//     console.log(courseId);
//
//     $.ajax({
//       url: "/courses/"+courseId+"/description",
//       type: 'GET',
//       dataType: 'json',
//       success: function(data){
//         console.log(data.description);
//       }
//     });
//   }
//
// })();
