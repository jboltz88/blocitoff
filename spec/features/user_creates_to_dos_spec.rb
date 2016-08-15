require 'rails_helper'

RSpec.feature "User Creates To Dos", type: :feature, js: true do


  scenario "successfully" do
    # Setup
    # user = User.create(email: 'foo@...')
    user = create(:user)

    # Exercise
    visit '/users/sign_in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_text 'Signed in successfully.'
    #binding.pry
    click_link 'New Item'
    expect(page).to have_css 'h1', text: 'New To-Do Item'
    fill_in 'Name', with: 'Get milk'
    click_button 'Save'

    expect(page).to have_text 'Item was saved successfully'
    expect(page).to have_text 'Get milk'
    # Assertions
  end
end
