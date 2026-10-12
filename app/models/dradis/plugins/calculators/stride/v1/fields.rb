module Dradis::Plugins::Calculators::STRIDE::V1
  class Fields
    FIELDS = {
      'STRIDE.Spoofing' => {
        label: 'Spoofing',
        description: "An attacker uses another user's authentication information."
      },
      'STRIDE.Tampering' => {
        label: 'Tampering',
        description: 'An attacker changes data in storage or in transit.'
      },
      'STRIDE.Repudiation' => {
        label: 'Repudiation',
        description: 'A user denies an action without proof to trace it.'
      },
      'STRIDE.InformationDisclosure' => {
        label: 'Information disclosure',
        description: 'Information reaches people who should not access it.'
      },
      'STRIDE.DenialOfService' => {
        label: 'Denial of service',
        description: 'An attack prevents valid users from accessing a service.'
      },
      'STRIDE.ElevationOfPrivilege' => {
        label: 'Elevation of privilege',
        description: 'An unprivileged user gains access to privileged actions.'
      }
    }.freeze

    # Returns a Hash of every STRIDE field name to 'Yes' or 'No', read from a
    # fields Hash. Missing or unrecognized values default to 'No'.
    def self.values(fields)
      FIELDS.keys.to_h { |field| [field, fields[field] == 'Yes' ? 'Yes' : 'No'] }
    end

    # Returns the STRIDE field values found in Dradis-style source text.
    def self.source_to_values(source)
      values(FieldParser.source_to_fields(source.to_s))
    end

    # Returns the Dradis-style source text for the given STRIDE values.
    def self.values_to_source(values)
      FieldParser.fields_hash_to_source(self.values(values))
    end
  end
end
