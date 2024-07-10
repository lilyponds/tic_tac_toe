class NewGame
  @turn = 0
  @transpose = Array.new(3) { Array.new(3, '_') }
  def initialize
    @grid = Array.new(3) { Array.new(3, '_') }
  end

  def grid
    @grid.each { |line| puts line.join(' | ') }
  end

  def move(xpos, ypos)
    if @grid[xpos][ypos] == '_'
      if @turn.even?
        @grid[xpos][ypos] = 'X'
        @transpose[ypos][xpos] = 'X'
      else
        @grid[xpos][ypos] = '0'
        @transpose[ypos][xpos] = '0'
      end
      @turn += 1
      status
    else
      puts 'Position already marked, try again.'
    end
  end

  private

  def gameover
    puts 'Winner Winner!!'
    @turn = 0
    @grid = Array.new(3) { Array.new(3, '_') }
    @transpose = Array.new(3) { Array.new(3, '_') }
  end

  def status
    grid
    return unless @turn > 4

    if @grid.any? { |line| line.all?('X') || line.all?(0) } || @transpose.any? do |line|
         line.all?('X') || line.all?(0)
       end
      gameover
    elsif @grid[0][0] == @grid[2][2] && @grid[0][0] == @grid[1][1]
      gameover
    elsif @grid[0][2] == @grid[2][0] && @grid[0][2] == @grid[1][1]
      gameover
    end
  end
end
