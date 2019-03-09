class Contact < ApplicationRecord
  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :email, presence: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/
  def run_created_at
    created_at.strftime("%e %b %Y %H:%M:%S%p")
  end
end
