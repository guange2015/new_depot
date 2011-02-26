#coding=utf-8
module ApplicationHelper
	def format_date(f)
		f.strftime("%Y-%m-%d %H:%M")
	end

	def link_delete(f)
		link_to "删除", f, :method => :delete,:confirm => "是否确定删除?" if Rails.env.eql? "development"
	end

	def s_type_to_s(s)
		s == "in" ? "入库" : "出库"
	end
end
