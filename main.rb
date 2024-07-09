class NewGame
    @@turn = 0
    @@transpose = Array.new(3) {Array.new(3,"_")}
    def initialize
        @grid = Array.new(3) {Array.new(3,"_")}
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
                @@transpose[ypos][xpos] = "X"
            else
                self.rough_grid[xpos][ypos] = "0"
                @@transpose[ypos][xpos] = "0"
            end
            @@turn +=1
            self.status
        else
            puts "Position already marked, try again."
        end
    end
    private
    def gameover
        puts "Winner Winner!!"
        @@turn = 0
        @grid = Array.new(3) {Array.new(3,"_")}
        @@transpose = Array.new(3) {Array.new(3,"_")}
    end
    def status
        self.grid
        if @@turn > 4
            if self.rough_grid.any? { |line| line.all?("X") || line.all?(0)} || @@transpose.any? { |line| line.all?("X") || line.all?(0)}
                self.gameover
            elsif self.rough_grid[0][0]==self.rough_grid[2][2] && self.rough_grid[0][0]==self.rough_grid[1][1]
                self.gameover
            elsif self.rough_grid[0][2]==self.rough_grid[2][0] && self.rough_grid[0][2]==self.rough_grid[1][1]
                self.gameover
            end
        else
        end
    end
end