class Event

	attr_accessor :start_date, :duration, :title, :attendees
	@@event_array = []

	def initialize(start_date_ini, duration_ini, title_ini, attendees_ini)
		require 'time'

		@start_date = Time.parse(start_date_ini)

		@duration = duration_ini.to_i

		@title = title_ini.to_s

		@attendees = attendees_ini

		@@event_array << self
	end

	def postpone_24h
		puts "Nouvelle date #{@start_date += (3600 * 24)}"
	end

	def end_date
		puts "La date de fin est le #{ @start_date + ( duration * 60 ) }"
	end

	def is_past?
		if @start_date + ( duration * 60 ) <= Time.now
			puts "L'évènement est terminé"

		elsif @start_date > Time.now + 1800
			puts "L'évènement arrive !"

		elsif @start_date < Time.now && @start_date + ( duration * 60 ) >= Time.now
			puts "L'évènement est en cours, dépêchez vous !"
	
		elsif Time.now.between?( (@start_date - 1800), @start_date )
			puts "L'évènement est dans moins de 30 mn !"
		end
	end

	def to_s
		puts "> Titre : #{@title}"
		puts "> Date de début : #{@start_date}"
		puts "> Durée : #{@duration} minutes"
		print "> Invités :"
		
		@attendees.each_with_index { |mail, i| print " #{mail}," } #i < (@attendees.length - 1) ? " #{mail}," :  " #{mail}" }
		puts
	end

	def self.show_calendar
		return @@event_array
	end

end