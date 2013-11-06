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

  $("button.add_cate_item").on('click', function() {
    var node = $("<li class='cate_item'>hahadfadf</li>");
    // node.editable();
    var list = $(this).parent().children().first();
    list.append(node);
  });

  $(".sortable").sortable({
    connectWith: ".connectedSortable",
    start: function(event, ui) {
      $(ui.item).find(".edit").hide();
      $(ui.item).find(".remove").hide();
    },
    update: function( event, ui  ) {
      var list = event.target;
      var nodes = $(list).find("li a").map(function(){
        return $(this).attr("data-pk");
      }).get();
      console.log(nodes);
      $.ajax({
        type: 'POST',
        url: '/categories/'+$(list).attr("data-pk")+'/resort',
        data: {nodes: nodes}
      }).done(function (msg) {
        console.log(msg); 
      });
    }
  }).disableSelection();

});
