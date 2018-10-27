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
        scraped_students << scraped_student
      end
      end
      @scraped_students
    end

  def self.scrape_profile_page(profile_url)
    profile_page = Nokogiri::HTML(open(profile_url))
    scraped_students = []
    links = profile_page.css(".social-icon-container").children.css("a").map { |el| el.attribute('href').value} #map over the array of 'a' tag objects and return just the attribute 'href' value

      links.each do |link|
        if link.include?("linkedin")
          linkedin = link
        end
        if link.include?("twitter")
          twitter = link
        end
        scraped_student = {
          linkedin: linkedin,
          twitter: twitter
        }
        scraped_students << scraped_student
      #now use conditionals to check if the link has a certain string (like 'linkedin') and if it does set key value pairs in student hash
    end
    scraped_students
  end

    #    linked_in =
    #    facebook =
    #    twitter = social.css(".social-icon").attribute("src").value
    #    bio = doc.css(".description-holder").first.text
    #    quote = doc.css(".profile-quote").text


  end
