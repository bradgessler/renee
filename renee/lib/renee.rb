require 'renee_core'
require 'renee_render'
require 'renee_streaming'

# Method for creating new Renee applications.
# @see http://reneerb.com
# @example
#     run Renee {
#       halt "hello renee"
#     }
def Renee(&blk)
  Class.new(Renee::Application).app(&blk)
end

# Top-level Renee constant.
module Renee
  # Main class for a Renee application. This class should be subclasses if you want to define your own Renee
  # implementations.
  class Application < Core
    include Renee::Render
    include Renee::Streaming
  end
end