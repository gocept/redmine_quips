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

  def set_quip_text
    unless request.post? or request.put? then
      return render(:text => 'Method not allowed', :status => 405)
    end
    @quip = Quip.find(params[:id])
    @quip.update_attribute(:text, params[:value])
    render :text => CGI::escapeHTML(@quip.text)
  end

  def destroy
    if request.post?
      @quip = Quip.find(params[:id])
      @quip.destroy
    end
    render :partial => "list", :locals => { :quips => Quip.find(:all) }
  end

  def authorize(ctrl = params[:controller], action = params[:action])
    allowed = User.current.allowed_to?({:controller => ctrl, :action => action}, nil, :global => true)
    allowed ? true : deny_access
  end
end
