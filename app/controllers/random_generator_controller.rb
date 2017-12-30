class RandomGeneratorController < ApplicationController
    include RandomGeneratorHelper

    def index
        names = pick_random_line("./app/assets/resources/names.txt",2)
        @fName = names[0]
        @lName = names[1]
        @alignment = getAlignment()
        @place = pick_random_line("./app/assets/resources/places.txt")
        @terrain = pick_random_line("./app/assets/resources/terrain.txt")
        @landmark = pick_random_line("./app/assets/resources/landmarks.txt")
        @monsters = pick_random_line("./app/assets/resources/monsters.txt",3)
        @items = pick_random_line("./app/assets/resources/items.txt",3)
    end

   
end
