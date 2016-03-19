require 'nokogiri'
require 'open-uri'
require 'pp'

class CharacterList
  def initialize(path: :ALL)
    @path = path
    @url = path_url
    @results = page(@url).css('td a') { |link| link.content }
  end

  def all_chars
    @tops ||= @results.map {|char| char.content }
  end

  def path
    @path.to_s.capitalize
  end

  def rank(number)
    if number < 1 || number > path_size
      []
    else
      all_chars[number - 1]
    end
  end

  def find_by(string, case_sensitive: false)
    if case_sensitive
      gather_results(string)
    else
      gather_results_insensitive(string)
    end
  end

  private

  def page(url)
    @topchars ||= Nokogiri::HTML(open(url))
  end

  def path_url
    options = {
      ALL: "http://users.nexustk.com/webreport/PowerAll.htm",
      MAGE: "http://users.nexustk.com/webreport/PowerMage.htm",
      WARRIOR: "http://users.nexustk.com/webreport/PowerWarrior.htm",
      ROGUE: "http://users.nexustk.com/webreport/PowerRogue.htm",
      POET: "http://users.nexustk.com/webreport/PowerPoet.htm"
    }
    options[@path.upcase.intern] || options[:ALL]
  end

  def path_size
   all_chars.count
  end

  def gather_results(string)
    @results.select { |link| link.text.include?(string) }.map { |char| char.text }
  end

  def gather_results_insensitive(string)
    string = string.downcase
    result = @results.select { |link| link.text.include?(string) }.map { |chars| chars.text }
  end
end
