require 'redmine'

Redmine::Plugin.register :redmine_quips do
  name 'Redmine Quips plugin'
  author 'Wolfgang Schnerring <ws@gocept.com>'
  description 'Display a random quip on the issue list'
  version '0.0.1'
end
