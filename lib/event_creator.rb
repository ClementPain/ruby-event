class EventCreator

	attr_accessor :start_date, :duration, :title, :attendees

	def initialize
		require 'time'

		puts "Salut, tu veux créer un événement ? Cool !"
		puts "Commençons. Quel est le nom de l'événement ?"
		print "> "
		@title = gets.chomp
		puts

		puts "Super. Quand aura-t-il lieu ? Indique la date (jj/mm/aaaa) et l'heure de début (hh:mm)"
		print "> "
		@start_date = Time.parse(gets.chomp)
		puts

		puts "Au top. Combien de temps va-t-il durer (en minutes) ?"
		print "> "
		@duration = gets.chomp.to_i
		puts

		puts "Génial. Qui va participer ? Balance leurs e-mails (séparez par des ;)"
		print "> "
		@attendees = gets.chomp.strip.split(";")
		puts

		puts "Super, c'est noté, ton évènement a été créé !"

	end

	def to_s
		puts "> Titre : #{@title}"
		puts "> Date de début : #{@start_date}"
		puts "> Durée : #{@duration} minutes"
		print "> Invités :"
		
		@attendees.each_with_index { |mail, i| print " #{mail}," } #i < (@attendees.length - 1) ? " #{mail}," :  " #{mail}" }
		puts
	end
end