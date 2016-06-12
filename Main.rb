begin
  require 'rubygems'
  require 'fileutils'
  require 'mechanize'
	require 'resolv'
	require 'colorize'
	require 'net/http'
	require 'spidr'
	require 'open-uri'
	require 'uri'
	require 'csv'

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
      puts"5> Check online databases to see if your \ninformation has been breached.\nA breach means that your entered\nusername or email has appeared in\nsome leaked details.\nA breach can be sensitive or non.\nThis means plain-text passwords etc.\n".blue
      choice1 = gets.chomp
  		if choice1 == "1"
			puts
    			puts "Use 'www.' and don't use 'http://'.".red
    			puts "Enter target URL: ".blue
    			targ = gets.chomp.to_s
          target = URI"http://#{targ}"
          puts "Enter Folder Name To Create And Save Files To.\nThis folder will be nested in the active directory.\nFolder name: \n"
          folder = gets.chomp
          Dir.mkdir(folder) unless File.exists?(folder)
    			puts
    			puts "Initializing...".red
    			sleep 1
    			puts "Loading ammunition...".blue
    			sleep 1
    			puts "Fire!".green
    			sleep 1
          puts 'a'
          Spidr.site(target) do |spider|
            puts 'b'
    			spider.every_page do |crawled|
            puts 'c'
          puts crawled.url
          puts 'd'
    			source = open(crawled.url).read
          Dir.chdir(folder) do
            File.open("#{crawled.url}.html", 'w') { |file| file.write(source) }
          end
          puts
    			puts "Website cloned and saved in active directory.".green
          end
          end

  		elsif choice1.to_s == "2"
			puts
			puts "Don't use 'http://'. Use 'www.'.".red
			print"Enter site you want to scrape emails: ".blue
			target=gets.chomp
      puts "Name of the file to save results to:\n"
      filenames=gets.chomp
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

			CSV.open("#{filenames}.csv", "a") do |csv|
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
            agent.verify_mode = OpenSSL::SSL::VERIFY_NONE
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
            page2 = agent.get("#{page.uri}&start=10")
            page2.links.each do |link|

              if link.href.to_s =~/url.q/
                str=link.href.to_s
                strList=str.split(%r{=|&})
                url=strList[1]
                puts "#{url}\n".blue
                checkur = url.gsub("%3F", "?")
                checkurr = checkur.gsub("%3D", "=")
                checkurl = checkur
                #puts "#{page.uri}".green
                begin
                  #ax = checkurl.scan('https://facebook')
                  #if ax.to_s == '["https://facebook"]'
                  #  checkurl = 'http://lol.com/gjouyhju.php?id=3'#throw 404 to prevent SSL error
                  #end
                  source = open(checkurl, {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}).read
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
    elsif choice1.to_s == "5"
      puts "\nEnter your username or email address to be checked\nthrough the databases:\n".blue
      checkdetail=gets.chomp.to_s
      puts "Enter file name to save results to:\n"
      filename=gets.chomp
      url=URI.parse("https://haveibeenpwned.com/api/v2/breachedaccount/#{checkdetail}")
      output = open(url, {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE})
      result = JSON.parse output.readlines.join("")
      puts "Breaches".green
      puts "--------\n".red
      coun = result.count
      count = coun +=1
      breachnum=0
      x=0
      puts "Amount of breaches: #{result.count}".red
      File.open("#{filename}.txt", 'a') { |file| file.write("\nAmount of breaches: #{result.count}\n") }
      while breachnum < count
        breachnum+=1
        puts "\nTitle of data breach number #{breachnum}: #{result[x]['Title']}".green
        File.open("#{filename}.txt", 'a') { |file| file.write("\nTitle of data breach number #{breachnum}: #{result[x]['Title']}\n") }
        puts "\nName of data breach number #{breachnum}: #{result[x]['Name']}".red
        File.open("#{filename}.txt", 'a') { |file| file.write("\nName of data breach number #{breachnum}: #{result[x]['Name']}\n") }
        puts "\nDomain of data breach number #{breachnum}: #{result[x]['Domain']}".blue
        File.open("#{filename}.txt", 'a') { |file| file.write("\nDomain of data breach number #{breachnum}: #{result[x]['Domain']}\n") }
        puts "\nDate breach number #{breachnum} added to breach database: #{result[x]['AddedDate']}\n".green
        File.open("#{filename}.txt", 'a') { |file| file.write("\nDate breach number #{breachnum} added to breach database: #{result[x]['AddedDate']}") }
        puts "\nData types of breach number #{breachnum}: #{result[x]['DataClasses']}".red
        File.open("#{filename}.txt", 'a') { |file| file.write("\nData types of breach number #{breachnum}: #{result[x]['DataClasses']}\n") }
        puts "\nData sensitive in breach number #{breachnum}? #{result[x]['IsSensitive']}".blue
        File.open("#{filename}.txt", 'a') { |file| file.write("\nData sensitive in breach number #{breachnum}? #{result[x]['IsSensitive']}\n") }
        x+=1
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
