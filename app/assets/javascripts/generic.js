function selectAll(){
  $("input#photos_").each(function(){
    //$(this).attr('checked', true);
    $(this).attr('checked', !$(this).is(':checked'));
    if($(this).is(':checked')) {
      $("#select_button").prop('value', 'Unselect All');
    } else {
      $("#select_button").prop('value', 'Select All');
    }
  });

  return false;
}
