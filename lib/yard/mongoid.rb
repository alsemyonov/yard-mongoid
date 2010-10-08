module YARD
  module Mongoid
    autoload :VERSION, 'yard/mongoid/version'
    autoload :Extensions, 'yard/mongoid/extensions'
  end
end

require 'yard/mongoid/field_handler'
require 'yard/mongoid/legacy/field_handler'
