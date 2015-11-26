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

  def leave_review(thoughts, rating)
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in 'Thoughts', with: thoughts
    select rating, from: 'Rating'
    click_button 'Leave Review'
  end

  scenario 'displays an average rating for all reviews' do
    leave_review('So so', '3')
    leave_review('Great', '5')
    expect(page).to have_content('Average rating: 4')
  end
end
