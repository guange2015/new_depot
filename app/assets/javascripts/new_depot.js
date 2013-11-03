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

  if ($.fn.editable) {
    $.fn.editable.defaults.mode = 'inline';
    $.fn.editable.defaults.ajaxOptions = {type: "PUT"};
    // $("li.cate_item").editable();
  }

  $("cate_item .edit").on('click',function () {
    $(this).parent().editable();
  });

  $("li.cate_item").hover(
    function () {
     console.log("on hover"); 
     $(this).find(".edit").show();
     $(this).find(".remove").show();
    },
    function () {
     console.log("lever"); 
     $(this).find(".edit").hide();
     $(this).find(".remove").hide();
    }
  );

  $("button.add_cate_item").on('click', function () {
    var node = $("<li class='cate_item'>hahadfadf</li>");
    // node.editable();
    var list = $(this).parent().children().first();
    list.append(node);
  });

});
