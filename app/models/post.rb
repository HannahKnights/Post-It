class Post < ActiveRecord::Base
    
  has_many :comments
  has_attached_file :image, 
                    styles: { thumb: "300x300>"},
                    storage: :s3,
                    s3_credentials: {
                      access_key_id: 'AKIAJU2GX4J6RWI4JKUQ',
                      secret_access_key: Rails.application.secrets.sw3_secret_access_key
                    },
                    bucket: 'faux_instagram'

end

