$: << File.expand_path('../../../renee_core/lib', __FILE__)
$: << File.expand_path('../../lib', __FILE__)
require 'renee_core'
require 'renee_streaming'

# TODO better registration method (?)
Renee::Core.send(:include, Renee::Streaming)

# Load shared test helpers
require File.expand_path('../../../lib/test_helper', __FILE__)
