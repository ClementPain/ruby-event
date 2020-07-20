class CalendarDisplayer

	attr_accessor :month, :calendar_month, :cal_month_only_days

	# créer une instance par mois
	def initialize(month)
		@month = month.to_i
	end

	# calendar_month : créer deux calendriers : un avec les évènements complets et un uniquement avec le jour de l'évènement

	def calendars_month
		@calendar_month = []
		@cal_month_only_days = [] #réinitialiser les tableaux pour qu'ils ne contiennent pas deux fois la date d'un évènement

		Event.show_calendar.each do |event|
			@calendar_month << event if event.start_date.month == @month
			@cal_month_only_days << event.start_date.day if event.start_date.month == @month
		end
	end


	# show_calendar : montrer le calendrier du mois

	def show_calendar
		puts @calendar_month
	end


	# show_week : créer une semaine

	def show_week
		
		for num_week in 1..5
			puts "-"*70
			week_first_line(num_week)
			week_line_time(num_week)
			for num_line in 3..5
				week_lines_name(num_week, num_line)
			end
		end

		puts "-"*70

	end

	# premiere ligne avec les jours
 	def week_first_line(num_week)

 		for day in 1+(num_week-1)*7..7+(num_week-1)*7
			if day < 10
				print "|" + day.to_s + " " * 8
			elsif day >= 10 && day <= 31
				print "|" + day.to_s + " " * 7
			elsif day > 31
				print "|" + " " * 9
			end
		end
		puts "|"
	end

	#deuxième ligne avec l'heure des évènements
	def week_line_time(num_week)
		for day in 1+(num_week-1)*7..7+(num_week-1)*7
			if @cal_month_only_days.include? day #pour savoir s'il faut mettre une information sur cette ligne

				@calendar_month.each do |event|
					if event.start_date.day == day

						event_hour = "0#{event.start_date.hour}"  if event.start_date.hour < 10
						event_minutes = "0#{event.start_date.min}" if event.start_date.min < 10
						
						print "|#{event_hour}:#{event_minutes}am  " 
						
					end
				end
			else
				print "|" + " " * 9
			end
		end
		
		puts "|"
	end

	#les lignes avec le nom de l'évènement
	def week_lines_name(num_week, num_line)
		for day in 1+(num_week-1)*7..7+(num_week-1)*7
			if @cal_month_only_days.include? day #pour savoir s'il y a un évènement à ce jour

				@calendar_month.each do |event|
					if event.start_date.day == day

						event_name = event.title.split(" ")[num_line-3]
						
						print !event_name.nil? ? "|#{event_name}#{" "*(9-event_name.length)}" : "|" + " " * 9

					end
				end
			else
				print "|" + " " * 9
			end
		end
		
		puts "|"
	end

end


