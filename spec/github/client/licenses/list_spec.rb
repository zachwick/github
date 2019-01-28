# encoding: utf-8

require 'spec_helper'

describe Github::Client::Licenses, '#list' do
    let(:request_path) { "/licenses" }
    let(:body) { fixture('licenses/licenses.json') }
    let(:status) { 200 }

    it { should respond_to(:find) }

    context "resources found" do
        before {
            stub_get(request_path).to_return(
                :body => body,
                :status => status,
                :headers => {:content_type => "application/json; charset=utf-8"} )
        }

        it "should get the resources" do
            subject.list
            a_get(request_path).should_have_been_made
        end

        it_should_behave_like "an array of resources" do
            let(:requestable) { subject.list }
        end

        it "should get resource information" do
            licenses = subject.list
            licenses.first.key.should == 'mit'
        end

        it "should yield result to a block" do
            yielded = []
            result = subject.list { |obj| yielded << obj }
            yielded.should == result
        end
    end
end