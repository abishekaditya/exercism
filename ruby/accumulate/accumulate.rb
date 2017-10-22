module BookKeeping
  VERSION = 1
end

# monkey patching accumulate
class Array
  def accumulate(&block)
    return enum_for(__method__) if block.nil?
    result = []
    each do |e|
      result << (yield e)
    end
    result
  end
end
