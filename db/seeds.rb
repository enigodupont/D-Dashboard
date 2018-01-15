# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "[*] cleaning up current database"

if Inventory.count > 0
    Inventory.delete_all
end

if BagOfHolding.count > 0
    BagOfHolding.delete_all
end

if  User.count > 0 
	User.delete_all
end

puts "[!] done"


puts "[*] loading users"
User.create("id"=>1, "username"=>"avem", "email"=>"avem@fake.bs", 'password'=>'tmppassword1234' )
User.create("id"=>2, "username"=>"enigo", "email"=>"enigo@fake.bs", 'password'=>'tmppassword1234' )
puts "[!] #{User.count} user(s) loaded"

puts "[*] loading bags of holding"
BagOfHolding.create("id"=>1, "user_id"=>1, "name"=>"avem_bag")
BagOfHolding.create("id"=>2, "user_id"=>1, "name"=>"avem_backup_bag")
BagOfHolding.create("id"=>3, "user_id"=>2, "name"=>"enigo_bag")
BagOfHolding.create("id"=>4, "user_id"=>2, "name"=>"enigo_backup_bag")
puts "[!] #{BagOfHolding.count} bag(s) of holding loaded"

puts "[*] loading items in inventory"
Inventory.create("id"=>1, "bag_id"=>1, "itemName"=>"sword", "weight"=>4)
Inventory.create("id"=>2, "bag_id"=>1, "itemName"=>"rum", "weight"=>2)
Inventory.create("id"=>3, "bag_id"=>2, "itemName"=>"rig", "weight"=>20)
Inventory.create("id"=>4, "bag_id"=>2, "itemName"=>"overwatch", "weight"=>0)
Inventory.create("id"=>5, "bag_id"=>3, "itemName"=>"sword", "weight"=>4)
Inventory.create("id"=>6, "bag_id"=>3, "itemName"=>"meme blade", "weight"=>420)
Inventory.create("id"=>7, "bag_id"=>4, "itemName"=>"loli", "weight"=>80)
Inventory.create("id"=>8, "bag_id"=>4, "itemName"=>"anime", "weight"=>0)
Inventory.create("id"=>9, "bag_id"=>4, "itemName"=>"stone", "weight"=>2)
puts "[!] #{Inventory.count} items(s) loaded"