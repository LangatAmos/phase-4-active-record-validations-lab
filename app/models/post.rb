class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

    #custom validation
    validate :title_is_sufficiently_clickbait

    def title_is_sufficiently_clickbait
        unless title&.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
            errors.add(:title, "title must include 'Guess' or 'Secret' or 'Top [number]' or 'Won't Believe'")
        end
    end
end
