module BookKeeping
  VERSION = 4
end

# gives RNA complement of DNA strand
class Complement
  def self.of_dna(dna_strand)
    out = dna_strand.split('').map { |i| complement(i) }.join
    out.length != dna_strand.length ? '' : out
  end

  def self.complement(nucleotide)
    hash = { 'G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'U' }
    hash[nucleotide]
  end
end
