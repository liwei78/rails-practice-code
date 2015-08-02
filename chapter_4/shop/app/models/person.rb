class Person
  extend ActiveModel::Callbacks
  define_model_callbacks :create

  def create
    run_callbacks :create do
      puts "I am in create method."
    end
  end

  before_create :action_before_create
  def action_before_create
    puts "I am in before action of create."
  end

  after_create :action_after_create
  def action_after_create
    puts "I am in after action of create."
  end

  around_create :action_around_create
  def action_around_create
    puts "I am in around action of create."
    yield
    puts "I am in around action of create."
  end

end
