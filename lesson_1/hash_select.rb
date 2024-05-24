def select_fruit(food)
  produce = food.keys
  counter = 0
  fruits = {}

  loop do
    current_produce = produce[counter]
    current_category = food[current_produce]
    if current_category == 'Fruit'
     fruits[current_produce] =  current_category
    end 
    counter += 1
    break if counter == produce.size
  end

  fruits
end
produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
