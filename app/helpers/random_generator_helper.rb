module RandomGeneratorHelper

    def pick_random_line(filePath)
        chosen_line = nil
        File.foreach(filePath).each_with_index do |line, number|
          chosen_line = line if rand < 1.0/(number+1)
        end
        return chosen_line
      end
end
