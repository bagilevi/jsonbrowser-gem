require "jsonbrowser/version"
require 'json'
require 'rest-client'

def JsonBrowser(subject)
  JsonBrowser.browse(subject)
end

module JsonBrowser
  class << self
    attr_accessor :root

    def root
      @root || 'https://json.jkl.me'
    end
  end

  def self.browse(subject)
    puts get_url(subject)
  end

  def self.get_url(subject)
    json = get_json_string(subject)
    response = RestClient.post(
      "#{root}/documents?return=json",
      json,
      content_type: :json,
      accept: :json
    )
    "#{root}#{JSON.parse(response.body)['path']}"
  end

  def self.get_json_string(subject)
    return subject if subject.is_a?(String) && subject[0].in?(['{', '['])
    return subject.to_json if subject.respond_to?(:to_json)

    %i(
      to_h
      to_hash
      to_a
      to_array
      as_json
      serializable_hash
    ).each do |method_name|
      if subject.respond_to?(method_name)
        return JSON.generate(subject.public_send(method_name))
      end
    end

    raise "Cannot convert #{subject.class.name} to a JSON. "\
          "Please convert it yourself and pass a string or provide an object "\
          "with a supported method."
  end
end
