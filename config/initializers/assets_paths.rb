# Sets autoload paths for 3rd party assets.

Szerg2::Application.configure do
  config.assets.paths ||= []
  config.assets.paths  += %W{#{config.root}/vendor/assets/bootstrap}
end
