require 'station.rb'



describe Station do

    subject(:station) {described_class.new}
    let(:zone) {double :zone}

    it 'it contains information on which zone the station is in from name when initialized' do
        station1 = Station.new("LiverpoolStreet")
        expect(station1.station_zone).to eq 1
    end


    it 'it returns its name when called' do
        station1 = Station.new("LiverpoolStreet")
        expect(station1.name).to eq "LiverpoolStreet"
    end


    
    
end