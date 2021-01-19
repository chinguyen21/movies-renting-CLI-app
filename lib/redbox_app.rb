require "date"
require 'active_support/all'
require 'colorize'
require 'colorized_string'


class RedBoxApp 
  def run
    welcome
  end

  private

  def prompt
    TTY::Prompt.new
  end

  def welcome
    puts "
 

██╗    ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗    ████████╗ ██████╗ 
██║    ██║██╔════╝██║     ██╔════╝██╔═══██╗████╗ ████║██╔════╝    ╚══██╔══╝██╔═══██╗
██║ █╗ ██║█████╗  ██║     ██║     ██║   ██║██╔████╔██║█████╗         ██║   ██║   ██║
██║███╗██║██╔══╝  ██║     ██║     ██║   ██║██║╚██╔╝██║██╔══╝         ██║   ██║   ██║
╚███╔███╔╝███████╗███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗       ██║   ╚██████╔╝
 ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝       ╚═╝    ╚═════╝ 
                                                                                    "

  sleep(1)
  puts "
            ██████╗ ███████╗██████╗ ██████╗  ██████╗ ██╗  ██╗
            ██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔═══██╗╚██╗██╔╝
            ██████╔╝█████╗  ██║  ██║██████╔╝██║   ██║ ╚███╔╝ 
            ██╔══██╗██╔══╝  ██║  ██║██╔══██╗██║   ██║ ██╔██╗ 
            ██║  ██║███████╗██████╔╝██████╔╝╚██████╔╝██╔╝ ██╗
            ╚═╝  ╚═╝╚══════╝╚═════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝
                                                             
      
       "
  sleep(5) 
  puts "=" * 50
  main_page
  end 

  def main_page
    system("clear")
    puts ""
    puts ""
    @select = prompt.select("Main Page".bold.underline.red, ["Sign up", "Login", "About us", "Exit"])
    if @select == "Sign up"
      sign_up_or_login
    elsif @select == "Login"
      sign_up_or_login
    elsif @select == "About us"
      about
    else 
      exit
    end
  end

  def about
    puts "      Redbox On Demand is another way to watch! Stream new movies fresh from the theater plus thousands
    more without a subscription – just pay as you go. Rentals start as low as $1.99, and purchases are yours
    to keep in your Library. You can even download your rentals & purchases to watch anywhere, anytime – even
    offline. To watch on DVD or Blu-ray™, head to any of our 41,000 Box locations nationwide. (You can also find
    4K UHD at select locations!)".colorize(:blue)
    choice = prompt.select("===========", ["Back to Main page"])
    main_page
  end

  def sign_up
    puts "      Please enter your name".colorize(:blue)
    user_name = gets.chomp.downcase
  end 
  
  def login
    puts "      Please enter your email address:".colorize(:blue)   
            @email = gets.chomp.downcase
    @user_email = User.find_by(email_address: @email)
  end  

  def sign_up_or_login
    system("clear")
     if @select == "Login" 
        if login.nil? 
          puts "Wrong email address, try again!\n".colorize(:red)
          select = prompt.select("======",["Enter email address again","Back"])
          select == "Back" ? main_page : sign_up_or_login
        elsif @select == "Login" 
          @user = User.find_by(email_address: @email)
          puts "Welcome back, #{@user.name}!".colorize(:green).italic
          puts ""
          sleep(2)
          account_page   
        end
                         
     elsif 
       if login.nil? 
          @user = User.create(name: sign_up, email_address: @email)
          puts "\nCongratulation! you have successfully created your account".colorize(:green).italic
          puts ""
          sleep(2)
          account_page  
       else 
          puts "\nThe email address is already used, enter a different email address.\n".colorize(:red)
          sleep(2)
          select = prompt.select("======",["Continue sign up?:","Back"])
          select == "Back" ? main_page : sign_up_or_login    
       end
        
     end
         
  end

  def account_page
    system("clear")
    puts ""
    puts ""
    select = prompt.select("Account Page".bold.underline.red, ["Account information", "Edit account", "Delete account", "Movies Page", "Sign out"])
    if select == "Account information"
      account_info
    elsif select == "Edit account"
      edit_account
    elsif select == "Delete account"
      delete_account
    elsif select == "Movies Page"
      movies_search_page
    elsif select == "Sign out"
      sign_out
    end
  end

  def review_history
    @user.reviews.reload
    @user.reviews.each do |review|
      puts "    Movie: #{Movie.find_by_id(review.movie_id).name}".bold.colorize(:yellow)
      puts "Your review: #{review.content}"
      puts "Your rating: #{review.rating}".colorize(:blue)
    end
    back_to_movies_search_page
  end

  def delete_account
    ask = prompt.yes?("Confirm if you want to delete your account???".blink)
    if ask == true
      @user.destroy
      main_page
    else 
      account_page
    end
  end

  def account_info
    puts ""
    puts "    Account name: #{@user.name}".colorize(:yellow)
    puts ""
    puts "    Email address: #{@user.email_address}".colorize(:yellow)
    puts ""
    back_to_account_page
  end

  def back_to_account_page
    choice = prompt.select("===========", ["Back to Account page", "Sign out"])
    choice == "Back to Account page" ? account_page : sign_out
  end

  def edit_account
    select = prompt.select("Edit".bold.underline.red, ["Name", "Email address"])
    if select == "Name"
      puts "   Your old name is #{@user.name}. Enter new name:".colorize(:blue)
      new_name = gets.chomp
      @user.update(name: new_name) 
      puts "Successful change your name!".colorize(:yellow).italic
    else select == "Email address"
      puts "Enter new email address:"
      new_email = gets.chomp
      @user.update(email_address: new_email)
      puts "Successful change your email address!".colorize(:yellow).italic
    end 
    back_to_account_page
  end

  def movies_search_page
    system("clear")
    puts ""
    puts ""
    sleep(1)
    puts "=" * 50
    list = %w(All_movies Movies_by_name Movies_by_rate_age Movies_by_rating Checked_out_history Return Review_History Back Sign_out)
    answer = prompt.select("SEARCH:", list, symbols: { marker: ">>" })
    puts "=" * 50
    if answer == "All_movies"
      show_all_movies
    elsif answer == "Movies_by_name"
      movies_by_name
    elsif answer == "Movies_by_rate_age"
      movies_by_rate_age
    elsif answer == "Movies_by_rating"
      movies_by_rating
    elsif answer == "Checked_out_history"
      checked_out_history 
    elsif answer == "Return"
      return_movie
    elsif answer == "Review_History"
      review_history
    elsif answer == "Back"
      account_page
    elsif answer == "Sign_out"
      sign_out
    end
  end

  def checked_out_history
    @user.receipts.reload
    if @user.receipts.empty?
      puts "No history".italic
      puts ""
    else
      @user.receipts.each do |receipt|
          movie = Movie.find_by(id: receipt.movie_id)
          puts "#{movie.name} =>  Return Date: #{receipt.return_date}  => Status: #{receipt.status}".colorize(:yellow)
          puts ""
      end
    end
    back_to_movies_search_page
  end

  def show_all_movies
      movies = Movie.all.map {|t| t.name}
      prompt_list_movies(movies) 
  end 

  def throw_error
    puts "  Sorry. We don't have that movie :("
    choice = prompt.select("", ["Enter movie name again:", "Back"])
    choice == "Enter movie name again:" ? movies_by_name : movies_search_page
  end

  def movies_by_name
    movie_typing = prompt.ask("Enter movie name:").downcase
    if !Movie.all.map {|movie| movie.name.downcase}.include?(movie_typing.downcase)
      throw_error
    else
      movies = Movie.where('lower(name) = ?', movie_typing).first.name
      prompt_list_movies(movies) 
    end  
  end

  def movies_by_rate_age
    list = ["G","R","PG-13"] 
    answer = prompt.select("RATING AGE:", list)
    puts "=" * 50
    movies = Movie.where(rate_age: answer).map {|t| t.name}
    prompt_list_movies(movies)
  end 

  def movies_by_rating
    answer = prompt.select("Select Rating Range:", ["1-2","2-3","3-4","4-5","5"], symbols: { marker: ">>" })
    puts "=" * 50
    movies = []
    Movie.all.each do |movie|
      if movie.rating >= answer[0].to_i && movie.rating < answer[-1].to_i
        movies << movie.name
      elsif movie.rating == answer[0].to_i
        movies << movie.name
      end
    end
    if movies.empty?
      puts "There is no movie that has rating between #{answer[0]} and #{answer[-1]}"
      back_to_movies_search_page
    else
      prompt_list_movies(movies)
    end
  end

  def return_movie
    @user.receipts.reload
    return_movie_list = []
    if @user.receipts.all? {|receipt| receipt.status == "returned"}
      puts "You don't have any movie rental now.".colorize(:yellow)
      puts ""
    else
      @user.receipts.map do |receipt|
        if receipt.status == "open rental"
          movie = Movie.find_by_id(receipt.movie_id)
          return_movie_list << "#{movie.name} => Return Date: #{receipt.return_date} Receipt number: => #{receipt.id}"
        end
      end 
    end

    select_movie = prompt.select("Choose", return_movie_list << "Back")
    if select_movie == "Back"
      movies_search_page
    else
      Movie.all.each do |movie|
        select_movie_a = select_movie.split(" => ")
        if movie.name == select_movie_a[0]
          update_quantity = movie.quantity + 1
          movie.update(quantity: update_quantity)
          Receipt.update(select_movie_a[-1], status: "returned")
          puts "Thank you for the return!".colorize(:yellow).italic
          sleep(1)
          leave_review(movie.id)
        end
      end
    end 
  end


  def leave_review(movie_id)
    ask = prompt.yes?("Do you want to write a review for this movie?".colorize(:blue))
    if ask == true
      content = prompt.ask("Write a review:")
      rating = prompt.ask("Rating(out of 5.0):")
      new_review = Review.create(movie_id: movie_id, user_id: @user.id, rating: rating, content: content)
      puts "Thank your for your review!".colorize(:yellow)
      sleep(3)
    end
    back_to_movies_search_page
  end


  def check_out(movie_id, user_id)
    ask = prompt.yes?("Do you want to rent this movie?".colorize(:yellow))
    if ask == true
      new_receipt = Receipt.create(movie_id: movie_id, user_id: user_id, checkout_date: Time.now, return_date: Time.now + 7.days.to_i, status: "open rental") 
      update_quantity = Movie.find_by_id(movie_id).quantity - 1
      Movie.update(movie_id, quantity: update_quantity) 
      puts "\nSuccessful check out #{Movie.find_by(id: movie_id).name}. Your rent is due on #{new_receipt.return_date}.".colorize(:yellow).italic
      puts "=" * 50
      puts "Do you want to rent other movies or sign out?".colorize(:blue)
      back_to_movies_search_page
    else
      movies_search_page
    end
  end

  def back_to_movies_search_page
    choice = prompt.select("", ["Back to movies search page", "Sign out"])
    choice == "Back to movies search page" ? movies_search_page : sign_out
  end

  def prompt_list_movies(movies)
    select_movie = prompt.select("Movie:", movies, symbols: { marker: ">>" })
    Movie.all.each do |movie|
        if movie.name == select_movie
          puts "Information | Rating_age: #{movie.rate_age} | Rating: #{movie.rating} | Available: #{movie.available?}".colorize(:blue)
          if movie.available? == "yes"
            check_out(movie.id, @user.id)
          else
            puts "Sorry, #{movie.name} is not available.".colorize(:red)
            back_to_movies_search_page
          end
        end
    end
  end

  def sign_out
    sleep(1)
    puts "Successful signed out!".colorize(:yellow).italic
    sleep(1)
    main_page
  end

  def exit
    puts "" 
    puts "Thank you for coming to RedBox. See you next time!".colorize(:yellow).italic.blink
    puts ""
    sleep(2)
  end

end 

