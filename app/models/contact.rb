class Contact < ApplicationRecord
  def run_created_at
    created_at.strftime("%e %b %Y %H:%M:%S%p")
  end
end
