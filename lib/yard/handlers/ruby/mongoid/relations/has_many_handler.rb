require 'yard/handlers/ruby/mongoid/relations/plural_handler'

module YARD::Handlers::Ruby::Mongoid::Relations
  class HasManyHandler < PluralHandler
    handles method_call(:has_many)

    def group_name
      'Has many'
    end

    private

    def return_description
      ''
    end
  end
end
