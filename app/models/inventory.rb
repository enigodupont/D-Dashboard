class Inventory < ApplicationRecord
    validates :bag_id, :presence => true
    validates :itemName, :presence => true
    validates :weight, :presence => true
end
