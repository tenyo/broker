
DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:hostsdb, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/hosts.db")

class Host
  include DataMapper::Resource
  def self.default_repository_name
    :hostsdb
  end
  
  property :id, Serial
  property :name, String, :required => true
  property :created_at, DateTime
  property :updated_at, DateTime
end

DataMapper.finalize
