require 'rails_helper'

feature "posts answer" do
  scenario "user posts a valid answer" do
    visit questions_path

    question = Question.create(title: "Ants legs", description: "How many legs do ants have?")
    visit question_path(question)

    fill_in "Answer", :with => "Pretty sure they have 6 legs"
    click_button("Answer Question")

    expect(page).to have_content("Answers:")
    expect(page).to have_content("Pretty sure they have 6 legs")
  end

  scenario "user posts a blank answer" do
    visit questions_path

    question = Question.create(title: "Ants legs", description: "How many legs do ants have?")
    visit question_path(question)

    click_button("Answer Question")

    expect(page).to have_content("Answers:")
    expect(page).to have_content("Answer can't be blank")
  end

  scenario "user posts a short answer" do
    visit questions_path

    question = Question.create(title: "Ants legs", description: "How many legs do ants have?")
    visit question_path(question)

    fill_in "Answer", :with => "6"
    click_button("Answer Question")

    expect(page).to have_content("Answers:")
    expect(page).to have_content("Answer is too short, must be at least 20 characters")
  end
end
