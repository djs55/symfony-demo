$url = 'http://localhost:8080'


# track execution time:
$timeTaken = Measure-Command -Expression {
  $site = Invoke-WebRequest -Uri $url -UseBasicParsing
}

$milliseconds = $timeTaken.TotalMilliseconds

$milliseconds = [Math]::Round($milliseconds, 1)

"This took $milliseconds ms to execute"