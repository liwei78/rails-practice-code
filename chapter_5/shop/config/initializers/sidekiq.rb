require "sidekiq"

redis_hash = {
  namespace: 'sidekiq',
  host: "127.0.0.1",
  port: 6379
}
Sidekiq.configure_server do |config|
  config.redis = redis_hash
end
Sidekiq.configure_client do |config|
  config.redis = redis_hash
end
