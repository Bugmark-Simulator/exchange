class Bugmtime < ApplicationRecord
end

# == Schema Information
#
# Table name: bugmtimes
#    id SERIAL primary key not null
#    bugmtime timestamp not null
#    systemtime timestamp not null
#    jfields json not null
