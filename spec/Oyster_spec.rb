require 'Oyster.rb'

describe Oyster do
    
    subject(:oyster) {described_class.new}
    
    let(:entry_station) {double :entry_station}
    
    let(:exit_station) {double :exit_station}
    
    it 'will test a Oystercard has a balance of default 0' do
        expect(oyster.balance).to eq(0)
    end

    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'will check that money can be added to card' do
        expect{oyster.top_up(2)}.to change{ oyster.balance }.by (2)
    end

    it 'will raise error for the cards max limit £90' do
        #max = Oyster::MAX_CARD_LIMIT
        #subject.top_up(max = Oyster::MAX_CARD_LIMIT)
        expect{oyster.top_up(Oyster::MAX_CARD_LIMIT + 1)}.to raise_error "#{Oyster::MAX_CARD_LIMIT} is the limit"
        #expect{subject.top_up(91)}.to raise_error'£90 is the limit'
    end
    
    # it 'deduct money from card when touching in' do
    #     expect(oyster.deduct(10)).to eq oyster.balance
    # end
    
    # it 'shows as in use (true) on touch in' do
    #     oyster.top_up(2)
    #     expect(oyster.touch_in(entry_station)).to eq true
    # end
    
    # it 'shows as out of use (false) when touched out' do
    #     expect(oyster.touch_out).to eq false
    # end
    
    it 'shows the state of journey when in_journey called' do
        oyster.top_up(2)
        oyster.touch_in(entry_station)
        expect(oyster).to be_in_journey
    end
    
    it 'raises an error if balnce is < £1' do
    expect{oyster.touch_in(entry_station)}.to raise_error "Under #{Oyster::MIN_CARD_LIMIT}, balance to low"
    
    end
   
    it 'needs to deduct minimum fare on touch out' do
        oyster.instance_variable_set("@balance", 1)
        expect{oyster.touch_out(exit_station)}.to change{ oyster.balance }.by (-1)
      
    end

    it 'on touch in records the station travelled from' do
        oyster.instance_variable_set("@balance", 1)
        oyster.touch_in(entry_station)
        expect(oyster.entry_station).to eq entry_station
    end

    it 'on touch out records the station travelled to' do
        #oyster.instance_variable_set("@balance", 1)
        oyster.touch_out(exit_station)
        expect(oyster.exit_station).to eq exit_station
    end

    

end
