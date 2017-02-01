def stock_picker (stock_prices)

  profit = 0
  largest_profit = 0
  best_buy = 0
  best_sell = 0

  stock_prices[0..-2].each_index do |buy|                      # buy (skip last day)
    stock_prices[1..-1].each_index do |sell|                   # sell (skip first day)
      if buy < sell                                            # You cannot sell before you buy
        profit = stock_prices[sell] - stock_prices[buy]
      end
      if profit > largest_profit
          largest_profit = profit
          best_buy = buy
          best_sell = sell
      end
    end
  end
  return result = [best_buy, best_sell]
end

stock_inputs = [17,3,6,9,15,8,6,1,10]                          #arry
p stock_picker(stock_inputs)                                   #calling a method and print the result to the screen
