require 'rack/contrib/try_static'
require 'rack/cors'

use Rack::TryStatic,
    :root => "_site",
    :urls => %w[/],
    :try => ['.html', 'index.html', '/index.html'],
    :header_rules => [
      # Provide web fonts with cross-origin access-control-headers
      # Firefox requires this when serving assets using a Content Delivery Network
      [:fonts, {'Access-Control-Allow-Origin' => '*'}]
    ]

run lambda { |env|
  return [404, {'Content-Type' => 'text/html'}, ['Not Found']]
}
