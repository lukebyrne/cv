#!/usr/bin/env ruby

module CV

  class Goal

    def self.output
      text  = 'My goal is to secure a short to medium term contract working in either AngularJS, Sinatra / Ruby on Rails. '
      text += 'My preference is for greenfield projects with a Service Orientated Architecture (SOA).'

    end

  end

  class MadSkills

    def self.languages
      languages   = ['php', 'ruby', 'javascript', 'golang']
      levels      = { expert: [], proficient: [], beginner: [] }

      # I say 'expert', but really I mean very, very good at each, but more in the context of the frameworks that I use.
      languages.each { |lang| levels[:expert] << lang if ['ruby', 'javascript'].include?(lang) }

      # Can do php, but really won't or don't want to (unless paid a lot per hour), although the Laravel framework does look interesting
      unless !absolutely_required?
        levels[:proficient] << languages.first

      end

      # GoLang seems like the new hotness, I have a feeling that it will become the new Ruby
      # Seems like a lot of the NodeJS pioneers are heading over
      levels[:beginner] << languages.last

      # Explicit return here just to be obvious
      return levels

    end


    def self.frameworks
      ['Sinatra', 'Rails', 'AngularJS', 'ExpressJS']

    end

    def self.datastores
      # I can use all these datastores
      stores = ['postgres 9.3', 'redis', 'mongo', 'mysql']

      # However I have found that these two serve me the best
      # Also now that Postgres 9.3 has JSON blobs Mongo is beginning to become less useful (for my use cases anyways)
      stores.select { |store| ['postgres', 'redis'].include?(store) }

    end

    # Only have exposure to the one
    def self.message_queues
      'rabbitMQ'

    end

    def self.absolutely_required?
      true

    end

  end


end

# Run this script, copy and paste the output and save as markdown to read
puts '# Goal'
puts CV::Goal.output
puts ''

puts '# Skills'

puts '## Languages'
puts "`#{CV::MadSkills.languages}`"
puts ''

puts '## Frameworks'
puts "`#{CV::MadSkills.frameworks}`"
puts ''

puts '## Datastores'
puts "`#{CV::MadSkills.datastores}`"

puts ''
puts '## Message Queues'
puts "`#{CV::MadSkills.message_queues}`"




