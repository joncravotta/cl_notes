class Todo

  FILE_NAME="TODO.txt"
  COMPLETED="[x]"
  NOT_COMPLETED="[]"


  def self.add(text)
    open("./#{FILE_NAME}", 'a') do |f|
      f.puts "[] #{text}"
    end
  end

  def self.edit(i, text)
  end

  def self.complete(i)
    # add each line to array and then change the string of the line
    # you want to change.  Write array to file
    File.open("./TODO.txt", 'r+') do |file|
      task_index = 1
      lines = file.each_line.to_a

      lines.each_with_index  do |line, index|
        if line.include? NOT_COMPLETED
          if i == task_index
            lines[index] = line.sub!("[]", "[x]")
          end

          task_index += 1
        end
      end

      file.rewind
      file.write(lines.join)
    end
  end

  def self.remove
  end

  def self.show
    read("./TODO.txt")
  end

  def self.show_completed
    index = 1

    File.open("./TODO.txt", "r") do |f|
      f.each_line do |line|
        if line.include? COMPLETED
          
          puts "#{index}: #{line}"

          index += 1
        end
      end
    end
  end

  private 

  def self.read(file_path)
    index = 1

    File.open(file_path, "r") do |f|
      f.each_line do |line|
        if line.include? NOT_COMPLETED
          
          puts "#{index}: #{line}"

          index += 1
        end
      end
    end
  end
end
