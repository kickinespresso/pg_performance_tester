require "pg_performance_tester/version"
require 'open3'

module PgPerformanceTester
  class Runner
    def run
      commands = ["pgbench -c 4 -j 2 -T 600 bench1",
                  "pgbench -c 4 -j 2 -T 600 bench2",
                  "pgbench -c 4 -j 2 -T 600 bench3",
                  "pgbench -c 4 -j 2 -T 600 -S bench2",
                  "pgbench -c 4 -j 2 -T 600 -N bench2",
                  "pgbench -c 1 -T 600 bench",
                  "pgbench -c 8 -j 2 -T 600 bench",
                  "pgbench -c 64 -j 4 -T 600 bench",
                  "pgbench -c 64 -j 4 -T 600 -N bench",
                  "pgbench -c 8 -j 2 -T 600 -C bench"]

      # commands = ["pgbench -c 4 -j 2 -T 5 bench1",
      # 		"pgbench -c 4 -j 2 -T 5 bench2"]



      results  = []

      def canonical_form str
        str.tr('^0-9.', '')
      end
      commands.each do |command|
        puts "starting command: #{command}"
        stdout_str, error_str, status = Open3.capture3(command)
        if status.success?
          result = []
          stdout_str.each_line do |line|

            if line.include? ":"
              value = canonical_form(line.partition(':').last)
              unless value.nil? || value.empty?
                result.push(value)
              end
            end
            if line.include? "="
              value = canonical_form(line.partition('=').last)
              unless value.nil? || value.empty?
                result.push(value)
              end
            end
          end
          results.push(result)

          puts stdout_str
        else
          raise "did not work"
        end
      end

      results.each do |result|
        puts result.join(",")
      end


    end
  end
end
