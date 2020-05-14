// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require_tree .
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets

//    $(function() {
//        $(".button_to input").hover(
            // function(){
        // $(this).css(
            // {
//               backgroundColor: '#5f5f5f',
//               color: '#fff',
//             }
//         )},
//             function(){
//         $(this).css(
//             {
//               backgroundColor: '#fff',
//               color: '#5f5f5f',
//             }        
//         )
//     });
// });


// $(function(){
//     $(".button_to input").click(
//         function() {
//          const str1 = $(this).attr("value");
//         if(str1==="いいね"){
//             $(this).attr("value","いいね解除")
//         }else{
//             $(this).attr("value","いいね")            
//         }
//     }
// );
// });

    $(function () {
        $('[data-toggle="tooltip"]').tooltip();
    },
);

   $(function () {
    $(".search.box").hide();
        $(".search.btn.btn-default").click(function () {
            $(".search.box").slideToggle();
    }
        )});



   

