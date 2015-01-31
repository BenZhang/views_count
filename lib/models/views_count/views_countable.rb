module ViewsCount
  module ViewsCountable
    extend ActiveSupport::Concern

    module ClassMethods

      def has_views_count(options = {})
        has_many :view_items, as: :target, dependent: :destroy, class_name: 'ViewsCount::ViewItem'
        @@views_count_options = {
          counter_cache: true,
          column_name:   :views_count,
          unique:        true
        }.merge(options)

        class_eval do
          def add_views_count(request, user = nil)
            raise ArgumentError if request.nil? && user.nil?

            view_item = if user.nil?
              self.view_items.where(ip_address: request.remote_ip).last
            else
              self.view_items.where(user_id: user.id).last
            end
            
            return if view_item and view_item.viewed_on >= ViewsCount.time_frame.ago
            
            if view_item
              view_item.viewed_on = Time.now
            else
              view_item = self.view_items.build(ip_address: request.remote_ip, user_id: user.try(:id), viewed_on: Time.now)
            end

            begin
              transaction do
                view_item.save!
                self.class.update_all("#{@@views_count_options[:column_name]} = COALESCE(#{@@views_count_options[:column_name]}, 0) + 1", {id: id})
                self.reload
              end
            rescue ActiveRecord::RecordNotUnique
            rescue ActiveRecord::RecordInvalid
            end
          end
        end
      end

    end

  end
end