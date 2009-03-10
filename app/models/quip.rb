class Quip < ActiveRecord::Base
  class << self
    def random
      "some quip"
    end
  end
end
