module WordShift
  def shift(words  : Array(String),
            pos    : Int32,
            target : Int32,
            log    = false)

    l = words.first pos
    r = words.skip  pos

    if (l.to_s.size < (target - 5)) #pos-1: caracteres ' ' entre palavras
        self.shiftRight(l, r, target, log)
    else self.shiftLeft(l, r, target, log)
    end
  end

  def shiftRight(l : Array(String), r : Array(String), target : Int32, log = false)
    return l unless r.size > 0
    if (log)
      puts "\t shiftRight | \
              l: #{l.size}, \
              r: #{r.size}, \
              t: #{target}"
    end

    r1 = r.first r.size-1
    r2 = [r.last]
    #r2 = [r[-1]]

    l1 = r2.concat(l)
    
    if(l1.to_s().size > (target - 5))
        return l.concat(r1)
    else
        return shiftRight(l1, r1, target, log)
    end
  end
  
  def shiftLeft(l : Array(String), r : Array(String), target : Int32, log = false)
    return r unless l.size > 0
    
    if (log)
      puts "\t shiftLeft | \
             l: #{l.size}, \
             r: #{r.size}, \
             t: #{target}"
    end

    l1 = [l.first] # Primeiro Elemento
    l2 = l.skip(1) # Resto da Lista

    r1 = r.concat(l1)
    
    if(l2.to_s().size < (target - 5))
        return l2.concat(r1)
    end

    return shiftLeft(l2, r1, target, log)
  end
end


