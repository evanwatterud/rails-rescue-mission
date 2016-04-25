require 'rails_helper'

feature "sees questions details" do
  scenario "see all the details of a question" do
    question = Question.create(title: "Ants", description: "How many legs do ants have?")
    another_question = Question.create(title: "Lobsters?", description: "How many legs do lobsters have?")

    visit questions_path

    click_link("Ants")
    expect(page).to have_content(question.title)
    expect(page).to have_content(question.description)
  end
end
