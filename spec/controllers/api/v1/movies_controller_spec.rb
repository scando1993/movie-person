require 'rails_helper'

RSpec.describe Api::V1::MoviesController, type: :controller do
  let(:valid_attributes) do
    {
        title: 'American Pie',
        releaseYear: '1987'
    }
  end
end
