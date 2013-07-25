class Server < ActiveRecord::Base
  require 'snmp'

  def total_memory
    result = ""
    begin
      result = manager.get(['hrStorageSize.1']).varbind_list[0].value
    rescue
      result = "Error"
    end
    result
  end

  def used_memory
    result = ""
    begin
      result = manager.get(['hrStorageUsed.1']).varbind_list[0].value
    rescue
      result = "Error"
    end
    result
  end

  def total_storage
    result = ""
    begin
      result = manager.get(['hrStorageSize.31']).varbind_list[0].value
    rescue
      result = "Error"
    end
    result
  end

  def used_storage
    result = ""
    begin
      result = manager.get(['hrStorageUsed.31']).varbind_list[0].value
    rescue
      result = "Error"
    end
    result
  end

  private
  def manager
    @manager = SNMP::Manager.new(:host => ip, :community => 'public', :MibModules => ['HOST-RESOURCES-MIB'])
  end
end
