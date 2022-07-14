#!/bin/bash

while getopts 'u:f:' OPTION; do
  case "$OPTION" in
    u ) # process option u for passing in a URL
      url="$OPTARG"
      output=$(curl -silent "$url")
      ;;
    f ) # process option f for passing in a file
      filename=$OPTARG
      output=$(<$filename)
      ;;
    \? ) echo "Usage: cmd [-u] (URL) [-f] (File)"
      ;;
  esac
done

# grep -q: Quiet;  do  not  write  anything  to  standard   output.    Exit immediately  with  zero status if any match is found, even if an error was detected.  Also see the -s or --no-messages option.

versions=()

# 1.0.0 has '.govuk-tabs__list' CSS selector
if grep -qF ".govuk-tabs__list" <<< "$output" ; then
  versions+=("✓ 1.0.0")
fi

# 1.1.0 has '.govuk-input--width-5' CSS selector
if grep -qF ".govuk-input--width-5" <<< "$output" ; then
  versions+=("✓ 1.1.0")
fi

# 1.2.0 has '.govuk-checkboxes__hint' CSS selector
if grep -qF ".govuk-checkboxes__hint" <<< "$output" ; then
  versions+=("✓ 1.2.0")
fi

# 1.3.0 has '.govuk-date-input' CSS selector
if grep -qF ".govuk-date-input" <<< "$output" ; then
  versions+=("✓ 1.3.0")
fi

# 2.0.0 has '.govuk-header__navigation-item--active a:focus' CSS selector
if grep -qF ".govuk-header__navigation-item--active a:focus" <<< "$output" ; then
  versions+=("✓ 2.0.0")
fi

# 2.1.0 has '.govuk-footer__meta-custom' CSS selector
if grep -qF ".govuk-footer__meta-custom" <<< "$output" ; then
  versions+=("✓ 2.1.0")
fi

# 2.2.0 has '.govuk-character-count__message--disabled' CSS selector
if grep -qF ".govuk-character-count__message--disabled" <<< "$output" ; then
  versions+=("✓ 2.2.0")
fi

# 2.3.0 has 'inset(50%)!important;' partial CSS property
if grep -qF "inset(50%)!important;" <<< "$output" ; then
  versions+=("✓ 2.3.0")
fi

# 2.4.0 identical to 2.3.0, so has 'inset(50%)!important;' not '.govuk-grid-column-one-quarter-from-desktop'
grep -qF "inset(50%)!important;" <<< "$output"
v24a=$?
grep -qF ".govuk-grid-column-one-quarter-from-desktop" <<< "$output"
v24b=$?
if [ "${v24a}" = 0 ] && [ "${v24b}" != 0 ]; then
  versions+=("✓ 2.4.0")
fi

# 2.5.0 has '.govuk-grid-column-one-quarter-from-desktop' CSS selector
if grep -qF ".govuk-grid-column-one-quarter-from-desktop" <<< "$output" ; then
  versions+=("✓ 2.5.0")
fi

# 2.6.0 has '.js-enabled .govuk-accordion' CSS selector
if grep -qF ".js-enabled .govuk-accordion" <<< "$output" ; then
  versions+=("✓ 2.6.0")
fi

# 2.7.0 has '.govuk-summary-list__key' CSS selector
if grep -qF ".govuk-summary-list__key" <<< "$output" ; then
  versions+=("✓ 2.7.0")
fi

# 2.8.0 has '.govuk-inset-text>:first-child' CSS selector
if grep -qF "govuk-inset-text>:first-child" <<< "$output" ; then
  versions+=("✓ 2.8.0")
fi

# 2.8.0 has '.govuk-inset-text>:first-child' CSS selector
if grep -qF ".govuk-inset-text>:first-child" <<< "$output" ; then
  versions+=("✓ 2.8.0")
fi

# 2.9.0 has partial 'content: "\2014 ";' property
if grep -qF "2014 " <<< "$output" ; then
  versions+=("✓ 2.9.0")
fi

# 2.10.0 has '.govuk-form-group:after' CSS selector
if grep -qF ".govuk-form-group:after" <<< "$output" ; then
  versions+=("✓ 2.10.0")
fi

# 2.11.0 has '.govuk-button--secondary' CSS selector
if grep -qF ".govuk-button--secondary" <<< "$output" ; then
  versions+=("✓ 2.11.0")
fi

# 2.12.0 and 2.13.0 are identical, so can't identify it 2.12.0

