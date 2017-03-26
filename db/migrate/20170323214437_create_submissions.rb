class CreateSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :submissions do |t|
      t.string :title
      t.string :link
      t.datetime :submission_time

      t.timestamps
    end
  end
end
