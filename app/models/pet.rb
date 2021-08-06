class Pet < ApplicationRecord

  has_many :pet_history

  def history_count
    total_visits = 0
    self.pet_history.each do |pet_history|
      total_visits += 1
    end
    total_visits
  end

  def avg_weight
    counter = 0
    weight = 0
    self.pet_history.each do |pet_history|
      counter += 1
      weight += (pet_history.weight)
    end 
    (weight / counter).truncate(1)
  end

  def avg_height
    counter = 0
    height = 0
    self.pet_history.each do |pet_history|
      counter += 1
      height += (pet_history.heigth.to_f)
    end 
    (height / counter).truncate(1)
  end

  def max_weight
    top = 0
    self.pet_history.each do |pet_history|
      if pet_history.weight > top
        top = (pet_history.weight)
      end
    end 
    (top).truncate(1)
  end

  def max_height
    top = 0
    self.pet_history.each do |pet_history|
      if (pet_history.heigth.to_f) > top
        top = (pet_history.heigth.to_f)
      end
    end 
    (top).truncate(1)
  end

end
