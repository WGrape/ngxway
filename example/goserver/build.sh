# Check go is installed.
if ! command -v go &> /dev/null; then
  wget https://dl.google.com/go/go1.15.linux-amd64.tar.gz
  tar -C /usr/local -xzf go1.15.linux-amd64.tar.gz
  rm -f go1.15.linux-amd64.tar.gz
fi

export PATH=$PATH:/usr/local/go/bin
go env -w GO111MODULE=on
go build -o goserver main.go
