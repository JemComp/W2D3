class Game

    def initialize(mark1,mark2)
        @player1 = HumanPlayer.new(mark1)
        @player2 = HumanPlayer.new(mark2)
        @current_player = @player1
    end

    def switch_turn
        
    end

end
