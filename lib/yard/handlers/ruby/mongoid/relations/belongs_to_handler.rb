require 'yard/handlers/ruby/mongoid/relations/singular_handler'

module YARD::Handlers::Ruby::Mongoid::Relations
  class BelongsToHandler < SingularHandler
    handles method_call(:belongs_to)

    def group_name
      'Belongs to'
    end

    private

    def return_description
      ''
    end
  end
end
