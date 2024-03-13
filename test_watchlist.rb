require 'minitest/autorun'
require_relative 'watchlist'  # Assuming Movie class is in a separate file

class WatchlistTest < Minitest::Test

  def setup
    @watchlist = Watchlist.new
  end

  # Test adding a valid movie (record functionality)
  def test_add_valid_movie
    title = "The Shawshank Redemption"
    year = 1994

    # Call record directly with prepared data
    @watchlist.record(title, year)

    # Assert movie is added and its details are correct
    assert_equal 1, @watchlist.instance_variable_get(:@movies).size
    assert_equal title, @watchlist.instance_variable_get(:@movies)[0].title
    assert_equal year, @watchlist.instance_variable_get(:@movies)[0].year
  end

  def test_remove_removes_movie_from_watchlist
    title = "Inception"
    year = 2010
    movie = Movie.new(title, year)
    @watchlist.instance_variable_get(:@movies) << movie

    # Call the remove method directly
    @watchlist.remove(title, year)

    # Check if the movie was removed from the watchlist
    assert_empty @watchlist.instance_variable_get(:@movies)
  end

end
