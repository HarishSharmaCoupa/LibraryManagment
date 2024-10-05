class Book < ApplicationRecord
    validates :name, presence: true, length: { minimum: 6, maximum: 100 }
    validates :isbn, presence: true, length: { maximum: 10 }, uniqueness: { case_sensitive: false }
    validates :author, presence: true, length: { maximum: 50 }
    validates :year, presence: true, length: { maximum: 50 }

    belongs_to :user
end
