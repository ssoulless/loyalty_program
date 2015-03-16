# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Deleting all records from the database..."

Store.delete_all
User.delete_all
Client.delete_all
Transaction.delete_all
Membership.delete_all

# Create the users
puts "Creating users..."
camilo = Client.create( cedula: "1", full_name: "Camilo Martinez", phone: "2244206613", address: "1717 Ridge Ave., Evanston, IL 60201", birthday: Date.parse('11-9-1986'), age: "28", points: 105, gender: "M")
florence = Client.create(cedula: "2", full_name: "Flores Frech", phone: "2244206614", address: "1718 Ridge Ave., Evanston, IL 60201", birthday: Date.parse('11-12-1985'), age: "29", points: 30, gender: "F")
david = Client.create(cedula: "3", full_name: "David Pascual", phone: "2244245613", address: "1727 Ridge Ave., Evanston, IL 60201", birthday: Date.parse('11-9-1984'), age: "30", points: 0, gender: "M")
juan = Client.create(cedula: "4", full_name: "Juan Ramos", phone: "2244204413", address: "1813 Ridge Ave., Evanston, IL 60201", birthday: Date.parse('11-9-1983'), age: "31", points: 8, gender: "M")
caroline = Client.create(cedula: "5", full_name: "Caroline Doe", phone: "2244204411", address: "1812 Ridge Ave., Evanston, IL 60201", birthday: Date.parse('1-1-1945'), age: "70", points: 14, gender: "F")

# Create the stores
puts "Creating stores..."
smylie = Store.create( name: "Smylie Brothers Brewing Co.", phone: "5555", type_of_store: "Bar", address: "1615 Oak Avenue, Evanston, IL 60201", description: "Brewery in a vast warehouse space offering beers, a central bar, pub-fare menus & outdoor seating.", pointsfirst: "10", pointssecond: "25", pointsthird: "50", rewardfirst: "glass of beer", rewardsecond: "pint of beer", rewardthird: "six pack")
farmhouse = Store.create( name: "Farmhouse Evanston", phone: "6666", type_of_store: "Restaurant", address: "703 Church Street, Evanston, IL 60201", description: "Comfy farm-to-table spot with local brews featured amid exposed brick & salvaged decor plus a patio.", pointsfirst: "100", pointssecond: "200", pointsthird: "500", rewardfirst: "desert", rewardsecond: "bottle of wine", rewardthird: "dinner for two")
soapie = Store.create( name: "Soapie's Cleaning and Tailoring", phone: "7777", type_of_store: "Dry Cleaning", address: "1231 Chicago Avenue, Evanston, IL 60202", description: "Premium Cleaning and Tayloring", pointsfirst: "50", pointssecond: "100", pointsthird: "175", rewardfirst: "shirt cleaning", rewardsecond: "pants cleaning", rewardthird: "dress cleaning")
brothers = Store.create( name: "Other Brother Coffeehouse", phone: "8888", type_of_store: "Coffee Shop", address: "1549 Sherman Avenue, Evanston, IL 60201", description: "Local Brewed Coffee", pointsfirst: "10", pointssecond: "15", pointsthird: "40", rewardfirst: "espresso", rewardsecond: "capucchino", rewardthird: "latte & biscuit")
bangers = Store.create( name: "Bangers & Lace", phone: "9999", type_of_store: "Restaurant", address: "810 Grove Street, Evanston, IL 60201", description: "Upscale pub grub pairs with lots of brews at this gastropub sister to a Chicago original.", pointsfirst: "30", pointssecond: "50", pointsthird: "100", rewardfirst: "beer", rewardsecond: "house sausage", rewardthird: "dinner for two")

# Create the transactions
puts "Creating transactions..."
tran1 = Transaction.create(store_id: smylie.id, client_id: camilo.id, points_awarded: 5, description: "1 Beer", total_cents: 500)
tran2 = Transaction.create(store_id: smylie.id, client_id: camilo.id, points_awarded: 100, description: "5 Beer", total_cents: 2500)
tran3 = Transaction.create(store_id: soapie.id, client_id: florence.id, points_awarded: 30, description: "2 lunches", total_cents: 3000)
tran4 = Transaction.create(store_id: brothers.id, client_id: juan.id, points_awarded: 8, description: "a cup of coffee", total_cents: 200)
tran5 = Transaction.create(store_id: bangers.id, client_id: caroline.id, points_awarded: 14, description: "A big filete", total_cents: 2500)


# Create the list of members for each store
Membership.create(store_id: smylie.id, client_id: camilo.id, points: 105)
Membership.create(store_id: soapie.id, client_id: florence.id, points: 30)
Membership.create(store_id: brothers.id, client_id: juan.id, points: 8)
Membership.create(store_id: bangers.id, client_id: caroline.id, points: 14)


puts "There are now #{Store.count} stores, #{Client.count} clients, and #{Transaction.count} transactions in the database."
