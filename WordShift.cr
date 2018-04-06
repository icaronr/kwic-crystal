module WordShift
    #class Array(T)
        #def split (arr : Array(T), pos : Int32) : Tuple(Array(T), Array(T))
            #{arr.take(pos), arr.skip(pos)}
        #end
    #end

        def shift(words : Array(String), pos : Int32, target : Int32)
            l = words.first pos
            r = words.skip pos

            if (l.to_s.size + (pos-1) < (target - 5)) #pos-1: caracteres ' ' entre palavras
                self.shiftRight(l, r, target)
            else self.shiftLeft(l, r, target)
            end
        end

        def shiftRight(l : Array(String), r : Array(String), target : Int32)
            puts "\t shiftRight | l: #{l.size}, r: #{r.size}, t: #{target}"
            
            l if r.size == 0

            r1 = r.first r.size - 1
            r2 = r.skip  r.size - 1
            
            l1 = r2.concat(l)
            
            if(l1.to_s().size + (l1.size-1) > (target - 5))
                l.concat(r)
            else
                shiftRight(l1, r1, target)
            end
        end
        
        def shiftLeft(l : Array(String), r : Array(String), target : Int32)
            puts "\t shiftLeft  | l: #{l.size}, r: #{r.size}, t: #{target}"
            r if l.size == 0
            
            l1 = l.first l.size - 1
            l2 = l.skip  l.size - 1
            
            r1 = l2.concat(l)
            
            if(l2.to_s().size + (l2.size-1) < (target - 5))
                l2.concat(r1)
            else
                shiftLeft(l2, r1, target)
            end
        end
end


