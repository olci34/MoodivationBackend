5.times do
    Category.create(name: Faker::Book.genre)
end

8.times do
    Author.create(name: Faker::Book.author)
end

Author.all.map do |author|
    title = Faker::GreekPhilosophers.quote
    2.times do
        word  = author.words.create(title: {en: title, tr: "TR#{title}"})
        word.categories = Category.all.sample(2)
    end
end
