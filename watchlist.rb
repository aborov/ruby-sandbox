require_relative "movie"

class Watchlist

  def initialize
    @movies = []
  end

  def run
    loop do
      puts "\nHey movie fan, welcome to the Watchlist!"
      puts "What you'd like to do today?"
      puts "1. Add a new film to watch sometime"
      puts "2. Pick a film to watch now"
      puts "3. Remove a film that you watched"
      puts "4. Exit"
      puts "Choose your option: "
      choice = gets.chomp.to_i
      puts "\n"
      case choice
      when 1
        title, year = get_movie_details_from_user
        record(title, year)
      when 2
        pick
      when 3
        title, year = get_movie_details_from_user
        remove(title, year)
      when 4
        puts "Thanks for using the Watchlist. Bye!"
        break
      else
        puts "Oh... You entered invalid option. Try again."
      end
    end
  end

  def get_movie_details_from_user
    print "Enter the movie title: "
    title = gets.chomp
    print "Enter the movie year (YYYY format): "
    year = gets.chomp.to_i
    return title, year
  end

  def record(title, year)
    if year.to_s.length != 4 || year > Time.now.year
      puts "Sorry, the year is invalid. It needs to be in YYYY format."
    else 
      @movies << Movie.new(title, year)
      puts "\nGreat, #{title} (#{year}) added to your watchlist!"
    end
  end

  def pick
    if @movies.empty?
      puts "Your watchlist is empty. Try adding some titles first."
    else
      puts "Here are some films you could watch:"
      @movies.each do |movie|
        puts movie.to_str
      end
      puts "Enjoy the film you choose!"
    end
  end
  
  def remove(title, year)
    if year.to_s.length != 4 || year > Time.now.year
      puts "Sorry, the year is invalid. It needs to be in YYYY format."
    else
      found_movie = @movies.find { |movie| movie.title == title && movie.year == year }
      if found_movie
        @movies.delete(found_movie)
        puts "\nOk, #{found_movie.to_str} removed from your watchlist."
      else
        puts "\nSorry, couldn't find #{title} in your watchlist."
      end
    end
  end
end
