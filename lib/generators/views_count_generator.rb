module ViewsCount
  module Generators
    class ViewsCountGenerator < Rails::Generators::Base
      hook_for :orm
      source_root File.expand_path('../templates', __FILE__)

      def copy_config_file
        template 'views_count.rb', 'config/initializers/views_count.rb'
      end

    end
  end
end
