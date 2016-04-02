require_relative 'character_list'

# Create a list of top 250 of a certain path (Mage, Warrior, Rogue, Poet)
warriors = CharacterList.new(path: :warrior)

# Return a list narrowed down by searching path, subpath, or name
behemoths = warriors.find_by('Behemoth')

# Print all Barbarians with a Behemoth ranking
behemoths.each { |barbarian| puts barbarian }
