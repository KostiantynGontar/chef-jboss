require 'minitest/spec'

describe_recipe 'jboss::default' do
  describe "users and groups" do 
    it "creates a user for jboss" do
      user("jboss").must_exist
    end
    it "creates the jboss group" do
      group("jboss").must_exist
    end
  end

  describe "files" do
    it "create jboss_home dir" do
      directory("/opt/jboss").must_exist.with(:owner,"jboss").and(:group,"jboss")
      link("/opt/jboss").must_exist.with(:link_type, :symbolic).and(:to, "/usr/local/jboss-7.1.1")  
    end
    it "create jboss env_settings" do
      file("/etc/profile.d/jboss.sh").must_have(:mode,"755").with(:owner,"root").and(:group,"root")
      file("/etc/profile.d/jboss.sh").must_include '/opt/jboss'
      file("/etc/profile.d/jboss.sh").must_include 'jboss'
    end
    it "create conf file" do
      file("/opt/jboss/bin/standalone.conf").must_have(:mode,"644").with(:owner,"jboss").and(:group,"jboss")
      file("/opt/jboss/bin/standalone.conf").must_include '0.0.0.0'
    end
  end
end
      
