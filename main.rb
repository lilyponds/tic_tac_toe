class NewGrid
    @@turn = 0
    def initialize
        @grid = Array.new(3) {Array.new(3,"_")}
    end
    def rough_grid
        @grid
    end
    def grid
        self.rough_grid.each { |line| puts line.join (" | ") }
    end

    def status
        self.grid
        if @@turn > 4
            if self.rough_grid.any? { |line| line.all?("X") || line.all?(0)}
            puts "Winner Winner!!"
            @@turn = 0
            @grid = Array.new(3) {Array.new(3,"_")}
        else
            end
        else
        end
    end

    def move(xpos,ypos)
        if self.rough_grid[xpos][ypos] == "_"
            if @@turn.even?
                self.rough_grid[xpos][ypos] = "X"
            else
                self.rough_grid[xpos][ypos] = "0"
            end
            @@turn +=1
            self.status
        else
            puts "Position already marked, try again."
        end
    end
end

#game = NewGrid.new(3)
#game.grid