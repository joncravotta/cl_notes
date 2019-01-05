require 'optparse'
require_relative "./todo"

options = {}

OptionParser.new do |opts|
  opts.banner = "Usage: ruby main.rb [options]"

  opts.on("-a N", "--add N", String,  "Add new task.") do |t|
    options[:task] = t
  end

  opts.on("-l", "--list", "Show all uncompleted tasks.") do |list|
    options[:list] = list
  end

  opts.on("-c N", "--complete N", Integer, "Mark task as completed with id.") do |id|
    options[:complete] = id
  end

  opts.on("-d N", "--delete N", Integer, "Delete task with id.") do |id|
    options[:delete] = id
  end

  opts.on("--completed", "Shows all completed tasks.") do |c|
    options[:completed] = c
  end

end.parse!

if options[:task]
  Todo.add(options[:task])
end

if options[:list]
  Todo.show
end

if options[:complete]
  Todo.complete(options[:complete])
end

if options[:completed]
  Todo.show_completed
end