require 'rails_helper'

feature "deletes question" do
  scenario "user deletes a question from edit page" do
    visit questions_path

    question = Question.create(title: "Ants legs", description: "How many legs do ants have?")
    visit question_path(question)

    click_link("Edit Question")

    click_link("Delete Question")

    expect(page).to have_content("Question successfully deleted")

    expect(page).to_not have_content("Ants Legs")
  end

  scenario "user deletes a question from details page" do
    visit questions_path

    question = Question.create(title: "Ants legs", description: "How many legs do ants have?")
    Answer.create(question: question, description: "pretty sure ants have like 6 legs")
    visit question_path(question)

    click_link("Delete Question")

    expect(page).to have_content("Question successfully deleted")

    expect(page).to_not have_content("Ants Legs")
    expect(question.answers).to eq([])
  end
end
