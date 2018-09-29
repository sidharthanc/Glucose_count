require 'rails_helper'
require 'spec_helper'

RSpec.describe PagesController, type: :controller do

  describe "POST #create_count" do
    it "create readings" do
    @user=User.find(3) 	
    sign_in @user
    @daily_reading = FactoryGirl.create(:daily_reading)	
    post :create_count, count: @daily_reading.reading.to_i
    expect(response).to redirect_to('/patient')
    end
  end

end
