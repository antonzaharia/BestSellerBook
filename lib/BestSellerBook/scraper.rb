
class BestSellerBook::Scraper

    def page_load
      Nokogiri::HTML(open("https://www.barnesandnoble.com/b/the-top-100-bestsellers-of-the-year/_/N-1p4d?Nrpp=20&page=1"))
    end
  
    def scrape_book_list
      self.page_load.css(".col-lg-9")
    end
  
    def create_books
      scrape_book_list.each do |book|
        BestSellerBook::Book.new_from_index(book)
      end
    end
  
  end
  