CLOUDINARY_CLOUD_NAME = ENV['cloudinary_cloud_name']
CLOUDINARY_API_KEY = ENV['cloudinary_api_key']
CLOUDINARY_SECRET_KEY = ENV['cloudinary_secret_key']

Cloudinary.config do |config|    
    config.cloud_name = CLOUDINARY_CLOUD_NAME
    config.api_key = CLOUDINARY_API_KEY
    config.api_secret = CLOUDINARY_SECRET_KEY
    config.secure = true    
    config.cdn_subdomain = true  
 end