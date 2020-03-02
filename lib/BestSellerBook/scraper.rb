
class BestSellerBook::Scraper

    def page_load #Loading index page with the top 20 from barnesandnoble
      Nokogiri::HTML(open("https://www.barnesandnoble.com/b/the-top-100-bestsellers-of-the-year/_/N-1p4d?Nrpp=20&page=1"))
    end
  
    def scrape_book_list # Scraping each book for list view
      self.page_load.css(".col-lg-9")
    end

    def create_books # Create each book for list view
      scrape_book_list.each do |book|
        book_info = {
          :title => book.css(".product-info-title a").text, 
          :author => book.css(".product-shelf-author").text,
          :date => book.css(".publ-date").text,
          :url => book.css(".product-info-title a").attribute("href").value
        }
        BestSellerBook::Book.new_from_index(book_info)
      end

    end

    def self.get_info(book) # Makes the url for each book
      doc = Nokogiri::HTML(open("https://www.barnesandnoble.com/#{book.url}"))
      book.price ||= doc.css(".price").text
      book.description ||= doc.css(".text--medium p").text
      book.delivery ||= doc.css(".shipping-message-text").text
      info = doc.css(".plain th")
      data = doc.css(".plain td")

      info.each_with_index do |d,i| 
        if d.text == "Publication date:"
          book.date = data[i].text
        elsif d.text == "Pages:"
          book.pages = data[i].text
        elsif d.text == "Sales rank:"
          book.sales_rank = data[i].text
        else
          nil
        end
      end

    end

  #   def price # Gets the price
  #     @price ||= doc.css(".price").text
  #   end

  #   def description # Gets the description
  #     @decription ||= doc.css(".text--medium p").text
  #   end

  #   def live_delivery # Gets the live delivery info
  #     @delivery ||= doc.css(".shipping-message-text").text
  #   end



  #   def info # More Info Array
  #     info = doc.css(".plain th")
  #   end
  #   def data # More Info Data Array (to be printed)
  #     data = doc.css(".plain td")
  #   end

    
  #   def date # Gets the publication date
  #     info.each_with_index do |d,i| 
  #       if d.text == "Publication date:"
  #         return data[i].text
  #       else
  #         nil
  #       end
  #     end
  #   end

  #   def pages # Gets the number of pages
  #     info.each_with_index do |d,i| 
  #       if d.text == "Pages:"
  #         return data[i].text
  #       else
  #         nil
  #       end
  #     end
  #   end

  #   def sales_rank # Gets the sale rank
  #     info.each_with_index do |d,i| 
  #       if d.text == "Sales rank:"
  #         return data[i].text
  #       else
  #         nil
  #       end
  #     end
  #   end
    
  
  end
  