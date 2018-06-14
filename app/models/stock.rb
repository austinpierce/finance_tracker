class Stock < ApplicationRecord
  
  def self.new_from_lookup(ticker_symbol) 
     # self level method (not working with object)
    begin   
      looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
      new(name: looked_up_stock.company_name, ticker: looked_up_stock.symbol, last_price: looked_up_stock.latest_price ) # new creates object
    rescue Exception => e # if user enters symbol that doesn't exist
      return nil
    end
      #name: , ticker:, last_price: are from DB columns. The . are from gem   
    end
  
end
