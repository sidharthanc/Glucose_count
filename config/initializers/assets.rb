# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css )
Rails.application.config.assets.precompile += %w( theme.css )
Rails.application.config.assets.precompile += %w( fixed-top.css )
Rails.application.config.assets.precompile += %w( font-awesome.css )
Rails.application.config.assets.precompile += %w( application.scss)
Rails.application.config.assets.precompile += %w( jquery.min.js )
Rails.application.config.assets.precompile += %w( http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js )
Rails.application.config.assets.precompile += %w( pace.js )
Rails.application.config.assets.precompile += %w( autocompleteMe.js )
Rails.application.config.assets.precompile += %w( new.css )
Rails.application.config.assets.precompile += %w( footable.bootstrap.min.css)
Rails.application.config.assets.precompile += %w( bootstrap.css)
Rails.application.config.assets.precompile += %w( footable.js)
Rails.application.config.assets.precompile += %w( footable.js)
Rails.application.config.assets.precompile += %w( bootstrap.min.js)
Rails.application.config.assets.precompile += %w( footable-mob-width.js)
Rails.application.config.assets.precompile += %w( footable.bootstrap.min.css)
Rails.application.config.assets.precompile += %w( jquery-ui.css )
Rails.application.config.assets.precompile += %w( semantic.min.css )
Rails.application.config.assets.precompile += %w( jquery-2.1.3.min.js)
Rails.application.config.assets.precompile += %w( semantic.min.js)
Rails.application.config.assets.precompile += %w( semantic.editableRecord.js)
Rails.application.config.assets.precompile += %w( example.js)