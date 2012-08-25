module Sardonyx
  class Node
    attr_accessor :left, :right, :parent
    attr_accessor :value, :color
    
    def initialize(attributes = {})
      {color: :black}.merge(attributes).each do |key, value|
        send("#{key}=", value)
      end
    end
    
    def grandparent
      parent.parent unless parent.nil?
    end
    
    def uncle
      g = grandparent
      (parent == g.left ? g.right : g.left) if g
    end
    
    def left=(node)
      @left = node
      node.parent = self
    end
    
    def right=(node)
      @right = node
      node.parent = self
    end
    
    def rotate_left
      nil
    end
    
    def rotate_right
      l, q, c = [left, self, c]
      a, p, b = [left.left, left, left.right]
    end
  end
end