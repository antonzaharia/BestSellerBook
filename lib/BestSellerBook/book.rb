class BestSellerBook::Book

    attr_accessor :title, :author, :date, :url, :price, :reviews, :decription, :delivery
  
    @@all = []
  
    def self.new_from_index(book) # To use in Scraper.rb to create each book for list view
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
      @decription = nil
    end
  
    def self.all
      @@all
    end
  
    def self.find_index(id) # Select one book using input
      self.all[id-1]
    end

    def doc
      Nokogiri::HTML(open("https://www.barnesandnoble.com/#{@url}"))
    end

    def price
      @price ||= doc.css(".price").text
    end

    def description
      @decription ||= doc.css(".text--medium p").text
    end

    def live_delivery
      @delivery ||= doc.css(".shipping-message-text").text
    end

    def info
      info = doc.css(".plain th")
    end
    def data
      data = doc.css(".plain td")
    end

    def pages 
      info.each_with_index do |d,i| 
        if d.text == "Pages:"
          return data[i].text
        else
          nil
        end
      end
    end

    def date 
      info.each_with_index do |d,i| 
        if d.text == "Publication date:"
          return data[i].text
        else
          nil
        end
      end
    end

    def pages 
      info.each_with_index do |d,i| 
        if d.text == "Pages:"
          return data[i].text
        else
          nil
        end
      end
    end

    def sales_rank
      info.each_with_index do |d,i| 
        if d.text == "Sales rank:"
          return data[i].text
        else
          nil
        end
      end
    end

      


  
  end