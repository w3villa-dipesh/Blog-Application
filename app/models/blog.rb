class Blog < ApplicationRecord

    validates :title, presence: true, uniqueness: { case_sensitive: true }, length: {maximum: 50, minimum:5}
    validates :body, presence: true, uniqueness: { case_sensitive:  true }, length: { minimum: 10 }
    validate :correct_image_type
    
    

    belongs_to :user
    belongs_to :category
    has_many_attached :images

    has_many :blog_tags
    has_many :tags, through: :blog_tags

    has_many :likes
    has_many :comments

    def correct_image_type
        if images.attached? == false
            errors.add(:images, "are missing")
        end

        images.each do |image|
            if !image.content_type.in?(%w(image/jpeg image/png))
                errors.add(:image,"must be a JPG/JPEG/PNG")
            end
        end
    end
#   accepts_nested_attributes_for :tag, allow_destroy: true

    def tags_attributes=(tags_attributes)
        tags_attributes.values.each do |tag|
            if !tag[:name].empty?
                self.tags << Tag.find_or_create_by(name: tag[:name])
            end
        end
    end
end
