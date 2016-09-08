class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :most_recent_book, :current_user

  def most_recent_book
    if current_user.books.exists?(session[:most_recent_book])
      current_user.books.find(session[:most_recent_book_id])
    elsif current_user.books.last
      current_user.books.last
    else
      Book.new(title: "YOU HAVEN'T MADE A BOOK YET")
    end
  end

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end
  # we could put methods we want across all controllers
end
