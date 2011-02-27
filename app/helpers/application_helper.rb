#coding=utf-8
module ApplicationHelper
	def format_date(f)
		f.strftime("%Y-%m-%d %H:%M") if f
	end

	def link_delete(f)
		link_to "删除", f, :method => :delete,:confirm => "是否确定删除?" if Rails.env.eql? "development"
	end

	def s_type_to_s(s)
		s == "in" ? "入库" : "出库"
	end

	def s_type_to_value(s)
		s == "in" ? 1 : 2
	end

	def encode_utf_url(code)
	  Base64.encode64(code).strip.gsub(/%/,"|").gsub(/[=]/,"!").gsub(/\+/,'*').gsub(/\//,'-')
	end
	
	def decode_utf_url(code)
	  Base64.decode64(code.gsub(/|/,"%").gsub(/!/,"=").gsub(/\*/,'+').gsub(/\-/,'/'))
	end

	def include_autocomplete_js
		javascript_include_tag 'jquery-ui.min',
			'jquery-ui-i18n','jquery-combobox-min',:cache=>'auto_complete_all'
	end

end
