require 'rails_helpers'

RSpec.describe "Users API", type: :request do
  describe "post/user" do
    context "when data is valid" do
      it "creates a user and returns 201" do
        post "/user", params: {
          user: { name: "William", active: true }
        }

        expect(response).to have_http_status(:created)

        json = JSON.parse(response.body)
        expect(json[:name].to eq("William"))
      end
    end
  end
end
