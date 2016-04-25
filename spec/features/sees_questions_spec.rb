require 'rails_helper'

feature "sees questions" do
  scenario "see all the questions" do
    question = Question.create(title: "Ants", description: "How many legs do ants have?")
    another_question = Question.create(title: "Lobsters?", description: "How many legs do lobsters have?")

    visit questions_path
    expect(page).to have_content(question.title)
    expect(page).to have_content(another_question.title)
  end
end
