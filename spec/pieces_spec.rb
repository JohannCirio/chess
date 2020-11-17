# ./spec/pieces_spec.rb

require './lib/pieces.rb'

describe Pawn do
  context 'white pawn is correctly initialized in H1' do
    before { @pawn = Pawn.new('white', 0, 1) }
    it 'is white' do
      color = @pawn.color
      expect(color).to eql('white')
    end

    it 'its token is "♟"' do
      token = @pawn.token
      expect(token).to eql("♟")
    end

    it "its initial column is H(0)" do
      column = @pawn.current_column
      expect(column).to eql(0)
    end

    it "its initial row is 1" do
      row = @pawn.current_row
      expect(row).to eql(1)
    end
  end

end