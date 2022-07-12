class Blog < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many_attached :images

    has_many :blog_tags
    has_many :tags, through: :blog_tags

#   accepts_nested_attributes_for :tag, allow_destroy: true

    def tags_attributes=(tags_attributes)
        tags_attributes.values.each do |tag|
            if !tag[:name].empty?
                self.tags << Tag.find_or_create_by(name: tag[:name])
            end
        end
    end
end
