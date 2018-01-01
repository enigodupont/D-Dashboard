class BagOfHolding < ApplicationRecord
    validates :name, :presence => true, :uniqueness => true
end
