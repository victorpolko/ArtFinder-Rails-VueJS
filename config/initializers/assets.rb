# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( vue/* )

# Add paths to shorten manifests' links to files
# Bower asset paths
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.sass.load_paths << Rails.root.join('node_modules')

# Minimum Sass number precision required by bootstrap-sass
::Sass::Script::Value::Number.precision = [8, ::Sass::Script::Value::Number.precision].max
