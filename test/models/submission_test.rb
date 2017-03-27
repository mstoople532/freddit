require "test_helper"

class SubmissionTest < ActiveSupport::TestCase
  test "submission" do
    assert Submission
  end

  test "submission persisted" do
    link = Submission.create(link: "http://lmgtfy.com", title: "let me google")
    assert link.persisted?
  end
end
