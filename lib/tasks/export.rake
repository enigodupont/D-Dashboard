namespace :export do
    desc "prints user.all in a seeds.rb way."
    task :seeds => :environment do
        User.order(:id).all.each do |user|
            puts "User.create(#{user.serializable_hash.delete_if {|key, value| ['password_digest', 'created_at', 'updated_at'].include?(key)}.to_s.gsub(/[{}]/,'')}, 'password'=>'tmppassword1234' )"
        end
        BagOfHolding.order(:id).all.each do |boh|
            puts "BagOfHolding.create(#{boh.serializable_hash.delete_if {|key, value| ['created_at', 'updated_at'].include?(key)}.to_s.gsub(/[{}]/,'')})"
        end
      Inventory.order(:id).all.each do |inv|
            puts "Inventory.create(#{inv.serializable_hash.delete_if {|key, value| ['created_at', 'updated_at'].include?(key)}.to_s.gsub(/[{}]/,'')})"
        end
    end
end