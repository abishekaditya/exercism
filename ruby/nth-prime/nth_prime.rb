module BookKeeping
  VERSION = 1
end

# find the nth prime number
class Prime
  @primes = [2, 3]

  def self.nth(number)
    raise ArgumentError if number.zero?
    fill_n_primes(number) if number > @primes.length
    @primes[number - 1]
  end

  def self.fill_n_primes(number)
    ctr = number - 2
    candidate = @primes.last + 2
    while ctr > 0
      if prime?(candidate)
        @primes << candidate
        ctr -= 1
      else
        candidate += 2
      end
    end
  end

  def self.prime?(number)
    @primes.none? { |i| (number % i).zero? }
  end
end
