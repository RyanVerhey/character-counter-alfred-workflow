require_relative 'alfred_helper'

input = ARGV.first
workflow = Alfred::Workflow.new

length = input.length
output = Alfred::Item.new({
  title: "#{length} characters",
  arg: input,
  icon: '58F434D9-0209-4D9E-BA11-EB71130AA696.png' })

workflow << output
puts workflow
