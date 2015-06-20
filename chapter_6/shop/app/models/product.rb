class Product < ActiveRecord::Base
  validates :name, presence: true
  scope :hot, -> { where(hot: true) }
  scope :top, -> { where(top: true) }
  has_many :variants

  before_validation do
    puts "before_validation"
  end

  after_validation do
    puts "after_validation"
  end

  before_save do
    puts "before_save"
  end

  around_save :test_around_save
  def test_around_save
    puts "begin around_save"
    yield
    puts "end around_save"
  end

  before_create do
    puts "before_create"
  end

  around_create :test_around_create
  def test_around_create
    puts "begin around_create"
    yield
    puts "end around_create"
  end

  after_create do
    puts "after_create"
  end

  after_save do
    puts "after_save"
  end

  after_commit do
    puts "after_commit"
  end

  after_rollback do
    puts "after_rollback"
  end

  after_touch :test_touch
  def test_touch
    puts 'Product was touched'
  end

end
