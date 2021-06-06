class Jab < ApplicationRecord
    #user has many jabs
    belongs_to :user
    has_many :jab_categories
    has_many :categories, through: :jab_categories
    validates :title, presence: true, length: { minimum: 6, maximum: 100 }
    validates :description, presence: true, length: { minimum: 10, maximum: 300 }
end