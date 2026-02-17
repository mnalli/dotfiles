function laws -a port -d "Toggle localstack AWS endpoint (so that aws_completer will see it)"

    if test -z $port
        set port 4566   # default localstack port
    end

    if set --query AWS_ENDPOINT_URL
        echo "set --erase AWS_ENDPOINT_URL ($AWS_ENDPOINT_URL)"
        set --erase AWS_ENDPOINT_URL
    else
        set -gx AWS_ENDPOINT_URL http://localhost:$port
        echo "set -gx AWS_ENDPOINT_URL $AWS_ENDPOINT_URL"
    end
end

