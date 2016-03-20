## Nexus Character List

#### Grabs current characters from [NexusTK](http://www.nexustk.com)

##### Lets you create lists by:

1. Path       (ex. Behemoth, Emissary, Druid, Clairvoyant)
1. Path Rank  (ex. 99, Il San, Ee San, Sam San, Sa San)
1. Subpath    (ex. Chongun, Druid, Baekho, Ju Jak)
1. Name       (ex.Calmwind, MoUnTiE, BeanBag, WinRoute)
1. String     (ex. "ont" will match all characters with "ont" in their name)

### USAGE

#### Create a list of top 250 of a certain path (Mage, Warrior, Rogue, Poet)

``` ruby
mage_list = CharacterList.new(path: :mage)
```

#### Return a list narrowed down by searching path, subpath, or name (case is ignored by default)

``` ruby
non_subpath_mages = mage_list.find_by('sA sAn (m)')
```

##### OR
#### Return a list searched with case sensitivity on (ex. "Greedo" won't match "Merchant greedo (99)")

``` ruby
 sa_diviners = mage_list.find_by('Visionary', case_sensitive: true)
```



#### Print all mages with no subpath

``` ruby
non_subpath_mages.each {|mage| puts mage }
```

##### Example Output

``` code

Sa San (M) Feenix (Sa San)
Sa San (M) Chronosphere (Sa San)
Sa San (M) CataLysT (Sa San)
Sa San (M) Washington (Sa San)
Sa San (M) rummur (Sa San)
Sa San (M) Ruse (Sa San)
Sa San (M) FireElement (Sa San)
Sa San (M) Wildhair (Sa San)
Sa San (M) Alfie (Sa San)

```
