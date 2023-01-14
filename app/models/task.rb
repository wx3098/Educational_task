class Task < ApplicationRecord
    validates :name, presence: true
    validates :detail, presence: true

    include Searchable
    define_like_search :name, :status

    enum status:{
       未着手:1, 着手中:2, 完了:3 
    }
end
