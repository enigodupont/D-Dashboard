class RandomGeneratorController < ApplicationController
    include RandomGeneratorHelper

    def index
        @fName = pick_random_line("./app/assets/resources/names.txt")
        @lName = pick_random_line("./app/assets/resources/names.txt")
        @place = pick_random_line("./app/assets/resources/places.txt")
        @terrain = pick_random_line("./app/assets/resources/terrain.txt")
        @landmark = pick_random_line("./app/assets/resources/landmarks.txt")
        @item = pick_random_line("./app/assets/resources/items.txt")
    end

   
end
