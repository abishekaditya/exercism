module BookKeeping
  VERSION = 1
end

# bob the builder
class Bob
  RESPONSE = {
    question: 'Sure.',
    yell: 'Whoa, chill out!',
    silence: 'Fine. Be that way!',
    default: 'Whatever.'
  }.freeze

  def self.hey(remark)
    RESPONSE[type_of(remark)]
  end

  def self.type_of(remark)
    if remark.upcase == remark && remark.downcase != remark
      :yell
    elsif remark.strip.end_with?('?')
      :question
    elsif remark.strip.empty?
      :silence
    else
      :default
    end
  end
end
