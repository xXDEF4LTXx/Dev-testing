require_relative 'yify.rb'
require'colorize'
require'json'

#print"Enter the movie you want to search:"
#movie=gets.chomp
#idk = Yify.Search(movie)
#puts movie
#puts idk

#puts parse_data["data"]["rating"]

print"Enter movie id:"
genre=gets.chomp.to_s
puts Yify.SearchGenre(genre)
 #for some strange ass reason , its returning blank and i cant wrap my brain around it :}