class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # ex of method you might want: .random, now every ORM class has a random method
end
