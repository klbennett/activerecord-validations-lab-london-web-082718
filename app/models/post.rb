class Post < ActiveRecord::Base
# All posts have a title
# Post content is at least 250 characters long
# Post summary is a maximum of 250 characters
# Post category is either Fiction or Non-Fiction

validates :title, presence: :true
validates :content, length: { minimum: 250 }
validates :summary, length: { maximum: 250 }
validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
validate :clickbait?

   CLICKBAIT = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]
   def clickbait?
    if CLICKBAIT.none? { |word| word.match(title) }
      errors.add(:title, "Title must be clickbait")
    end
  end
end
