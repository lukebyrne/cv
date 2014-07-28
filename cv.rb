#!/usr/bin/env ruby

module CV

  class Goal

    def self.output
      <<-END

      `If this README.md is a little lite for you, jump into the cv.rb that creates this file. You may enjoy some of the code or comments.`

      My goal is to secure a short to medium term contract working in either AngularJS, Sinatra / Ruby on Rails.

      I like the Sinatra/NodeJS micro services approach on the backend to build up an API, and AngularJS on the front end to create a compelling UI/UX.

      My preference is for greenfield projects with a Service Orientated Architecture (SOA).

      My preferreed location is either Melbourne, Brighton or Singapore.

      END

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

  class Testing

    def mantra
      'As close to 100% test coverage as possible is my mantra, and I am pretty pedantic about coding conventions.'

    end

    def frameworks
      ['RSpec', 'FactoryGirl', 'SimpleCov', 'Karma', 'Protractor']

    end

  end

  class DevOps

  end

  class Experience

  end

  class Contact

  end

end

# Clean out the README.md
File.open('README.md', 'w') {|file| file.truncate(0) }

open('README.md', 'a') { |f|

  f.puts '# Goal'
  f.puts CV::Goal.output
  f.puts ''

  f.puts '# Skills'

  f.puts '## Languages'
  f.puts "`#{CV::MadSkills.languages}`"
  f.puts ''

  f.puts '## Frameworks'
  f.puts "`#{CV::MadSkills.frameworks}`"
  f.puts ''

  f.puts '## Datastores'
  f.puts "`#{CV::MadSkills.datastores}`"

  f.puts ''
  f.puts '## Message Queues'
  f.puts "`#{CV::MadSkills.message_queues}`"


  testing = CV::Testing.new
  f.puts ''
  f.puts '## Testing'
  f.puts "`#{testing.mantra}`"
  f.puts ''
  f.puts "`#{testing.frameworks}`"

}
