require "views_count/version"
require "views_count/railtie"

module ViewsCount
  
  mattr_accessor :time_frame
  @@time_frame = 24.hours

  # Load configuration from initializer
  def self.setup
    yield self
  end
end