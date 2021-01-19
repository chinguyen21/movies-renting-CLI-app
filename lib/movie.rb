class Movie < ActiveRecord::Base

  has_many :receipts
  has_many :users, through: :receipts
  has_many :reviews

  def rating
    if self.reviews.length != 0
      self.reviews.sum {|review| review.rating} / self.reviews.length.to_f
    else 
      0
    end
  end

  def available?
    return "yes" if self.quantity >= 1
    "no"
  end


end