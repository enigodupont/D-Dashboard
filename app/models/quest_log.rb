class QuestLog < ApplicationRecord
  validates :title, :presence => true, :uniqueness => true
  validates :log, :presence => true
  validates :dm_id, :presence => true
end
