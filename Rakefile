task default: %w[test]
# TODO: Add 'test/test_map_generator.rb' to tests.
tests = ['test/test_hero.rb', 'test/test_map.rb',
         'test/test_room.rb', 'test/test_stats.rb',
         'test/test_cursor.rb', 'test/test_character.rb',
         'test/test_combat.rb', 'test/test_monster.rb',
         'test/test_random_creator.rb', 'test/test_menu.rb']
task :test do
  tests.each do |test_file|
    ruby test_file
  end
end
