require 'nokogiri'
require 'open-uri'
require 'pp'

class Characters
  def initialize(path: :ALL)
    @path = char_path(path)
    @results = page(@path).css('td a') { |link| link.content }
  end

  def top_1000
    @tops ||= @results.map {|char| char.content }.to_a
  end

  def path
    @original_path
  end

  def rank(number)
    if number < 1
      []
    elsif number > path_size
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

  def page(address)
    @topchars ||= Nokogiri::HTML(open(address))
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

  def char_path(selection)
    options = {
      ALL: "http://users.nexustk.com/webreport/PowerAll.htm",
      MAGE: "http://users.nexustk.com/webreport/PowerMage.htm",
      WARRIOR: "http://users.nexustk.com/webreport/PowerWarrior.htm",
      ROGUE: "http://users.nexustk.com/webreport/PowerRogue.htm",
      POET: "http://users.nexustk.com/webreport/PowerPoet.htm"
    }
    @original_path = selection.upcase.intern
    path = options[@original_path] || options[:ALL]
  end

  def path_size
    if @original_path == :ALL
      return 1000
    else
      return 250
    end
  end
end

