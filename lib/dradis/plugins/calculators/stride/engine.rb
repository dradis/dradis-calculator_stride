module Dradis::Plugins::Calculators::STRIDE
  class Engine < ::Rails::Engine
    isolate_namespace Dradis::Plugins::Calculators::STRIDE

    include Dradis::Plugins::Base
    provides :addon
    description 'Risk Calculators: STRIDE'

    initializer 'calculator_stride.asset_precompile_paths' do |app|
      app.config.assets.precompile += [
        'dradis/plugins/calculators/stride/base.css',
        'dradis/plugins/calculators/stride/base.js',
        'dradis/plugins/calculators/stride/manifests/hera.css',
        'dradis/plugins/calculators/stride/manifests/hera.js'
      ]
    end

    initializer "calculator_stride.inflections" do |app|
      ActiveSupport::Inflector.inflections do |inflect|
        inflect.acronym('STRIDE')
      end
    end

    initializer 'calculator_stride.mount_engine' do
        Rails.application.routes.append do
          # Enabling/disabling integrations calls Rails.application.reload_routes! we need the enable
          # check inside the block to ensure the routes can be re-enabled without a server restart
          if Engine.enabled?
            mount Engine => '/', as: :stride_calculator
          end
        end
      # end
    end
  end
end
