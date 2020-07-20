# lignes très pratiques qui appellent les gems du Gemfile. On verra plus tard comment s'en servir ;) - ça évite juste les "require" partout
require 'bundler'
require 'pry'
require 'time'



# lignes qui appellent les fichiers lib/user.rb et lib/event.rb
# comme ça, tu peux faire User.new dans ce fichier d'application. Top.
require_relative 'lib/user'
require_relative 'lib/event'
require_relative 'lib/event_creator'
require_relative 'lib/calendar_master'



def init
	juin = CalendarDisplayer.new(6)
	anniv1 = Event.new("20/06/2020", 180, "Anniv1", [])
	anniv2 = Event.new("02/06/2020", 180, "Anniv2", [])
	juin.calendars_month
	juin.show_week
end
binding.pry
# Maintenant c'est open bar pour tester ton application. Tous les fichiers importants sont chargés
# Tu peux faire User.new, Event.new, binding.pry, User.all, etc.