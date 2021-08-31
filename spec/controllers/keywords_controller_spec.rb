# frozen_string_literal: true

require 'rails_helper'

describe KeywordsController do
  let(:keyword) { create(:keyword) }

  describe 'GET #index' do
    let(:keywords) { create_list(:keyword, 2) }

    before do
      get :index
    end

    it 'populates an array of all keywords' do
      expect(assigns(:keywords)).to match_array(keywords)
    end
    it 'renders index view' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: keyword } }

    it 'assigns the requested keywords to @keyword' do
      expect(assigns(:keyword)).to eq keyword
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'assigns a new keyword to @keyword' do
      expect(assigns(:keyword)).to be_a_new(Keyword)
    end

    it 'renders a new keyword' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    before { get :edit, params: { id: keyword } }

    it 'assigns the requested post to @post' do
      expect(assigns(:keyword)).to eq keyword
    end

    it 'renders edit view' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new keyword in the database' do
        expect { post :create, params: { keyword: attributes_for(:keyword) } }.to change(Keyword, :count).by(1)
      end

      it 'redirects to show view' do
        post :create, params: { keyword: attributes_for(:keyword) }
        expect(response).to redirect_to(keyword_path(assigns[:keyword]))
      end
    end
    # TODO: create tests for invalid keyword creation
  end

  describe 'DELETE #destroy' do
    let!(:my_keyword) { create(:keyword) }

    it 'deletes keyword' do
      my_keyword.destroy
    end

    it 'redirect to index view' do
      delete :destroy, params: { id: my_keyword }
      expect(response).to redirect_to 'http://test.host/keywords'
    end
  end
end
