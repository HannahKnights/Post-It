class Post < ActiveRecord::Base
  
  after_validation :parse_tags

  has_many :comments
  has_attached_file :image, 
                    styles: { thumb: "300x300>"},
                    storage: :s3,
                    s3_credentials: {
                      access_key_id: 'AKIAJU2GX4J6RWI4JKUQ',
                      secret_access_key: Rails.application.secrets.sw3_secret_access_key
                    },
                    bucket: 'faux_instagram'

  validates :image, presence: true
  
  has_and_belongs_to_many :tags, autosave: false

  def save_tags_without_hashtags mytags
    self.tags = mytags.map { |tag| Tag.find_or_create_by(name: tag[1..-1]) }
  end

  def parse_tags
    save_tags_without_hashtags(content.downcase.gsub('#',' #').scan(/\#\w+/)).uniq
  end

  def self.by_tag_or_all(tag_name)
    tag_name ? Tag.find_by(name: tag_name).posts : all
  end

end

