class Hack < ApplicationRecord
    belongs_to :user

    acts_as_votable

    acts_as_followable
end
