require 'spec_helper'

describe CharacterList do

  before :all do
    # Memoize both lists in order to stop new GET requests being
    # sent via Nokogiri.
    @one_thousand_characters ||= CharacterList.new
    @two_fifty_characters ||= CharacterList.new(path: :MAGE)
  end

  context '#all_chars' do
    context 'with 1000 players' do
      it 'gets an array of 1000 characters' do
        list = @one_thousand_characters

        result = list.all_chars

        expect(result.count).to be_within(5).of(1000)
      end
    end

    context 'with 250 players' do
      it 'gets an array of 250 characters' do
        list = @two_fifty_characters

        result = list.all_chars

        expect(result.count).to eq(250)
      end
    end
  end

  context '#find_by' do
    it 'returns a list searched case insensitive' do
      list = @one_thousand_characters
      result = list.find_by("Sa san")

      expect(result).to include("Sa San (M) Chronosphere (Sa San)").or include("Behemoth Crucial (Sa San)")
    end

    it 'returns a list searched case sensitive' do
      list = @one_thousand_characters

      result = list.find_by("chronosphere", case_sensitive: true)

      expect(result).not_to include("Sa San (M) Chronosphere (Sa San)")
    end

  end

  context '#rank' do
    it 'should return the correct ranked player' do
      list = @one_thousand_characters
      result = list.rank(1)

      expect(result).to eq(list.all_chars.first)
    end

    context 'with 1000 characters' do
      it 'returns empty array with a bad rank' do
        list = @one_thousand_characters

        result = list.rank(1010)

        expect(result).to eq([])
      end

      it 'returns empty array with negative numbers' do
        list = @one_thousand_characters

        result = list.rank(-333)

        expect(result).to eq([])
      end
    end
    context 'with 250 characters' do
      it 'returns empty array with a bad rank' do
        list = @two_fifty_characters

        result = list.rank(251)

        expect(result).to eq([])
      end

      it 'returns empty array with negative numbers' do
        list = @two_fifty_characters

        result = list.rank(-333)

        expect(result).to eq([])
      end
    end
  end

  context '#path' do
    it 'returns the original initialized path' do
      list = @two_fifty_characters

      result = list.path

      expect(result).to eq("Mage")
    end
  end

  def mock_players
    Array.new(1000) { |num| "Il San player#{num}" }
  end
end
