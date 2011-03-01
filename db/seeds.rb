# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
require "fastercsv"

 FasterCSV.foreach("stops.txt") do |row|

      b = BusStop.create(:stop_id => row[0] , :stop_code => row[1] , :stop_desc => row[3] , :stop_name => row[2], :stop_lat => row[4].to_f , :stop_lon => row[5].to_f , :stop_url => row[6])
      b.save()
    end
