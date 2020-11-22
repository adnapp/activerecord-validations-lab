class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250}
    validates :summary, length: { maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :is_clickbait?

    #define clickbait words in array
    #check and see if they are conatined, if they are not containes, add error

    CLICKBAIT = [
        /Won't Believe/i,
        /Secret/i,
        /Top \d*/i,
        /Guess/i
      ]

    def is_clickbait?
        if CLICKBAIT.none? { |pat| pat.match title }
        errors.add(:title, "must be clickbait")
      end
    end




end
