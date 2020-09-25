class Fixnum
  # Taken from https://codereview.stackexchange.com/questions/7937/roman-numeral-converter
  # The solution within a separate class is 'cleaner' which is easier for testing
  ROMAN_NUMS = {
      "M" => 1000,
      "CM" => 900, "D" => 500, "CD" => 400, "C" => 100,
      "XC" => 90,  "L" => 50,  "XL" => 40,  "X" => 10,
      "IX" => 9,   "V" => 5,   "IV" => 4,   "I" => 1
  }

  def roman
    num = self
    ROMAN_NUMS.map do |ltr, val|
      amt, num = num.divmod(val)
      ltr * amt
    end.join
  end

end