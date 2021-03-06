require 'rails_helper'

feature 'reviewing' do
  before {Restaurant.create name: 'KFC'}

  scenario 'allows users to leave a review using a form' do
    sign_up
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in "Thoughts", with: "too fry"
    select '3', from: 'Rating'
    click_button 'Leave Review'
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content("too fry")
  end

  scenario 'allows user to leave only one review for each restaurant' do
    sign_up
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in "Thoughts", with:"too fry"
    select '2', from: 'Rating'
    click_button 'Leave Review'
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in "Thoughts", with:"too fry"
    select '2', from: 'Rating'
    click_button 'Leave Review'
    expect(page).to have_content('You can leave only one review per restaurant')
  end

  scenario 'allows user to leave only one review for each restaurant' do
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in "Thoughts", with:"too fry"
    select '2', from: 'Rating'
    click_button 'Leave Review'
    expect(page).to have_content('You have to log in firts')
  end

  scenario 'user can delete only his/hers review' do
    sign_up
    leave_review('good', 4)
    click_link 'Delete KFC review'
    expect(page).to have_content 'Review deleted successfully'
  end

  scenario 'displays an average rating for all reviews' do
    sign_up
    leave_review('So so', '4')
    expect(page).to have_content('Average rating: ★★★★☆')
  end
end
