require 'spec_helper'


describe "Events" do
  
  #Creating 2 ids testacc123 and testacc1234
  before(:each) do
    DatabaseCleaner.clean
    visit root_path
    within(:css, ".navbar-inner") do
    click_link 'Sign Up'
    end
    fill_in 'Email', with: 'testacc123@gmail.com'
    fill_in 'Password', with: 'password123'
    within("#new_user") do
         click_button 'Sign up'
    end
    expect(page).to have_content('Welcome to EventScene!')
    click_link 'Logged in as testacc123@gmail.com. Logout?'
     visit root_path
      within(:css, ".navbar-inner") do
      click_link 'Sign Up'
      end
      fill_in 'Email', with: 'testacc1234@gmail.com'
      fill_in 'Password', with: 'password1234'
      within("#new_user") do
           click_button 'Sign up'
      end
      expect(page).to have_content('Welcome to EventScene!')
      click_link 'Logged in as testacc1234@gmail.com. Logout?'
  end

# end creating ids


  describe "Clicked Create Event: " do
    it 'Shows Sign in if not logged in' do
     visit root_path
     click_link 'Create Event'
     expect(page).to have_content('Sign in')
     end

     it 'Shows New Event if logged in' do
      
      sign_in
      visit root_path
      click_link 'Create Event'
      expect(page).to have_content('New event')
      end
  end
  
describe 'Entered details on home page itself' do
  it 'Should redirect me to new event with a message' do
    visit root_path
    fill_in 'Email', with: 'test1acc123@gmail.com'
    fill_in 'Password', with: 'p1assword123'
    click_button 'Sign up'
    expect(page).to have_content ('Welcome to EventScene, you can create an event now!')
    end  
end
  
  
describe 'I should not be able to see Edit/Destroy without authorization:' do
  
it 'must deny access if i visit edit ' do
FactoryGirl.create(:event, :user_id => 1)
visit ('/events')
click_link 'Edit', :match => :first
expect(page).to have_content ('Sign in')
end  

it 'must deny access if i visit destroy ' do
FactoryGirl.create(:event, :user_id => 1)
visit ('/events')
click_link 'Destroy', :match => :first
expect(page).to have_content ('Sign in')
end

it 'must deny access if its not me ' do
sign_in
FactoryGirl.create(:event, :user_id => 100)
visit ('/events')
click_link 'Edit', :match => :first
expect(page).to have_content ('Sorry, this is not your event!')
end

it 'must allow access if it IS me ' do
sign_in

FactoryGirl.create(:event, :user_id => User.find_by_email('testacc123@gmail.com').id)
visit ('/events/')
click_link 'Edit', :match => :first
expect(page).to have_content ('Editing event')
end

end
  
  #Common Methods
  def sign_in
    visit root_path
    click_link 'Log In'
    fill_in 'Email', with: 'testacc123@gmail.com'
    fill_in 'Password', with: 'password123'
    click_button 'Sign in'
  end
end