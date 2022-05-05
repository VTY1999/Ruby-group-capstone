module GameDateTemplate
  def date_format(date)
    "#{date.year}-#{date.month}-#{date.day}"
  end

  def choose_year
    prints 'Year: '
    year = gets.chomp.to_i
    while year < 1900 || year > Time.new.year
      prints "Year must be between 1900 and #{Time.new.year}"
      prints 'Year: '
      year = gets.chomp.to_i
    end
    year
  end

  def choose_month
    prints 'Month: '
    month = gets.chomp.to_i
    while month < 1 || month > 12
      prints 'Month must be between 1 and 12'
      prints 'Month: '
      month = gets.chomp.to_i
    end
    month
  end

  def choose_day
    prints 'Day: '
    day = gets.chomp.to_i
    while day < 1 || day > 31
      prints 'Day must be between 1 and 31'
      prints 'Day: '
      day = gets.chomp.to_i
    end
    day
  end
end
