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
<<<<<<< HEAD

    profile_page.css('.social-icon-container').each do |social_icon|
      binding.pry
      
      hash[:twitter] = social_icon.children[1].attributes["href"].value unless social_icon.children[1].attributes["href"].value.nil?

      hash[:linkedin] = social_icon.children[3].attributes["href"].value unless social_icon.children[3].attributes["href"].value.nil?

      hash[:github] = social_icon.children[5].attributes["href"].value unless social_icon.children[5].attributes["href"].value.nil?

      hash[:blog] = social_icon.children[7].attributes["href"].value unless social_icon.children[7].attributes["href"].value.nil?
=======
    profile_page.css('').each do |student|
      # hash[:twitter] =
      # hash[:linkedin] =
      # hash[:github] =
      # hash[:blog] =
    end

    profile_page.css('.profile_quote').each do |student|
      binding.pry
      # hash[:profile_quote] =
    end

    profile_page.css('.bio-content content-holder').css('description-holder').each do |student|
      # hash[:bio] =
>>>>>>> 336d4408f8aefe2d795672b6c13621be4f3b4d92
    end

    hash[:profile_quote] = profile_page.css('div.profile-quote').text
    hash[:bio] = profile_page.css('.bio-content').children[3].text.strip
    # binding.pry
    hash
  end

end
