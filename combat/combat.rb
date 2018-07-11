binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'menu'
require 'hero'
require 'monster'
require 'io_terminal'

# class that allows 2 characters to fight
class Combat
  ATTACK_MULTIPLIER = {
    'a' => 1,
    'd' => 0,
    'r' => 0
  }.freeze

  DEFENCE_MULTIPLIER = {
    'r' => 0,
    'a' => 1,
    'd' => 2
  }.freeze

  SYMBOLS = {
    'a' => 'attack',
    'd' => 'defend',
    'r' => 'run'
  }.freeze

  def initialize(hero, monster, device)
    @hero = hero
    @monster = monster
    @device = device
  end

  def fight
    loop do
      (user_choice, monster_choice) = choices
      (hero_taken_damage, monster_taken_damage) =
        compute_damage(user_choice, monster_choice)
      update_stats(hero_taken_damage, monster_taken_damage)
      show_damage(hero_taken_damage, monster_taken_damage, user_choice,
                  monster_choice)
      break if anyone_dead? || hero_ran?(user_choice)
    end
    @hero.alive? ? false : true
  end

  private

  def hero_ran?(user_choice)
    return false unless user_choice == 'r'
    @monster.escape_chance > rand(101)
  end

  def choices
    user_choice = user_interaction
    monster_choice = %w[a d].sample
    [user_choice, monster_choice]
  end

  def show_damage(hero_taken_damage, monster_taken_damage, user_choice,
                  monster_choice)
    @device.clear
    current_stats = @hero.description + "\n" + @monster.description
    @device.print_string current_stats
    string = "Hero chose to #{SYMBOLS[user_choice]} and dealt "\
             "#{monster_taken_damage}\nMonster chose to "\
             "#{SYMBOLS[monster_choice]} and dealt #{hero_taken_damage}\n"
    @device.print_string string
    @device.input
  end

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
    hero_power = @hero.stats.attack * ATTACK_MULTIPLIER[user_choice].to_i *
                 rand(0.5..2)
    monster_power = @monster.stats.attack *
                    ATTACK_MULTIPLIER[monster_choice].to_i * rand(0.5..2)
    [hero_power, monster_power]
  end

  def compute_block(user_choice, monster_choice)
    hero_block = @hero.stats.defence * DEFENCE_MULTIPLIER[user_choice].to_i
    monster_block = @monster.stats.defence *
                    DEFENCE_MULTIPLIER[monster_choice].to_i
    [hero_block, monster_block]
  end

  def user_interaction
    description = @hero.description + "\n" + @monster.description
    options = { 'a' => 'attack', 'd' => 'defend', 'r' => 'run' }
    Menu.new(options, description, @device).choice
  end

  def anyone_dead?
    !(@hero.alive? && @monster.alive?)
  end
end
