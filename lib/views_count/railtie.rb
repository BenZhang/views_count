require 'rails/railtie'

module ViewsCount
  class Railtie < Rails::Railtie

    initializer 'views_count.model' do |app|
      require "models/views_count/views_countable.rb"
      require "models/views_count/view_item.rb"
      ActiveRecord::Base.send(:include, ViewsCount::ViewsCountable)
    end

  end
end