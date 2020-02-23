require_relative 'BestSellerBook/version'
require_relative 'BestSellerBook/cli'
require_relative 'BestSellerBook/scraper'
require_relative 'BestSellerBook/book'

require 'open-uri'
require 'nokogiri'


module BestSellerBook
  class Error < StandardError; end
  # Your code goes here...
end
