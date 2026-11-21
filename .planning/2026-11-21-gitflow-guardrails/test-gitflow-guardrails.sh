#!/usr/bin/env bash
set -euo pipefail

validate_flow() {
  local base="$1" head="$2" repository="$3" expected="$4"
  local result=0

  [[ "$repository" == "Edwanderson94/Terraform-Modules" ]] || result=1
  if (( result == 0 )); then
    case "$base" in
      release/*)
        [[ "$base" =~ ^release/[0-9]+\.[0-9]+\.[0-9]+$ ]] || result=1
        [[ "$head" =~ ^(feature|fix|docs|hotfix)/.+$ ]] || result=1
        ;;
      master)
        [[ "$head" =~ ^release/[0-9]+\.[0-9]+\.[0-9]+$ ]] || result=1
        ;;
      *) result=1 ;;
    esac
  fi

  if [[ "$expected" == pass && "$result" -ne 0 ]] ||
     [[ "$expected" == fail && "$result" -eq 0 ]]; then
    printf 'FAIL: %s -> %s (%s) expected %s\n' "$head" "$base" "$repository" "$expected" >&2
    return 1
  fi
}

validate_title() {
  local title="$1" expected="$2" result=0
  local conventional_commit_regex='^(feat|fix|docs|chore|refactor|test|ci|build|perf|revert)(\([^)]*\))?!?:[[:space:]].+'
  [[ "$title" =~ $conventional_commit_regex ]] || result=1
  if [[ "$expected" == pass && "$result" -ne 0 ]] ||
     [[ "$expected" == fail && "$result" -eq 0 ]]; then
    printf 'FAIL: title "%s" expected %s\n' "$title" "$expected" >&2
    return 1
  fi
}

validate_version() {
  local version="$1" expected="$2" result=0
  [[ "$version" =~ ^v?[0-9]+\.[0-9]+\.[0-9]+$ ]] || result=1
  if [[ "$expected" == pass && "$result" -ne 0 ]] ||
     [[ "$expected" == fail && "$result" -eq 0 ]]; then
    printf 'FAIL: version "%s" expected %s\n' "$version" "$expected" >&2
    return 1
  fi
}

validate_flow release/1.6.0 feature/add-module Edwanderson94/Terraform-Modules pass
validate_flow release/1.6.0 fix/bug Edwanderson94/Terraform-Modules pass
validate_flow release/1.5.1 hotfix/security Edwanderson94/Terraform-Modules pass
validate_flow master release/1.6.0 Edwanderson94/Terraform-Modules pass
validate_flow master feature/add-module Edwanderson94/Terraform-Modules fail
validate_flow release/latest feature/add-module Edwanderson94/Terraform-Modules fail
validate_flow release/1.6.0 experiment/foo Edwanderson94/Terraform-Modules fail
validate_flow release/1.6.0 feature/add-module contributor/fork fail

validate_title 'feat(guardrails): validate branch flow' pass
validate_title 'fix: reject direct master promotion' pass
validate_title 'release guardrails' fail
validate_title 'feature: missing conventional type' fail

validate_version v1.5.0 pass
validate_version 1.6.0 pass
validate_version v1.6 fail
validate_version release/1.6.0 fail
validate_version v1.6.0-rc.1 fail

printf 'PASS: GitFlow guardrail positive/negative cases\n'
