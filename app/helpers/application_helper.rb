#coding=utf-8
module ApplicationHelper
	def format_date(f)
		f.strftime("%Y-%m-%d %H:%M") if f
	end

	def link_delete(f, un_finished=false)
		link_to "删除", f, :method => :delete, data: { :confirm => ("是否确定删除?" if admin? || un_finished) }
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

	def admin?
		current_user == "admin"
	end

  def menu_link_to(active, *args)
    s = "<li"
    s << " class=\"active\"" if active
    s << ">"
    s << "#{link_to(*args)}</li>"
    s.html_safe
  end

	def user?
		current_user == "user"
	end
	
  def login?
	  !!current_user
  end

  def current_user
    @current_user ||= session[:current_user_id]
  end
end
