class FireworksController < ApplicationController
  autocomplete :firework, :name, :full => true,:extra_data => [:lastdata]

  def new
  	@firework = Firework.new
  end
  
  def back_up
    UserMailer.backup.deliver!
  end

  def create
  	@firework = Firework.new(firework_params)
  	if @firework.save
  		redirect_to fireworks_path
  	else
  		render :new
  	end
  end

  def index
    @categories = Category.categories
  	condition = Firework
    condition = condition.where(category_id: params[:root]) if  params[:root] 
    @fireworks = condition.order("name,created_at DESC").
  	          page(params[:page]||1).per(20)
  end

  def destroy
    firework = Firework.find(params[:id])
    firework.destroy

    redirect_to fireworks_path
  end

  def show
    @firework = Firework.find(params[:id])
  end

  def search
    @fireworks = my_search(
                    params[:encode] == "base64" ? decode_utf_url(params[:q]) : params[:q], 
                    params[:spec]).page(params[:page]||1).per(20)
    render :index
  end

  def finished
    @df = DataForm.find(params[:id])
    unless @df.finished?
      @df.data_lists.each do |dl|
        unless dl.finished?
          dl.before_data = dl.firework.lastdata
          if dl.s_type == 1
            dl.firework.lastdata += dl.data_number
          elsif dl.s_type == 2
            dl.firework.lastdata -= dl.data_number
          end
          dl.last_data = dl.firework.lastdata
          dl.finish!
          dl.save!
          dl.firework.save!
        end
      end
      @df.finish!
      @df.save!
    end

  end 
  
  
  private
  def my_search(name, spec=nil)
    find_sql = "name like '%#{name}%'"
    find_sql << " and spec = '#{spec}' " if spec
    Firework.where(find_sql)
  end 

  def firework_params
    params.require(:firework).permit(:name, :spec, :comment, :lastdata, :rate)
  end
end
