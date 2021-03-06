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
      t.jsonb    :jfields,  null: false, default: {}
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
      t.jsonb    :jfields,  null: false, default: {}
    end
    add_index   :issue_comments, :issue_uuid

    create_table  :log do |t|
      t.string    :user_uuid
      t.datetime  :time
      t.string    :page
      t.string    :issue_uuid
      t.jsonb     :jfields,  null: false, default: {}
    end

    create_table  :bugmtimes do |t|
      t.datetime  :bugmtime
      t.datetime  :systime
      t.jsonb     :jfields,  null: false, default: {}
    end

    create_table :issue_new_comments do |t|
      t.string   :issue_uuid
      t.string   :user_uuid
      t.integer  :new_comments
      t.jsonb    :jfields,  null: false, default: {}
    end
    add_index(:issue_new_comments, [:issue_uuid, :user_uuid], unique: true)

    create_table  :sessions do |t|
      t.string    :uuid
      t.datetime  :bugmtime_start
      t.datetime  :bugmtime_end
      t.datetime  :systime_start
      t.datetime  :systime_end
      t.integer   :days_simulated
      t.jsonb     :jfields,  null: false, default: {}
    end

  end
end
