function add_data_list()
{
	var s = $("#fieldset0").html();
	var num = Number($("fieldset").last().attr("id").substr(8))+1;
	s = s.replace(/\[0\]/g,"["+num+"]");
	s = s.replace(/\_0\_/g,"_"+num+"_");
	//alert(s);
	$("#fieldset"+(num-1)).after("<fieldset id=\"fieldset"+num+"\">"+s+"</fieldset>");

	$("#fieldset"+(num)).hide();
	$("#fieldset"+(num)).fadeIn(1500);
}