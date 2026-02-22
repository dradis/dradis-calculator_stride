module Dradis::Plugins::Calculators::STRIDE
  class V1
    FIELD_NAMES = %i[
      Spoofing
      Tampering
      Repudiation
      InformationDisclosure
      DenialOfService
      ElevationOfPrivilege
    ].freeze

    FIELDS = FIELD_NAMES.map { |name| "STRIDE.#{name}".freeze }.freeze
  end
end
