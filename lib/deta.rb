# frozen_string_literal: true

require "faraday"
require "faraday/multipart"

require_relative "deta/version"

module Deta
  autoload :Client, "deta/client"
  autoload :Error, "deta/error"
  autoload :Resource, "deta/resource"
  autoload :Object, "deta/object"

  autoload :BaseResource, "deta/resources/base"
  autoload :DriveResource, "deta/resources/drive"

  autoload :BaseObject, "deta/objects/base"
  autoload :DriveObject, "deta/objects/drive"
end
