class Api::V1::LocationSerializer < Api::V1::BaseSerializer
  attributes :id, :name, :parent_id
end