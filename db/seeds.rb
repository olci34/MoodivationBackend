5.times do
    Category.create(name: Faker::Book.genre)
end

8.times do
    Author.create(name: Faker::Book.author)
end

Author.all.map do |author|
    2.times do
        title = Faker::GreekPhilosophers.quote
        word  = author.words.create(title: {en: title, tr: "TR#{title}"}, size: (12...42).to_a.sample)
        word.categories = Category.all.sample(2)
    end
end
