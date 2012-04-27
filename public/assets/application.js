/*
* Unobtrusive autocomplete
*
* To use it, you just have to include the HTML attribute autocomplete
* with the autocomplete URL as the value
*
*   Example:
*       <input type="text" data-autocomplete="/url/to/autocomplete">
*
* Optionally, you can use a jQuery selector to specify a field that can
* be updated with the element id whenever you find a matching value
*
*   Example:
*       <input type="text" data-autocomplete="/url/to/autocomplete" data-id-element="#id_field">
*/


(function(jQuery)
{
  var self = null;
  jQuery.fn.railsAutocomplete = function() {
    return this.live('focus',function() {
      if (!this.railsAutoCompleter) {
        this.railsAutoCompleter = new jQuery.railsAutocomplete(this);
      }
    });
  };

  jQuery.railsAutocomplete = function (e) {
    _e = e;
    this.init(_e);
  };

  jQuery.railsAutocomplete.fn = jQuery.railsAutocomplete.prototype = {
    railsAutocomplete: '0.0.1'
  };

  jQuery.railsAutocomplete.fn.extend = jQuery.railsAutocomplete.extend = jQuery.extend;
  jQuery.railsAutocomplete.fn.extend({
    init: function(e) {
      e.delimiter = jQuery(e).attr('data-delimiter') || null;
      function split( val ) {
        return val.split( e.delimiter );
      }
      function extractLast( term ) {
        return split( term ).pop().replace(/^\s+/,"");
      }

      jQuery(e).autocomplete({
        source: function( request, response ) {
          jQuery.getJSON( jQuery(e).attr('data-autocomplete'), {
            term: extractLast( request.term )
          }, function() {
            jQuery(arguments[0]).each(function(i, el) {
              var obj = {};
              obj[el.id] = el;
              jQuery(e).data(obj);
            });
            response.apply(null, arguments);
          });
        },
        search: function() {
          // custom minLength
          var term = extractLast( this.value );
          if ( term.length < 2 ) {
            return false;
          }
        },
        focus: function() {
          // prevent value inserted on focus
          return false;
        },
        select: function( event, ui ) {
          var terms = split( this.value );
          // remove the current input
          terms.pop();
          // add the selected item
          terms.push( ui.item.value );
          // add placeholder to get the comma-and-space at the end
          if (e.delimiter != null) {
            terms.push( "" );
            this.value = terms.join( e.delimiter );
          } else {
            this.value = terms.join("");
            if (jQuery(this).attr('data-id-element')) {
              jQuery(jQuery(this).attr('data-id-element')).val(ui.item.id);
            }
            if (jQuery(this).attr('data-update-elements')) {
              var data = jQuery(this).data(ui.item.id.toString());
              var update_elements = jQuery.parseJSON(jQuery(this).attr("data-update-elements"));
              for (var key in update_elements) {
                //jQuery(update_elements[key]).val(data[key]);
                //修改原因，这里要排作span,而非form字段
                jQuery(update_elements[key]).text(data[key]);
              }
            }
          }
          var remember_string = this.value;
          jQuery(this).bind('keyup.clearId', function(){
            if(jQuery(this).val().trim() != remember_string.trim()){
              jQuery(jQuery(this).attr('data-id-element')).val("");
              jQuery(this).unbind('keyup.clearId');
            }
          });
          jQuery(this).trigger('railsAutocomplete.select', ui);

          return false;
        }
      });
    }
  });

  jQuery(document).ready(function(){
    jQuery('input[data-autocomplete]').railsAutocomplete();
  });
})(jQuery);
var g_fieldset_html;
function add_data_list()
{
	var s = g_fieldset_html;
	var num = Number($("fieldset").last().attr("id").substr(8))+1;
	s = s.replace(/\[0\]/g,"["+num+"]");
	s = s.replace(/\_0\_/g,"_"+num+"_");
	//alert(s);
	$("#fieldset"+(num-1)).after("<fieldset id=\"fieldset"+num+"\">"+s+"</fieldset>");

	$("#fieldset"+(num)).hide();
	$('#data_form_data_lists_attributes_'+num+'_firework_id').combobox({size: 40});

	$("#fieldset"+(num)).fadeIn(1500);
}

function firework_select(id)
{
	$('#depot_last_data').html($('#depot_last_data').data(id));
}

function commit_data() {
	document.forms[0].submit();
}
;
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//

;
