require 'colorize'
require 'net/http'
require'spidr'
require 'open-uri'
require 'uri'
require'colorize'
require'csv'


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
puts "1) Modules 2) Credits - Type your option number. 3) Email crawler"
choice = gets.chomp
puts
if choice.to_s == "1"
  puts "Modules"
  puts "_______"
  puts
  puts"1> Webpage cloning"
  puts"2> empty"
  choice1 = gets.chomp
  if choice1 == "1"
    puts
    puts "Enter type E.g HTML, PHP etc. If you don't know try guess"
    puts "if you're wrong then just do it again with another type."
    puts "Type: "
    webtype = gets.chomp
    puts "Use 'www.'"
    puts "Enter target URL: "
    target = gets.chomp
    source = Net::HTTP.get(target, '/index.'+"."+webtype)
    File.open(target+"."+webtype, 'w') { |file| file.write(source) }

  end
elsif choice.to_s == "2"
  puts "Credits"
  puts "_______"
  puts
  puts "Built by Mclovin' and xXD3F4LTXx"
  puts "Thanks to Jackzett for ideas and the FAW community!"
elsif choice.to_s == "3"
  puts 
  print"Enter site you want to scrape emails:"
  target=gets.chomp.to_s
  puts

   uri = URI(target)
 
  $stderr.puts "Scanning #{uri.host}"
  Spidr.site(target) do |spider|
  spider.every_page do |crawled_page|
  puts "#{crawled_page.url}"
  crawled_page.body.scan(/[\w\d]+[\w\d.-]@[\w\d.-]+\.\w{2,6}/).each do |address|
    puts"#{address}".green
    CSV.open("emails.csv", "a") do |csv|
       csv << ["#{address}"]
    end 
  end 
end 
end 
end 