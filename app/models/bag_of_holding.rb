class BagOfHolding < ApplicationRecord
    validates :name, :presence => true, uniqueness: { scope: :user_id }
    validates :user_id, :presence => true
end
