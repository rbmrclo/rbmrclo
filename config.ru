latest_version = Dir["public/versions/*"][-1]
latest_index = latest_version + '/index.html'

use Rack::Static, 
  :urls => ["/images", "/js", "/css", "/fonts"],
  :root => "public"

run lambda { |env|
  [
    200, 
    {
      'Content-Type'  => 'text/html', 
      'Cache-Control' => 'public, max-age=86400' 
    },

    File.open(latest_index, File::RDONLY)
  ]
}
