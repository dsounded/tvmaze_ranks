require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module TvmazeRanks
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    config.autoload_paths += %w(#{config.root}/presenters #{config.root}/services)

    config.generators do |g|
      g.orm :active_record
      g.template_engine :slim
      g.test_framework :rspec, fixture: false
      g.integration_tool :rspec
    end
  end
end
