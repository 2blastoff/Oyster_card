require 'oystercard'

describe Oystercard do
  subject(:oystercard) {described_class.new}

  describe "#balance" do
    it "is initialised with a balance of 0 by default" do
      expect(oystercard.balance).to eq 0
    end
  end

  describe '#top_up' do
    it 'adds the value specified to the balance' do
      value = rand(Oystercard::BALANCE_MAX)
      expect{oystercard.top_up(value)}.to change{ oystercard.balance }.from(0).to(value)
    end
  end

  describe '#top_up' do
    it 'raises an error if topping up more than the max limit' do
      max_balance = Oystercard::BALANCE_MAX
      oystercard.top_up(max_balance)
      expect{ oystercard.top_up(1) }.to raise_error 'Top-up exceeds maximum limit of #{max_balance}'
    end
  end

  describe '#deduct' do
    it 'deducts the value specified from the balance' do
      value = rand(Oystercard::BALANCE_MAX)
      oystercard.top_up(value)
      expect{oystercard.deduct(value)}.to change{ oystercard.balance }.by (-value)
    end
  end

  describe '#touch_in' do
    it 'sets the oystercard to being in journey' do
      oystercard.top_up(Oystercard::BALANCE_MIN)
      expect(oystercard.touch_in).to eq true
    end
  end

  describe '#touch_in' do
    it 'raises an exception if the balance is inferior to £1' do
      expect{ oystercard.touch_in }.to raise_error 'Please top up your card.'
    end
  end

  describe '#touch_out' do
    it 'sets the oystercard to being off journey' do
      expect(oystercard.touch_out).to eq false
    end
  end

  describe '#in_journey?' do
    it 'checks that when initialised the card is not in journey' do
      expect(oystercard).to_not be_in_journey
    end
  end

end
