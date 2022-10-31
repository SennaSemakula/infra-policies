.PHONY: staging-audit prod-audit

PROD_ROLE=production-admin
STAGING_ROLE=staging-admin

staging-audit:
	@AWS_PROFILE=$(STAGING_ROLE) custodian run --dry-run --region eu-west-1 --region eu-west-2 --cache-period 0 --dry-run --output-dir=. policies/dev/rds-activity.yml

prod-audit:
	#!/bin/bash
	AWS_PROFILE=$(PROD_ROLE) custodian run --dry-run --region eu-west-1 --region eu-west-2 --cache-period 0 --dry-run --output-dir=. policies/dev