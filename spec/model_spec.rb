require 'spec_helper'

describe Presto::Client::Models do
  describe 'rehash of BlockedReason' do
    h = {
      "operatorId" => 0,
      "planNodeId" => "47",
      "operatorType" => "ScanFilterAndProjectOperator",
      "addInputCalls" => 0,
      "addInputWall" => "0.00ns",
      "addInputCpu" => "0.00ns",
      "addInputUser" => "0.00ns",
      "inputDataSize" => "9.46MB",
      "inputPositions" => 440674,
      "getOutputCalls" => 734,
      "getOutputWall" => "7.29s",
      "getOutputCpu" => "0.00ns",
      "getOutputUser" => "0.00ns",
      "outputDataSize" => "36.99MB",
      "outputPositions" => 440674,
      "blockedWall" => "0.00ns",
      "finishCalls" => 0,
      "finishWall" => "0.00ns",
      "finishCpu" => "0.00ns",
      "finishUser" => "0.00ns",
      "memoryReservation" => "0B",
      "systemMemoryReservation" => "0b",
      "blockedReason" => "WAITING_FOR_MEMORY",
      "info" => {"k" => "v"}
    }

    stats = Models::OperatorStats.decode(h)
    stats.blocked_reason.should == :waiting_for_memory
  end

  describe 'rehash of BlockedReason' do
    h = {
      "@type" => "partitionedOutput",
      "rowsAdded" => 1,
      "pagesAdded" => 1,
      "outputBufferPeakMemoryUsage" => "0B"
    }

    operator_info = Models::OperatorInfo.decode(h)
    operator_info.rows_added.should == 1
    operator_info.pages_added.should == 1
    operator_info.output_buffer_peak_memory_usage.should == "0B"
  end
end
