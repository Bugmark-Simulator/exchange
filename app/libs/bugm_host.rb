class BugmHost

  class << self
    def name
      ENV['SYSNAME']
    end

    def datastore
      return "permanent" if name == "bugmark-net"
      "mutable"
    end

    def reset
      reset_influx
      reset_grafana
      reset_postgres
    end

    private

    def reset_postgres
      tables = %w(Tracker User Offer Escrow Position Amendment Contract Event Work_queue Issue_Comment)
      tables.each {|el|
        Object.const_get(el).destroy_all
        # reset the ids
        sql = "TRUNCATE TABLE #{Object.const_get(el).table_name} RESTART IDENTITY;"
        ActiveRecord::Base.connection.execute(sql)
      }
      BugmTime.clear_offset
      UserCmd::Create.new({email: 'admin@bugmark.net', password: 'bugmark'}).project
    end

    def reset_grafana
      # do not reset grafana settings!
    end

    def reset_influx
      # delete Influx database and recreate it -- tables are created within this
      return unless InfluxUtil.has_influx?
      InfluxStats.delete_database("bugm_stats")
      InfluxStats.create_database("bugm_stats")
      InfluxStats.delete_database("bugm_log")
      InfluxStats.create_database("bugm_log")
    end
  end
end
