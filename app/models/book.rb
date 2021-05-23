class Book < ApplicationRecord
    enum sales_status: {
        reservation: 0, # 予約受付
        now_on_sale: 1, # 発売中
        end_of_print: 2, # 販売終了
    }

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

    after_destroy do
        Rails.logger.info "Book is deleted; #{self.attributes}"
    end

    after_destroy :if => :hight_price? do
        Rails.logger.warn "Book with high price is deleted: #{self.attributes}"
    end

    def hight_price?
        price >= 500
    end 

end
