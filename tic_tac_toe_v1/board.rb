class Board

    def initialize()
        @grid = Array.new(3) {Array.new(3) {'_'}}
    end

    def valid?(position)
        row,col = position
        row.between?(0,2) && col.between?(0,2) ? true : false
    end

    def empty?(position)
        row,col = position
        @grid[row][col] == '_' ? true : false
    end

    def place_mark(position, mark)

        row,col = position
        raise ArgumentError.new "not valid input" if !valid?(position) || !empty?(position)
        @grid[row][col] = mark
    end

    def print
        @grid.each do |row|
            puts row.join (" ")
        end
    end

    def win_row?(mark)
        @grid.any? {|row| row.uniq.count <= 1 && row.uniq.include?(mark) }
    end



    def win_column?(mark)
        columns = []
        (0..2).each do |i|
            col = []
            (0..2).each do |j|
                col << @grid[j][i]
            end
            columns << col
        end
        columns.any? {|col| col.uniq.count <= 1 && col.uniq.include?(mark) }
    end

    def win_diagonal?
        diagonals = []
        diag1 = []
        diag2 = []
        (0..2).each do |i|
            diag1 << @grid[i][i]
        end

        (0..2).each do |i|
            diag2 << @grid[i][grid.length-1-i]
        end

        diagonals.push diag1,diag2
        diagonals.any? {|diag| diag.uniq.count <= 1 && diag.uniq.include?(mark) }
    end

    def win?
        win_row? || win_column? || win_diagonal? ? true :false
    end

    def empty_positions?
        @grid.any do |row|
            row.any {|el| el == "_"}
        end
    end




            





end