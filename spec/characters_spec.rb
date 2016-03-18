require 'spec_helper'

describe Characters do
  context '#top_1000' do
    it 'gets an array of 1000 characters' do
      top_players = mock_players
      allow(Nokogiri).to receive(:HTML).and_return(top_players)
      allow(top_players).to receive(:css).and_return(top_players)
      allow(top_players).to receive(:top_1000).and_return(top_players)
      allow(top_players).to receive(:map).and_return(top_players)

      list = Characters.new
      result = list.top_1000

      expect(result.count).to eq(1000)
      expect(result.first).to eq("Il San player0")
    end
  end

  context '#find_by' do
    it 'returns a list searched case insensitive' do
      top_players = mock_players

      allow(Characters).to receive(:new).and_return(top_players)
      allow(top_players).to receive(:find_by).with("player999").and_return(top_players.last)

      list = Characters.new
      result = list.find_by("player999")

      expect(list).to have_received(:find_by).with("player999")
      expect(result).to eq("Il San player999")
    end

    it 'returns a list searched case sensitive' do
      top_players = mock_players

      allow(Characters).to receive(:new).and_return(top_players)
      allow(top_players).to receive(:find_by).with("Il san").and_return([])

      list = Characters.new
      result = list.find_by("Il san")

      expect(result.first).to eq(nil)
    end

  end

  context '#find' do
    it 'should return the correct ranked player' do
      list = Characters.new
      result = list.find(1)

      expect(result).to eq(list.top_1000[0])
    end

    it 'returns empty array with a bad rank' do
      list = Characters.new
      result = list.find(1001)

      expect(result).to eq([])
    end

    it 'returns empty array with negative numbers' do
      list = Characters.new
      result = list.find(-333)

      expect(result).to eq([])
    end
  end

  def mock_players
    Array.new(1000) { |num| "Il San player#{num}" }
  end
end
