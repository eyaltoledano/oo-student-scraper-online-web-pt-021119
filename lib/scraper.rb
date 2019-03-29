require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = open(index_url)
    index_page = Nokogiri::HTML(html)
    students_array = []
    index_page.css('.student-card').each do |student|
      hash = {}
      hash[:name] = student.children.children[3].children[1].text
      hash[:location] = student.children.children[3].children[3].text
      hash[:profile_url] = student.children[1].values.first
      students_array << hash
    end
    students_array
  end

  def self.scrape_profile_page(profile_url)
    html = open(profile_url)
    profile_page = Nokogiri::HTML(html)
    hash = {}
    profile_page.css('').each do |student|
      # hash[:twitter] = 
      # hash[:linkedin] = 
      # hash[:github] = 
      # hash[:blog] = 
      # hash[:profile_quote] = 
      # hash[:bio] = 
    end
  end

end
