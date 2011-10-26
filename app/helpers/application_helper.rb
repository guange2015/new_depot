#coding=utf-8
module ApplicationHelper
	def format_date(f)
		f.strftime("%Y-%m-%d %H:%M") if f
	end

	def link_delete(f, un_finished=false)
		link_to "删除", f, :method => :delete,:confirm => "是否确定删除?" if admin? || un_finished
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
			'jquery-ui-i18n','jquery-combobox-min'
	end

	def admin?
		current_user == "admin"
	end

	def user?
		current_user == "user"
	end

	def current_user
    	_current_user ||= session[:current_user_id]
  	end

  	def logged_in?
  		!!current_user
 	end
end


class MyLinkRenderer < WillPaginate::ActionView::LinkRenderer
  # Process it! This method returns the complete HTML string which contains
  # pagination links. Feel free to subclass LinkRenderer and change this
  # method as you see fit.
  def to_html
    html = pagination.map do |item|
      item.is_a?(Fixnum) ?
        page_number(item) :
        send(item)
    end.join(@options[:link_separator])
    html = tag(:ul, html)
    
    @options[:container] ? html_container(html) : html
  end
  
  protected    
  def page_number(page)
    unless page == current_page
      '<li>'+link(page, page, :rel => rel_value(page))+'</li>'
    else
      #tag(:em, page, :class => 'current')
      '<li class="active">'+link(page, page, :rel => rel_value(page))+'</li>'
    end
  end

  def gap
        text = @template.will_paginate_translate(:page_gap) { '&hellip;' }
        #%(<span class="gap">#{text}</span>)
        %(<li class="disabled"><a>#{text}</a></li>)
  end

  private
  def previous_or_next_page(page, text, classname)
  	pre_str = '<li '
    if page
      pre_str += ">"
    else
      if classname == "next_page"
      	pre_str += 'class="next disabled">'
      elsif classname == "previous_page"
      	pre_str += 'class="prev disabled">'
      else 
      	pre_str += 'class="disabled">'
      end
    end
    pre_str + link(text, page ? page: '#')+'</li>'
  end

end