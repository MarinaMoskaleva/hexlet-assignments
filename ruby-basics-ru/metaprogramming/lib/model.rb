# frozen_string_literal: true

require 'date'

# BEGIN
module Model

    def self.included(base)
        base.extend(ClassMethods)
    end
    
    module ClassMethods

        def attribute(name, options = {})
            default_value = options[:default]
            type = options[:type]

            define_method(name) do
                instance_variable_get("@#{name}")
            end

            define_method("#{name}=") do |value|
                if type
                    if value.nil?
                        instance_variable_set("@#{name}", nil)
                    else
                        case type
                            when :string
                                value = value.to_s 
                            when :datetime
                                value = DateTime.parse(value)
                            when :boolean
                                value = !!value
                            when :integer
                                value = value.to_i
                        end
                    end
                    
                    instance_variable_set("@#{name}", value)
                end
                
            end

            if default_value || default_value.is_a?(FalseClass)
                define_method("get_default_value_#{name}") do
                default_value
                end
            end
        end
    end
    def initialize(attributes = {})
        self.attributes.each do |key, value|
            if !attributes.keys.include?(key) && respond_to?("get_default_value_#{key}")
                send("#{key}=", send("get_default_value_#{key}"))
            end
        end
        attributes.each do |key, value|
            if respond_to?("#{key}=") 
                send("#{key}=", value )
            end
        end
    end

    def attributes
        result = {}

        self.class.instance_methods(false).each do |method_name|
            if method_name.to_s.end_with?('=')
                attribute_name = method_name.to_s.chomp('=')
                result[attribute_name.to_sym] = send(attribute_name)
            end
        end
        
        result
    end

end
# END
