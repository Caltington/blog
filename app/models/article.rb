class Article < ApplicationRecord
  searchkick match: :word_start, suggest: [:title, :author], searchable: [:title, :author]

  include Visible

  has_many :comments

  validates :title, presence: true
  validates :author, presence: true
  validates :body, presence: true, length: { minimum: 10}

end
 