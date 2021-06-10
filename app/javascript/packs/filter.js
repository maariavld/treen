const initFilter = () => {
  // $(window).load(function () {
    $(".trigger_popup_filter").click(function(){
       $('.hover_bkgr_filter').show();
    });
    // $('.hover_bkgr_filter').click(function(){
    //     $('.hover_bkgr_filter').hide();
    //     console.log('b');
    // });
    $('.popupCloseButtonFilter').click(function(){
        $('.hover_bkgr_filter').hide();
    });
  // });
 }

export { initFilter };
