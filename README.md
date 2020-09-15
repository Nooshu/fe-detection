# GOV.UK Frontend Detection
Simple bash script to try to find what version of GOV.UK Frontend is being used on a service. Point the script at a services CSS file to guess the version used.

Example command:
```
./fe-test.sh https://raw.githubusercontent.com/alphagov/govuk-frontend/v2.9.0/dist/govuk-frontend-2.9.0.min.css
```

## Methodology
The 'dist` version of the CSS it taken and differences between versions are identified, then used to pin down a particular version of GOV.UK Frontend being used. Use the following command to do this:

```
curl -s https://raw.githubusercontent.com/alphagov/govuk-frontend/v2.9.0/dist/govuk-frontend-2.9.0.min.css | cssbeautify-cli -s > govuk-frontend-2.9.0.css
```

Depends on:

- [cURL](https://curl.haxx.se/)
- [cssbeautify-cli](https://www.npmjs.com/package/cssbeautify-cli)