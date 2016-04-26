require 'rails_helper'

feature "posts question" do
  scenario "user posts a valid question" do
    visit questions_path

    click_link("Post Question")

    fill_in "Title", :with => "Butts"
    fill_in "Description", :with => "what are butts, really?"
    click_button("Create Question")

    expect(page).to have_content("Question created successfully.")
    expect(page).to have_content("Butts")
  end

  scenario "user posts an invalid question" do
    visit questions_path

    click_link("Post Question")

    fill_in "Description", :with => "what are butts, honestly?"
    click_button("Create Question")

    expect(page).to have_content("Title can't be blank")
    expect(page).to_not have_content("Butts")
  end
end
