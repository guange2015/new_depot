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

  if ($.fn.jinplace) {
    $.fn.jinplace.defaults.ajaxType = 'put';
    $.fn.jinplace.defaults.placeholder = '';
    $('.editable').jinplace();
  }


  $(".cate_item").hover(function() {
    $(this).find(".edit").show();
    $(this).find(".remove").show();
  }, function() {
    $(this).find(".edit").hide();
    $(this).find(".remove").hide();
  });

  // $.fn.editable.defaults.ajaxOptions = {
  //   type: "PUT"
  // };
  $("li.cate_item>.edit").click(function(e) {
    var css = ".editable[data-pk=" + $(this).attr("data-id") + "]";
    e.stopPropagation();
    $(css).editable({
      success: function(response, newValue) {
        if (response.status == 'error') return response.msg; //msg will be shown in editable form
      }
    })
    $(css).editable('toggle');
  });

  $(".sortable").sortable({
    connectWith: ".connectedSortable",
    start: function(event, ui) {
      $(ui.item).find(".edit").hide();
      $(ui.item).find(".remove").hide();
    },
    update: function(event, ui) {
      var list = event.target;
      var nodes = $(list).find("li a").map(function() {
        return $(this).attr("data-pk");
      }).get();
      console.log(nodes);
      $.ajax({
        type: 'POST',
        url: '/categories/' + $(list).attr("data-pk") + '/resort',
        data: {
          nodes: nodes
        }
      }).done(function(msg) {
        console.log(msg);
      });
    }
  }).disableSelection();

  $("button.add_cate_item").click(function(event) {
    var offset = $(this).offset();
    var e = $("#class_input_helper");
    offset.left += $(this).width() + 30;
    offset.top -= e.height() / 2;
    offset.top += $(this).height() / 2;
    e.show();
    e.offset(offset);
    e.find("input").focus();
    event.stopPropagation();
  });
  $("#class_input_helper").click(function(event) {
    event.stopPropagation();
  });

  $("body").click(function() {
    var e = $("#class_input_helper");
    if (e.is(":visible")) {
      e.fadeOut();
    }
  });

});
