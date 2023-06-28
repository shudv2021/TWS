class AddForiegnKeyOnQuestionToSubject < ActiveRecord::Migration[6.1]
  def change
    add_reference :questions, :subject, foreign_key: true
  end
end
