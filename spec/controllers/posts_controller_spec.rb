# frozen_string_literal: true

require 'rails_helper'

describe PostsController do
  let(:post) { create(:post) }

  describe 'GET #index' do
    let(:posts) { create_list(:post, 2) }

    before do
      get :index
    end

    it 'populates an array of all posts' do
      expect(assigns(:posts)).to match_array(posts)
    end
    it 'renders index view' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: post } }

    it 'assigns the requested post to @post' do
      expect(assigns(:post)).to eq post
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'assigns a new post to @post' do
      expect(assigns(:post)).to be_a_new(Post)
    end

    it 'renders a new post' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    before { get :edit, params: { id: post } }

    it 'assigns the requested post to @post' do
      expect(assigns(:post)).to eq post
    end

    it 'renders edit view' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new post in the database' do
        expect { post :create, params: { post: attributes_for(:post) } }.to change(Post, :count).by(1)
      end

      it 'redirects to show view' do
        post :create, params: { post: attributes_for(:post) }
        expect(response).to redirect_to(post_path(assigns[:post]))
      end
    end

    context 'with invalid attributes' do
      it 'post save to database aborted' do
        expect { post :create, params: { post: attributes_for(:invalid_post) } }.to_not change(Post, :count)
      end

      it 're-render new view' do
        post :create, params: { post: attributes_for(:invalid_post) }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do

    let(:my_post) { create(:post) }

    context 'with valid attributes' do
      it 'assigns the requested post to @post' do
        patch :update, params: { id: my_post, post: attributes_for(:post) }
        expect(assigns(:post)).to eq my_post
      end

      it 'change of post attributes' do
        patch :update, params: { id: my_post, post: { title: 'new title', content: 'new content' } }
        my_post.reload
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:my_post) { create(:post) }

    it 'deletes post' do
      my_post.destroy
    end

    it 'redirect to index view' do
      delete :destroy, params: { id: my_post }
      expect(response).to redirect_to 'http://test.host/posts'
    end
  end
end
