class QuestLog < ApplicationRecord
  validates :title, :presence => true, :uniqueness => true
  validates :log, :presence => true
  validates :dm, :presence => true
end
