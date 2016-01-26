class Oyster
    
    attr_reader :balance
    
    MAX_CARD_LIMIT = 90
    
    MIN_CARD_LIMIT = 1
    
    def initialize
        @balance = 0
        @in_use = false
    end
    
    def top_up(value)
        fail "#{MAX_CARD_LIMIT} is the limit" if @balance + value > MAX_CARD_LIMIT
        @balance += value
    end
    
    def touch_in
        fail "Under #{MIN_CARD_LIMIT}, balance to low" if balance < MIN_CARD_LIMIT
        @in_use = true
    end
    
    def touch_out
        deduct(1)
        @in_use = false 
    end
    
    def in_journey?
        @in_use
    end
    
    
    private
    
    def deduct(amount)
        @balance -= amount
    end
    
    
end