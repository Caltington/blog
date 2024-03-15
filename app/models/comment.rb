class Comment < ApplicationRecord
  belongs_to :article

  VALIDATE_STATUSES = ['public', 'private', 'archived']

  validates :status, :inclusion: {in: VALIDATE_STATUSES}
  
  def archived?
    status == 'archived'
  end
end
