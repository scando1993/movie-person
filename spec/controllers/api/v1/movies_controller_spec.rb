require 'rails_helper'

RSpec.describe Api::V1::MoviesController, type: :controller do
  let(:valid_attributes) do
    {
        title: 'American Pie',
        releaseYear: ''
    }
  end
end
