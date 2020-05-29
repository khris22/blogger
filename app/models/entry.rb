class Entry < ApplicationRecord
    belongs_to :user
    has_many :comments

    validates :title, presence: true
    validates :notes, presence: true


end
