require 'rails_helper'

RSpec.describe Inventory, type: :model do
  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:description) }
end
