# This class takes a character list and will provide utilities to narrow the
# list down via a string.
class ListSearcher
  def initialize(char_list)
    @list = char_list
  end

  def find_by(string, case_sensitive: false)
    if case_sensitive
      gather_results(string)
    else
      gather_results_insensitive(string)
    end
  end

  private

  def gather_results(string)
    @list.select { |char| char.include?(string) }
  end

  def gather_results_insensitive(string)
    @list.select { |char| char.downcase.include?(string.downcase) }
  end
end
