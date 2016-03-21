require_relative 'character_list'

# Create a list of top 1000 characters of www.nexustk.com
# **Sometimes there are more than 1000**
list = CharacterList.new

# Print all of the characters.
# list.all_chars.each {|char| puts char }

# Create a list of top 250 of a certain path (Mage, Warrior, Rogue, Poet)
mage_list = CharacterList.new(path: :mage)

# Return a list narrowed down by searching path, subpath, or name
non_subpath_mages = list.find_by('Sa san (M)')

# Print all mages with no subpath
non_subpath_mages.each {|mage| puts mage }
