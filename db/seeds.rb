 require 'random_data'

 # Create Posts
 50.times do
 # #1
   Post.create!(
 # #2
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all

puts "#{Post.count}"
 Post.find_or_create_by!(title: "my unique title", body: "this is unique body")
 puts "#{Post.count}"
 # Create Comments
 # #3
 100.times do
   Comment.create!(
 # #4
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end
puts "#{Comment.count}"
 Comment.find_or_create_by!(post: , body: "this is unique body")
 puts "#{Comment.count}"

 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
