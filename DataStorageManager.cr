 
module DataStorageManager
    class DataStorageManager
        @lines : Array(String)
        def initialize(@filename : String = "\0")
            if !File.file? @filename
                abort "file not found: #{@filename}"
            end

           #puts File.each_line(@filename).to_a.to_s 
           
           @lines = File.each_line(@filename).to_a
           puts "\t[dsm]: lines: #{self.length}"
        end


        def line(idx : Int32)
            @lines[idx]
        end

        def length()
            @lines.size
        end
    end
end
