begin
  require 'rubygems'
  require 'mechanize'
	require 'resolv'
	require 'colorize'
	require 'net/http'
	require'spidr'
	require 'open-uri'
	require 'uri'
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
	puts "1) Modules 2) Credits - Type your option number.\n".green
	choice = gets.chomp
	puts
	if choice.to_s == "1"
  		puts "Modules - Type module number.".blue
  		puts "_____________________________\n".red
  		puts
  		puts"1> Webpage cloning\n".blue
  		puts"2> Email scrape from URL\n".blue
  		puts"3> URL Info grabber\n".blue
      puts"4> SQLI Scanner: \n this module uses your entered google dork\n to search google for basic vulnerable\n websites.\n".blue
  		choice1 = gets.chomp
  		if choice1 == "1"
			puts
    			puts "Use 'www.' and don't use 'http://'.".red
    			puts "Enter target URL: ".blue
    			target = gets.chomp
    			puts
    			puts "Initializing...".red
    			sleep 1
    			puts "Loading ammunition...".blue
    			sleep 1
    			puts "Fire!".green
    			sleep 1
    			source = open('http://'+target).read
    			File.open("#{target}.html", 'w') { |file| file.write(source) }
    			puts
    			puts "Webpage cloned and saved in active directory.".green

  		elsif choice1.to_s == "2"
			puts
			puts "Don't use 'http://'. Use 'www.'.".red
			print"Enter site you want to scrape emails: ".blue
			target=gets.chomp
			puts
   		puts "Initializing...".red
    	sleep 1
  		puts "Loading ammunition...".blue
 		  sleep 1
      puts "Fire!".green
      sleep 1
			puts
			uri = URI("http://"+target.to_s)
			$stderr.puts "Scanning: #{uri}"
			Spidr.site(uri) do |spider|
			spider.every_page do |crawled_page|
			puts "#{crawled_page.url}".blue
			crawled_page.body.scan(/[\w\d]+[\w\d.-]@[\w\d.-]+\.\w{2,6}/).each do |address|
			puts"#{address}".green
			CSV.open("emails.csv", "a") do |csv|
				csv << ["#{address}"]
		    	end


			end
			end
			end
	 	elsif choice1.to_s == "3"
			puts
			puts"Enter URL: ".blue
			target = gets.chomp.to_s
			puts
   		puts "Initializing...".red
    	sleep 1
  		puts "Loading ammunition...".blue
 			sleep 1
      puts "Fire!".green
      sleep 1
			puts
  		ip = Resolv.getaddress target
			ips = Resolv.getaddresses target
			hname = Resolv.getnames ip
			puts "First IP listed: #{ip}".green
			puts "All listed IPs: #{ips}".green
			puts "All listed hostnames: #{hname}".green
    elsif choice1.to_s == "4"
      begin
            puts
            puts "Initializing...".red
            sleep 1
            puts "Loading ammunition...".blue
            sleep 1
            puts "Fire!".green
            sleep 1
            puts
            agent = Mechanize.new
            counting = 0
            #agent.user_agent_alias = 'Mechanize'
            #agent.set_proxy '78.186.178.153', 808
            agent.history.clear
            page = agent.get('http://www.google.com/')
            google_form = page.form('f')
            puts "Overuse of this module will block your ip with google captcha.\nUsing a VPN is recommended.".red
            puts
            puts "Enter SQLI Dork: \n".blue
            dork = gets.chomp
            puts
            google_form.q = dork.to_s

            page = agent.submit(google_form, google_form.buttons.first)

            page.links.each do |link|
              if link.href.to_s =~/url.q/
                str=link.href.to_s
                strList=str.split(%r{=|&})
                url=strList[1]
                puts "#{url}\n".blue
                checkur = url.gsub("%3F", "?")
                checkurr = checkur.gsub("%3D", "=")
                checkurl = checkur
                begin
                  source = open(checkurl).read
                  aa=source.scan('You have an error in your SQL syntax')
                  a= aa.to_s
                  if a == '["You have an error in your SQL syntax"]'
                      puts "Vulnerability possible\n".green
                      counting+=1
                      url2 = "\n #{url.to_s} \n"
                      towrite = "\n #{url2} \n"
                      file = 'SQL.txt'
                      File.open(file, 'a') { |file| file.write(towrite) }
                  else
                      puts "No basic vulnerability\n".red
                  end
                rescue OpenURI::HTTPError => err
                      puts "Error in link or network\n".red
                      elog = "Error2.log"
                      write = "\n #{err} \n"
                      File.open(elog, 'a') { |file| file.write(write) }
                end

              end
            end
            puts "All #{counting} vulnerable links have been entered into SQL.txt."
      rescue Exception => er
        time1 = Time.new
        logtime = "Error Time : " + time1.inspect
        File.open('SQLerror.log', 'a') { |file| file.write("\n"+logtime.to_s+"\n") }
        err = er.inspect
        File.open('SQLerror.log', 'a') { |file| file.write("\n"+err.to_s+"\n") }
        err2 = er.backtrace
        File.open('SQLerror.log', 'a') { |file| file.write("\n"+err2.to_s+"\n") }
      end
		else
			puts "Unknown response.".red
		end
	elsif choice.to_s == "2"
		puts "Credits".blue
 		puts "_______".red
	 	puts
  		puts "Built by Mclovin' and xXD3F4LTXx".green
  		puts "Thanks to Jackzett for ideas and the FAW community!".green
	else
  	puts "Unknown response.".red
	end

rescue Exception => e
  time1 = Time.new
  logtime = "Error Time : " + time1.inspect
  File.open('error.log', 'a') { |file| file.write("\n"+logtime.to_s+"\n") }
  err = e.inspect
  File.open('error.log', 'a') { |file| file.write("\n"+err.to_s+"\n") }
  err2 = e.backtrace
  File.open('error.log', 'a') { |file| file.write("\n"+err2.to_s+"\n") }
end
