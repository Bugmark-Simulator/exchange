class Work_queue < ApplicationRecord
end

# == Schema Information
#
# Table name: Work_queues
#    id SERIAL primary key not null
#    user_uuid character varying not null
#    issue_uuid character varying not null
#    task character varying not null
#    added_queue timestamp not null
#    position int
#    canceled boolean default false
#    completed timestamp not null
#    startwork timestamp not null
#    updated_issue boolean default false
