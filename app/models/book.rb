class Book < ApplicationRecord
    belongs_to :publisher
    has_many :book_authors
    has_many :authors, through: :book_authors

    validate do |book|
        if book.name.include?("execrise")
            book.errors[:name] << "I don't like execrise."
        end
    end

    before_validation do  
        self.name = self.name.gsub(/Cat/) do |matched|
            "lovely #{matched}"
        end
    end

    before_validation :add_lovely_to_cat

    def add_lovely_to_cat
        self.name = self.name.gsub(/Cat/) do |matched|
            "lovely2 #{matched}"
        end
    end
end
