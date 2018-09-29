require 'test_helper'
class PatientTest < ActionDispatch::IntegrationTest

  include Capybara::DSL
  puts "patient test" 

 test 'patientHome' do
   init_screenshot_folder(self,"patienthome","Login as patient and go to patient Home page")
   basic_auth('ajay@ontash.net', 'test_password')
   #visit patient_home_path
   puts "patient"
   #expect(page).to have_content("count remains a day")
   assert page.has_content? 'count remains a day'
   sleep(2)
   take_screenshot('On patient Home Page')
   click_link 'Monthly Rport'
   sleep(2)
   take_screenshot('On Monthly report Page')
   assert page.has_content? 'Monthly Report Here...'
   click_link 'Back to home'
   take_screenshot('Again Home page')
   
 end
end

