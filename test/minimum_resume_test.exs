defmodule MinimumResumeTest do
  use ExUnit.Case
  #doctest MinimumResume

  test "入学・卒業年度出力" do
    assert MinimumResume.school("19780415") == "1997/03 〇〇高等学校 卒業\n1997/04 〇〇大学/専門学校/短期大学 入学\n1999/03 専門学校/短期大学 卒業\n2001/03 〇〇大学 卒業"
  end

  test "入学・卒業年度出力 境界値0401" do
    assert MinimumResume.school("19780401") == "1996/03 〇〇高等学校 卒業\n1996/04 〇〇大学/専門学校/短期大学 入学\n1998/03 専門学校/短期大学 卒業\n2000/03 〇〇大学 卒業"
  end

  test "入学・卒業年度出力 境界値0402" do
    assert MinimumResume.school("19780402") == "1997/03 〇〇高等学校 卒業\n1997/04 〇〇大学/専門学校/短期大学 入学\n1999/03 専門学校/短期大学 卒業\n2001/03 〇〇大学 卒業"
  end

end
