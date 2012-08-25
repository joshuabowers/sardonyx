module Sardonyx
  class Node
    attr_accessor :left, :right, :parent
    attr_accessor :value, :color
    
    def grandparent
      nil
    end
    
    def uncle
      nil
    end
  end
end