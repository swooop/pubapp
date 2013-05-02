# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# #//* / Form submission event
#   $('#finderz').on('submit', function(event) {
#     // prevent default from happen
#     event.preventDefault();
#     //grab the name from the form element
#     var beer = $('#my_beer').val();
#     // set the Item in local storage
    

#     //Change name on form sumbmit
#     //changeName();

#     $.getJSON("http://api.openbeerdatabase.com/v1/breweries.json?callback=?", function(response) {
#       $(response.breweries).each(function() {
#        $("#example-breweries").append($("<li>", { text : this.name }));
#       });
#     });


#   });



Pub.destroy_all
Beer.destroy_all
Brewery.destroy_all
Location.destroy_all
User.destroy_all

User.create :email => "toby@toby.com", :password => '123', :name_first => 'Toby', name_

########
# CREATE BREWERIES
########
breweries = Brewery.create([
  { name: 'InBev' },
  { name: 'Fullers' },
  { name: 'Darkstar' }
])

# Get inbev to use later
inbev = Brewery.find_by_name('InBev')
fullers = Brewery.find_by_name('Fullers')
darkstar = Brewery.find_by_name('Fullers')

########
# CREATE BEERS
########
beers = Beer.create([
  { name: 'Leffe', brewery: inbev},
  { name: 'London Pride', brewery: fullers },
  { name: 'Hophead', brewery: darkstar }
])

# Create Clerkenwell to use later
clerkenwell = Location.create({ address: '13 Eyre Street Hill, EC1R 5ET' })
belsize = Location.create({ address: '67 Fleet Rd  London NW3 2QU' })

########
# CREATE PUBS
########

Pub.create( [
  { name: 'Gunmakers', breweries: [inbev], location: clerkenwell },
  { name: 'The Stag', breweries: [fullers], location: belsize },
  
])


 
