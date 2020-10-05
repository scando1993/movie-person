require 'rails_helper'

RSpec.describe Person, type: :model do
  it { is_expected.to validate_presence_of(:firstName)}
  it { is_expected.to validate_presence_of(:lastName)}
  it { is_expected.to validate_presence_of(:aliases)}
end
