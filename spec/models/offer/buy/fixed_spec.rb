require 'rails_helper'

RSpec.describe Offer::Buy::Fixed, type: :model do
  def valid_params
    {}
  end

  let(:klas)   { described_class         }
  subject      { klas.new(valid_params)  }

end

# == Schema Information
#
# Table name: offers
#
#  id                    :bigint(8)        not null, primary key
#  uuid                  :string
#  type                  :string
#  tracker_type          :string
#  user_uuid             :string
#  prototype_uuid        :string
#  amendment_uuid        :string
#  salable_position_uuid :string
#  volume                :integer
#  price                 :float
#  value                 :float
#  poolable              :boolean          default(FALSE)
#  aon                   :boolean          default(FALSE)
#  status                :string
#  expiration            :datetime
#  maturation_range      :tsrange
#  xfields               :hstore           not null
#  jfields               :jsonb            not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  stm_issue_uuid        :string
#  stm_tracker_uuid      :string
#  stm_title             :string
#  stm_body              :string
#  stm_status            :string
#  stm_labels            :string
#  stm_trader_uuid       :string
#  stm_group_uuid        :string
#  stm_comments          :jsonb            not null
#  stm_jfields           :jsonb            not null
#  stm_xfields           :hstore           not null
#
