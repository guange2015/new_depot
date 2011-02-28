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