# frozen_string_literal: true

class Note
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :body, type: String
  field :tags, type: Array

  scope :search_by_title, ->(title) { where(title: /.*#{title}.*/i) }
  scope :search_by_tag, ->(tag) { where(tags: /.*#{tag}.*/i) }
end
