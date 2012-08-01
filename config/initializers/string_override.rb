class String
  def tmp__lfill(len = self.size, fill = '.')
    tmp = self[0..(len - 3)] + '...' if self.size - 3 > len
    return tmp || self
  end
end
