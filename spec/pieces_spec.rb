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
      expect(token).to eql('♟')
    end

    it 'its initial column is H(0)' do
      column = @pawn.current_column
      expect(column).to eql(0)
    end

    it 'its initial row is 1' do
      row = @pawn.current_row
      expect(row).to eql(1)
    end
  end
end

describe Knight do
  context 'white knight is correctly initialized in H1' do
    before { @knight = Knight.new('white', 0, 1) }
    it 'is white' do
      color = @knight.color
      expect(color).to eql('white')
    end

    it 'its token is ""' do
      token = @knight.token
      expect(token).to eql('♞')
    end

    it 'its initial column is H(0)' do
      column = @knight.current_column
      expect(column).to eql(0)
    end

    it 'its initial row is 1' do
      row = @knight.current_row
      expect(row).to eql(1)
    end
  end
end

describe Queen do
  context 'white queen is correctly initialized in H1' do
    before { @queen = Queen.new('white', 0, 1) }
    it 'is white' do
      color = @queen.color
      expect(color).to eql('white')
    end

    it 'its token is ""' do
      token = @queen.token
      expect(token).to eql('♚')
    end

    it 'its initial column is H(0)' do
      column = @queen.current_column
      expect(column).to eql(0)
    end

    it 'its initial row is 1' do
      row = @queen.current_row
      expect(row).to eql(1)
    end
  end
end

describe Bishop do
  context 'white bishop is correctly initialized in H1' do
    before { @bishop = Bishop.new('white', 0, 1) }
    it 'is white' do
      color = @bishop.color
      expect(color).to eql('white')
    end

    it 'its token is ""' do
      token = @bishop.token
      expect(token).to eql('♝')
    end

    it 'its initial column is H(0)' do
      column = @bishop.current_column
      expect(column).to eql(0)
    end

    it 'its initial row is 1' do
      row = @bishop.current_row
      expect(row).to eql(1)
    end
  end
end

describe Tower do
  context 'white tower is correctly initialized in H1' do
    before { @tower = Tower.new('white', 0, 1) }
    it 'is white' do
      color = @tower.color
      expect(color).to eql('white')
    end

    it 'its token is ""' do
      token = @tower.token
      expect(token).to eql('♜')
    end

    it 'its initial column is H(0)' do
      column = @tower.current_column
      expect(column).to eql(0)
    end

    it 'its initial row is 1' do
      row = @tower.current_row
      expect(row).to eql(1)
    end
  end
end

describe King do
  context 'white king is correctly initialized in H1' do
    before { @king = King.new('white', 0, 1) }
    it 'is white' do
      color = @king.color
      expect(color).to eql('white')
    end

    it 'its token is ""' do
      token = @king.token
      expect(token).to eql('♛')
    end

    it 'its initial column is H(0)' do
      column = @king.current_column
      expect(column).to eql(0)
    end

    it 'its initial row is 1' do
      row = @king.current_row
      expect(row).to eql(1)
    end
  end
end
