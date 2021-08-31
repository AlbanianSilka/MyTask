class Keyword < ApplicationRecord
  validates_presence_of :key, :link
end