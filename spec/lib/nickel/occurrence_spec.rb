require 'spec_helper'
require 'nickel/occurrence'
require 'nickel/zdate'

module Nickel
  describe Occurrence do
    describe '#==' do
      let(:occ) { Occurrence.new(type: :daily, start_date: ZDate.new('20140128')) }

      it 'is true when comparing to itself' do
        expect(occ).to eq occ
      end

      it 'is false when comparing to nil' do
        expect(occ).to_not eq nil
      end

      it 'is false when comparing to a string' do
        expect(occ).to_not eq 'occ'
      end

      it 'is false when comparing to an occurence with different dates' do
        expect(occ).to_not eq Occurrence.new(type: :daily, start_date: ZDate.new('20080825'))
      end

      it 'is false when comparing to an occurrence with a different type' do
        expect(occ).to_not eq Occurrence.new(type: :weekly, start_date: ZDate.new('20140128'))
      end

      it 'is false when comparing to an occurence with a different interval' do
        expect(occ).to_not eq Occurrence.new(type: :daily, start_date: ZDate.new('20140128'), interval: 3)
      end

      it 'is true when comparing to an occurence with the same values' do
        expect(occ).to eq Occurrence.new(type: :daily, start_date: ZDate.new('20140128'))
      end
    end

    describe '#inspect' do
      let(:occ) { Occurrence.new(type: :daily, start_date: ZDate.new('20140128'), end_date: ZDate.new('20140209'), interval: 2) }

      it 'shows only members that have been set' do
        expect(occ.inspect).to eq '#<Occurrence type: daily, start_date: 20140128, end_date: 20140209, interval: 2>'
      end
    end
  end
end
