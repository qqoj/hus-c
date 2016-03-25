class EveYaml
  class Base < ActiveYaml::Base

    set_root_path Rails.root.join('db/eve')

    class << self
      def extension
        'yaml'
      end
    end

  end
end