require 'json'
require 'rest-client'
require 'time'

URL = 'https://api.spacexdata.com/v3/launches/next'

class Proximo_Lanzamiento
  attr_accessor :mision, :cohete, :fecha

  def initialize(mision, cohete, fecha)
    @mision = mision
    @cohete = cohete
    @fecha = Time.parse(fecha).getlocal.strftime('%d/%m/%Y')
    @hora = Time.parse(fecha).getlocal.strftime('%H:%M')
  end
end

response = RestClient.get URL
result = JSON.parse response.to_str
p Time.new(result['launch_date_local']).hour

proximo = Proximo_Lanzamiento.new(result['mission_name'], result['rocket']['rocket_name'], result['launch_date_local'])

puts '     /\     '
puts '   /|==|\       SpaceX   '
puts '  /_|  |_\      Proximo lanzamiento'
puts '    |  | '
puts "    |  |        MISION: #{proximo.mision} "
puts '   /____\        '
puts "   |    |       COHETE: #{proximo.cohete} "
puts '   |    | '
puts "   |    |       FECHA: #{proximo.fecha} "
puts '  /| |  |\ '
puts " / | |  | \\     HORA: #{proximo.fecha} Hora local  "
puts '/__|_|__|__\ '
puts '   /_\/_\ '
puts '   ###### '
puts '  ######## '
puts '    #### '
puts '    #### '
puts '     ## '
