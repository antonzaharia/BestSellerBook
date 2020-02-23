class BestSellerBook::CLI
    def call
        BestSellerBook::Scraper.new.create_books
    puts "Welcome to the Best Seller Books CLI"
    start
    end

    def start
        puts ""
        puts "What books would you like to see? 1-5 , 6-10, 11-15 or 16-20?"
    
        input = gets.strip.to_i
    
        print_books(input)
    
      end
      def print_books(from_number)
        puts ""
        puts "---------- Books #{from_number} - #{from_number+ 4} ----------"
        puts ""
        BestSellerBook::Book.all[from_number-1, 4].each.with_index(from_number) do |book, index|
          puts "#{index}. #{book.title} - #{book.author}"
        end
      end
end