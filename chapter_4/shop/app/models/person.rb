class Person
  extend ActiveModel::Callbacks
  define_model_callbacks :create

  before_create :hi

  def create
    puts "I create"
    run_callbacks :create do
      puts "fuxk"
    end
  end

  def hi
    puts "hi"
  end
end
