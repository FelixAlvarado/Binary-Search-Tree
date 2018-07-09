class BSTNode
  attr_accessor  :left, :right, :parent
  attr_reader :value
  def initialize(value)
    @value = value
    @parent = nil
    @right = nil
    @left = nil 
  end
end
