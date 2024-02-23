# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::DetailsController do
  let(:person) { Person.create! email: 'admin@example.com' }
  let(:valid_attributes) do
    { title: 'Mr.', name: 'admin', age: 23, phone: '1234567890', person_id: person.id }
  end

  let(:invalid_attributes) do
    { name: nil }
  end

  describe 'GET #index' do
    it 'returns a success response' do
      Detail.create! valid_attributes
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      detail = Detail.create! valid_attributes
      get :show, params: { id: detail.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Detail' do
        expect do
          post :create, params: { detail: valid_attributes }
        end.to change(Detail, :count).by(1)
      end

      it 'renders a JSON response with the new detail' do
        post :create, params: { detail: valid_attributes }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new detail' do
        post :create, params: { detail: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'PUT #update' do
    let(:new_attributes) do
      { title: 'Mr.', name: 'admin', age: 23, phone: '1234567890' }
    end

    it 'updates the requested detail' do
      detail = Detail.create! valid_attributes
      put :update, params: { id: detail.to_param, detail: new_attributes }
      detail.reload
      expect(detail.name).to eq('admin')
    end

    it 'renders a JSON response with the detail' do
      detail = Detail.create! valid_attributes
      put :update, params: { id: detail.to_param, detail: valid_attributes }
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested detail' do
      detail = Detail.create! valid_attributes
      expect do
        delete :destroy, params: { id: detail.to_param }
      end.to change(Detail, :count).by(-1)
    end
  end
end
