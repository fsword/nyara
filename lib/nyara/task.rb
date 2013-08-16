desc "display all routes"
task :routes do
  Nyara.setup
  Nyara::Route.print_routes
end

namespace :assets do
  desc "Build asset files to public directory"
  task :build do
    Nyara.setup
    print "Assets css files in compressing..."
    `bundle exec sass --cache-location tmp/cache/sass --update #{Nyara.assets_path("css")}:#{Nyara.public_path("css")} -t compressed -f`
    puts " [Done]"
    print "Assets js files in compressing..."
    `bundle exec coffee -c -b -o #{Nyara.public_path("js")} #{Nyara.assets_path("js")}`
    puts " [Done]"
  end
end
