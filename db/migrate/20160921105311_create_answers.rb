class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answer do |t|
      t.text  :body, null: false
      t.references  :user
      t.references :question

      t.timestamps(null: false)
    end
  end
end
