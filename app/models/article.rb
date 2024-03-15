class Article < ApplicationRecord
  has_many :comments

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10}

  VALIDATE_STATUSES = ['public', 'private', 'archived']

  validates :status, inclusion: {in VALIDATE_STATUSES }
  def archived?
    status == 'archived'
  end
end
