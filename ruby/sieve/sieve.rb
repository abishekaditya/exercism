module BookKeeping
  VERSION = 1
end

# Sieve of Eratosthenes
class Sieve
  def initialize(upto)
    @limit = upto
  end

  def primes
    list = [*2..@limit]
    list.each_with_object([]) do |current, numbers|
      numbers << current
      list.reject! { |i| (i % current).zero? && current != i }
    end
  end
end
