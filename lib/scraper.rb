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
    #doc.css("div.roster-cards-container").each do |card|
    #  card.css("div.student-card a").each do |student|
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
    @scraped_students
  end

end


#student.css(".student-location").text

#names doc.css("h4").text
#location doc.css("p").text
#kickstarter.css("li.project.grid_4").each do |project|
#   title = project.css("h2.bbcard_name strong a").text
#   projects[title.to_sym] = {
#     :image_link => project.css("div.project-thumbnail a img").attribute("src").value,
#     :description => project.css("p.bbcard_blurb").text,
#     :location => project.css("ul.project-meta span.location-name").text,
#     :percent_funded => project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i
#   }
 #end
