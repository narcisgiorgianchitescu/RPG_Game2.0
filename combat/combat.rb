binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'menu'
require 'hero'
require 'monster'

# class that allows 2 characters to fight
class Combat
  ATTACK_MULTIPLIER = {
    'a' => 1,
    'd' => 0
  }.freeze

  DEFENCE_MULTIPLIER = {
    'r' => 0,
    'a' => 1,
    'd' => 2
  }.freeze

  def initialize(hero, monster, device)
    @hero = hero
    @monster = monster
    @device = device
  end

  def fight
    loop do
      user_choice = user_interaction
      monster_choice = %w[a d].sample
      (hero_taken_damage, monster_taken_damage) =
        compute_damage(user_choice, monster_choice)
      update_stats(hero_taken_damage, monster_taken_damage)
      # TODO: show who deald what damage
      break if anyone_dead?
    end
    # TODO: create a menu with exit option only that shows what u got
    @hero.alive? ? false : true
  end

  private

  def update_stats(hero_taken_damage, monster_taken_damage)
    @hero.stats.hp -= hero_taken_damage
    @monster.stats.hp -= monster_taken_damage
  end

  def compute_damage(user_choice, monster_choice)
    (hero_power, monster_power) = compute_power(user_choice, monster_choice)
    (hero_block, monster_block) = compute_block(user_choice, monster_choice)
    hero_taken_damage = (monster_power - hero_block).to_i.abs
    monster_taken_damage = (hero_power - monster_block).to_i.abs
    [hero_taken_damage, monster_taken_damage]
  end

  def compute_power(user_choice, monster_choice)
    hero_power = @hero.stats.attack * ATTACK_MULTIPLIER[user_choice] *
                 rand(0.5..2)
    monster_power = @monster.stats.attack * ATTACK_MULTIPLIER[monster_choice] *
                    rand(0.5..2)
    [hero_power, monster_power]
  end

  def compute_block
    hero_block = @hero.stats.defence * DEFENCE_MULTIPLIER[user_choice]
    monster_block = @monster.stats.defence * DEFENCE_MULTIPLIER[monster_choice]
    [hero_block, monster_block]
  end

  def user_interaction
    description = hero_print + "\n" + monster_print
    options = { 'a' => 'a', 'd' => 'defend', 'r' => 'run' }
    Menu.new(options, description, @device)
  end

  def anyone_dead?
    !(@hero.alive? && @monster.alive?)
  end

  def hero_print
    "Hero #{@hero.name} has the following stats\n"\
              "#{@hero.stats.attack} attack\n"\
              "#{@hero.stats.defence} defence\n"\
              "#{@hero.stats.hp} hp\n"\
              "#{@hero.stats.coins} coins\n"
  end

  def monster_print
    "Monster #{@monster.name} has the following stats\n"\
                "#{@monster.stats.attack} attack\n"\
                "#{@monster.stats.defence} defence\n"\
                "#{@monster.stats.hp} hp\n"\
                "#{@monster.stats.coins} coins\n"
  end
end
