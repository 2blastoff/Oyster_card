class Oyster
    
    attr_reader :balance, :entry_station
    
    MAX_CARD_LIMIT = 90
    
    MIN_CARD_LIMIT = 1
    
    def initialize
        @balance = 0
        #@in_use = false
        @entry_station = nil
    end
    
    def top_up(value)
        fail "#{MAX_CARD_LIMIT} is the limit" if @balance + value > MAX_CARD_LIMIT
        @balance += value
    end
    
    def touch_in(entry_station)
        fail "Under #{MIN_CARD_LIMIT}, balance to low" if balance < MIN_CARD_LIMIT
        @entry_station = entry_station
        #@in_use = true
    end
    
    def touch_out(exit_station)
        deduct(1)
        @entry_station = nil
        #@in_use = false 
        
    end
    
    def in_journey?
        @entry_station
    end
    
    
    private
    
    def deduct(amount)
        @balance -= amount
    end
    
    
end