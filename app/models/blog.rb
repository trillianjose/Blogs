class Blog < ApplicationRecord
  belongs_to :author

  validates :content, :author, presence: true
end
