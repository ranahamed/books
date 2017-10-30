class Author < ApplicationRecord
  belongs_to :book , optional: true

  
  
end
