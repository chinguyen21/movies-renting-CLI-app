Movie.destroy_all
User.destroy_all
Review.destroy_all
Receipt.destroy_all

movie1 = Movie.create(name: "Shark", rate_age: "G", quantity: 10)
movie2 = Movie.create(name: "Game of Throne", rate_age: "R", quantity: 15)
movie3 = Movie.create(name: "Hard Kill", rate_age: "PG-13", quantity: 8)
movie4 = Movie.create(name: "Run", rate_age: "G", quantity: 7)
movie5 = Movie.create(name: "Ava", rate_age: "PG-13", quantity: 12)
movie6 = Movie.create(name: "Lion King", rate_age: "G", quantity: 20)
movie7 = Movie.create(name: "The Old Guard", rate_age: "PG-13", quantity: 5)
movie8 = Movie.create(name: "Matrix", rate_age: "R", quantity: 3)
movie9 = Movie.create(name: "Big Game", rate_age: "R", quantity: 1)
movie10= Movie.create(name: "Kingsman", rate_age: "R", quantity: 6)

user1 = User.create(name: "Chi", email_address: "chi2101@gmail.com")
user2 = User.create(name: "Rahel", email_address: "rahel2020@gmail.com")
user3 = User.create(name: "Alex", email_address: "aalexs01@gmail.com")
user4= User.create(name: "Abel", email_address: "abelina0@gmail.com")
user5 = User.create(name: "Evan", email_address: "evang05@gmail.com")

review1 = Review.create(content: "I cannot stress enough how good this show is. I've watched a lot of TV in my life and this show still remains the best show I've ever seen.", rating: 5, user_id: user1.id, movie_id: movie2.id)
review2 = Review.create(content: "Re-Watched it 7 times and counting. I guess I liked it.", rating: 4, user_id: user2.id, movie_id: movie2.id)
review3 = Review.create(content: "I wanna delete my brain and watch it again like I never knew it.", rating: 4, user_id: user3.id, movie_id: movie5.id)
review4 = Review.create(content: "The best series I have seen in my whole life, even better than the wire.", rating: 2, user_id: user1.id, movie_id: movie3.id)
review5 = Review.create(content: "Waste of time", rating: 2, user_id: user4.id, movie_id: movie5.id)
review6 = Review.create(content: "This Circle is not quite golden, but it doesn't collapse", rating: 2, user_id: user3.id, movie_id: movie10.id)
review7 = Review.create(content: "The benchmark for all sci-fi films to come", rating: 5, user_id: user2.id, movie_id: movie9.id)
review8 = Review.create(content: "You only need 7 minutes to undestand the work and dedication that went in making this movie..", rating: 2.5, user_id: user2.id, movie_id: movie5.id)
review9 = Review.create(content: "Waste of time", rating: 2, user_id: user1.id, movie_id: movie5.id)
review10 = Review.create(content: "Good sequel but strange decisions.", rating: 4, user_id: user3.id, movie_id: movie10.id)
review11 = Review.create(content: "Great Beginning, WORST Ending!", rating: 4, user_id: user3.id, movie_id: movie2.id)


receipt1 = Receipt.create(user_id: user1.id, movie_id: movie2.id, checkout_date: '11-02-2020',return_date: '18-02-2020', status: "returned")
receipt2 = Receipt.create(user_id: user2.id, movie_id: movie3.id, checkout_date: '11-01-2020',return_date: '18-01-2020', status: "returned")
receipt3 = Receipt.create(user_id: user1.id, movie_id: movie9.id, checkout_date: '02-12-2020',return_date: '09-12-2020', status: "open rental")
receipt4 = Receipt.create(user_id: user5.id, movie_id: movie10.id, checkout_date: '02-10-2020',return_date: '09-10-2020', status: "returned")
receipt5 = Receipt.create(user_id: user3.id, movie_id: movie4.id, checkout_date: '02-12-2020',return_date: '09-12-2020', status: "open rental")
receipt6 = Receipt.create(user_id: user4.id, movie_id: movie10.id, checkout_date: '03-12-2020',return_date: '10-12-2020', status: "open rental")
receipt7 = Receipt.create(user_id: user2.id, movie_id: movie10.id, checkout_date: '11-04-2020',return_date: '18-04-2020', status: "returned")
receipt8 = Receipt.create(user_id: user1.id, movie_id: movie2.id, checkout_date: '29-11-2020',return_date: '06-12-2020', status: "open rental")
receipt9 = Receipt.create(user_id: user5.id, movie_id: movie3.id, checkout_date: '25-11-2020',return_date: '02-12-2020', status: "open rental")
receipt10 = Receipt.create(user_id: user3.id, movie_id: movie5.id, checkout_date: '11-07-2020',return_date: '18-07-2020', status: "returned")




