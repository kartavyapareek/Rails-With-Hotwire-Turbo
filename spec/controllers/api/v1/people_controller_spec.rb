# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::PeopleController do
  let(:valid_attributes) do
    { email: 'admin@example.com' }
  end

  let(:invalid_attributes) do
    { email: nil }
  end

  let(:valid_detail_attributes) do
    { title: 'Mr.', name: 'admin', age: 23, phone: '1234567890' }
  end

  let(:invalid_detail_attributes) do
    { name: nil }
  end

  describe 'GET #index' do
    it 'returns a success response' do
      Person.create! valid_attributes
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      person = Person.create! valid_attributes
      get :show, params: { id: person.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Person' do
        expect do
          post :create, params: { person: valid_attributes }
        end.to change(Person, :count).by(1)
      end

      it 'renders a JSON response with the new person' do
        post :create, params: { person: valid_attributes }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new person' do
        post :create, params: { person: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'POST #create_with_detail' do
    context 'with valid params' do
      it 'creates a new Person with Detail' do
        expect do
          post :create_with_detail, params: { person: valid_attributes, detail: valid_detail_attributes }
        end.to change(Person, :count).by(1)
      end

      it 'renders a JSON response with the new person' do
        post :create_with_detail, params: { person: valid_attributes, detail: valid_detail_attributes }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new person' do
        post :create_with_detail, params: { person: invalid_attributes, detail: invalid_detail_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'PUT #update' do
    let(:new_attributes) do
      { email: 'admin2@example.com' }
    end

    it 'updates the requested person' do
      person = Person.create! valid_attributes
      put :update, params: { id: person.to_param, person: new_attributes }
      person.reload
      expect(person.email).to eq('admin2@example.com')
    end

    it 'renders a JSON response with the person' do
      person = Person.create! valid_attributes
      put :update, params: { id: person.to_param, person: valid_attributes }
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the person' do
        person = Person.create! valid_attributes
        put :update, params: { id: person.to_param, person: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested person' do
      person = Person.create! valid_attributes
      expect do
        delete :destroy, params: { id: person.to_param }
      end.to change(Person, :count).by(-1)
    end
  end
end
