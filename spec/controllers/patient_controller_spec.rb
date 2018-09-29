require 'rails_helper'
require 'spec_helper'

RSpec.describe PatientController, type: :controller do

  describe "GET #monthto_date" do
    it "get month to date" do
    @user=User.find(3) 	
    sign_in @user
    @daily_reading = FactoryGirl.create(:daily_reading)	
    get :monthto_date, date_val: @daily_reading.date_done.to_s
    sign_out @user
    end
  end

  describe "GET #monthly report" do
    it "get monthly report" do
    @user=User.find(3) 	
    sign_in @user
    get :monthly_report
    sign_out @user
    end
  end

end
