class Issue_New_Comment < ApplicationRecord
end

# == Schema Information
#
# Table name: issue_new_comments
  # id SERIAL primary key not null,
  # user_uuid character varying not null,
  # user_name character varying not null,
  # issue_now_comments integer not null
  #  jfields          :jsonb            not null
