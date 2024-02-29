# frozen_string_literal: true

require 'validates_identity'
require_relative 'pa_ruc/version'

class ValidatesIdentity
  module PaRuc
    autoload :LegalValidator, 'validates_identity/pa_ruc/legal_validator'
    autoload :PersonValidator, 'validates_identity/pa_ruc/person_validator'
  end
end

# Legal
ValidatesIdentity.register_legal_identity_type('PA_RUC_LEGAL', ValidatesIdentity::PaRuc::LegalValidator)
ValidatesIdentity::ShouldaMatchers.register_legal_allowed_values('PA_RUC_LEGAL', %w[123456789-2-2015 10101010-1-2001 12312123-3-2040])
ValidatesIdentity::ShouldaMatchers.register_legal_disallowed_values('PA_RUC_LEGAL', %w[90-234-1-23 10-0-123-123])
# Person
ValidatesIdentity.register_person_identity_type('PA_RUC_PERSON', ValidatesIdentity::PaRuc::PersonValidator)
ValidatesIdentity::ShouldaMatchers.register_person_allowed_values('PA_RUC_PERSON', %w[PE-23-123 10-1-123])
ValidatesIdentity::ShouldaMatchers.register_person_disallowed_values('PA_RUC_PERSON', %w[90-234-123 10-0123-123])
