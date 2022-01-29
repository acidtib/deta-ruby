# frozen_string_literal: true

require "faraday"

require_relative "deta/version"

module Deta
  autoload :Client, "deta/client"
  autoload :Error, "deta/error"
  autoload :Resource, "deta/resource"
  autoload :Object, "deta/object"

  autoload :BaseResource, "deta/resources/base"

  autoload :BaseObject, "deta/objects/base"
end
