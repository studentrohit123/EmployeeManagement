require 'rails_helper'

RSpec.describe DepartmentsController, type: :controller do

  # let(:department) { create(:department) } 

  # describe "GET #index" do
  #   it "returns http success" do
  #     get :index
  #     expect(assign(:department)).to eq(Department.all)
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #new" do
  #   it "get new  Department" do
  #     get :new
  #     expect(response).to have_http_status(:success)
  #     expect(assigns(:department)).to be_a_new(Department)
  #   end
  # end

  describe "POST #create" do
    it "create new @department" do
      post :create, params: { department: { name: 'HR' } }
      expect(response).to redirect_to(buses_path(assigns(:bus)))
    end
  end
end
