require 'yard/handlers/ruby/mongoid/relations/base'

module YARD::Handlers::Ruby::Mongoid::Relations
  class PluralHandler < Base
    def class_name
      "Array<#{super(true)}>"
    end

    private
    def return_description
      "An array of associated #{method_name.humanize}"
    end
  end
end
