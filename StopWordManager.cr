module StopWordManager
    class StopWordManager
        @stopwords : Array(String)
        def initialize(@filename : String =  "\0")
            if !File.file? @filename
                abort "[swm]-> ERROR - file not found: #{@filename}"
            end
            @stopwords = File.each_line(@filename).to_a
        end
        
    end
end