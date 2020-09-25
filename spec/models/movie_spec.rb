require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "Model validations" do
    it { is_expected.to validate_presence_of(:title)}
    it { is_expected.to validate_presence_of(:releaseYear)}
  end
end
