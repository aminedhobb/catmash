class Cat < ApplicationRecord
  validates :auid, presence: true uniqueness: true
  validates :url, presence: true, uniqueness: true
end
