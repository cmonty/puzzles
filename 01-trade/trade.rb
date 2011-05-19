require 'csv'
require 'nokogiri'

class Conversion
  attr_accessor :factor

  def initialize(opts)
    doc = Nokogiri::XML(open('rates.xml'))
    doc.css('rate').each do |node|
      if node.search('from').first.content == opts[:from] and node.search('to').first.content == opts[:to]
        @factor = node.search('conversion').first.content.to_f
        break
      end
    end
  end
  
  def convert(amount)
    round amount / @factor
  end

  def round(n)
    return n.round(2) unless n.abs - n.floor == 0.5

    if n.floor % 2 == 1
      n.abs.ceil
    else
      n.abs.floor
    end

  end

end


class Records
  
  def self.read(product)
    trans = Array.new

    CSV.foreach 'trans.csv', :headers => :first_row, :return_headers => false do |row|
      trans << row['amount'] if row["sku"] == product
    end
    
    trans
  end

end
