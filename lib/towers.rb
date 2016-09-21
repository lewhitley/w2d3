class TowersOfHanoi
  attr_accessor :stacks

  def initialize
    @stacks = [[3, 2, 1], [], []]
  end

  def game
    until won?
      from_tower = from_prompt
      to_tower = to_prompt
      move(from_tower, to_tower)
    end
  end

  def from_prompt
    puts "Please select a tower to move a disk from:"
    from_tower = Integer(gets.chomp)
  rescue ArgumentError => e
    puts e
    retry
  ensure
    from_tower
  end

  def to_prompt
    puts "Please select a tower to move a disk to:"
    to_tower = Integer(gets.chomp)
  rescue ArgumentError => e
    puts e
    retry
  ensure
    to_tower
  end

  def won?
    @stacks.first.empty? && (@stacks[1].length == 3 || @stacks[2].length == 3)
  end

  def move(from_tower, to_tower)
    if valid_move?(from_tower, to_tower)
      disk = @stacks[from_tower].pop
      @stacks[to_tower] << disk
    end
  end

  def valid_move?(from_tower, to_tower)
    raise "can't select empty stack" if @stacks[from_tower].empty?
    return true if @stacks[to_tower].empty?
    return true if @stacks[from_tower].last < @stacks[to_tower].last
    false
  end
end
