require 'active_model'
module NRB; module BeerXML;
  module RecordValidators
    class PercentageValidator < ActiveModel::EachValidator

      def validate_each(record, attribute, value)
        return unless value
        unless value.is_a?(Numeric) && greater_than_min(value) && less_than_max(value)

          message = 'must be a percentage'

          if options[:allow_negative] && options[:give_110]

          elsif options[:allow_negative]
            message += ' (greater than 0)'

          elsif options[:give_110]
            message += ' (less than 100)'

          else
            message += ' (between 0 & 100)'
          end

          record.errors[attribute] << message
        end
      end

    private

      def greater_than_min(value)
        options[:allow_negative] ? true : value >= min
      end


      def less_than_max(value)
        options[:give_110] ? true : value <= max
      end


      def max
        options[:max] || 100
      end


      def min
        options[:min] || 0
      end

    end
  end
end; end
defined?(PercentageValidator) || PercentageValidator = NRB::BeerXML::RecordValidators::PercentageValidator

