#coding=utf-8
module DataFormsHelper
  def select_firework_name_tag(f)
    select_tag f.object_name+"[firework_id]",
               options_for_select(["--请选择--"]+Firework.all.collect{|p| [p.name+"=="+p.spec.to_s,p.id ]}),
              :onchange => ""
  end

  def depot_data_fill()
  	s = ''
  	Firework.all.each do |f| 
  		s << "$('#depot_last_data').data('#{f.id}',#{f.lastdata});"
  	end
  	s
  end

end
