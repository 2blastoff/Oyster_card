class Oyster
    
    attr_reader :balance, :entry_station, :journey_hist, :exit_station
    
    MAX_CARD_LIMIT = 90
    
    MIN_CARD_LIMIT = 1
    
    def initialize
        @balance = 0
        #@entry_station = 'x'
        #@exit_station = "hold"
        @journey_hist = {}
    end
    
    def top_up(value)
        fail "#{MAX_CARD_LIMIT} is the limit" if @balance + value > MAX_CARD_LIMIT
        @balance += value
    end
    
    def touch_in(entry_station)
        fail "Under #{MIN_CARD_LIMIT}, balance to low" if balance < MIN_CARD_LIMIT
        @entry_station = entry_station
        @journey_hist[@entry_station] = nil
    end
    
    def touch_out(exit_station)
        deduct(1)
        @exit_station = exit_station
        @journey_hist[@entry_station] = @exit_station 
        
    end
    
    def in_journey?
        @journey_hist.empty? ? false : @journey_hist[@entry_station] == nil
    end
    
    
    private
    
    def deduct(amount)
        @balance -= amount
    end
    
    
end