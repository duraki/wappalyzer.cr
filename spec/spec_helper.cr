require "spec"
require "../src/wappalyzer.cr"

HOST   = "localhost"
PORT   = 8001
DOMAIN = "http://#{HOST}:#{PORT}/fixtures/wapptest.html"

Process.fork { system "pkill php" }
Process.fork { system "cd ./spec && php -S #{HOST}:#{PORT}" }
