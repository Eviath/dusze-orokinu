Rails.application.config.content_security_policy do |policy|
  policy.connect_src :self, :https, "http://localhost:3035", "ws://localhost:3035", "http://content.warframe.com/dynamic/worldState.php" if Rails.env.development?
end