Category.create(title: 'Little Cacti')
category = Category.all.first
category.items.create(title: 'Pink Cactus', description: "It has a little flower on top", price: 10.95, image: File.open('app/assets/images/2.jpg', 'r'))
category.items.create(title: 'Pretty Cactus', description: 'It comes in a geometric glass pot.', price: 20.95, image: File.open('app/assets/images/1.jpg', 'r'))
category.items.create(title: 'Basic Cactus', description: 'It comes in a ceramic pot.', price: 6.95, image: File.open('app/assets/images/3.jpg', 'r'))