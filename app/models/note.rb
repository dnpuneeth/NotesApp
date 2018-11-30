# frozen_string_literal: true

class Note
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :body, type: String
  field :tags, type: Array
end
