module IndexManager
  class IndexManager
    @map = Hash(String, Array({String, Int32})).new
    
    def initialize; end
    def isEmpty : Bool
      map.isEmpty
    end
    
    def map(word : String, line : String, pos : Int32)
      tuple = {line, pos}
      if @map.has_key?(word)
        @map[word] << tuple 
      else @map[word] = Array{tuple}
      end
    end

    def occurrencesOfWord(word : String)
      @map[word]
    end

    def sortedWords
      s = @map.keys.sort
    end
  end
end
