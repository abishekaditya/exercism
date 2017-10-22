module BookKeeping
  VERSION = 1
end

# word counter
class Phrase
  def initialize(str)
    @str = str
  end

  def word_count
    counts = Hash.new(0)
    cleaned_array.each do |item|
      counts[item] += 1
    end
    counts
  end

  private

  def cleaned_array
    cleaned_string = @str.downcase.gsub(/[.!&@$%^,:]/, ' ')
    cleaned_string.split(' ').map { |i| i.gsub(/\A'(.+)'\Z/, '\1') }
  end
end
