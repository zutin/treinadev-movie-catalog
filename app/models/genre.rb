class Genre < ApplicationRecord
  has_many :directors
  has_many :movies
end
