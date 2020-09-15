# GOV.UK Frontend Detection
Simple bash script to try to find what version of GOV.UK Frontend is being used on a service. Point the script at a services CSS file to guess the version used.

Example command:
```
./fe-test.sh https://raw.githubusercontent.com/alphagov/govuk-frontend/v2.9.0/dist/govuk-frontend-2.9.0.min.css
```

## Use on a live services
Running the following command:
```
./fe-test.sh https://create-energy-label.service.gov.uk/assets/static/css/main.css
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
✓ 3.4.0 present
✓ 3.5.0 present
```

So version `3.5.0` of GOV.UK Frontend is most likely being used on this service.

## Methodology
The 'dist` version of the CSS it taken and differences between versions are identified, then used to pin down a particular version of GOV.UK Frontend being used. Use the following command to do this:

```
curl -s https://raw.githubusercontent.com/alphagov/govuk-frontend/v2.9.0/dist/govuk-frontend-2.9.0.min.css | cssbeautify-cli -s > govuk-frontend-2.9.0.css
```
## Caveats
This is always going to be an approximate version test. If all services were using the `dist` version of the CSS it would be easy. But as service teams can pick / choose certain components to include in their build process. So at some point they may not include CSS that is being looked for in the simple tests.

# Testing
Tests written using Bats: Bash Automated Testing System. Run using the `bats fe-test.bats` command.

Depends on:

- [cURL](https://curl.haxx.se/)
- [cssbeautify-cli](https://www.npmjs.com/package/cssbeautify-cli)
- [Bats](https://github.com/sstephenson/bats)