## Nexus Character List

#### Grabs current characters from [NexusTK](http://www.nexustk.com)

##### Lets you create lists by:

1 Path (ex. Behemoth, Emissary, Druid, Clairvoyant)
4 Path Rank (99, Il San, Ee San, Sam San, Sa San)
2 Subpath (Chongun, Druid, Baekho, Ju Jak)
3 Name (Calmwind, MoUnTiE, BeanBag, WinRoute)
4 String (ex. "ont" will match all characters with "ont" in their name)

``` ruby

# Create a list of top 250 of a certain path (Mage, Warrior, Rogue, Poet)
mage_list = CharacterList.new(path: :mage)

# Return a list narrowed down by searching path, subpath, or name
non_subpath_mages = list.find_by('Sa san (M)')

# Print all mages with no subpath
non_subpath_mages.each {|mage| puts mage }

```
