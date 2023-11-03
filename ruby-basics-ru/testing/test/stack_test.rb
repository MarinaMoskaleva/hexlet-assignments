# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  
  def test_add_element
    stack = Stack.new ['ruby', 'php']
    assert { stack.push! 'java' == ['ruby', 'php', 'java'] }
  end

  def test_remove_element
    stack = Stack.new ['ruby', 'php', 'java']
    assert { stack.pop! == 'java' }
  end

  def test_clear_stack
    stack = Stack.new ['ruby', 'php']
    assert { stack.clear! == [] }
  end

  def test_stack_is_empty
    stack = Stack.new
    assert { stack.clear! == [] }
  end

  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
