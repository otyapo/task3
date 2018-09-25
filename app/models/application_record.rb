class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

# validates :name, length: {in: 1..20 }

end