# 2.13.0 has '.govuk-button--secondary' CSS selector but doesn't have 'light-94a07e06a1-v2.woff2' CSS selector
grep -qF ".govuk-button--secondary" <<< "$output"
v213a=$?
grep -qF "light-94a07e06a1-v2.woff2" <<< "$output"
v213b=$?
if [ "${v213a}" = 0 ] && [ "${v213b}" != 0 ]; then
  versions+=("✓ 2.13.0")
fi

# 3.0.0 has the new v2 fonts 'light-94a07e06a1-v2.woff2'
if grep -qF "light-94a07e06a1-v2.woff2" <<< "$output" ; then
  versions+=("✓ 3.0.0")
fi

# 3.1.0 has '.govuk-footer__section:first-child:nth-last-child(2)' CSS selector
if grep -qF ".govuk-footer__section:first-child:nth-last-child(2)" <<< "$output" ; then
  versions+=("✓ 3.1.0")
fi

# 3.2.0 not directly possible to detect as no major CSS changes, so has '.govuk-footer__section:first-child:nth-last-child(2)' CSS selector and not '!-display-none' partial CSS selector
grep -qF ".govuk-footer__section:first-child:nth-last-child(2)" <<< "$output"
v320a=$?
grep -qF "!-display-none" <<< "$output"
v320b=$?
if [ "${v320a}" = 0 ] && [ "${v320b}" != 0 ]; then
  versions+=("✓ 3.2.0")
fi

# 3.3.0 has '!-display-none' partial CSS selector
if grep -qF "!-display-none" <<< "$output" ; then
  versions+=("✓ 3.3.0")
fi

# 3.4.0 has '#626a6e' color
if grep -qF "#626a6e" <<< "$output" ; then
  versions+=("✓ 3.4.0")
fi

# 3.5.0 not directly possible to detect as no major CSS changes, so '#626a6e' color and doesn't have '.govuk-tag--grey' CSS selector
grep -qF "#626a6e" <<< "$output"
v35a=$?
grep -qF ".govuk-tag--grey" <<< "$output"
v35b=$?
if [ "${v35a}" = 0 ] && [ "${v35b}" != 0 ]; then
  versions+=("✓ 3.5.0")
fi

# 3.6.0 has '.govuk-tag--grey' CSS selector
if grep -qF ".govuk-tag--grey" <<< "$output" ; then
  versions+=("✓ 3.6.0")
fi

# 3.7.0 has '.govuk-list--spaced' CSS selector
if grep -qF ".govuk-list--spaced" <<< "$output" ; then
  versions+=("✓ 3.7.0")
fi

# 3.8.0 has '#505a5f' color
if grep -qF "#505a5f" <<< "$output" ; then
  versions+=("✓ 3.8.0")
fi

# 3.9.0 has '.govuk-input__prefix' CSS selector
if grep -qF ".govuk-input__prefix" <<< "$output" ; then
  versions+=("✓ 3.9.0")
fi

# 3.10.0 has '.govuk-notification-banner' CSS selector
if grep -qF ".govuk-notification-banner" <<< "$output" ; then
  versions+=("✓ 3.10.0")
fi

# 3.11.0 has '.govuk-cookie-banner' CSS selector
if grep -qF ".govuk-cookie-banner" <<< "$output" ; then
  versions+=("✓ 3.11.0")
fi

# 3.12.0 has '.govuk-link--no-underline' CSS selector
if grep -qF ".govuk-link--no-underline" <<< "$output" ; then
  versions+=("✓ 3.12.0")
fi

# 3.13.0 has '.govuk-checkboxes__divider' CSS selector
if grep -qF ".govuk-checkboxes__divider" <<< "$output" ; then
  versions+=("✓ 3.13.0")
fi

# 4.0.0 has '.govuk-template' CSS selector
if grep -qF ".govuk-template" <<< "$output" ; then
  versions+=("✓ 4.0.0")
fi

# 4.0.1 has '.govuk-header__link--homepage' CSS selector
if grep -qF ".govuk-header__link--homepage" <<< "$output" ; then
  versions+=("✓ 4.0.1")
fi


# 4.1.0 has '.govuk-radios__input:disabled~.govuk-hint' CSS selector
if grep -qF ".govuk-radios__input:disabled~.govuk-hint" <<< "$output" ; then
  versions+=("✓ 4.1.0")
fi


# 4.2.0 has '.govuk-header__service-name' CSS selector
if grep -qF ".govuk-header__service-name" <<< "$output" ; then
  versions+=("✓ 4.2.0")
fi



if [ -z "$versions" ]
then
  echo "GOV.UK Frontend CSS not found in this CSS file."
else
  for version in "${versions[@]}"; do
    echo "$version present"
  done
fi
