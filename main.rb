class NewGrid
    @@turn = 0
    def initialize(size)
        @grid = Array.new(size) {Array.new(size,"_")}
    end
    def rough_grid
        @grid
    end
    def grid
        self.rough_grid.each { |line| puts line.join (" | ") }
    end

    def move(xpos,ypos)
        if self.rough_grid[xpos][ypos] == "_"
            if @@turn.even?
                self.rough_grid[xpos][ypos] = "X"
            else
                self.rough_grid[xpos][ypos] = "0"
            end
            @@turn +=1
            puts @@turn
            self.grid
        else
            puts "Position already marked, try again."
        end
    end
end

game = NewGrid.new(3)
game.grid