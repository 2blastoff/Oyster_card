class Station
    
    NAMES = { LiverpoolStreet: 1, Stratord: 2, WhiteChaple: 3}
    
    def initialize(name)
       @zone = NAMES[name.to_sym]
       @name = name
    end
    
    
    def station_zone
        @zone
    end
    
    def name
        @name
    end
end