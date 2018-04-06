require "./Program.cr"

if ARGV.size > 2
    puts "We have args!"
    
    ARGV.each do |arg|
        puts "- #{arg}"
    end

    i, o, word = ARGV
    prog = Program.new(i, o, word)
else
    puts "We have no args!"
    prog = Program.new
end

prog.run
