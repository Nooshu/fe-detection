#!/bin/bash

output=$(curl -silent "$1")

# grep -q: Quiet;  do  not  write  anything  to  standard   output.    Exit immediately  with  zero status if any match is found, even if an error was detected.  Also see the -s or --no-messages option.

# 2.8.0 has '.govuk-inset-text>:first-child {' CSS selector
if echo $output | grep -q "govuk-inset-text>:first-child"; then
    echo "Version 2.8.0 present"
else
    echo "Version 2.8.0 not present"
fi

# 2.9.0 has partial 'content: "\2014 ";' property
if echo $output | grep -q "2014 "; then
    echo "Version 2.9.0 present"
else
    echo "Version 2.9.0 not present"
fi

# 2.10.0 has '.govuk-form-group:after' CSS selector
if echo $output | grep -q ".govuk-form-group:after"; then
    echo "Version 2.10.0 present"
else
    echo "Version 2.10.0 not present"
fi

# 2.11.0 has '.govuk-button--secondary' CSS selector
if echo $output | grep -q ".govuk-button--secondary"; then
    echo "Version 2.11.0 present"
else
    echo "Version 2.11.0 not present"
fi

# 2.12.0 and 2.13.0 are identical

# 2.13.0 has '.govuk-button--secondary' CSS selector but doesn't have '.govuk-button--secondary:focus[disabled]' CSS selector


# 3.0.0 has the new v2 fonts 'light-94a07e06a1-v2.woff2'
if echo $output | grep -q "light-94a07e06a1-v2.woff2"; then
    echo "Version 3.0.0 present"
else
    echo "Version 3.0.0 not present"
fi

# 3.1.0 has '.govuk-footer__section:first-child:nth-last-child(2)' CSS selector
if echo $output | grep -q ".govuk-footer__section:first-child:nth-last-child(2)"; then
    echo "Version 3.1.0 present"
else
    echo "Version 3.1.0 not present"
fi

# 3.2.0 not directly possible to detect as no major CSS changes (look at detecting 3.1.0 changes and 3.3.0 change)

# 3.3.0 has '!-display-none' partial CSS selector
if echo $output | grep -q "!-display-none"; then
    echo "Version 3.3.0 present"
else
    echo "Version 3.3.0 not present"
fi

# 3.4.0 has '#626a6e' color
if echo $output | grep -q "#626a6e"; then
    echo "Version 3.4.0 present"
else
    echo "Version 3.4.0 not present"
fi

# 3.5.0 doesn't have 'display: -webkit-flex;' property and doesn't have '.govuk-tag--grey' CSS selector
# echo "$output" | grep -q "display: -webkit-flex;"
# v35a=$?
# echo "$output" | grep -q ".govuk-tag--grey"
# v35b=$?

# echo $v35a
# echo $v35b

# if [ "${v35a}" != 0 ] && [ "${v35b}" != 0 ]; then
# 	echo "Version 3.5.0 present"
# else
# 	echo "Version 3.5.0 not present"
# fi

# 3.6.0 has '.govuk-tag--grey' CSS selector
if echo $output | grep -q ".govuk-tag--grey"; then
    echo "Version 3.6.0 present"
else
    echo "Version 3.6.0 not present"
fi

# 3.7.0 has '.govuk-list--spaced' CSS selector
if echo $output | grep -q ".govuk-list--spaced"; then
    echo "Version 3.7.0 present"
else
    echo "Version 3.7.0 not present"
fi

# 3.8.0 has '#505a5f' color
if echo $output | grep -q "#505a5f"; then
    echo "Version 3.8.0 present"
else
    echo "Version 3.8.0 not present"
fi

# 3.9.0 has .govuk-input__prefix CSS selector
if echo $output | grep -q ".govuk-input__prefix"; then
    echo "Version 3.9.0 present"
else
    echo "Version 3.9.0 not present"
fi





# 3.8.0+ = #505a5f
# 3.7.0+ = govuk-list--spaced
# 3.6.0+ = govuk-tag--grey
# 3.4.0+ = #626a6e hex
# 3.3.0+ = .govuk-\!-display-none
# 3.2.0+ = missing `overflow: hidden` on `.govuk-fieldset__legend`
# 3.1.0+ = .govuk-footer__section:first-child:nth-last-child(2)

# curl -s https://assets.registertovote.service.gov.uk/b6c0b08777ae337e3bc89c0187b4c47199e4dc6f/css/styles.css | grep ".govuk-footer__section:first-child:nth-last-child(2)"
# curl -s https://report-director-conduct.service.gov.uk/css/govuk-frontend-2.4.0.min.css | grep ".govuk-footer__section:first-child:nth-last-child(2)"
