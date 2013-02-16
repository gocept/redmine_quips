class QuipsController < ApplicationController
  before_filter :authorize

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

  def edit
    @quip = Quip.find(params[:id])
    if request.put? and @quip.update_attributes(params[:quip])
      flash[:notice] = 'Quip edited successfully.'
      redirect_to :action => 'index'
    end
  end

  def destroy
    if request.post?
      @quip = Quip.find(params[:id])
      @quip.destroy
    end
    redirect_to :action => 'index'
  end

  def authorize(ctrl = params[:controller], action = params[:action])
    allowed = User.current.allowed_to?({:controller => ctrl, :action => action}, nil, :global => true)
    allowed ? true : deny_access
  end
end
