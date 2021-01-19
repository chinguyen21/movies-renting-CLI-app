class User < ActiveRecord::Base
  has_many :receipts
  has_many :movies, through: :receipts
  has_many :reviews


end