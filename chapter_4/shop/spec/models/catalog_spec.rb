require 'rails_helper'

RSpec.describe Catalog, type: :model do
  it { should belong_to(:parent_catalog) }
  it { should have_many(:subcatalogs) }
end
