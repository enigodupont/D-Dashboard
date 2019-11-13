class Inventory < ApplicationRecord
    # Need to add foreign key
    # belongs_to :bag_of_holding
    validates :bag_id, :presence => true
    validates :itemName, :presence => true
    validates :weight, :presence => true
end
