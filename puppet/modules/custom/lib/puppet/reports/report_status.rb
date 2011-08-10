Puppet::Reports.register_report(:report_status) do
  desc "This report will write out the report status"
  def process
    File.open('/var/lib/puppet/reports/report.txt','a') do |f|
      resource_statuses.each do |k,v|
        v.events.each do |e|
          f.puts "Event:\n\tResource => #{k}\n\tProperty => #{e.property}\n\tNew value => #{e.desired_value}\n\tOld value => #{e.previous_value}"
        end
      end
    end
  end
end
