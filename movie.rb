class Movie
  attr_accessor :title, :year

  def initialize(title, year)
    @title = title
    @year = year
  end

  def to_str
    "#{title} (#{year})"
  end

end
