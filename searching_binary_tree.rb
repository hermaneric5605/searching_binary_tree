class Node
	attr_accessor :value, :parent, :left_child, :right_child
	def initialize(value, parent = nil, left_child = nil, right_child = nil)
		@value = value
		@parent = parent
		@left_child = left_child
		@right_child = right_child
	end

end
	#write a method build_tree which takes an array of data and turns it into a binary tree full of Node objects appropriately placed
	def build_tree(array=[])