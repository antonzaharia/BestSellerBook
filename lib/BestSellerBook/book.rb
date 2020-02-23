class BestSellerBook::Book

    attr_accessor :title, :author, :date, :url, :price, :format
  
    @@all = []
  
    def self.new_from_index(book)
      self.new(
        title = book.css(".product-info-title a").text, 
        author = book.css(".product-shelf-author").text,
        date = book.css(".publ-date").text,
        url = book.css(".product-info-title a").attribute("href").value
      )
    end
  
    def initialize(title=nil, author=nil, date=nil, url=nil)
      @title = title
      @author = author
      @date = date
      @url = url
      @@all << self
    end
  
    def self.all
      @@all
    end
  
    def self.find_index(id)
      self.all[id-1]
    end
  
  
  
  end