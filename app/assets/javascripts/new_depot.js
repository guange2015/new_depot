$(function() {
  $("input.datepicker").datepicker({
    format: 'yyyy年mm月dd日'
  });

  //产品菜单列表
  $('.nav-menu-root').on('click', function(event) {
    console.log($(this).text());
    var ul = $(this).parent().find('ul');
    if (ul) {
      if (ul.is(":hidden")) {
        ul.show();
      } else {
        ul.hide();
      }
    }
  });

  $('.nav-menu-leaf').on('click', function() {
    $('#myModal').modal('hide');
    var id = $(this).attr('data-id');
    $("input#fake_category").val($(this).text());
    $("input#firework_category_id").val(id);
  });

  $('input#fake_category').on('click', function() {
    $('#myModal').modal();
  });


});