class Prompt < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  settings(index: {number_of_shards: 1}) do
    mappings(dynamic: "false") do
      indexes :prompt, type: "text", analyzer: "english"
      # Add more fields as needed
    end
  end

  def self.search(query)
    params = {
      query: {
        multi_match: {
          query: query,
          fields: [:prompt],
          fuzziness: "AUTO"
        }
      }
    }

    self.__elasticsearch__.search(params)
  end

  def self.reindex!
    self.__elasticsearch__.create_index!
    self.import
  end
end
