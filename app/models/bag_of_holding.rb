class BagOfHolding < ApplicationRecord
    validates :name, :presence => true, uniqueness: { scope: :user_id }
    validates :user_id, :presence => true
    # Need to add dependency
    # has_many  :inventories, :dependent => :delete_all
end
