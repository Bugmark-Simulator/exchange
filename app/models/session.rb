class Session < ApplicationRecord
end

# == Schema Information
#
# Table name: Work_queues
  # id              :bigint(8)  not null, primary key
  # bugmtime_start  :datetime
  # bugmtime_end    :datetime
  # systime_start   :datetime
  # systime_end     :datetime
  # days_simulated  :int
  # jfields         :jsonb      not null
