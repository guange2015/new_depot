class FireworksController < ApplicationController
  def new
  	@firework = Firework.new
  end

  def create
  	@firework = Firework.new(params[:firework])
  	if @firework.save
  		redirect_to fireworks_path
  	else
  		render :new
  	end
  end

  def index
  	@fireworks = Firework.all(:order => "name,created_at DESC")
  end

  def destroy
    firework = Firework.find(params[:id])
    firework.destroy

    redirect_to fireworks_path
  end

  def finished
    @df = DataForm.find(params[:id])
    unless @df.finished?
      @df.data_lists.each do |dl|
        unless dl.finished?
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
end
