require 'redmine'
require 'redmine/hook'


Redmine::Plugin.register :redmine_quips do
  name 'Redmine Quips plugin'
  author 'Wolfgang Schnerring <ws@gocept.com>'
  description 'Display a random quip on the issue list'
  version '0.0.1'
end


class QuipHook < Redmine::Hook::ViewListener
  render_on :view_layouts_base_content, :partial => "quips/inject"
  render_on :view_layouts_base_html_head, :partial => "quips/head"
end
