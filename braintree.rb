class BrainTree
  
  def self.luhn?(n)
    sum = 0

    n.reverse.chars.with_index do |c, i|
      d = c.to_i
      
      if i % 2 == 1
        d *= 2
        d -= 9 if d > 9
      end
      
      sum += d
    end
    
    sum % 10 == 0
  end

  def self.ccexp?(d)
    m, y = d.split '/'
    
    if y.to_i > 2010
      false
    elsif y.to_i == 2010 and m.to_i > 6
      false
    else
      true
    end
    
  end

  def self.f(n)
    if n <= 2
      1
    else
      f(n-1) + f(n-2)
    end
  end

  def self.fibsum(n)
    sum = 0

    1.upto(n) do |i|
      sum += f(i)
    end

    sum
  end

  def self.morse(str)
    code = %w[.- -... -.-. -.. . ..-. --. .... .. .--- -.- .-.. -- -. --- .--. --.- .-. ... - ..- ...- .-- -..- -.-- --..]

    26.times do |i|
      str.gsub!(/#{(97+i).chr}/i, code[i])
    end
    str
  end

  def self.mask(s)
    s[6..-5] = '*' * (s.size - 10)
    s
  end
end
