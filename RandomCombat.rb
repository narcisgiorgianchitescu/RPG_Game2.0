require_relative 'Monster'
require_relative 'Hero'

class RandomCombat
  def initialize(hero = nil, monster = nil)
    @hero = hero
    @monster = monster
    @Attack = 1
    @Defend = 2
  end

  def do_round(hero_option)
    monster_option = rand(@Attack..@Defend)
    puts 'Monster chose to attack' if monster_option == @Attack
    puts 'Monster chose to defend' if monster_option == @Defend

    if monster_option == @Attack and hero_option == @Attack then
      both_attack
    elsif monster_option == @Attack and hero_option == @Defend then
      monster_attack
    elsif monster_option == @Defend and hero_option == @Attack then
      hero_attack
    else
      both_defend
    end
  end

  def both_attack
    hero_attack = attack_for(@hero)
    monster_attack = attack_for(@monster)
    @hero.hp -= monster_attack
    @monster.hp -= hero_attack
    puts "Hero dealt #{hero_attack} damage"
    puts "Monster dealt #{monster_attack} damage"
  end

  def hero_attack
    damage = (attack_for(@hero).to_f / @monster.defence).ceil
    if damage < 0 then damage = 0 end
    puts "Hero dealt #{damage} damage"
    @monster.hp -= damage
  end

  def monster_attack
    damage = (attack_for(@monster).to_f / @hero.defence).ceil
    if damage < 0 then damage = 0 end
    puts "Monster dealt #{damage} damage"
    @hero.hp -= damage
  end

  def both_defend
    puts "Staring contest"
  end

  def attack_for(character)
    rand((character.attack/2)..(character.attack * 2))
  end
end
