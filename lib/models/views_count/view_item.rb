module ViewsCount
  class ViewItem < ActiveRecord::Base
    belongs_to :target, polymorphic: true

    if respond_to?(:attr_accessible)
      attr_accessible :user_id, :viewed_on, :ip_address
    end

  end
end