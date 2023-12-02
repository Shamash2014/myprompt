
class Prompt < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  def self.reindex!
    self.__elasticsearch__.create_index!
    self.import
  end
end
