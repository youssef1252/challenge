class Product < ApplicationRecord
  has_many :favorites
  has_many :visbilities
end
