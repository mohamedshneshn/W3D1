class Board
    attr_reader :size
   def initialize(size)
    @size=size
    @grid=Array.new(size){Array.new(size)}

   end
#    ------------------------------------------
   def [](pos)
    row,col=pos
    @grid[row][col]
   end
#    -------------------------------------------
   def []=(pos, mark)
    row,col=pos
    @grid[row][col]=mark
   end
#    --------------------------------------------
def complete_row?(mark)
    @grid.any? {|row| row.all?(mark) }
end
# ------------------------------------------------
def complete_col?(mark)
    @grid.transpose.any? {|row| row.all?(mark) }
end
# ---------------------------------------------------
def complete_diag?(mark)
    left_to_right=(0...@grid.length).all? do |i|
        pos=[i,i]
        self[pos] == mark
    end
    right_to_left=(0...@grid.length).all? do |i|
        j=@grid.length-1-i
        pos=[i,j]
        self[pos] == mark
    end
    left_to_right || right_to_left
end
# -------------------------------------------------------------
def winner?(mark)
    complete_row?(mark) || complete_col?(mark) || complete_diag?(mark)
end
# --------------------------------------------------------------

    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @grid.each { |row| p row }
    end
end
