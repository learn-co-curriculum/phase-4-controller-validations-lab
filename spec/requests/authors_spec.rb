require 'rails_helper'

RSpec.describe "Authors", type: :request do
  before do
    Author.create!(name: 'H. Jeff', email: 'jeff@sbahj.info')
  end
  
  describe "POST /authors" do
    context "with valid author params" do
      let!(:author_params) { { name: 'S. Bro', email: 'bro@sbahj.info' } }
  
      it 'creates a new author' do
        expect { post '/authors', params: author_params }.to change(author, :count).by(1)
      end
  
      it 'returns the author data' do
        post '/authors', params: author_params
  
        expect(response.body).to include_json({
          id: a_kind_of(Integer),
          name: 'S. Bro', 
          email: 'bro@sbahj.info'
        })
      end
  
      it 'returns a status code of 201 (created)' do
        post '/authors', params: author_params
  
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid author params" do
      let!(:author_params) { { email: 'jeff@sbahj.info' } }
  
      it 'does not creates a new author' do
        expect { post '/authors', params: author_params }.to change(author, :count).by(0)
      end
  
      it 'returns the error messages' do
        post '/authors', params: author_params
  
        expect(response.body).to include_json({
          errors: {
            name: "can't be blank",
            email: "has already been taken"
          }
        })
      end
  
      it 'returns a status code of 422 (Unprocessable Entity)' do
        post '/authors', params: author_params
  
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
