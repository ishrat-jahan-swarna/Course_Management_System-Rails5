class Course < ApplicationRecord
    validates   :code, :title, :credit, :days, presence: true
    validates   :code, :title, uniqueness:true
    validates   :credit, numericality: { greater_than_or_equal_to: 0.01 }
    has_and_belongs_to_many :departments
end
