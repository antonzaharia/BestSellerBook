class BestSellerBook::Book

    attr_accessor :title, :author, :date, :url, :price, :reviews, :description, :delivery, :pages, :sales_rank
  
    @@all = []

    def self.new_from_index(book_info) # To use in Scraper.rb to create each book for list view
      self.new(
        title = book_info[:title], 
        author = book_info[:author],
        date = book_info[:date],
        url = book_info[:url]


        # title = book.css(".product-info-title a").text, 
        # author = book.css(".product-shelf-author").text,
        # date = book.css(".publ-date").text,
        # url = book.css(".product-info-title a").attribute("href").value
      )
    end
  
    def initialize(title=nil, author=nil, date=nil, url=nil)
      @title = title
      @author = author
      @date = date
      @url = url
      @@all << self
      @description = nil
    end
  
    def self.all
      @@all
    end
  
    def self.find_index(id) # Select one book using input
      self.all[id-1]
    end
  
  end