class BestSellerBook::CLI

    def call 
        BestSellerBook::Scraper.new.create_books  # Create all books for list view
    puts "--------------------------------------------------"
    puts "------ Welcome to the Best Seller Books CLI ------"
    puts "--------------------------------------------------"
    start
    end

    def start
        puts "-------------------------------------------------------------"
        puts "What books would you like to see? 1-5, 6-10, 11-15 or 16-20?"
        puts "-------------------------------------------------------------"
    
        input = gets.strip

        if input == "1-5" || input == "6-10" || input == "11-15" || input == "16-20"
        print_books(input.to_i)
        else
          puts "-------------------------------"
          puts "I don't understand your answer."
          puts "-------------------------------"
        start
        end
    end

    def print_books(from_number) # Prints list view
        puts ""
        puts "---------- Books #{from_number} - #{from_number + 4} ----------"
        puts ""
        puts ""
        BestSellerBook::Book.all[from_number-1, 5].each.with_index(from_number) do |book, index|
          puts "#{index}. #{book.title} - #{book.author}"
          puts ""
          puts ""
        end
        puts "-----------------------------------------------------------------------------------"
        puts "---------- Which book would you like to know more about? (type a number) ----------"
        puts "-----------------------------------------------------------------------------------"
        puts "------------ Or would you like to choose from other books? (type 'Y')--------------"
        puts "-----------------------------------------------------------------------------------"

        input = gets.strip
        if input.upcase == "Y"
          start
        elsif book = BestSellerBook::Book.find_index(input.to_i)  # Get which book user wants
          print_book(book)
        else
          puts "-------------------------------"
          puts "I don't understand your answer."
          puts "-------------------------------"
          start
        end
        puts "------------------------------------------------"
        puts "Would you like to see another book? Enter Y or N"
        puts "------------------------------------------------"
        input = gets.strip.downcase           # Asking for another book
      if input == "y"
        start
      elsif input == "n"
      puts "----------------------------"
      puts "Thank you! Have a great day!"
      puts "----------------------------"
      exit
      else
      puts "-------------------------------"
      puts "I don't understand your answer."
      puts "-------------------------------"
      start
      end
    end


    def print_book(book) #Prints one book method
      BestSellerBook::Scraper.get_info(book)
      puts "--------------------------------------------------------------"
      puts "-------- #{book.title} --------"
      puts "--------------------------------------------------------------"
      puts "-------- Publication date: #{book.date}------" if book.date != nil
      puts "--------------------------------------------------------------"
      puts "-------- Price: #{book.price} --------"
      puts "--------------------------------------------------------------"
      puts "-------- Delivery Info: - #{book.delivery} - "
      puts "--------------------------------------------------------------"
      puts "-------- Number of pages: #{book.pages}" if book.pages != nil
      puts "--------------------------------------------------------------"
      puts "-------- Sales rank *** #{book.sales_rank} ***" if book.sales_rank != nil
      puts "--------------------------------------------------------------"
      puts "-------- Description:----------"
      puts "#{book.description}"
      puts "-------------- end -----------------"
    end

  end