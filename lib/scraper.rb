require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)
      doc = Nokogiri::HTML(open(index_url))
      scraped_students = []
      doc.css("div.roster-cards-container").each do |card|
        card.css("div.student-card a").each do |student|
          student_name = student.css(".student-name").first.text,
          student_location = student.css(".student-location").text,
          student_profile_url = student.attr('href')
        scraped_student = {
          name: student_name[0],
          location: student_location,
          profile_url: student_profile_url
        }
        #binding.pry
        scraped_students << scraped_student
      end
      end
      @scraped_students
    end

  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open(profile_url))
    scraped_students = []
    doc.css("social-icon-container").each do |card|
      card.css("social-icon").each do |student|
    #    student_name = student.css(".student-name").first.text,
    #    student_location = student.css(".student-location").text,
    #    student_profile_url = student.attr('href')
    #  scraped_student = {
    #    name: student_name[0],
    #    location: student_location,
    #    profile_url: student_profile_url
      #}
      binding.pry
      scraped_students << scraped_student
    end
  end
    @scraped_students
  end

end


#twitter
#linked in
#facebook
#github
#bio    doc.css(".description-holder").first.text
#quote  doc.css(".profile-quote").text
