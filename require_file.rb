main_folder = File.dirname(__FILE__)
$LOAD_PATH << main_folder
folders = %w[room test character io item map utilities menu combat]
folders.each do |folder|
  $LOAD_PATH.unshift File.expand_path(File.join(main_folder, folder))
end
