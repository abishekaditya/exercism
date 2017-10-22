defmodule ProteinTranslation do
  @codon_protein_map %{
  "UGU" => "Cysteine",
  "UGC" => "Cysteine",
  "UUA" => "Leucine",
  "UUG" => "Leucine",
  "AUG" => "Methionine",
  "UUU" => "Phenylalanine",
  "UUC" => "Phenylalanine",
  "UCU" => "Serine",
  "UCC" => "Serine",
  "UCA" => "Serine",
  "UCG" => "Serine",
  "UGG" => "Tryptophan",
  "UAU" => "Tyrosine",
  "UAC" => "Tyrosine",
  "UAA" => "STOP",
  "UAG" => "STOP",
  "UGA" => "STOP"
  }
  @invalid_codon "invalid codon"
  @invalid_rna "invalid RNA"
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: { atom,  list(String.t()) }
  def of_rna(rna) do
    to_charlist(rna)
    |> Enum.chunk_every(3)
    |> Enum.map(&to_string(&1))
    |> Enum.map(&elem(of_codon(&1),1))
    |> Enum.take_while(&(&1 != "STOP"))
    |> check_validity()
  end

  defp check_validity(list) do
    cond do
      Enum.any?(list, &invalid?(&1)) ->
        {:error, @invalid_rna}
      true ->
        {:ok, list}
    end
  end
  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: { atom, String.t() }
  def of_codon(codon) do
    do_of_codon(@codon_protein_map[codon])
  end

  defp do_of_codon(nil), do: {:error, @invalid_codon}
  defp do_of_codon(value), do: {:ok, value}

  defp invalid?(nil), do: true
  defp invalid?(@invalid_codon), do: true
  defp invalid?(_), do: false
end

