 const initPop = () => {
  // $(window).load(function () {
    $(".trigger_popup_fricc").click(function(){
       $('.hover_bkgr_fricc').show();
    });
    // $('.hover_bkgr_fricc').click(function(){
    //     $('.hover_bkgr_fricc').hide();
    //     console.log('b');
    // });
    $('.popupCloseButton').click(function(){
        $('.hover_bkgr_fricc').hide();
    });
  // });
 }

export { initPop };
