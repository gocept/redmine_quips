require 'redmine'
require 'redmine/hook'


Redmine::Plugin.register :redmine_quips do
  name 'Redmine Quips plugin'
  author 'Wolfgang Schnerring <ws@gocept.com>'
  description 'Display a random quip below the page header'
  version '0.0.3'

  permission :view_quips, { :quips => :index }
  permission :add_quips, { :quips => [:new, :thanks] }
  permission :delete_quips, { :quips => :destroy }
end


class QuipHook < Redmine::Hook::ViewListener
  render_on :view_layouts_base_content, :partial => "quips/inject"
  render_on :view_layouts_base_html_head, :partial => "quips/head"
end
