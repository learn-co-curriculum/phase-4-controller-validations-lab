require 'rails_helper'

RSpec.describe "Posts", type: :request do
  let!(:post) do
    Post.create!(
      title: 'The Dangers of Stairs',
      content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed dapibus, nulla vel condimentum ornare, arcu lorem hendrerit purus, ac sagittis ipsum nisl nec erat. Morbi porta sollicitudin leo, eu cursus libero posuere ac. Sed ac ultricies ante. Donec nec nulla ipsum. Nunc eleifend, ligula ut volutpat.',
      category: 'Non-Fiction'
    )
  end

  describe 'PATCH /posts/:id' do
    context 'with valid post params' do
      let!(:post_params) { { title: 'Fifteen Ways to Transcend Corporeal Form', category: 'Fiction' } }
      
      it 'updates a post' do
        patch "/posts/#{post.id}", params: post_params

        expect(post.reload.title).to eq('Fifteen Ways to Transcend Corporeal Form')
      end
  
      it 'returns the post data' do
        patch "/posts/#{post.id}", params: post_params
  
        expect(response.body).to include_json({
          id: a_kind_of(Integer),
          title: 'Fifteen Ways to Transcend Corporeal Form', 
          content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed dapibus, nulla vel condimentum ornare, arcu lorem hendrerit purus, ac sagittis ipsum nisl nec erat. Morbi porta sollicitudin leo, eu cursus libero posuere ac. Sed ac ultricies ante. Donec nec nulla ipsum. Nunc eleifend, ligula ut volutpat.',
          category: 'Fiction'
        })
      end
  
      it 'returns a status code of 200 (ok)' do
        patch "/posts/#{post.id}", params: post_params
  
        expect(response).to have_http_status(:ok)
      end
    end

    context "with invalid author params" do
      let!(:post_params) { { content: 'too short', category: 'Speculative Fiction' } }
  
      it 'does not update the post' do
        patch "/posts/#{post.id}", params: post_params

        expect(post.reload.category).to eq('Non-Fiction')
      end
  
      it 'returns the error messages' do
        patch "/posts/#{post.id}", params: post_params
  
        expect(response.body).to include_json({
          errors: a_kind_of(Hash)
        })
      end
  
      it 'returns a status code of 422 (Unprocessable Entity)' do
        patch "/posts/#{post.id}", params: post_params
  
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
