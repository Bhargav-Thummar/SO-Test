# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories_name = ["Fiction", "Classics", "Fantasy", "Horror"]

categories_name.each do |category|
  Category.create(title: category)
end

Book.create(title: "Celestial Bodies", auther: "Jokha Alharthi", category: Category.find_by_title("Fiction"), description: "Test1")
Book.create(title: "Cheque book	", auther: "Vasdev Mohi", category: Category.find_by_title("Classics"), description: "Test2")
Book.create(title: "Right Under Our Nose	", auther: "R. Giridharan", category: Category.find_by_title("Fiction"), description: "Test3")

