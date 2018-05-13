
require "./DataStorageManager.cr"
require "./IndexManager.cr"
require "./WordShift.cr"

class Program
  include DataStorageManager
  include IndexManager
  include WordShift

  def initialize(
    @inputfile  = "./res/papers.txt",
    @outputfile = "./res/test-res.txt",
    @stopword   : String? = nil,
    @saida = "Registro de saída em aquivo\n"
    # @stopwords  = "./res/stop_words.txt")
    )
  end

  def showStartup
    #Saida no terminal
    {% if flag?(:terminal) %}
    puts "- Input File  : #{@inputfile}"
    puts "- Output File : #{@outputfile}"
    puts "- Stop Word   : #{@stopword}" unless !@stopword
    {% end %}
    #Saida em arquivo
    {% if flag?(:arquivo) %}
    @saida += "- Input File  : #{@inputfile}\n"
    @saida += "- Output File : #{@outputfile}\n"
    @saida += "- Stop Word   : #{@stopword}\n" unless !@stopword
    {% end %}
  end


  def run
    self.showStartup
    dsm = DataStorageManager.new @inputfile
    im  = IndexManager.new

    dsm.length.times do |lineNumber|
      line  = dsm.line(lineNumber)
      words = line.split(' ')

      words.size.times do |pos|
        im.map(words[pos], line, pos)
      end
    end

    sorted_words = im.sortedWords

    return if sorted_words.size == 0

    longest_word_size =
      sorted_words
        .sort {|w| w.size}
        .first()
        .size

    sorted_words.skip(3).each do |w|
      
      tab = longest_word_size - w.size
      #Saida no terminal
      {% if flag?(:terminal) %}
      puts "\nWord: #{w}"
      {% end %}
      #Saida em arquivo
      {% if flag?(:arquivo) %}
      @saida += "\nWord: #{w}\n"
      {% end %}
      im.occurrencesOfWord(w).map_with_index do |(line,pos), i|
        
        # Test Printing
        l = line.split(' ')
        s = l.size/2
        # puts "[#{pos}] : #{line.split(' ')} \n\
        #       \t [first #{s}]: #{l.first(s)} \n\
        #       \t [last  #{l.size-s}]: #{l.skip(l.size-s)}"

        # Shift
        header = "\t- [#{w} (#{i})]:"
        tab.times { header += " " }
        #Saida no terminal
        {% if flag?(:terminal) %}
        puts "#{header} #{shift(line.split(' '), pos, 0).to_s}"
        {% end %}
        #Saida em arquivo
        {% if flag?(:arquivo) %}
        @saida += "#{header} #{shift(line.split(' '), pos, 0).to_s}\n"
        {% end %}
      end
    end
    #Escreve a saida no arquivo
    {% if flag?(:arquivo) %}
    File.write(@outputfile, @saida)
    {% end %}
  end
end
