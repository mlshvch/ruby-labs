require "json"
require "yaml"

class User
    def initialize(name, surname, age)
        @name = name
        @surname = surname
        @age = age
    end

    def serialize()
        file = File.open("#{self.class.name}.yaml", "a")
        file.write("time: ", Time.now.to_s, "\n", self.to_yaml.to_s.split("\n")[1..-1].join("\n"), "\n---\n")
        file.close    
    end

    def deserialize()
        file = File.open("#{self.class.name}.yaml", "r").read
        file = file.split("---\n")
        index = 0
        puts "Choose save:"
        file.each do |save|
            puts index.to_s.concat(": ",save.split("\n")[0].split(": ")[1])
            index += 1
        end

        save = gets.chomp.to_i

        diap = (0..index).to_a
        
        if ! diap.include?(save) then
            puts "not saved"
            return
        end

        obj = file[save].split("\n")
        obj.shift
        @name = obj[0].split(": ")[1]
        @surname = obj[1].split(": ")[1]
        @age = obj[2].split(": ")[1].to_i
    end
end

Alex = User.new("Alex", "Malashevich", 20)

Alex.serialize

usr = User.new("Alex", "Malashevich", 20)


