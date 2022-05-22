After do |scenario|
  if scenario.failed?
    log "Response URI: #{@response.request.last_uri}"
    log "Response code: #{@response.code}"
    log "Request body: #{@response.request.options[:body]}"
    log "Response headers: #{@response.request.options[:headers]}"
    log "Response body: #{@response.body}"
  elsif scenario.passed?
    if @response.body != nil
      #log "Request body: #{@response.request.options[:body]}"
      log "Response body: #{@response.body}"
      log "Response URI: #{@response.request.last_uri}"
      log "Response code: #{@response.code}"
    end
  end
end