module RandomGeneratorHelper

    def pick_random_line(file_path,num=1)

        chosen_lines = Array.new(num)
        File.foreach(file_path).each_with_index do |line, number|
          chosen_lines.each_index {|x| chosen_lines[x] = line if rand < 1.0/(number+1) }
        end

        if(num == 1)
          return chosen_lines[0]
        else
          return chosen_lines
        end
    end

    def get_alignment()

      a1 = ["Lawful","Neutral","Chaotic"]
      a2 = ["Good","Neutral","Evil"]

      return a1.sample + "-" + a2.sample
    end
end
