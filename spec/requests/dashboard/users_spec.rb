# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Dashboard::Users', type: :request do
  describe 'GET /edit' do
    it 'returns http success' do
      get '/dashboard/users/edit'
      expect(response).to have_http_status(:success)
    end
  end
end
