#!/usr/bin/env ruby

require 'json'

module CV

  class Goal

    def self.addendum
      '`If this README.md is a little lite for you, jump into the cv.rb that creates this file. You may enjoy some of the code or comments.`'
    end

    def self.output

      <<-END

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
      # These are the ones I like to work with, have used others in the past such as CakePHP, Word Press, OS Commerce, Joomla etc
      ['Sinatra', 'Rails', 'AngularJS', 'ExpressJS']

    end

    def self.datastores
      # I can use all these datastores
      stores = ['Postgres 9.3', 'Redis', 'Mongo', 'Mysql']

      # However I have found that these two serve me the best
      # Also now that Postgres 9.3 has JSON blobs Mongo is beginning to become less useful (for my use cases anyways)
      stores.select { |store| ['Postgres 9.3', 'Redis'].include?(store) }

    end

    # Only have exposure to the one
    def self.message_queues
      'RabbitMQ'

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
      ['RSpec', 'FactoryGirl', 'SimpleCov', 'Karma', 'Protractor', 'Istanbul']

    end

  end

  class Experience

    def self.roles
      [{
        company:  'Shift72.com',
        industry: 'Video On Demand',
        roles:    'Senior Web Dev',
        when:     {
          from: 'Feb 2013',
          to: Time.now
        }
      },
      {
        company:  'TestScreening.com',
        industry: 'Video Audience Metrics',
        roles:    'Founder Senior Web Dev',
        when:     {
          from: 'July 2013',
          to: Time.now
        }
      }]

    end

  end

  class DevOps
    # TODO - (LB 28/7/14)
    # I am learning a lot about Dev Ops these days
    # What with the 12 Factor App, SOA, message queues, 0% downtime there is a lot to learn.
    # Suffice to say I am using Jenkins and Drone.io for Continuous Integration and Deployment
    # I am also learning more and more about Docker and like it the more I see it
  end

end

# Clean out the README.md
File.open('README.md', 'w') {|file| file.truncate(0) }

open('README.md', 'a') { |f|

  f.puts '# Goal'
  f.puts CV::Goal.addendum
  f.puts CV::Goal.output
  f.puts ''

  f.puts '# Skills'

  f.puts '## Languages'
  f.puts "```json"
  f.puts JSON.pretty_generate(CV::MadSkills.languages)
  f.puts "```"
  f.puts ''

  f.puts '## Frameworks'
  f.puts "`#{CV::MadSkills.frameworks.join(', ')}`"
  f.puts ''

  f.puts '## Datastores'
  f.puts "`#{CV::MadSkills.datastores.join(', ')}`"

  f.puts ''
  f.puts '## Message Queues'
  f.puts "`#{CV::MadSkills.message_queues}`, its the best one right?"

  testing = CV::Testing.new
  f.puts ''
  f.puts '## Testing'
  f.puts "`#{testing.mantra}`"
  f.puts ''
  f.puts "`#{testing.frameworks.join(', ')}`"

  f.puts ''
  f.puts '## Experience'
  f.puts "```json"
  f.puts JSON.pretty_generate(CV::Experience.roles)
  f.puts "```"

  f.puts ''
  f.puts '## Dev Ops'
  f.puts 'Please read the TODO notes in the code'

  f.puts ''
  f.puts '## Contact'
  f.puts "`me at luke byrne dot com` will find me "
  f.puts "`@melukebyrne` via Twitter"
}
