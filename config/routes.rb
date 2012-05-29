ActionController::Routing::Routes.draw do |map|
  map.connect 'quips/:action', :controller => 'quips'
end
