# encoding: utf-8
require_relative '../spec_helper'
require "logstash/filters/request_classifier"

describe LogStash::Filters::RequestClassifier do
  describe "Classify request image" do
    let(:config) do <<-CONFIG
      filter {
        request_classifier {
          url => "message"
        }
      }
    CONFIG
    end

    sample("message" => ".gif") do
      expect(subject).to include("resource_type")
      expect(subject.get('resource_type')).to eq('image')
    end
  end
end
