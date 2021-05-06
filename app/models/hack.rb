class Hack < ApplicationRecord
    belongs_to :user

    acts_as_votable

    acts_as_followable

    validates :title, presence: true, uniqueness: true
    validates :description, presence: true
    validates :title,:description, length: { minimum: 6 } 
    validates :title, :description, length: { maximum: 20 } 


    def self.search(search)
        # Title is for the above case, the OP incorrectly had 'name'
        where("title LIKE ?", "%#{search}%")
      end
end
