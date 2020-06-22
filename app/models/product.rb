class Product < ActiveRecord::Base
    belongs_to :user
end

#user_id attr_acc