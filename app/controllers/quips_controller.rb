class QuipsController < ApplicationController
  def index
    @quips = Quip.find(:all)
  end

  def new
    @quip = Quip.new(params[:quip])
    if request.post? and @quip.save
      flash[:notice] = 'Quip added successfully.'
      redirect_to :action => 'thanks', :id => @quip.id
    end
  end

  def thanks
    @quip = Quip.find(params[:id])
  end

  def destroy
    if request.post?
      @quip = Quip.find(params[:id])
      @quip.destroy
    end
    render :partial => "list", :locals => { :quips => Quip.find(:all) }
  end
end
