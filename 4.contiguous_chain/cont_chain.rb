require 'profile'
class Point
	attr_accessor :x, :y, :line

	def initialize(x, y)
		@x = x
		@y = y
		@line = "not set"
	end
end
class Grid
	attr_accessor :width, :height

	def initialize(width, height)
		@width = width.to_i
		@height = height.to_i
		@grid = create_grid
	end
	def create_grid
		@grid = Hash.new()
		(1..@height).each do |y|
			(1..@width).each do |x|
				@grid[[x,y]] = Point.new(x,y) if $file[y].split('')[x-1].to_s == "x" 
			end
		end
		@grid
	end
	def get(x,y)
		@grid[[x,y]]
	end
end

def set_line_and_search_and_set_neighbours(x,y, line)
	if $g.get(x,y).line == "not set"
		$g.get(x,y).line = line
		if $g.get(x+1, y) != nil then set_line_and_search_and_set_neighbours(x+1, y, line) end
		if $g.get(x-1, y) != nil then set_line_and_search_and_set_neighbours(x-1, y, line) end
		if $g.get(x, y+1) != nil then set_line_and_search_and_set_neighbours(x, y+1, line) end
		if $g.get(x, y-1) != nil then set_line_and_search_and_set_neighbours(x, y-1, line) end
	end
end

def contiguous_chain(path)
	$file = File.readlines(path)
	$file.map! {|l| l.chomp}
	y = $file[0].split(' ').first.to_i
	x = $file[0].split(' ').last.to_i
	$g = Grid.new(x,y)

	i = 1
	(1..$g.height).each do |y|
		(1..$g.width).each do |x|
			if $g.get(x,y) != nil
				if $g.get(x,y).line == "not set"
					set_line_and_search_and_set_neighbours(x,y, i.to_s)
					i += 1
				end
			end
		end
	end
	i - 1
end
puts contiguous_chain("input/10.txt")

