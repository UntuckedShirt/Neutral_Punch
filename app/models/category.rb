class Category < ApplicationRecord
    #refer to has mny assocations in rails guide
    validates :name, presence: true, length: { minimum: 3, maximum: 25 }
    validates_uniqueness_of :name
    has_many :jab_categories
    has_many :jabs, through: :jab_categories
  end