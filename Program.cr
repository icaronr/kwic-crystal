
require "./DataStorageManager.cr"
require "./IndexManager.cr"
require "./WordShift.cr"

class Program
    include DataStorageManager
    include IndexManager
    include WordShift

    def initialize(
        @inputfile  = "./kwic-cr/test/resources/papers.txt",
        @outputfile = "./kwic-cr/test-res.txt",
        @stopword   = "of")
    end

    def showStartup
        puts "- Input File  : #{@inputfile}"
        puts "- Output File : #{@outputfile}"
        puts "- Stop Word   : #{@stopword}"
    end


    def run
        self.showStartup
        dsm = DataStorageManager.new @inputfile
        im  = IndexManager.new

        # dsm.each.to_s.split(' ').each do |word|
        #   im..map(word, line, pos)
        # end

        dsm.length.times do |lineNumber|
            line = dsm.line(lineNumber)
            words = line.split(' ')

            words.size.times do |pos|
                im.map(words[pos], line, pos)
            end
        end

        im.sortedWords.each do |w|
            puts "[prog]: shifting word: #{w}"
            im.occurrencesOfWord(w).each do |(line,pos)|
                puts shift(line.split(' '), pos, 0).to_s()
            end
        end
    end
end
