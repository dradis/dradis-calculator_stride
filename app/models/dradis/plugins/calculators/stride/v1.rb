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

    DESCRIPTIONS = {
      'STRIDE.Spoofing' => "An attacker uses another user's authentication information.",
      'STRIDE.Tampering' => 'An attacker changes data in storage or in transit.',
      'STRIDE.Repudiation' => 'A user denies an action without proof to trace it.',
      'STRIDE.InformationDisclosure' => 'Information reaches people who should not access it.',
      'STRIDE.DenialOfService' => 'An attack prevents valid users from accessing a service.',
      'STRIDE.ElevationOfPrivilege' => 'An unprivileged user gains access to privileged actions.'
    }.freeze

  end
end
