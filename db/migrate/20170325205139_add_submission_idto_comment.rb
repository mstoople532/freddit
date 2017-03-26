class AddSubmissionIdtoComment < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :submission_id, :integer
  end
end
