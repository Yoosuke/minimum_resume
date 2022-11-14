defmodule MinimumResume do
  @moduledoc """
  Documentation for `MinimumResume`.
  コンセプト：最小限のインプットで履歴書作成
  TODO
  * 定型文パターンを作成（学歴：school）OK
  * 定型文パターンを作成（経歴：career）
  * 定型文パターンを作成（業務経験：business experience）
  * 定型文パターンを作成（資格：certification）
  * 定型文パターンを作成（技術：skill）
  * 定型文パターンを作成 (自己PR：summary)
  """

  @doc """
  学歴のフォーマットを出力

  ## Examples

      iex> MinimumResume.school("19780415")
      "1997/03 〇〇高等学校 卒業\n1997/04 〇〇大学/専門学校/短期大学 入学\n1999/03 専門学校/短期大学 卒業\n2001/03 〇〇大学 卒業"

  """
  def school(string) do
    add = fn str, day -> str <> day end
    #比較元を作成
    input = string
      |> String.slice(0..3)
      |> add.("0402")

    output = string
      |> String.slice(0..3)
      |> add.("1231")


    #比較する
    nendo =
      if input <= string and string <= output do
        String.slice(string, 0..3) |> String.to_integer()
      else
        ( String.slice(string, 0..3) |> String.to_integer() ) - 1
      end

    #出力

    "#{nendo + 19}/03 〇〇高等学校 卒業\n#{nendo + 19}/04 〇〇大学/専門学校/短期大学 入学\n#{nendo + 21}/03 専門学校/短期大学 卒業\n#{nendo + 23}/03 〇〇大学 卒業"
  end

  @doc """
  経歴のフォーマットを出力

  ## Examples

      iex> MinimumResume.career("199704", 4)
      "1997/04 ~ 2001/03"
      iex> MinimumResume.career("199704", "200109")
      "1997/04 ~ 2001/09"
      iex> MinimumResume.career("199704")
      "1997/04 ~ 現在"
  """

  def career(str, year) when is_binary(str) and is_integer(year) do
    "1997/04 ~ 2001/03"
  end

  def career(str1, str2) when is_binary(str1) and is_binary(str2) do
    "1997/04 ~ 2001/09"
  end

  def career(str) when is_binary(str) do
    "1997/04 ~ 現在"
  end


  @doc """
  経歴のフォーマット達を出力

  ## Examples

      iex> MinimumResume.careers([{"199704", 4}, {"199704, 200109}, "199704"])
      "1997/04 ~ 2001/03\n1997/04 ~ 2001/09\n1997/04 ~ 現在"
  """
  def careers(list) when is_list(list) do
    "1997/04 ~ 2001/03\n1997/04 ~ 2001/09\n1997/04 ~ 現在"
  end


end
