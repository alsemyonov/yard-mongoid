require 'yard'
require 'yard/mongoid/version'

module YARD
  module Handlers
    module Ruby
      module Mongoid
      end
    end
  end
end

require 'yard/handlers/ruby/mongoid/field_handler'
require 'yard/handlers/ruby/mongoid/relations/belongs_to_handler'
require 'yard/handlers/ruby/mongoid/relations/has_one_handler'
require 'yard/handlers/ruby/mongoid/relations/has_many_handler'
require 'yard/handlers/ruby/mongoid/relations/has_and_belongs_to_many_handler'
