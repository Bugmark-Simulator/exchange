class CreateSimulationTables < ActiveRecord::Migration[5.1]
  def change

    create_table :work_queues do |t|
      t.string   :user_uuid
      t.string   :issue_uuid
      t.string   :task
      t.datetime :added_queue
      t.integer  :position
      t.datetime :removed
      t.datetime :completed
      t.datetime :startwork
      t.boolean  :updated_issue, default: false
      t.datetime :created_at, default: -> {'CURRENT_TIMESTAMP'}
      t.datetime :updated_at, default: -> {'CURRENT_TIMESTAMP'}

      t.timestamps
    end
    add_index :work_queues, :user_uuid
    add_index :work_queues, :issue_uuid
    add_index :work_queues, :completed

    create_table :issue_comments do |t|
      t.string   :issue_uuid
      t.string   :user_uuid
      t.string   :user_name
      t.string   :comment
      t.datetime :comment_date
      t.datetime :comment_delete
      t.timestamps
      t.datetime :created_at, default: -> {'CURRENT_TIMESTAMP'}
      t.datetime :updated_at, default: -> {'CURRENT_TIMESTAMP'}
    end
    add_index :issue_comments, :issue_uuid

  end
end
