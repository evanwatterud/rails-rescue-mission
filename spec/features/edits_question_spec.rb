require 'rails_helper'

feature "edits question" do
  scenario "user successfully edits a question" do
    visit questions_path

    question = Question.create(title: "Ants legs", description: "How many legs do ants have?")
    visit question_path(question)

    click_link("Edit Question")

    fill_in "Title", :with => "Ants arms"
    click_button("Edit Question")

    expect(page).to have_content("Edit successful")
    expect(page).to have_content("How many legs do ants have?")
  end

  scenario "user unsuccessfully edits a question" do
    visit questions_path

    question = Question.create(title: "Ants legs", description: "How many legs do ants have?")
    visit question_path(question)

    click_link("Edit Question")

    fill_in "Title", :with => ""
    click_button("Edit Question")

    expect(page).to have_content("Title can't be blank")
    expect(page).to have_button("Edit Question")
  end
end
