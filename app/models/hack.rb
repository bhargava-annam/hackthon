class Hack < ApplicationRecord
    belongs_to :user

    acts_as_votable

    acts_as_followable

    validates :title, presence: true
    validates :description, presence: true
    validates :title,:description, length: { minimum: 6 } 
    validates :title, :description, length: { maximum: 15 } 
end
