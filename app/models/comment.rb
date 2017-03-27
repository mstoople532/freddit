class Comment < ApplicationRecord
  belongs_to :submission
  def timestampdiff
    diff = Time.now - self.comment_time
    # TODO fix the /s and specify cases for one day/hour/minute
    if diff / 86_400 > 1
      "#{(diff / 86_400).to_i} day/s ago"
    elsif diff / 3600 > 1
      "#{(diff / 3600).to_i} hour/s ago"
    elsif diff / 3600 < 1 && diff / 60 > 1
      "#{(diff / 60).to_i} minute/s ago"
    else
      "less than one minute ago"
    end
  end
end
