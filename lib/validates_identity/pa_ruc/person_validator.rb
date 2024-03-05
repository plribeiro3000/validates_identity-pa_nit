# frozen_string_literal: true

class ValidatesIdentity
  module PaRuc
    class PersonValidator
      VALIDATION_REGULAR_EXPRESSION = /\A([0-9A-Z]{1,2})-([1-9][0-9]{0,})-([1-9][0-9]{0,})\z/i.freeze

      attr_reader :value

      def initialize(value)
        @value = value.to_s
      end

      def valid?
        return true if value.blank?

        birth_state.present? && birth_state_valid?
      end

      def formatted
        return if result.nil?

        "#{result[1]}-#{result[2]}-#{result[3]}"
      end

      private

      def result
        @result ||= VALIDATION_REGULAR_EXPRESSION.match(value)
      end

      def birth_state
        return if result.nil?

        @birth_state ||= result[1]
      end

      def birth_state_valid?
        return true if birth_state.to_i.between?(1, 13)

        %w[E N PE EM KY NT NB].include?(birth_state)
      end
    end
  end
end
