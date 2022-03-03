require "byebug"

class Board

    def initialize(n)
        @grid = Array.new(n){Array.new(n){:N}}
        @size = n*n 
    end

    def size
        @size
    end

    def [](index)
        row,column = index
        @grid[row][column]
    end

    def []=(position, value)
        row,column = position
        @grid[row][column] = value
    end

    def num_ships
        @grid.flatten.count{ |el| el == :S}
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            p "you sunk my battleship!"
            return true
        else
            self[pos] = :X
            return false
        end
    end

    def place_random_ships

        while self.num_ships < @size/4
            r1 = rand(0...@grid.length)
            r2 = rand(0...@grid.length)
            pos = [r1,r2]
            self[pos] = :S if self[pos] != :S
                
        end
    end


    def hidden_ships_grid
        newGrid = []
        @grid.each do |row|
            newRow = row.map do |el| 
                (el == :S) ? :N : el
            end
            newGrid << newRow
        end
        newGrid
    end

    def self.print_grid(grid)
        grid.each do |row|
            puts row.join (" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end













end
