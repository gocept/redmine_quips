class Quip < ActiveRecord::Base
  validates_presence_of :text

  class << self
    def random
      # see <http://almosteffortless.com/2007/12/04/random-records-in-rails/>
      ids = connection.select_all("SELECT id FROM #{table_name}")
      find(ids[rand(ids.length)]["id"].to_i).text unless ids.blank?
    end
  end
end
