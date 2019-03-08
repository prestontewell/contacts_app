class Contact < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  def run_created_at
    created_at.strftime("%e %b %Y %H:%M:%S%p")
  end
end
