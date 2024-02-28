# frozen_string_literal: true

class ValidatesIdentity
  module PaRuc
    class LegalValidator
      VALIDATION_REGULAR_EXPRESSION = /\A([0-9]{8,9})-([1-3])-([1-2][9|0][0-9]{2})\z/i.freeze

      attr_reader :value

      def initialize(value)
        @value = value.to_s
      end

      def valid?
        return true if value.blank?

        result.present? && valid_type? && valid_year?
      end

      def formatted
        value
      end

      private

      def result
        @result ||= VALIDATION_REGULAR_EXPRESSION.match(value)
      end

      def folio
        @folio ||= result[1]
      end

      def type
        @type ||= result[2].to_i
      end

      def year
        @year ||= result[3].to_i
      end

      def valid_type?
        if commercial_entity?
          folio.size == 9
        elsif non_commercial_entity?
          folio.size == 8
        elsif third_generation?
          true
        else
          false
        end
      end

      def valid_year?
        if commercial_entity? || non_commercial_entity?
          year >= 2014
        elsif third_generation?
          year >= 1999 && year <= 2014
        else
          false
        end
      end

      def third_generation?
        type == 1
      end

      def fourth_generation?
        commercial_entity? || non_commercial_entity?
      end

      def commercial_entity?
        type == 2
      end

      def non_commercial_entity?
        type == 3
      end
    end
  end
end
