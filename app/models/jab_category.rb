class JabCategory < ApplicationRecord
    #this model belongs to jabs and categories
    belongs_to :jab
    belongs_to :category
end