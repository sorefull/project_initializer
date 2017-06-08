require 'yaml'

class ProjectInitializer
  def self.call(argv, a_path)
    if argv.include?('html')
      thing = YAML.load_file("#{__dir__}/../config/html.yml")
      thing.keys.each do |key|
        path = key.split('/')
        _path = "#{a_path}/"
        path[0...-1].each do |folder|
          Dir.mkdir("#{_path}#{folder}")
          _path += "#{folder}/"
          File.open(key, 'w') do |file_content|
            file_content.write(thing[key])
          end
        end
      end
    end
  end
end
