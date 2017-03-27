require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "Comment" do
    assert Comment
  end

  test "comments persisted" do
    bad_stuff = Submission.create(link:"hello", title: "world")
    rabble = Comment.create(comment_text: "rabble rabble rabble", submission_id: bad_stuff.id)
    assert rabble.persisted?
  end
end
