require 'nokogiri'
require 'open-uri'

class Characters
  def initialize
    @results = page.css('td a') { |link| link.content }
  end

  def top_1000
    @tops ||= @results.map {|char| char.content }.to_a
  end

  def find(number)
    if number < 1
      []
    elsif number > @results.size
      []
    else
      top_1000[number - 1]
    end
  end

  def find_by(string, case_sensitive: false)

    if case_sensitive
      result = @results.select { |link| link.text.include?(string) }.map { |char| char.text }
    else
      lowercase = string.downcase
      capcase = string.capitalize
      result = @results.select { |link| link.text.include?(string) || link.text.include?(lowercase) || link.text.include?(capcase) }.map { |chars| chars.text }
    end
    result
  end

  def print(list)
    get_names(list)
  end

  private

  def page
    @topchars ||= Nokogiri::HTML(open('http://users.nexustk.com/webreport/PowerAll.htm'))
  end

  def list_empty?(list)
    if list.empty?
      puts "No Matches"
      true
    else
      false
    end
  end

  def get_names(list)
    if list_empty? list
      return
    else
      list.each { |char| puts char }
    end
  end
end

# list = Characters.new
# # find_by "sna"
# list.find_by("hair")
# list.find_by("HAIR", case_sensitive: true)

# list.find_by("dark", case_sensitive: true)
# list.find_by("dark")
# # puts top_1000
# p list.top_1000
