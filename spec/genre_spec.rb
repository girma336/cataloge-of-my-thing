require 'rspec'
require_relative '../classes/genre'

RSpec.describe Genre do
  describe '#initialize' do
    context 'Check is it an instance of Genre' do
      it 'Return a new genre object' do
        @genre = Genre.new('Girma')
        expect(@genre).to be_an_instance_of Genre
      end
    end

    context 'Check without argumant' do
      it 'Return argumantError' do
        expect { Genre.new }.to raise_exception ArgumentError
      end
    end
  end

  describe '#name' do
    subject { Genre.new('Jerry') }
    context 'Check the return value of name' do
      it 'Return true if name is Jerry' do
        expect(subject.name).to eql('Jerry')
      end
    end

    context 'Check the return value of name with incorrect name' do
      it 'Return false if name is jerry' do
        expect(subject.name).not_to eql('jerry')
      end
    end
  end

  describe '#items' do
    subject { Genre.new('Girma') }
    context 'Check array items' do
      it 'Return empty array' do
        expect(subject.items).to eq([])
      end
    end
  end
end
