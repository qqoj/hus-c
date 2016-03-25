def eve(file_name, &block)
  puts "Importing #{file_name} ..."
  YAML.load(File.open(Rails.root.join("db/eve/#{file_name}"))).each &block
end

eve 'typeIDs.yaml' do |type_id|
  EveItem
      .find_or_create_by(type_id: type_id[0])
      .update!(
          name: type_id[1]['name']['en'],
          price: type_id[1]['basePrice'],
          volume: type_id[1]['volume']
      )
end

eve 'blueprints.yaml' do |blueprint|
  Blueprint
      .find_or_create_by(type_id: blueprint[0])
      .update!(
          activities: blueprint[1]['activities'],
          limit: blueprint[1]['maxProductionLimit']
      )
end
