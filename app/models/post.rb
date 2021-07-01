class Post < ApplicationRecord
    validates :title, presence: true 
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
    validate :clickbait

    def clickbait
        words = ["Won't Believe", "Secret", "Top [number]", "Guess"]
        if title
            good_titles = words.any? {|w| title.include?(w)}
            if !good_titles
                errors.add(:title, "Not clickbait-y enough")
            end
        end
    end
end
