cat - > .envrc << EOF
export GOPRIVATE='*.garena.com'
export GOPROXY=https://nexus.shopee.io/,direct
EOF

cat - > .gitlab-ci.yml << EOF
stages:
  - lint
 
lint:
  stage: lint
  image: harbor.shopeemobile.com/shopee/golangci-lint
  script: run_lint.sh
EOF

cat - > .golangci.yml << EOF
run:
  skip-dirs:
    - docs
 
linters-settings:
  maligned:
    suggest-new: true
  gocritic:
    disabled-checks:
      - singleCaseSwitch
 
linters:
  disable:
    - gochecknoglobals
    - funlen
  enable-all: true
EOF
