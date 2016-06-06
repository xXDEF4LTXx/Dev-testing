require 'colorize'
require 'open-uri'

puts
puts"FFFFFFFFFFFFFFFFFFFFFF     AAA    WWWWWWWW                           WWWWWWWW".blue
puts"F::::::::::::::::::::F    A:::A   W::::::W                           W::::::W".blue
puts"F::::::::::::::::::::F   A:::::A  W::::::W                           W::::::W".blue
puts"FF::::::FFFFFFFFF::::F  A:::::::A W::::::W                           W::::::W".blue
puts"F:::::F       FFFFFF   A:::::::::A W:::::W           WWWWW           W:::::W".blue
puts"F:::::F               A:::::A:::::A W:::::W         W:::::W         W:::::W".blue
puts"F::::::FFFFFFFFFF    A:::::A A:::::A W:::::W       W:::::::W       W:::::W".blue
puts"F:::::::::::::::F   A:::::A   A:::::A W:::::W     W:::::::::W     W:::::W".blue
puts"F:::::::::::::::F  A:::::A     A:::::A W:::::W   W:::::W:::::W   W:::::W".blue
puts"F::::::FFFFFFFFFF A:::::AAAAAAAAA:::::A W:::::W W:::::W W:::::W W:::::W".blue
puts"F:::::F          A:::::::::::::::::::::A W:::::W:::::W   W:::::W:::::W".blue
puts"F:::::F         A:::::AAAAAAAAAAAAA:::::A W:::::::::W     W:::::::::W".blue
puts"FF::::::FF     A:::::A             A:::::A W:::::::W       W:::::::W".blue
puts"F::::::::FF   A:::::A               A:::::A W:::::W         W:::::W".blue
puts"F::::::::FF  A:::::A                 A:::::A W:::W           W:::W".blue
puts"FFFFFFFFFFF AAAAAAA                   AAAAAAA WWW             WWW".blue
#####
puts
puts
puts "1) Modules 2) Credits - Type your option number."
choice = gets.chomp
puts
if choice.to_s == "1"
  puts "Modules"
  puts "_______"
  puts
  puts"1> Webpage cloning"
  puts"2> empty option"
  choice1 = gets.chomp
  if choice1 == "1"
    puts
    puts "Use 'www.' and don't use 'http://'."
    puts "Enter target URL: "
    target = gets.chomp
    source = open('http://'+target).read
    File.open("#{target}.html", 'w') { |file| file.write(source) }
    puts
    puts "Webpage cloned and saved in active directory."
  end
elsif choice.to_s == "2"
  puts "Credits"
  puts "_______"
  puts
  puts "Built by Mclovin' and xXD3F4LTXx"
  puts "Thanks to Jackzett for ideas and the FAW community!"
else
  puts "Unknown response."
end
