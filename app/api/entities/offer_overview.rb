module Entities
  class OfferOverview < Grape::Entity
    expose :uuid      , documentation: { type: String, desc: "UUID" }
  end
end
