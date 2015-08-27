#note to self: use ruby-prof to profile the code. (see where it spends the most time.)
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
		@grd = Hash.new()
		create_grid
	end
	def create_grid
		(1..@height).each do |y|
			(1..@width).each do |x|
				@grd[[x,y]] = Point.new(x,y) if file_split(y)[x-1].to_s == "x"  
			end
		end

	end
	#split the file string into chars. caching used for speed.
	def file_split(y)
		@file_split_cache ||= {} #create empty hash if variable does not exist yet
		@file_split_cache[y] ||= $file[y].scan(/./)
	end
	def get(x,y)
		@grd[[x,y]]
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
	$file = File.readlines(path.to_s)
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

file_input = File.readlines("files.txt")
file_output = File.new("results.txt", "w")
file_input.each do |i| 
	file_output.puts "#{i.chomp.to_s} -> #{contiguous_chain(i.chomp)}"
end
file_output.close





