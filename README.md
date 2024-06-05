# 🚨🚨Deprecated🚨🚨

This repo has now been deprecated since the Design System team has now added the `:root {--govuk-frontend-version: "[version number]";}` into their CSS files. See [issue 2](https://github.com/Nooshu/fe-detection/issues/2) for more information!

# GOV.UK Frontend Detection
Bash script to try to find what version of GOV.UK Frontend is being used on a service. Point the script at a services CSS file to guess the version used.

Example command:
```
./bin/fe-test.sh -u https://raw.githubusercontent.com/alphagov/govuk-frontend/v4.3.0/dist/govuk-frontend-4.3.0.min.css
```

## Use on a live services
Running the following command:
```
./bin/fe-test.sh -u https://create-energy-label.service.gov.uk/assets/static/css/main.css
```
Gives the following output:

```
✓ 1.0.0 present
✓ 1.1.0 present
✓ 1.2.0 present
✓ 1.3.0 present
✓ 2.0.0 present
✓ 2.1.0 present
✓ 2.2.0 present
✓ 2.5.0 present
✓ 2.6.0 present
✓ 2.7.0 present
✓ 2.9.0 present
✓ 2.10.0 present
✓ 2.11.0 present
✓ 3.0.0 present
✓ 3.1.0 present
✓ 3.3.0 present
✓ 3.6.0 present
✓ 3.7.0 present
✓ 3.8.0 present
✓ 3.9.0 present
✓ 3.10.0 present
✓ 3.11.0 present
```

So version `3.11.0` of GOV.UK Frontend is most likely being used on this service.

## Use on a CSS file
Some services restrict the downloading of assets via `curl`, so you can download via the browser then pass them into the script using the `-f` flag:

```
./bin/fe-test.sh -f css-filename.css
```

## Methodology
The 'dist` version of the CSS it taken and differences between versions are identified, then used to pin down a particular version of GOV.UK Frontend being used. Use the following command to do this:

```
curl -s https://raw.githubusercontent.com/alphagov/govuk-frontend/v4.3.0/dist/govuk-frontend-4.3.0.min.css | cssbeautify-cli -s > ./css/govuk-frontend-4.3.0.css
```

## Generating diffs
For future reference it is possible to generate file diffs using git with the following command:
```
./generate-diffs.sh
```

## Caveats
This is always going to be an approximate version test. If all services were using the `dist` version of the CSS it would be easy. But as service teams can pick / choose certain components to include in their build process. So at some point they may not include CSS that is being used to pin down a particular version.

# Testing
Tests written using Bats: Bash Automated Testing System. Run using the `bats fe-test.bats` command.

Depends on:

- [cURL](https://curl.haxx.se/)
- [cssbeautify-cli](https://www.npmjs.com/package/cssbeautify-cli)
- [Bats](https://github.com/sstephenson/bats)

# To add a new version of GOV.UK Frontend
```
# Download and beautify the css
# e.g. curl -s https://raw.githubusercontent.com/alphagov/govuk-frontend/v4.3.0/dist/govuk-frontend-4.3.0.min.css | cssbeautify-cli -s > ./css/govuk-frontend-4.3.0.css
curl -s https://raw.githubusercontent.com/alphagov/govuk-frontend/v[VERSION]/dist/govuk-frontend-[VERSION].min.css | cssbeautify-cli -s > ./css/govuk-frontend-[VERSION].css

# generate the new diffs
./generate-diffs.sh

# Examine the new version diff looking for a unique change for this version
# Add version + unique change to `fe-test.sh`
# Add new test to `fe-test.bats` and run test
bats ./bin/fe-test.bats
```
