binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'test/unit'
require 'random_creator'
require 'position'

class TestRandomCreator < Test::Unit::TestCase
  def setup
    @difficulty1 = 1
    @difficulty2 = 0
    @hero = Hero.new
    @map = Map.new
    @times_test = 20
  end

  def test_difficulty_multiplier
    #value must be between 0.5 and 1.5 by convention
    max_value = 1.5
    min_value = 0.5
    assert_equal(
      true,
      RandomCreator.difficulty_multiplier(@difficulty1).between?(min_value, max_value)
    )
    assert_equal(
      true,
      RandomCreator.difficulty_multiplier(@difficulty2).between?(min_value, max_value)
    )
  end

  def test_map
    map1 = RandomCreator.map(@hero, @difficulty1)
    map2 = RandomCreator.map(@hero, @difficulty1)
    map_types = ['Room', 'Hospital', 'MonsterRoom', 'Shop', 'Vault', 'WinRoom']
    count_winroom1 = 0
    count_winroom2 = 0
    #potential solution with https://stackoverflow.com/questions/2393697/look-up-all-descendants-of-a-class-in-ruby
    map1.size.times do |i|
      map1.size.times do |j|
        assert_equal(true, (map_types.include? map1.slots[i][j].class.name))
        assert_equal(true, (map_types.include? map2.slots[i][j].class.name))
        count_winroom1 += 1 if map1.slots[i][j].class.name == 'WinRoom'
        count_winroom2 += 1 if map2.slots[i][j].class.name == 'WinRoom'
      end
    end
    assert_equal(1, count_winroom1, 'wrong number of winrooms -> winroom_spawn')
    assert_equal(1, count_winroom2, 'wrong number of winrooms -> winroom_spawn')
  end

  def test_item
    item_types = ['Consumable', 'Wearable', 'Weapon']
    @times_test.times do
      assert_equal(true, (item_types.include? RandomCreator.item.class.name))
    end
  end

  def test_consumable
    coins_max = 50
    coins_min = 0
    others_max = 10
    others_min = -3

    @times_test.times do
      item = RandomCreator.consumable
      assert_equal(true, ('Consumable' == item.class.name), 'consumable type wrong')
      assert_equal(true, item.stats.hp.between?(others_min, others_max), 'consumable hp wrong')
      assert_equal(true, item.stats.attack.between?(others_min, others_max), 'consumable attack wrong')
      assert_equal(true, item.stats.defence.between?(others_min, others_max), 'consumable defence wrong')
      assert_equal(true, item.stats.coins.between?(coins_min, coins_max), 'consumable coins wrong' )
    end
  end

  def test_wearable
    coins_max = 50
    coins_min = 0
    others_max = 15
    others_min = 0

    @times_test.times do
      item = RandomCreator.head
      assert_equal(true, ('Wearable' == item.class.name), 'head class wrong')
      assert_equal(true, item.type == :head, 'head wrong type')
      assert_equal(true, item.stats.hp.between?(others_min, others_max), 'head hp wrong')
      assert_equal(true, item.stats.attack.between?(others_min, others_max), 'head attack wrong')
      assert_equal(true, item.stats.defence.between?(others_min, others_max), 'head defence wrong')
      assert_equal(true, item.stats.coins.between?(coins_min, coins_max), 'head coins wrong' )
    end
    @times_test.times do
      item = RandomCreator.boots
      assert_equal(true, ('Wearable' == item.class.name), 'boots class wrong')
      assert_equal(true, item.type == :boots, 'boots wrong type')
      assert_equal(true, item.stats.hp.between?(others_min, others_max), 'boots hp wrong')
      assert_equal(true, item.stats.attack.between?(others_min, others_max), 'boots attack wrong')
      assert_equal(true, item.stats.defence.between?(others_min, others_max), 'boots defence wrong')
      assert_equal(true, item.stats.coins.between?(coins_min, coins_max), 'boots coins wrong' )
    end
    @times_test.times do
      item = RandomCreator.chest
      assert_equal(true, ('Wearable' == item.class.name), 'chest class wrong')
      assert_equal(true, item.type == :chest, 'chest wrong type')
      assert_equal(true, item.stats.hp.between?(others_min, others_max), 'chest hp wrong')
      assert_equal(true, item.stats.attack.between?(others_min, others_max), 'chest attack wrong')
      assert_equal(true, item.stats.defence.between?(others_min, others_max), 'chest defence wrong')
      assert_equal(true, item.stats.coins.between?(coins_min, coins_max), 'chest coins wrong' )
    end
  end

  def test_weapon
    coins_max = 50
    coins_min = 0
    others_max = 30
    others_min = 0

    @times_test.times do
      item = RandomCreator.weapon
      assert_equal(true, ('Weapon' == item.class.name), 'weapon class wrong')
      assert_equal(true, item.stats.hp == 0, 'weapon hp wrong')
      assert_equal(true, item.stats.attack.between?(others_min, others_max), 'weapon attack wrong')
      assert_equal(true, item.stats.defence.between?(others_min, others_max), 'weapon defence wrong')
      assert_equal(true, item.stats.coins.between?(coins_min, coins_max), 'weapon coins wrong' )
    end
  end

  def test_monster
    escape_chanece_min = 0
    escape_chance_max = 100
    stats_min = 0
    stats_max = 500
    coins_min = 0
    coins_max = 200
    @times_test.times do
      mob = RandomCreator.monster(@hero)
      assert_equal(true, ('Monster' == mob.class.name), 'monster class wrong')
      assert_equal(true, mob.stats.hp.between?(stats_min, stats_max), 'monster hp wrong')
      assert_equal(true, mob.stats.attack.between?(stats_min, stats_max), 'monster attack wrong')
      assert_equal(true, mob.stats.defence.between?(stats_min, stats_max), 'monster defence wrong')
      assert_equal(true, mob.stats.coins.between?(coins_min, coins_max), 'monster coins wrong' )
    end
  end

  def test_shop
    items_min = 1 #number of
    items_max = 20
    room = RandomCreator.shop
    assert_equal(true, ('Shop' == room.class.name), 'shop class wrong')
    assert_equal(true, room.input.size.between?(items_min, items_max), 'shop wrong number items')
  end

  def test_vault
    items_min = 1 #number of
    items_max = 20
    room = RandomCreator.vault
    assert_equal(true, ('Vault' == room.class.name), 'vault class wrong')
    assert_equal(true, room.input.size.between?(items_min, items_max), 'vault wrong number items')
  end

end
