// import $ from "jquery";
// const loadReview = () => {

//   $(window).load(function () {
//     $(".trigger_popup_review").click(function(){
//        $('.hover_bkgr_review').show();
//     });
//     $('.popupReviewCloseButton').click(function(){
//         $('.hover_bkgr_review').hide();
//     });

// });

//   }

// export {loadReview}


 const loadReview = () => {
  // $(window).load(function () {
    $(".trigger_popup_review").click(function(){
       $('.hover_bkgr_review').show();
       console.log('a');
    });
    // $('.hover_bkgr_review').click(function(){
    //     $('.hover_bkgr_review').hide();
    //     console.log('b');
    // });
    $('.popupReviewCloseButton').click(function(){
        $('.hover_bkgr_review').hide();
        console.log('c');
    });
  // });
 }

export { loadReview };
