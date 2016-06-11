class CreateBrTests < ActiveRecord::Migration
  def change
    create_table :br_tests do |t|
      t.string :name
      t.string :gender
      t.string :age
      t.string :hometown
      t.string :occupation
      t.string :education
      t.string :email
      t.string :bilingual
      t.string :foreign

      t.string :answer_1
      t.string :answer_2
      t.string :answer_3
      t.string :answer_4
      t.string :answer_5
      t.string :answer_6
      t.string :answer_7
      t.string :answer_8
      t.string :answer_9
      t.string :answer_10
      t.string :answer_11
      t.string :answer_12
      t.string :answer_13
      t.string :answer_14
      t.string :answer_15
      t.string :answer_16
      t.string :answer_17
      t.string :answer_18

      t.integer :wrong_answers

      t.timestamps
    end
  end
end
