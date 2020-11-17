<!--
@license
Copyright 2018 The Lighthouse Authors. All Rights Reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS-IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
-->
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
  <link rel="icon" href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAEhklEQVR4AWJxL/BhIAesev1U5tcflpncgNrKIsqNIwzC9feMpDUzs70kOczMzMzJJcxwCTMzncPMnOwtzBwzMzPb0vRfeZPp0VhPS5I39V5fdiXV1/VD+9QC7OVn9BsyH1XIoEI1PfmJvLFowVV564+34DFUHudbmfDh4kVXh//7XwE+WjS/YfXZe3yr4j2rqj1AIhSB7hZ8ZtPZu/zw8cK523U4wE1/rvPfWrz4zs0m9ZdC9yUJAlASdBAgocRegfF/f3/h/PuaFsxMdwjAR0vm1+06eMMfIrhLqTWqdH4EumU2SPfMhigJAlRQbZrgrRsl9U+Y2DYDFCz3ILC9kiAiqSrMwbWT0nceEnR+9Kggc2zjOJCASDENkg0a5HfZZgDP81CM3CrQs2Z1+o7DJ6ePr8sK0AOCHv5Jjdt3evyYSaZ351VIStIxPRAUtrBYbxC6w+BZ0ivVSBKkIhJhemSyZpfB00EiPO2VjzYkxhcqXQqCWCShGplvi3y0QxqbuBurMjyJeWnkHZuAEgIQGsUBqwrfjZ+IlBgKyRJzVVYF8O6qFWdh86YzQzMrZigYmxAyfvHgLZQ/LC1CbeniW2Hkqr/PH16SgvGuf2/uzNMBwJA/njxizGPtSyAf7EziJCMGRDRdhoAC4PL1A/SrKQMAAQkEfpJAcRQdrBJ7gNwjSpJsdwK+CANBkqa1LgQB4IicV9nYUct7gaxuDJUErQIiEAiMxLVOFlKzIktPpT0ggpdpC/8YAHnxbgkUY4tAAFSR7AAXNyAAWHJrA/kHGjzg5nleuwFO7Nd/IoDw4Pm58+4jNLmYG0wRA5bErc2Mr3Y+dXTDW1VvwqbJkzMCHQ4S1GTCBOIgUHJrGdEwqzR+jAp/o2qAZelUDoQnruEEdDclJI6576AlNVfc+22XN/+Y1vnJD0Yind6UpEEvn/Hqq15EYjCW7jZCJEpnNvDgkyelDjs106kuux2AAXCSobULOWP8mLhYlpoDMK4qAFXJGk+grtH8YXVz5KJblqaG1+VUdTc0I290bmUQAriGITRbdQnom0aoFj8kx1+wMD2ifncAXUQE4SkDqN1hE0jEophs1SUwZAOhUAiMCLwRtamtTZtbbmZErSAUHbSysaoEmnrsakiMiUAURi283gN6wans9oX8rOCrj7/JP35DFD+iQ7Au/K2KE1jzx6ujjUnXFH9KjEq6ZlhsTBICrNLJf47Pv/pkHzvup1w4dmUbEei0+bcXRqJuh5kVARQ8byyYxOwNGr7A87xh1tp8sGT+uMInrwi++Xj7TQz2d27NvwEkrOflAFQGIDA5khASBCGdO2/Z/MnLPwYfv5TFhjW7QhVKAB6afwe2LpFlFsCnlQEosgQgDsdOG1/LKeNqJS4JCSPJ/i+TakwEARor7gER1Iva5JmPOJK0RUqmoPnnlzFCtmIAhAAQEIQRgDaiYPIauNXcnDlRIrWNFY3hm7PG9YRqr7IV7HrCgAC17befjEvRq2nGhAHtBqDpOuI/I1diUUAMYIxEdyejBJqLnNoszGZtfiX/CztGv2mq+sdaAAAAAElFTkSuQmCC">
  <title>Lighthouse Report</title>
  <style>/**
 * @license
 * Copyright 2017 The Lighthouse Authors. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS-IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*
  Naming convention:

  If a variable is used for a specific component: --{component}-{property name}-{modifier}

  Both {component} and {property name} should be kebab-case. If the target is the entire page,
  use 'report' for the component. The property name should not be abbreviated. Use the
  property name the variable is intended for - if it's used for multiple, a common descriptor
  is fine (ex: 'size' for a variable applied to 'width' and 'height'). If a variable is shared
  across multiple components, either create more variables or just drop the "{component}-"
  part of the name. Append any modifiers at the end (ex: 'big', 'dark').

  For colors: --color-{hue}-{intensity}

  {intensity} is the Material Design tag - 700, A700, etc.
*/
.lh-vars {
  /* Palette using Material Design Colors
   * https://www.materialui.co/colors */
  --color-amber-50: #FFF8E1;
  --color-blue-200: #90CAF9;
  --color-blue-900: #0D47A1;
  --color-blue-A700: #2962FF;
  --color-cyan-500: #00BCD4;
  --color-gray-100: #F5F5F5;
  --color-gray-200: #E0E0E0;
  --color-gray-400: #BDBDBD;
  --color-gray-50: #FAFAFA;
  --color-gray-500: #9E9E9E;
  --color-gray-600: #757575;
  --color-gray-700: #616161;
  --color-gray-800: #424242;
  --color-gray-900: #212121;
  --color-gray: #000000;
  --color-green-700: #018642;
  --color-green: #0CCE6B;
  --color-lime-400: #D3E156;
  --color-orange-50: #FFF3E0;
  --color-orange-700: #D04900;
  --color-orange: #FFA400;
  --color-red-700: #EB0F00;
  --color-red: #FF4E42;
  --color-teal-600: #00897B;
  --color-white: #FFFFFF;

  /* Context-specific colors */
  --color-average-secondary: var(--color-orange-700);
  --color-average: var(--color-orange);
  --color-fail-secondary: var(--color-red-700);
  --color-fail: var(--color-red);
  --color-hover: var(--color-gray-50);
  --color-informative: var(--color-blue-900);
  --color-pass-secondary: var(--color-green-700);
  --color-pass: var(--color-green);
  --color-not-applicable: var(--color-gray-600);

  /* Component variables */
  --audit-description-padding-left: calc(var(--score-icon-size) + var(--score-icon-margin-left) + var(--score-icon-margin-right));
  --audit-explanation-line-height: 16px;
  --audit-group-margin-bottom: 40px;
  --audit-group-padding-vertical: 8px;
  --audit-margin-horizontal: 5px;
  --audit-padding-vertical: 8px;
  --category-header-font-size: 20px;
  --category-padding: 40px;
  --chevron-line-stroke: var(--color-gray-600);
  --chevron-size: 12px;
  --default-padding: 12px;
  --env-item-background-color: var(--color-gray-100);
  --env-item-font-size: 28px;
  --env-item-line-height: 36px;
  --env-item-padding: 10px 0px;
  --env-name-min-width: 220px;
  --footer-padding-vertical: 16px;
  --gauge-circle-size-big: 112px;
  --gauge-circle-size: 80px;
  --gauge-label-font-size-big: 28px;
  --gauge-label-font-size: 20px;
  --gauge-label-line-height-big: 36px;
  --gauge-label-line-height: 26px;
  --gauge-percentage-font-size-big: 38px;
  --gauge-percentage-font-size: 28px;
  --gauge-wrapper-width: 148px;
  --header-line-height: 24px;
  --highlighter-background-color: var(--report-text-color);
  --icon-square-size: calc(var(--score-icon-size) * 0.88);
  --image-preview-size: 48px;
  --metric-toggle-lines-fill: #7F7F7F;
  --metrics-toggle-background-color: var(--color-gray-200);
  --plugin-badge-background-color: var(--color-white);
  --plugin-badge-size-big: calc(var(--gauge-circle-size-big) / 2.7);
  --plugin-badge-size: calc(var(--gauge-circle-size) / 2.7);
  --plugin-icon-size: 65%;
  --pwa-icon-margin: 0 6px 0 -2px;
  --pwa-icon-size: var(--topbar-logo-size);
  --report-background-color: #fff;
  --report-border-color-secondary: #ebebeb;
  --report-font-family-monospace: 'Roboto Mono', 'Menlo', 'dejavu sans mono', 'Consolas', 'Lucida Console', monospace;
  --report-font-family: Roboto, Helvetica, Arial, sans-serif;
  --report-font-size: 16px;
  --report-monospace-font-size: calc(var(--report-font-size) * 0.85);
  --report-line-height: 24px;
  --report-min-width: 400px;
  --report-text-color-secondary: var(--color-gray-800);
  --report-text-color: var(--color-gray-900);
  --report-width: calc(60 * var(--report-font-size));
  --score-container-padding: 8px;
  --score-icon-background-size: 24px;
  --score-icon-margin-left: 4px;
  --score-icon-margin-right: 12px;
  --score-icon-margin: 0 var(--score-icon-margin-right) 0 var(--score-icon-margin-left);
  --score-icon-size: 12px;
  --scores-container-padding: 20px 0 20px 0;
  --scorescale-height: 6px;
  --scorescale-width: 18px;
  --section-padding-vertical: 12px;
  --snippet-background-color: var(--color-gray-50);
  --snippet-color: #0938C2;
  --sparkline-height: 5px;
  --stackpack-padding-horizontal: 10px;
  --sticky-header-background-color: var(--report-background-color);
  --table-higlight-background-color: hsla(0, 0%, 75%, 0.1);
  --tools-icon-color: var(--color-gray-600);
  --tools-icon-size: var(--score-icon-background-size);
  --topbar-background-color: var(--color-gray-100);
  --topbar-height: 32px;
  --topbar-logo-size: 24px;
  --topbar-padding: 0 8px;
  --toplevel-warning-background-color: var(--color-orange-50);
  --toplevel-warning-message-text-color: #BD4200;
  --toplevel-warning-padding: 18px;
  --toplevel-warning-text-color: var(--report-text-color);

  /* SVGs */
  --plugin-icon-url-dark: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" viewBox="0 0 24 24" fill="%23FFFFFF"><path d="M0 0h24v24H0z" fill="none"/><path d="M20.5 11H19V7c0-1.1-.9-2-2-2h-4V3.5C13 2.12 11.88 1 10.5 1S8 2.12 8 3.5V5H4c-1.1 0-1.99.9-1.99 2v3.8H3.5c1.49 0 2.7 1.21 2.7 2.7s-1.21 2.7-2.7 2.7H2V20c0 1.1.9 2 2 2h3.8v-1.5c0-1.49 1.21-2.7 2.7-2.7 1.49 0 2.7 1.21 2.7 2.7V22H17c1.1 0 2-.9 2-2v-4h1.5c1.38 0 2.5-1.12 2.5-2.5S21.88 11 20.5 11z"/></svg>');
  --plugin-icon-url: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" viewBox="0 0 24 24" fill="%23757575"><path d="M0 0h24v24H0z" fill="none"/><path d="M20.5 11H19V7c0-1.1-.9-2-2-2h-4V3.5C13 2.12 11.88 1 10.5 1S8 2.12 8 3.5V5H4c-1.1 0-1.99.9-1.99 2v3.8H3.5c1.49 0 2.7 1.21 2.7 2.7s-1.21 2.7-2.7 2.7H2V20c0 1.1.9 2 2 2h3.8v-1.5c0-1.49 1.21-2.7 2.7-2.7 1.49 0 2.7 1.21 2.7 2.7V22H17c1.1 0 2-.9 2-2v-4h1.5c1.38 0 2.5-1.12 2.5-2.5S21.88 11 20.5 11z"/></svg>');

  --pass-icon-url: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48"><title>check</title><path fill="%23178239" d="M24 4C12.95 4 4 12.95 4 24c0 11.04 8.95 20 20 20 11.04 0 20-8.96 20-20 0-11.05-8.96-20-20-20zm-4 30L10 24l2.83-2.83L20 28.34l15.17-15.17L38 16 20 34z"/></svg>');
  --average-icon-url: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48"><title>info</title><path fill="%23E67700" d="M24 4C12.95 4 4 12.95 4 24s8.95 20 20 20 20-8.95 20-20S35.05 4 24 4zm2 30h-4V22h4v12zm0-16h-4v-4h4v4z"/></svg>');
  --fail-icon-url: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48"><title>warn</title><path fill="%23C7221F" d="M2 42h44L24 4 2 42zm24-6h-4v-4h4v4zm0-8h-4v-8h4v8z"/></svg>');

  --pwa-fast-reliable-gray-url: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg"><g fill="none" fill-rule="nonzero"><circle fill="%23DAE0E3" cx="12" cy="12" r="12"/><path d="M12.3 4l6.3 2.8V11c0 3.88-2.69 7.52-6.3 8.4C8.69 18.52 6 14.89 6 11V6.8L12.3 4zm-.56 12.88l3.3-5.79.04-.08c.05-.1.01-.29-.26-.29h-1.96l.56-3.92h-.56L9.6 12.52c0 .03.07-.12-.03.07-.11.2-.12.37.2.37h1.97l-.56 3.92h.56z" fill="%23FFF"/></g></svg>');
  --pwa-installable-gray-url: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg"><g fill="none" fill-rule="nonzero"><circle fill="%23DAE0E3" cx="12" cy="12" r="12"/><path d="M12 5a7 7 0 1 0 0 14 7 7 0 0 0 0-14zm3.5 7.7h-2.8v2.8h-1.4v-2.8H8.5v-1.4h2.8V8.5h1.4v2.8h2.8v1.4z" fill="%23FFF"/></g></svg>');
  --pwa-optimized-gray-url: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg"><g fill="none" fill-rule="evenodd"><rect fill="%23DAE0E3" width="24" height="24" rx="12"/><path fill="%23FFF" d="M12 15.07l3.6 2.18-.95-4.1 3.18-2.76-4.2-.36L12 6.17l-1.64 3.86-4.2.36 3.2 2.76-.96 4.1z"/><path d="M5 5h14v14H5z"/></g></svg>');

  --pwa-fast-reliable-gray-url-dark: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg"><g fill="none" fill-rule="nonzero"><circle fill="%23424242" cx="12" cy="12" r="12"/><path d="M12.3 4l6.3 2.8V11c0 3.88-2.69 7.52-6.3 8.4C8.69 18.52 6 14.89 6 11V6.8L12.3 4zm-.56 12.88l3.3-5.79.04-.08c.05-.1.01-.29-.26-.29h-1.96l.56-3.92h-.56L9.6 12.52c0 .03.07-.12-.03.07-.11.2-.12.37.2.37h1.97l-.56 3.92h.56z" fill="%23FFF"/></g></svg>');
  --pwa-installable-gray-url-dark: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg"><g fill="none" fill-rule="nonzero"><circle fill="%23424242" cx="12" cy="12" r="12"/><path d="M12 5a7 7 0 1 0 0 14 7 7 0 0 0 0-14zm3.5 7.7h-2.8v2.8h-1.4v-2.8H8.5v-1.4h2.8V8.5h1.4v2.8h2.8v1.4z" fill="%23FFF"/></g></svg>');
  --pwa-optimized-gray-url-dark: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg"><g fill="none" fill-rule="evenodd"><rect fill="%23424242" width="24" height="24" rx="12"/><path fill="%23FFF" d="M12 15.07l3.6 2.18-.95-4.1 3.18-2.76-4.2-.36L12 6.17l-1.64 3.86-4.2.36 3.2 2.76-.96 4.1z"/><path d="M5 5h14v14H5z"/></g></svg>');

  --pwa-fast-reliable-color-url: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg"><g fill-rule="nonzero" fill="none"><circle fill="%230CCE6B" cx="12" cy="12" r="12"/><path d="M12 4.3l6.3 2.8v4.2c0 3.88-2.69 7.52-6.3 8.4-3.61-.88-6.3-4.51-6.3-8.4V7.1L12 4.3zm-.56 12.88l3.3-5.79.04-.08c.05-.1.01-.29-.26-.29h-1.96l.56-3.92h-.56L9.3 12.82c0 .03.07-.12-.03.07-.11.2-.12.37.2.37h1.97l-.56 3.92h.56z" fill="%23FFF"/></g></svg>');
  --pwa-installable-color-url: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg"><g fill-rule="nonzero" fill="none"><circle fill="%230CCE6B" cx="12" cy="12" r="12"/><path d="M12 5a7 7 0 1 0 0 14 7 7 0 0 0 0-14zm3.5 7.7h-2.8v2.8h-1.4v-2.8H8.5v-1.4h2.8V8.5h1.4v2.8h2.8v1.4z" fill="%23FFF"/></g></svg>');
  --pwa-optimized-color-url: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg"><g fill="none" fill-rule="evenodd"><rect fill="%230CCE6B" width="24" height="24" rx="12"/><path d="M5 5h14v14H5z"/><path fill="%23FFF" d="M12 15.07l3.6 2.18-.95-4.1 3.18-2.76-4.2-.36L12 6.17l-1.64 3.86-4.2.36 3.2 2.76-.96 4.1z"/></g></svg>');
}

@media not print {
  .lh-vars.dark {
    /* Pallete */
    --color-gray-200: var(--color-gray-800);
    --color-gray-400: var(--color-gray-600);
    --color-gray-700: var(--color-gray-400);
    --color-gray-50: #757575;
    --color-gray-600: var(--color-gray-500);
    --color-green-700: var(--color-green);
    --color-orange-700: var(--color-orange);
    --color-red-700: var(--color-red);
    --color-teal-600: var(--color-cyan-500);

    /* Context-specific colors */
    --color-hover: rgba(0, 0, 0, 0.2);
    --color-informative: var(--color-blue-200);

    /* Component variables */
    --env-item-background-color: var(--color-gray);
    --plugin-badge-background-color: var(--color-gray-800);
    --report-background-color: var(--color-gray-900);
    --report-border-color-secondary: var(--color-gray-200);
    --report-text-color-secondary: var(--color-gray-400);
    --report-text-color: var(--color-gray-100);
    --snippet-color: var(--color-cyan-500);
    --topbar-background-color: var(--color-gray);
  	--toplevel-warning-background-color: #544B40;
  	--toplevel-warning-message-text-color: var(--color-orange-700);
	--toplevel-warning-text-color: var(--color-gray-100);

    /* SVGs */
    --plugin-icon-url: var(--plugin-icon-url-dark);
    --pwa-fast-reliable-gray-url: var(--pwa-fast-reliable-gray-url-dark);
    --pwa-installable-gray-url: var(--pwa-installable-gray-url-dark);
    --pwa-optimized-gray-url: var(--pwa-optimized-gray-url-dark);
  }
}

@media only screen and (max-width: 480px) {
  .lh-vars {
    --audit-group-margin-bottom: 20px;
    --category-padding: 24px;
    --env-name-min-width: 120px;
    --gauge-circle-size-big: 96px;
    --gauge-circle-size: 72px;
    --gauge-label-font-size-big: 22px;
    --gauge-label-font-size: 14px;
    --gauge-label-line-height-big: 26px;
    --gauge-label-line-height: 20px;
    --gauge-percentage-font-size-big: 34px;
    --gauge-percentage-font-size: 26px;
    --gauge-wrapper-width: 112px;
    --header-padding: 16px 0 16px 0;
    --image-preview-size: 24px;
    --plugin-icon-size: 75%;
    --pwa-icon-margin: 0 7px 0 -3px;
    --report-font-size: 14px;
    --report-line-height: 20px;
    --score-icon-margin-left: 2px;
    --score-icon-size: 10px;
    --topbar-height: 28px;
    --topbar-logo-size: 20px;
  }

  /* Not enough space to adequately show the relative savings bars. */
  .lh-sparkline {
    display: none;
  }
}

.lh-vars.lh-devtools {
  --audit-explanation-line-height: 14px;
  --audit-group-margin-bottom: 20px;
  --audit-group-padding-vertical: 12px;
  --audit-padding-vertical: 4px;
  --category-header-font-size: 16px;
  --category-padding: 12px;
  --default-padding: 12px;
  --env-name-min-width: 120px;
  --footer-padding-vertical: 8px;
  --gauge-circle-size-big: 72px;
  --gauge-circle-size: 64px;
  --gauge-label-font-size-big: 22px;
  --gauge-label-font-size: 14px;
  --gauge-label-line-height-big: 26px;
  --gauge-label-line-height: 20px;
  --gauge-percentage-font-size-big: 34px;
  --gauge-percentage-font-size: 26px;
  --gauge-wrapper-width: 97px;
  --header-line-height: 20px;
  --header-padding: 16px 0 16px 0;
  --plugin-icon-size: 75%;
  --pwa-icon-margin: 0 7px 0 -3px;
  --report-font-family-monospace: 'Menlo', 'dejavu sans mono', 'Consolas', 'Lucida Console', monospace;
  --report-font-family: '.SFNSDisplay-Regular', 'Helvetica Neue', 'Lucida Grande', sans-serif;
  --report-font-size: 12px;
  --report-line-height: 20px;
  --score-icon-margin-left: 2px;
  --score-icon-size: 10px;
  --section-padding-vertical: 8px;
}

.lh-devtools.lh-root {
  height: 100%;
}
.lh-devtools.lh-root img {
  /* Override devtools default 'min-width: 0' so svg without size in a flexbox isn't collapsed. */
  min-width: auto;
}
.lh-devtools .lh-container {
  overflow-y: scroll;
  height: calc(100% - var(--topbar-height));
}
@media print {
  .lh-devtools .lh-container {
    overflow: unset;
  }
}
.lh-devtools .lh-sticky-header {
  /* This is normally the height of the topbar, but we want it to stick to the top of our scroll container .lh-container` */
  top: 0;
}

@keyframes fadeIn {
  0% { opacity: 0;}
  100% { opacity: 0.6;}
}

.lh-root *, .lh-root *::before, .lh-root *::after {
  box-sizing: border-box;
  -webkit-font-smoothing: antialiased;
}

.lh-root {
  font-family: var(--report-font-family);
  font-size: var(--report-font-size);
  margin: 0;
  line-height: var(--report-line-height);
  background: var(--report-background-color);
  scroll-behavior: smooth;
  color: var(--report-text-color);
}

.lh-root :focus {
    outline: -webkit-focus-ring-color auto 3px;
}
.lh-root summary:focus {
    outline: none;
    box-shadow: 0 0 0 1px hsl(217, 89%, 61%);
}

.lh-root [hidden] {
  display: none !important;
}

.lh-root pre {
  margin: 0;
}

.lh-root details > summary {
  cursor: pointer;
}

.lh-container {
  /*
  Text wrapping in the report is so much FUN!
  We have a `word-break: break-word;` globally here to prevent a few common scenarios, namely
  long non-breakable text (usually URLs) found in:
    1. The footer
    2. .lh-node (outerHTML)
    3. .lh-code

  With that sorted, the next challenge is appropriate column sizing and text wrapping inside our
  .lh-details tables. Even more fun.
    * We don't want table headers ("Potential Savings (ms)") to wrap or their column values, but
    we'd be happy for the URL column to wrap if the URLs are particularly long.
    * We want the narrow columns to remain narrow, providing the most column width for URL
    * We don't want the table to extend past 100% width.
    * Long URLs in the URL column can wrap. Util.getURLDisplayName maxes them out at 64 characters,
      but they do not get any overflow:ellipsis treatment.
  */
  word-break: break-word;
}

.lh-audit-group a,
.lh-category-header__description a,
.lh-audit__description a,
.lh-footer a,
.lh-table-column--link a {
  color: var(--color-informative);
}

.lh-audit__description, .lh-audit__stackpack {
  --inner-audit-padding-right: var(--stackpack-padding-horizontal);
  padding-left: var(--audit-description-padding-left);
  padding-right: var(--inner-audit-padding-right);
  padding-top: 8px;
  padding-bottom: 8px;
}

.lh-details {
  font-size: var(--report-font-size);
  margin-top: var(--default-padding);
  margin-bottom: var(--default-padding);
  margin-left: var(--audit-description-padding-left);
  /* whatever the .lh-details side margins are */
  width: 100%;
}

.lh-details.flex .lh-code {
  max-width: 70%;
}

.lh-audit__stackpack {
  display: flex;
  align-items: center;
}

.lh-audit__stackpack__img {
  max-width: 50px;
  margin-right: var(--default-padding)
}

/* Report header */

.report-icon {
  opacity: 0.7;
}
.report-icon:hover {
  opacity: 1;
}
.report-icon[disabled] {
  opacity: 0.3;
  pointer-events: none;
}

.report-icon--print {
  background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M19 8H5c-1.66 0-3 1.34-3 3v6h4v4h12v-4h4v-6c0-1.66-1.34-3-3-3zm-3 11H8v-5h8v5zm3-7c-.55 0-1-.45-1-1s.45-1 1-1 1 .45 1 1-.45 1-1 1zm-1-9H6v4h12V3z"/><path fill="none" d="M0 0h24v24H0z"/></svg>');
}
.report-icon--copy {
  background-image: url('data:image/svg+xml;utf8,<svg height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="M0 0h24v24H0z" fill="none"/><path d="M16 1H4c-1.1 0-2 .9-2 2v14h2V3h12V1zm3 4H8c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h11c1.1 0 2-.9 2-2V7c0-1.1-.9-2-2-2zm0 16H8V7h11v14z"/></svg>');
}
.report-icon--open {
  background-image: url('data:image/svg+xml;utf8,<svg height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="M0 0h24v24H0z" fill="none"/><path d="M19 4H5c-1.11 0-2 .9-2 2v12c0 1.1.89 2 2 2h4v-2H5V8h14v10h-4v2h4c1.1 0 2-.9 2-2V6c0-1.1-.89-2-2-2zm-7 6l-4 4h3v6h2v-6h3l-4-4z"/></svg>');
}
.report-icon--download {
  background-image: url('data:image/svg+xml;utf8,<svg height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="M19 9h-4V3H9v6H5l7 7 7-7zM5 18v2h14v-2H5z"/><path d="M0 0h24v24H0z" fill="none"/></svg>');
}
.report-icon--dark {
  background-image:url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 100 125"><path d="M50 23.587c-16.27 0-22.799 12.574-22.799 21.417 0 12.917 10.117 22.451 12.436 32.471h20.726c2.32-10.02 12.436-19.554 12.436-32.471 0-8.843-6.528-21.417-22.799-21.417zM39.637 87.161c0 3.001 1.18 4.181 4.181 4.181h.426l.41 1.231C45.278 94.449 46.042 95 48.019 95h3.963c1.978 0 2.74-.551 3.365-2.427l.409-1.231h.427c3.002 0 4.18-1.18 4.18-4.181V80.91H39.637v6.251zM50 18.265c1.26 0 2.072-.814 2.072-2.073v-9.12C52.072 5.813 51.26 5 50 5c-1.259 0-2.072.813-2.072 2.073v9.12c0 1.259.813 2.072 2.072 2.072zM68.313 23.727c.994.774 2.135.634 2.91-.357l5.614-7.187c.776-.992.636-2.135-.356-2.909-.992-.776-2.135-.636-2.91.357l-5.613 7.186c-.778.993-.636 2.135.355 2.91zM91.157 36.373c-.306-1.222-1.291-1.815-2.513-1.51l-8.85 2.207c-1.222.305-1.814 1.29-1.51 2.512.305 1.223 1.291 1.814 2.513 1.51l8.849-2.206c1.223-.305 1.816-1.291 1.511-2.513zM86.757 60.48l-8.331-3.709c-1.15-.512-2.225-.099-2.736 1.052-.512 1.151-.1 2.224 1.051 2.737l8.33 3.707c1.15.514 2.225.101 2.736-1.05.513-1.149.1-2.223-1.05-2.737zM28.779 23.37c.775.992 1.917 1.131 2.909.357.992-.776 1.132-1.917.357-2.91l-5.615-7.186c-.775-.992-1.917-1.132-2.909-.357s-1.131 1.917-.356 2.909l5.614 7.187zM21.715 39.583c.305-1.223-.288-2.208-1.51-2.513l-8.849-2.207c-1.222-.303-2.208.289-2.513 1.511-.303 1.222.288 2.207 1.511 2.512l8.848 2.206c1.222.304 2.208-.287 2.513-1.509zM21.575 56.771l-8.331 3.711c-1.151.511-1.563 1.586-1.05 2.735.511 1.151 1.586 1.563 2.736 1.052l8.331-3.711c1.151-.511 1.563-1.586 1.05-2.735-.512-1.15-1.585-1.562-2.736-1.052z"/></svg>');
}

/* Node */
.lh-node__snippet {
  font-family: var(--report-font-family-monospace);
  color: var(--snippet-color);
  font-size: var(--report-monospace-font-size);
  line-height: 20px;
}

/* Score */

.lh-audit__score-icon {
  width: var(--score-icon-size);
  height: var(--score-icon-size);
  margin: var(--score-icon-margin);
}

.lh-audit--pass .lh-audit__display-text {
  color: var(--color-pass-secondary);
}
.lh-audit--pass .lh-audit__score-icon, 
.lh-scorescale-range--pass::before {
  border-radius: 100%;
  background: var(--color-pass);
}

.lh-audit--average .lh-audit__display-text {
  color: var(--color-average-secondary);
}
.lh-audit--average .lh-audit__score-icon, 
.lh-scorescale-range--average::before {
  background: var(--color-average);
  width: var(--icon-square-size);
  height: var(--icon-square-size);
}

.lh-audit--fail .lh-audit__display-text {
  color: var(--color-fail-secondary);
}
.lh-audit--fail .lh-audit__score-icon,
.lh-audit--error .lh-audit__score-icon, 
.lh-scorescale-range--fail::before {
  border-left: calc(var(--score-icon-size) / 2) solid transparent;
  border-right: calc(var(--score-icon-size) / 2) solid transparent;
  border-bottom: var(--score-icon-size) solid var(--color-fail);
}

.lh-audit--manual .lh-audit__display-text,
.lh-audit--notapplicable .lh-audit__display-text {
  color: var(--color-gray-600);
}
.lh-audit--manual .lh-audit__score-icon,
.lh-audit--notapplicable .lh-audit__score-icon {
  border-radius: 100%;
  background: var(--color-gray-400);
}

.lh-audit--informative .lh-audit__display-text {
  color: var(--color-gray-600);
}

.lh-audit--informative .lh-audit__score-icon {
  border: none;
  border-radius: 100%;
  background: var(--color-gray-400);
}

.lh-audit__description,
.lh-audit__stackpack {
  color: var(--report-text-color-secondary);
}
.lh-category-header__description  {
  font-size: var(--report-font-size);
  text-align: center;
  margin: 0px auto;
  max-width: 400px;
}


.lh-audit__display-text,
.lh-load-opportunity__sparkline,
.lh-chevron-container {
  margin: 0 var(--audit-margin-horizontal);
}
.lh-chevron-container {
  margin-right: 0;
}

.lh-audit__title-and-text {
  flex: 1;
}

.lh-audit__title-and-text code {
  color: var(--snippet-color);
  font-size: var(--report-monospace-font-size);
}

/* Prepend display text with em dash separator. But not in Opportunities. */
.lh-audit__display-text:not(:empty):before {
  content: '—';
  margin-right: var(--audit-margin-horizontal);
}
.lh-audit-group.lh-audit-group--load-opportunities .lh-audit__display-text:not(:empty):before {
  display: none;
}

/* Expandable Details (Audit Groups, Audits) */
.lh-audit__header {
  display: flex;
  align-items: center;
  font-weight: 500;
  padding: var(--audit-padding-vertical) 0;
}

.lh-audit--load-opportunity .lh-audit__header {
  display: block;
}

.lh-audit__header:hover {
  background-color: var(--color-hover);
}

/* Hide the expandable arrow icon, three ways: via the CSS Counter Styles spec, for webkit/blink browsers, hiding the polyfilled icon */
/* https://github.com/javan/details-element-polyfill/blob/master/src/details-element-polyfill/polyfill.sass */
.lh-audit-group > summary,
.lh-expandable-details > summary {
  list-style-type: none;
}
.lh-audit-group > summary::-webkit-details-marker,
.lh-expandable-details > summary::-webkit-details-marker {
  display: none;
}
.lh-audit-group > summary:before,
.lh-expandable-details > summary:before {
  display: none;
}

/* Perf Metric */

.lh-metrics-container {
  display: grid;
  grid-template-rows: 1fr 1fr 1fr;
  grid-auto-flow: column;
  grid-column-gap: 24px;
}

.lh-metric {
  border-top: 1px solid var(--report-border-color-secondary);
}

@media screen and (min-width: 640px) {
  .lh-metric:nth-child(3n+3) {
    border-bottom: 1px solid var(--report-border-color-secondary);
  }
}

@media screen and (max-width: 640px) {
  .lh-metrics-container {
    display: block;
  }

  .lh-metric:nth-last-child(-n+1) {
    border-bottom: 1px solid var(--report-border-color-secondary);
  }
}

.lh-metric__innerwrap {
  display: grid;
  grid-template-columns: var(--audit-description-padding-left) 10fr 3fr;
  align-items: center;
  padding: 10px 0;
}

.lh-metric__details {
  order: -1;
}

.lh-metric__title {
  flex: 1;
  font-weight: 500;
}

.lh-metrics__disclaimer {
  color: var(--color-gray-600);
  margin: var(--section-padding-vertical) 0;
}

.lh-calclink {
  padding-left: calc(1ex / 3);
}

.lh-metric__description {
  display: none;
  grid-column-start: 2;
  grid-column-end: 3;
  color: var(--report-text-color-secondary);
}

.lh-metric__value {
  white-space: nowrap; /* No wrapping between metric value and the icon */
  font-weight: 500;
  justify-self: end;
}

/* No-JS toggle switch */
/* Keep this selector sync'd w/ `magicSelector` in report-ui-features-test.js */
 .lh-metrics-toggle__input:checked ~ .lh-metrics-container .lh-metric__description {
  display: block;
}

.lh-metrics-toggle__input {
  cursor: pointer;
  opacity: 0;
  position: absolute;
  right: 0;
  width: 74px;
  height: 28px;
  top: -3px;
}
.lh-metrics-toggle__label {
  display: flex;
  background-color: #eee;
  border-radius: 20px;
  overflow: hidden;
  position: absolute;
  right: 0;
  top: -3px;
  pointer-events: none;
}
.lh-metrics-toggle__input:focus + label {
  outline: -webkit-focus-ring-color auto 3px;
}
.lh-metrics-toggle__icon {
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 2px 5px;
  width: 50%;
  height: 28px;
}
.lh-metrics-toggle__input:not(:checked) + label .lh-metrics-toggle__icon--less,
.lh-metrics-toggle__input:checked + label .lh-metrics-toggle__icon--more {
  background-color: var(--color-blue-A700);
  --metric-toggle-lines-fill: var(--color-white);
}
.lh-metrics-toggle__lines {
  fill: var(--metric-toggle-lines-fill);
}

.lh-metrics-toggle__label  {
  background-color: var(--metrics-toggle-background-color);
}

.lh-metrics-toggle__label .lh-metrics-toggle__icon--less {
  padding-left: 8px;
}
.lh-metrics-toggle__label .lh-metrics-toggle__icon--more {
  padding-right: 8px;
}

/* Pushes the metric description toggle button to the right. */
.lh-audit-group--metrics .lh-audit-group__header {
  display: flex;
}
.lh-audit-group--metrics .lh-audit-group__header span.lh-audit-group__title {
  flex: 1;
}

.lh-metric .lh-metric__innerwrap::before, 
.lh-scorescale-range::before {
  content: '';
  width: var(--score-icon-size);
  height: var(--score-icon-size);
  display: inline-block;
  margin: var(--score-icon-margin);
}

.lh-metric--pass .lh-metric__value {
  color: var(--color-pass-secondary);
}
.lh-metric--pass .lh-metric__innerwrap::before {
  border-radius: 100%;
  background: var(--color-pass);
}

.lh-metric--average .lh-metric__value {
  color: var(--color-average-secondary);
}
.lh-metric--average .lh-metric__innerwrap::before {
  background: var(--color-average);
  width: var(--icon-square-size);
  height: var(--icon-square-size);
}

.lh-metric--fail .lh-metric__value {
  color: var(--color-fail-secondary);
}
.lh-metric--fail .lh-metric__innerwrap::before,
.lh-metric--error .lh-metric__innerwrap::before {
  border-left: calc(var(--score-icon-size) / 2) solid transparent;
  border-right: calc(var(--score-icon-size) / 2) solid transparent;
  border-bottom: var(--score-icon-size) solid var(--color-fail);
}

.lh-metric--error .lh-metric__value,
.lh-metric--error .lh-metric__description {
  color: var(--color-fail-secondary);
}

/* Perf load opportunity */

.lh-load-opportunity__cols {
  display: flex;
  align-items: flex-start;
}

.lh-load-opportunity__header .lh-load-opportunity__col {
  color: var(--color-gray-600);
  display: unset;
  line-height: calc(2.3 * var(--report-font-size));
}

.lh-load-opportunity__col {
  display: flex;
}

.lh-load-opportunity__col--one {
  flex: 5;
  align-items: center;
  margin-right: 2px;
}
.lh-load-opportunity__col--two {
  flex: 4;
  text-align: right;
}

.lh-audit--load-opportunity .lh-audit__display-text {
  text-align: right;
  flex: 0 0 calc(3 * var(--report-font-size));
}


/* Sparkline */

.lh-load-opportunity__sparkline {
  flex: 1;
  margin-top: calc((var(--report-line-height) - var(--sparkline-height)) / 2);
}

.lh-sparkline {
  height: var(--sparkline-height);
  width: 100%;
}

.lh-sparkline__bar {
  height: 100%;
  float: right;
}

.lh-audit--pass .lh-sparkline__bar {
  background: var(--color-pass);
}

.lh-audit--average .lh-sparkline__bar {
  background: var(--color-average);
}

.lh-audit--fail .lh-sparkline__bar {
  background: var(--color-fail);
}



/* Filmstrip */

.lh-filmstrip-container {
  /* smaller gap between metrics and filmstrip */
  margin: -8px auto 0 auto;
}

.lh-filmstrip {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  padding-bottom: var(--default-padding);
}

.lh-filmstrip__frame {
  text-align: right;
  position: relative;
}

.lh-filmstrip__thumbnail {
  border: 1px solid var(--report-border-color-secondary);
  max-height: 100px;
  max-width: 60px;
}

@media screen and (max-width: 750px) {
  .lh-filmstrip {
    flex-wrap: wrap;
  }
  .lh-filmstrip__frame {
    width: 20%;
    margin-bottom: 5px;
  }
  .lh-filmstrip__thumbnail {
    display: block;
    margin: auto;
  }
}

/* Audit */

.lh-audit {
  border-bottom: 1px solid var(--report-border-color-secondary);
}

/* Apply border-top to just the first audit. */
.lh-audit {
  border-top: 1px solid var(--report-border-color-secondary);
}
.lh-audit ~ .lh-audit {
  border-top: none;
}


.lh-audit--error .lh-audit__display-text {
  color: var(--color-fail);
}

/* Audit Group */

.lh-audit-group {
  margin-bottom: var(--audit-group-margin-bottom);
  position: relative;
}

.lh-audit-group__header::before {
  /* By default, groups don't get an icon */
  content: none;
  width: var(--pwa-icon-size);
  height: var(--pwa-icon-size);
  margin: var(--pwa-icon-margin);
  display: inline-block;
  vertical-align: middle;
}

/* Style the "over budget" columns red. */
.lh-audit-group--budgets #performance-budget tbody tr td:nth-child(4),
.lh-audit-group--budgets #performance-budget tbody tr td:nth-child(5),
.lh-audit-group--budgets #timing-budget tbody tr td:nth-child(3) {
  color: var(--color-red-700);
}

/* Align the "over budget request count" text to be close to the "over budget bytes" column. */
.lh-audit-group--budgets .lh-table tbody tr td:nth-child(4){
  text-align: right;
}

.lh-audit-group--budgets .lh-table {
  width: 100%;
  margin: 16px 0px 16px 0px;
}

.lh-audit-group--pwa-fast-reliable .lh-audit-group__header::before {
  content: '';
  background-image: var(--pwa-fast-reliable-gray-url);
}
.lh-audit-group--pwa-installable .lh-audit-group__header::before {
  content: '';
  background-image: var(--pwa-installable-gray-url);
}
.lh-audit-group--pwa-optimized .lh-audit-group__header::before {
  content: '';
  background-image: var(--pwa-optimized-gray-url);
}
.lh-audit-group--pwa-fast-reliable.lh-badged .lh-audit-group__header::before {
  background-image: var(--pwa-fast-reliable-color-url);
}
.lh-audit-group--pwa-installable.lh-badged .lh-audit-group__header::before {
  background-image: var(--pwa-installable-color-url);
}
.lh-audit-group--pwa-optimized.lh-badged .lh-audit-group__header::before {
  background-image: var(--pwa-optimized-color-url);
}

.lh-audit-group--metrics .lh-audit-group__summary {
  margin-top: 0;
  margin-bottom: 0;
}

.lh-audit-group__summary {
  display: flex;
  justify-content: space-between;
  margin-top: calc(var(--category-padding) * 1.5);
  margin-bottom: var(--category-padding);
}

.lh-audit-group__itemcount {
  color: var(--color-gray-600);
  font-weight: bold;
}
.lh-audit-group__header .lh-chevron {
  margin-top: calc((var(--report-line-height) - 5px) / 2);
}

.lh-audit-group__header {
  font-size: var(--report-font-size);
  margin: 0 0 var(--audit-group-padding-vertical);
  /* When the header takes 100% width, the chevron becomes small. */
  max-width: calc(100% - var(--chevron-size));
}
/* max-width makes the metric toggle not flush. metrics doesn't have a chevron so unset. */
.lh-audit-group--metrics .lh-audit-group__header {
  max-width: unset;
}

.lh-audit-group__header span.lh-audit-group__title {
  font-weight: bold;
}

.lh-audit-group__header span.lh-audit-group__itemcount {
  font-weight: bold;
  color: var(--color-gray-600);
}

.lh-audit-group__header span.lh-audit-group__description {
  font-weight: 500;
  color: var(--color-gray-600);
}
.lh-audit-group__header span.lh-audit-group__description::before {
  content: '—';
  margin: 0px var(--audit-margin-horizontal);
}

.lh-clump > .lh-audit-group__header,
.lh-audit-group--diagnostics .lh-audit-group__header,
.lh-audit-group--load-opportunities .lh-audit-group__header,
.lh-audit-group--metrics .lh-audit-group__header,
.lh-audit-group--pwa-fast-reliable .lh-audit-group__header,
.lh-audit-group--pwa-installable .lh-audit-group__header,
.lh-audit-group--pwa-optimized .lh-audit-group__header {
  margin-top: var(--audit-group-padding-vertical);
}

.lh-audit-explanation {
  margin: var(--audit-padding-vertical) 0 calc(var(--audit-padding-vertical) / 2) var(--audit-margin-horizontal);
  line-height: var(--audit-explanation-line-height);
  display: inline-block;
}

.lh-audit--fail .lh-audit-explanation {
  color: var(--color-fail);
}

/* Report */
.lh-list > div:not(:last-child) {
  padding-bottom: 20px;
}

.lh-header-container {
  display: block;
  margin: 0 auto;
  position: relative;
  word-wrap: break-word;
}

.lh-report {
  min-width: var(--report-min-width);
}

.lh-exception {
  font-size: large;
}

.lh-code {
  white-space: normal;
  margin-top: 0;
  font-size: var(--report-monospace-font-size);
}

.lh-warnings {
  --item-margin: calc(var(--report-line-height) / 6);
  color: var(--color-average);
  margin: var(--audit-padding-vertical) 0;
  padding: calc(var(--audit-padding-vertical) / 2) calc(var(--audit-description-padding-left));
}
.lh-warnings span {
  font-weight: bold;
}

.lh-warnings--toplevel {
  --item-margin: calc(var(--header-line-height) / 4);
  color: var(--toplevel-warning-text-color);
  margin-left: auto;
  margin-right: auto;
  max-width: calc(var(--report-width) - var(--category-padding) * 2);
  background-color: var(--toplevel-warning-background-color);
  padding: var(--toplevel-warning-padding);
  border-radius: 8px;
}

.lh-warnings__msg {
  color: var(--toplevel-warning-message-text-color);
  margin: 0;
}

.lh-warnings ul {
  margin: 0;
}
.lh-warnings li {
  margin: var(--item-margin) 0;
}
.lh-warnings li:last-of-type {
  margin-bottom: 0;
}

.lh-scores-header {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
}
.lh-scores-header__solo {
  padding: 0;
  border: 0;
}

/* Gauge */

.lh-gauge__wrapper--pass {
  color: var(--color-pass);
  fill: var(--color-pass);
  stroke: var(--color-pass);
}

.lh-gauge__wrapper--average {
  color: var(--color-average);
  fill: var(--color-average);
  stroke: var(--color-average);
}

.lh-gauge__wrapper--fail {
  color: var(--color-fail);
  fill: var(--color-fail);
  stroke: var(--color-fail);
}

.lh-gauge__wrapper--not-applicable {
  color: var(--color-not-applicable);
  fill: var(--color-not-applicable);
  stroke: var(--color-not-applicable);
}

.lh-gauge {
  stroke-linecap: round;
  width: var(--gauge-circle-size);
  height: var(--gauge-circle-size);
}

.lh-category .lh-gauge {
  --gauge-circle-size: var(--gauge-circle-size-big);
}

.lh-gauge-base {
    opacity: 0.1;
    stroke: var(--circle-background);
}

.lh-gauge-arc {
    fill: none;
    stroke: var(--circle-color);
    transform-origin: 50% 50%;
    animation: load-gauge var(--transition-length) ease forwards;
    animation-delay: 250ms;
}

.lh-gauge__svg-wrapper {
  position: relative;
  height: var(--gauge-circle-size);
}
.lh-category .lh-gauge__svg-wrapper {
  --gauge-circle-size: var(--gauge-circle-size-big);
}

/* The plugin badge overlay */
.lh-gauge__wrapper--plugin .lh-gauge__svg-wrapper::before {
  width: var(--plugin-badge-size);
  height: var(--plugin-badge-size);
  background-color: var(--plugin-badge-background-color);
  background-image: var(--plugin-icon-url);
  background-repeat: no-repeat;
  background-size: var(--plugin-icon-size);
  background-position: 58% 50%;
  content: "";
  position: absolute;
  right: -6px;
  bottom: 0px;
  display: block;
  z-index: 100;
  box-shadow: 0 0 4px rgba(0,0,0,.2);
  border-radius: 25%;
}
.lh-category .lh-gauge__wrapper--plugin .lh-gauge__svg-wrapper::before {
  width: var(--plugin-badge-size-big);
  height: var(--plugin-badge-size-big);
}

@keyframes load-gauge {
  from { stroke-dasharray: 0 352; }
}

.lh-gauge__percentage {
  width: 100%;
  height: var(--gauge-circle-size);
  position: absolute;
  font-family: var(--report-font-family-monospace);
  font-size: calc(var(--gauge-circle-size) * 0.34 + 1.3px);
  line-height: 0;
  text-align: center;
  top: calc(var(--score-container-padding) + var(--gauge-circle-size) / 2);
}

.lh-category .lh-gauge__percentage {
  --gauge-circle-size: var(--gauge-circle-size-big);
  --gauge-percentage-font-size: var(--gauge-percentage-font-size-big);
}

.lh-gauge__wrapper {
  position: relative;
  display: flex;
  align-items: center;
  flex-direction: column;
  text-decoration: none;
  padding: var(--score-container-padding);

  --transition-length: 1s;

  /* Contain the layout style paint & layers during animation*/
  contain: content;
  will-change: opacity; /* Only using for layer promotion */
}

.lh-gauge__label {
  font-size: var(--gauge-label-font-size);
  line-height: var(--gauge-label-line-height);
  margin-top: 10px;
  text-align: center;
  color: var(--report-text-color);
}

/* TODO(#8185) use more BEM (.lh-gauge__label--big) instead of relying on descendant selector */
.lh-category .lh-gauge__label {
  --gauge-label-font-size: var(--gauge-label-font-size-big);
  --gauge-label-line-height: var(--gauge-label-line-height-big);
  margin-top: 14px;
}


.lh-scores-header .lh-gauge__wrapper,
.lh-scores-header .lh-gauge--pwa__wrapper,
.lh-sticky-header .lh-gauge__wrapper,
.lh-sticky-header .lh-gauge--pwa__wrapper {
  width: var(--gauge-wrapper-width);
}

.lh-scorescale {
  display: inline-flex;
  margin: 12px auto 0 auto;
  border: 1px solid var(--color-gray-200);
  border-radius: 20px;
  padding: 8px 8px;
}

.lh-scorescale-range {
  display: flex;
  align-items: center;
  margin: 0 12px;
  font-family: var(--report-font-family-monospace);
  white-space: nowrap;
}

/* Hide category score gauages if it's a single category report */
.lh-header--solo-category .lh-scores-wrapper {
  display: none;
}


.lh-categories {
  width: 100%;
  overflow: hidden;
}

.lh-category {
  padding: var(--category-padding);
  max-width: var(--report-width);
  margin: 0 auto;
}

.lh-category-wrapper {
  border-bottom: 1px solid var(--color-gray-200);
}

.lh-category-wrapper:first-of-type {
  border-top: 1px solid var(--color-gray-200);
}

/* section hash link jump should preserve fixed header
   https://css-tricks.com/hash-tag-links-padding/
*/
.lh-category > .lh-permalink {
  --sticky-header-height: calc(var(--gauge-circle-size) + var(--score-container-padding) * 2);
  --topbar-plus-header: calc(var(--topbar-height) + var(--sticky-header-height));
  margin-top: calc(var(--topbar-plus-header) * -1);
  padding-bottom: var(--topbar-plus-header);
  display: block;
  visibility: hidden;
}

.lh-category-header {
  font-size: var(--category-header-font-size);
  min-height: var(--gauge-circle-size);
  margin-bottom: var(--section-padding-vertical);
}

.lh-category-header .lh-score__gauge {
  max-width: 400px;
  width: auto;
  margin: 0px auto;
}

.lh-category-header .lh-audit__title {
  font-size: var(--category-header-font-size);
  line-height: var(--header-line-height);
}

#lh-log {
  position: fixed;
  background-color: #323232;
  color: #fff;
  min-height: 48px;
  min-width: 288px;
  padding: 16px 24px;
  box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.26);
  border-radius: 2px;
  margin: 12px;
  font-size: 14px;
  cursor: default;
  transition: transform 0.3s, opacity 0.3s;
  transform: translateY(100px);
  opacity: 0;
  bottom: 0;
  left: 0;
  z-index: 3;
}

#lh-log.show {
  opacity: 1;
  transform: translateY(0);
}

/* 964 fits the min-width of the filmstrip */
@media screen and (max-width: 964px) {
  .lh-report {
    margin-left: 0;
    width: 100%;
  }
}

@media print {
  body {
    -webkit-print-color-adjust: exact; /* print background colors */
  }
  .lh-container {
    display: block;
  }
  .lh-report {
    margin-left: 0;
    padding-top: 0;
  }
  .lh-categories {
    margin-top: 0;
  }
}

.lh-table {
  border-collapse: collapse;
  /* Can't assign padding to table, so shorten the width instead. */
  width: calc(100% - var(--audit-description-padding-left));
}

.lh-table thead th {
  font-weight: normal;
  color: var(--color-gray-600);
  /* See text-wrapping comment on .lh-container. */
  word-break: normal;
}

.lh-row--odd {
  background-color: var(--table-higlight-background-color);
}
.lh-row--hidden {
  display: none;
}

.lh-table th,
.lh-table td {
  padding: 8px 6px;
}
.lh-table th:first-child {
  padding-left: 0;
}
.lh-table th:last-child {
  padding-right: 0;
}

.lh-table tr {
  vertical-align: middle;
}

/* Looks unnecessary, but mostly for keeping the <th>s left-aligned */
.lh-table-column--text,
.lh-table-column--source-location,
.lh-table-column--url,
/* .lh-table-column--thumbnail, */
/* .lh-table-column--empty,*/
.lh-table-column--code,
.lh-table-column--node {
  text-align: left;
}

.lh-table-column--code {
  min-width: 100px;
}

.lh-table-column--bytes,
.lh-table-column--timespanMs,
.lh-table-column--ms,
.lh-table-column--numeric {
  text-align: right;
  word-break: normal;
}



.lh-table .lh-table-column--thumbnail {
  width: var(--image-preview-size);
  padding: 0;
}

.lh-table-column--url {
  min-width: 250px;
}

.lh-table-column--text {
  min-width: 80px;
}

/* Keep columns narrow if they follow the URL column */
/* 12% was determined to be a decent narrow width, but wide enough for column headings */
.lh-table-column--url + th.lh-table-column--bytes,
.lh-table-column--url + .lh-table-column--bytes + th.lh-table-column--bytes,
.lh-table-column--url + .lh-table-column--ms,
.lh-table-column--url + .lh-table-column--ms + th.lh-table-column--bytes,
.lh-table-column--url + .lh-table-column--bytes + th.lh-table-column--timespanMs {
  width: 12%;
}


.lh-text__url-host {
  display: inline;
}

.lh-text__url-host {
  margin-left: calc(var(--report-font-size) / 2);
  opacity: 0.6;
  font-size: 90%
}

.lh-thumbnail {
  object-fit: cover;
  width: var(--image-preview-size);
  height: var(--image-preview-size);
  display: block;
}

.lh-unknown pre {
  overflow: scroll;
  border: solid 1px var(--color-gray-200);
}

.lh-text__url > a {
  color: inherit;
  text-decoration: none;
}

.lh-text__url > a:hover {
  text-decoration: underline dotted #999;
}

.lh-sub-item-row {
  margin-left: 20px;
  margin-bottom: 0;
  color: var(--color-gray-700);
}
.lh-sub-item-row td {
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 20px;
}

/* Chevron
   https://codepen.io/paulirish/pen/LmzEmK
 */
.lh-chevron {
  --chevron-angle: 42deg;
  /* Edge doesn't support transform: rotate(calc(...)), so we define it here */
  --chevron-angle-right: -42deg;
  width: var(--chevron-size);
  height: var(--chevron-size);
  margin-top: calc((var(--report-line-height) - 12px) / 2);
}

.lh-chevron__lines {
  transition: transform 0.4s;
  transform: translateY(var(--report-line-height));
}
.lh-chevron__line {
 stroke: var(--chevron-line-stroke);
 stroke-width: var(--chevron-size);
 stroke-linecap: square;
 transform-origin: 50%;
 transform: rotate(var(--chevron-angle));
 transition: transform 300ms, stroke 300ms;
}

.lh-audit-group > summary > .lh-audit-group__summary > .lh-chevron .lh-chevron__line-right,
.lh-audit-group[open] > summary > .lh-audit-group__summary > .lh-chevron .lh-chevron__line-left,
.lh-audit > .lh-expandable-details .lh-chevron__line-right,
.lh-audit > .lh-expandable-details[open] .lh-chevron__line-left {
 transform: rotate(var(--chevron-angle-right));
}

.lh-audit-group[open] > summary > .lh-audit-group__summary > .lh-chevron .lh-chevron__line-right,
.lh-audit > .lh-expandable-details[open] .lh-chevron__line-right {
  transform: rotate(var(--chevron-angle));
}

.lh-audit-group[open] > summary > .lh-audit-group__summary > .lh-chevron .lh-chevron__lines,
.lh-audit > .lh-expandable-details[open] .lh-chevron__lines {
 transform: translateY(calc(var(--chevron-size) * -1));
}



/* Tooltip */
.tooltip-boundary {
  position: relative;
}

.tooltip {
  position: absolute;
  display: none; /* Don't retain these layers when not needed */
  opacity: 0;
  background: #ffffff;
  min-width: 246px;
  max-width: 275px;
  padding: 15px;
  border-radius: 5px;
  text-align: initial;
}
/* shrink tooltips to not be cutoff on left edge of narrow viewports
   45vw is chosen to be ~= width of the left column of metrics
*/
@media screen and (max-width: 535px) {
  .tooltip {
    min-width: 45vw;
    padding: 3vw;
  }
}

.tooltip-boundary:hover {
  background-color: var(--color-hover);
}

.tooltip-boundary:hover .tooltip {
  display: block;
  animation: fadeInTooltip 250ms;
  animation-fill-mode: forwards;
  animation-delay: 850ms;
  bottom: 100%;
  z-index: 1;
  will-change: opacity;
  right: 0;
  pointer-events: none;
}

.tooltip::before {
  content: "";
  border: solid transparent;
  border-bottom-color: #fff;
  border-width: 10px;
  position: absolute;
  bottom: -20px;
  right: 6px;
  transform: rotate(180deg);
  pointer-events: none;
}

@keyframes fadeInTooltip {
  0% { opacity: 0; }
  75% { opacity: 1; }
  100% { opacity: 1;  filter: drop-shadow(1px 0px 1px #aaa) drop-shadow(0px 2px 4px hsla(206, 6%, 25%, 0.15)); pointer-events: auto; }
}

/* Element screenshot */
.lh-element-screenshot {
  position: relative;
  overflow: hidden;
  float: left;
  margin-right: 20px;
}
.lh-element-screenshot__content {
  overflow: hidden;
}
.lh-element-screenshot__image {
  outline: 2px solid #777;
  background-color: white;
  background-repeat: no-repeat;
}
.lh-element-screenshot__mask {
  position: absolute;
  background: #555;
  opacity: 0.8;
}
.lh-element-screenshot__element-marker {
  position: absolute;
  outline: 2px solid var(--color-lime-400);
}
.lh-element-screenshot__overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  z-index: 1;
  background: rgba(0, 0, 0, 0.7);
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: zoom-out;
}

.lh-feature-screenshot-overlay .lh-element-screenshot {
  cursor: zoom-out;
}
.lh-feature-screenshot-overlay .lh-node .lh-element-screenshot {
  cursor: zoom-in;
}

/*# sourceURL=report-styles.css */
</style>
</head>
<body class="lh-root lh-vars">
  <noscript>Lighthouse report requires JavaScript. Please enable.</noscript>
  <div hidden><!--
@license
Copyright 2018 The Lighthouse Authors. All Rights Reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS-IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
-->

<!-- Lighthouse run warnings -->
<template id="tmpl-lh-warnings--toplevel">
  <div class="lh-warnings lh-warnings--toplevel">
    <p class="lh-warnings__msg"></p>
    <ul></ul>
  </div>
</template>

<!-- Lighthouse score scale -->
<template id="tmpl-lh-scorescale">
  <div class="lh-scorescale">
      <span class="lh-scorescale-range lh-scorescale-range--fail">0&ndash;49</span>
      <span class="lh-scorescale-range lh-scorescale-range--average">50&ndash;89</span>
      <span class="lh-scorescale-range lh-scorescale-range--pass">90&ndash;100</span>
  </div>
</template>

<!-- Toggle arrow chevron -->
<template id="tmpl-lh-chevron">
  <svg class="lh-chevron" title="See audits" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 100 100">
    <g class="lh-chevron__lines">
      <path class="lh-chevron__line lh-chevron__line-left" d="M10 50h40"></path>
      <path class="lh-chevron__line lh-chevron__line-right" d="M90 50H50"></path>
    </g>
  </svg>
</template>

<!-- Lighthouse category header -->
<template id="tmpl-lh-category-header">
  <div class="lh-category-header">
    <div class="lh-score__gauge" role="heading" aria-level="2"></div>
    <div class="lh-category-header__description"></div>
  </div>
</template>

<!-- Lighthouse clump -->
<template id="tmpl-lh-clump">
  <!-- TODO: group classes shouldn't be reused for clumps. -->
  <details class="lh-clump lh-audit-group">
    <summary>
      <div class="lh-audit-group__summary">
        <div class="lh-audit-group__header">
          <span class="lh-audit-group__title"></span>
          <span class="lh-audit-group__itemcount"></span>
          <!-- .lh-audit-group__description will be added here -->
          <!-- .lh-metrics-toggle will be added here -->
        </div>
        <div class=""></div>
      </div>
    </summary>
  </details>
</template>

<!-- Lighthouse metrics toggle -->
<template id="tmpl-lh-metrics-toggle">
  <div class="lh-metrics-toggle">
    <input class="lh-metrics-toggle__input" type="checkbox" id="toggle-metric-descriptions" aria-label="Toggle the display of metric descriptions">
    <label class="lh-metrics-toggle__label" for="toggle-metric-descriptions">
      <div class="lh-metrics-toggle__icon lh-metrics-toggle__icon--less" aria-hidden="true">
        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24" viewBox="0 0 24 24">
          <path class="lh-metrics-toggle__lines" d="M4 9h16v2H4zm0 4h10v2H4z" />
        </svg>
      </div>
      <div class="lh-metrics-toggle__icon lh-metrics-toggle__icon--more" aria-hidden="true">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
          <path class="lh-metrics-toggle__lines" d="M3 18h12v-2H3v2zM3 6v2h18V6H3zm0 7h18v-2H3v2z" />
        </svg>
      </div>
    </label>
  </div>
</template>

<!-- Lighthouse audit -->
<template id="tmpl-lh-audit">
  <div class="lh-audit">
    <details class="lh-expandable-details">
      <summary>
        <div class="lh-audit__header lh-expandable-details__summary">
          <span class="lh-audit__score-icon"></span>
          <span class="lh-audit__title-and-text">
            <span class="lh-audit__title"></span>
            <span class="lh-audit__display-text"></span>
          </span>
          <div class="lh-chevron-container"></div>
        </div>
      </summary>
      <div class="lh-audit__description"></div>
      <div class="lh-audit__stackpacks"></div>
    </details>
  </div>
</template>

<!-- Lighthouse perf metric -->
<template id="tmpl-lh-metric">
  <div class="lh-metric">
    <div class="lh-metric__innerwrap">
      <span class="lh-metric__title"></span>
      <div class="lh-metric__value"></div>
      <div class="lh-metric__description"></div>
    </div>
  </div>
</template>

<!-- Lighthouse perf opportunity -->
<template id="tmpl-lh-opportunity">
  <div class="lh-audit lh-audit--load-opportunity">
    <details class="lh-expandable-details">
        <summary>
          <div class="lh-audit__header lh-expandable-details__summary">
            <div class="lh-load-opportunity__cols">
              <div class="lh-load-opportunity__col lh-load-opportunity__col--one">
                <span class="lh-audit__score-icon"></span>
                <div class="lh-audit__title"></div>
              </div>
              <div class="lh-load-opportunity__col lh-load-opportunity__col--two">
                <div class="lh-load-opportunity__sparkline">
                  <div class="lh-sparkline"><div class="lh-sparkline__bar"></div></div>
                </div>
                <div class="lh-audit__display-text"></div>
                <div class="lh-chevron-container" title="See resources"></div>
              </div>
            </div>
          </div>
        </summary>
      <div class="lh-audit__description"></div>
      <div class="lh-audit__stackpacks"></div>
    </details>
  </div>
</template>

<!-- Lighthouse perf opportunity header -->
<template id="tmpl-lh-opportunity-header">
  <div class="lh-load-opportunity__header lh-load-opportunity__cols">
    <div class="lh-load-opportunity__col lh-load-opportunity__col--one"></div>
    <div class="lh-load-opportunity__col lh-load-opportunity__col--two"></div>
  </div>
</template>

<!-- Lighthouse score container -->
<template id="tmpl-lh-scores-wrapper">
  <style>
    .lh-scores-container {
      display: flex;
      flex-direction: column;
      padding: var(--scores-container-padding);
      position: relative;
      width: 100%;
    }

    .lh-sticky-header {
      --gauge-circle-size: 36px;
      --plugin-badge-size: 18px;
      --plugin-icon-size: 75%;
      --gauge-wrapper-width: 60px;
      --gauge-percentage-font-size: 13px;
      position: fixed;
      left: 0;
      right: 0;
      top: var(--topbar-height);
      font-weight: 700;
      display: none;
      justify-content: center;
      background-color: var(--sticky-header-background-color);
      border-bottom: 1px solid var(--color-gray-200);
      padding-top: var(--score-container-padding);
      padding-bottom: 4px;
      z-index: 1;
      pointer-events: none;
    }

    .lh-devtools .lh-sticky-header {
      /* The report within DevTools is placed in a container with overflow, which changes the placement of this header unless we change `position` to `sticky.` */
      position: sticky;
    }

    .lh-sticky-header--visible {
      display: grid;
      grid-auto-flow: column;
      pointer-events: auto;
    }

    /* Disable the gauge arc animation for the sticky header, so toggling display: none
       does not play the animation. */
    .lh-sticky-header .lh-gauge-arc {
      animation: none;
    }

    .lh-sticky-header .lh-gauge__label {
      display: none;
    }

    .lh-highlighter {
      width: var(--gauge-wrapper-width);
      height: 1px;
      background-color: var(--highlighter-background-color);
      /* Position at bottom of first gauge in sticky header. */
      position: absolute;
      grid-column: 1;
      bottom: -1px;
    }

    .lh-gauge__wrapper:first-of-type {
      contain: none;
    }
  </style>
  <div class="lh-scores-wrapper">
    <div class="lh-scores-container">
      <div class="pyro">
        <div class="before"></div>
        <div class="after"></div>
      </div>
    </div>
  </div>
</template>

<!-- Lighthouse topbar -->
<template id="tmpl-lh-topbar">
  <style>
    .lh-topbar {
      position: sticky;
      top: 0;
      left: 0;
      right: 0;
      z-index: 1000;
      display: flex;
      align-items: center;
      height: var(--topbar-height);
      background-color: var(--topbar-background-color);
      padding: var(--topbar-padding);
    }

    .lh-topbar__logo {
      width: var(--topbar-logo-size);
      height: var(--topbar-logo-size);
      user-select: none;
      flex: none;
    }
    .lh-topbar__logo .shape {
      fill: var(--report-text-color);
    }

    .lh-topbar__url {
      margin: var(--topbar-padding);
      text-decoration: none;
      color: var(--report-text-color);
      text-overflow: ellipsis;
      overflow: hidden;
      white-space: nowrap;
    }

    .lh-tools {
      margin-left: auto;
      will-change: transform;
      min-width: var(--tools-icon-size);
    }
    .lh-tools__button {
      width: var(--tools-icon-size);
      height: var(--tools-icon-size);
      cursor: pointer;
      margin-right: 5px;
      /* This is actually a button element, but we want to style it like a transparent div. */
      display: flex;
      background: none;
      color: inherit;
      border: none;
      padding: 0;
      font: inherit;
      outline: inherit;
    }
    .lh-tools__button svg {
      fill: var(--tools-icon-color);
    }
    .dark .lh-tools__button svg {
      filter: invert(1);
    }
    .lh-tools__button.active + .lh-tools__dropdown {
      opacity: 1;
      clip: rect(-1px, 187px, 242px, -3px);
      visibility: visible;
    }
    .lh-tools__dropdown {
      position: absolute;
      background-color: var(--report-background-color);
      border: 1px solid var(--report-border-color);
      border-radius: 3px;
      padding: calc(var(--default-padding) / 2) 0;
      cursor: pointer;
      top: 36px;
      right: 0;
      box-shadow: 1px 1px 3px #ccc;
      min-width: 125px;
      clip: rect(0, 164px, 0, 0);
      visibility: hidden;
      opacity: 0;
      transition: all 200ms cubic-bezier(0,0,0.2,1);
    }
    .lh-tools__dropdown a {
      display: block;
      color: currentColor;
      text-decoration: none;
      white-space: nowrap;
      padding: 0 12px;
      line-height: 2;
    }
    .lh-tools__dropdown a:hover,
    .lh-tools__dropdown a:focus {
      background-color: var(--color-gray-200);
      outline: none;
    }
    .lh-tools__dropdown .report-icon {
      cursor: pointer;
      background-repeat: no-repeat;
      background-position: 8px 50%;
      background-size: 18px;
      background-color: transparent;
      text-indent: 18px;
    }
    .dark .report-icon {
      color: var(--color-gray-900);
      filter: invert(1);
    }
    .dark .lh-tools__dropdown a:hover,
    .dark .lh-tools__dropdown a:focus {
      background-color: #BDBDBD;
    }
    /* copy icon needs slight adjustments to look great */
    .lh-tools__dropdown .report-icon--copy {
      background-size: 16px;
      background-position: 9px 50%;
    }
    /* save-as-gist option hidden in report */
    .lh-tools__dropdown .lh-tools--gist {
      display: none;
    }

    @media screen and (max-width: 964px) {
      .lh-tools__dropdown {
        right: 0;
        left: initial;
      }
    }
    @media print {
      .lh-topbar {
        position: static;
        margin-left: 0;
      }

      .lh-tools__dropdown {
        display: none;
      }
    }
  </style>

  <div class="lh-topbar">
    <!-- Lighthouse logo.  -->
    <svg class="lh-topbar__logo" viewBox="0 0 24 24">
      <defs>
        <linearGradient x1="57.456%" y1="13.086%" x2="18.259%" y2="72.322%" id="lh-topbar__logo--a">
          <stop stop-color="#262626" stop-opacity=".1" offset="0%"/>
          <stop stop-color="#262626" stop-opacity="0" offset="100%"/>
        </linearGradient>
        <linearGradient x1="100%" y1="50%" x2="0%" y2="50%" id="lh-topbar__logo--b">
          <stop stop-color="#262626" stop-opacity=".1" offset="0%"/>
          <stop stop-color="#262626" stop-opacity="0" offset="100%"/>
        </linearGradient>
        <linearGradient x1="58.764%" y1="65.756%" x2="36.939%" y2="50.14%" id="lh-topbar__logo--c">
          <stop stop-color="#262626" stop-opacity=".1" offset="0%"/>
          <stop stop-color="#262626" stop-opacity="0" offset="100%"/>
        </linearGradient>
        <linearGradient x1="41.635%" y1="20.358%" x2="72.863%" y2="85.424%" id="lh-topbar__logo--d">
          <stop stop-color="#FFF" stop-opacity=".1" offset="0%"/>
          <stop stop-color="#FFF" stop-opacity="0" offset="100%"/>
        </linearGradient>
      </defs>
      <g fill="none" fill-rule="evenodd">
        <path d="M12 3l4.125 2.625v3.75H18v2.25h-1.688l1.5 9.375H6.188l1.5-9.375H6v-2.25h1.875V5.648L12 3zm2.201 9.938L9.54 14.633 9 18.028l5.625-2.062-.424-3.028zM12.005 5.67l-1.88 1.207v2.498h3.75V6.86l-1.87-1.19z" fill="#F44B21"/>
        <path fill="#FFF" d="M14.201 12.938L9.54 14.633 9 18.028l5.625-2.062z"/>
        <path d="M6 18c-2.042 0-3.95-.01-5.813 0l1.5-9.375h4.326L6 18z" fill="url(#lh-topbar__logo--a)" fill-rule="nonzero" transform="translate(6 3)"/>
        <path fill="#FFF176" fill-rule="nonzero" d="M13.875 9.375v-2.56l-1.87-1.19-1.88 1.207v2.543z"/>
        <path fill="url(#lh-topbar__logo--b)" fill-rule="nonzero" d="M0 6.375h6v2.25H0z" transform="translate(6 3)"/>
        <path fill="url(#lh-topbar__logo--c)" fill-rule="nonzero" d="M6 6.375H1.875v-3.75L6 0z" transform="translate(6 3)"/>
        <path fill="url(#lh-topbar__logo--d)" fill-rule="nonzero" d="M6 0l4.125 2.625v3.75H12v2.25h-1.688l1.5 9.375H.188l1.5-9.375H0v-2.25h1.875V2.648z" transform="translate(6 3)"/>
      </g>
    </svg>

    <a href="" class="lh-topbar__url" target="_blank" rel="noopener"></a>

    <div class="lh-tools">
      <button id="lh-tools-button" class="report-icon report-icon--share lh-tools__button" title="Tools menu" aria-label="Toggle report tools menu" aria-haspopup="menu" aria-expanded="false" aria-controls="lh-tools-dropdown">
        <svg width="100%" height="100%" viewBox="0 0 24 24">
            <path d="M0 0h24v24H0z" fill="none"/>
            <path d="M12 8c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2zm0 2c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm0 6c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"/>
        </svg>
      </button>
      <div id="lh-tools-dropdown" role="menu" class="lh-tools__dropdown" aria-labelledby="lh-tools-button">
         <!-- TODO(i18n): localize tools dropdown -->
        <a role="menuitem" tabindex="-1" href="#" class="report-icon report-icon--print" data-i18n="dropdownPrintSummary" data-action="print-summary"></a>
        <a role="menuitem" tabindex="-1" href="#" class="report-icon report-icon--print" data-i18n="dropdownPrintExpanded" data-action="print-expanded"></a>
        <a role="menuitem" tabindex="-1" href="#" class="report-icon report-icon--copy" data-i18n="dropdownCopyJSON" data-action="copy"></a>
        <a role="menuitem" tabindex="-1" href="#" class="report-icon report-icon--download" data-i18n="dropdownSaveHTML" data-action="save-html"></a>
        <a role="menuitem" tabindex="-1" href="#" class="report-icon report-icon--download" data-i18n="dropdownSaveJSON" data-action="save-json"></a>
        <a role="menuitem" tabindex="-1" href="#" class="report-icon report-icon--open lh-tools--viewer" data-i18n="dropdownViewer" data-action="open-viewer"></a>
        <a role="menuitem" tabindex="-1" href="#" class="report-icon report-icon--open lh-tools--gist" data-i18n="dropdownSaveGist" data-action="save-gist"></a>
        <a role="menuitem" tabindex="-1" href="#" class="report-icon report-icon--dark" data-i18n="dropdownDarkTheme" data-action="toggle-dark"></a>
      </div>
    </div>
  </div>
</template>

<!-- Lighthouse header -->
<template id="tmpl-lh-heading">
  <style>
    /* CSS Fireworks. Originally by Eddie Lin
       https://codepen.io/paulirish/pen/yEVMbP
    */
    .pyro {
      display: none;
      z-index: 1;
      pointer-events: none;
    }
    .score100 .pyro {
      display: block;
    }
    .score100 .lh-lighthouse stop:first-child {
      stop-color: hsla(200, 12%, 95%, 0);
    }
    .score100 .lh-lighthouse stop:last-child {
      stop-color: hsla(65, 81%, 76%, 1);
    }

    .pyro > .before, .pyro > .after {
      position: absolute;
      width: 5px;
      height: 5px;
      border-radius: 2.5px;
      box-shadow: 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff;
      animation: 1s bang ease-out infinite backwards,  1s gravity ease-in infinite backwards,  5s position linear infinite backwards;
      animation-delay: 1s, 1s, 1s;
    }

    .pyro > .after {
      animation-delay: 2.25s, 2.25s, 2.25s;
      animation-duration: 1.25s, 1.25s, 6.25s;
    }
    .fireworks-paused .pyro > div {
      animation-play-state: paused;
    }

    @keyframes bang {
      to {
        box-shadow: -70px -115.67px #47ebbc, -28px -99.67px #eb47a4, 58px -31.67px #7eeb47, 13px -141.67px #eb47c5, -19px 6.33px #7347eb, -2px -74.67px #ebd247, 24px -151.67px #eb47e0, 57px -138.67px #b4eb47, -51px -104.67px #479eeb, 62px 8.33px #ebcf47, -93px 0.33px #d547eb, -16px -118.67px #47bfeb, 53px -84.67px #47eb83, 66px -57.67px #eb47bf, -93px -65.67px #91eb47, 30px -13.67px #86eb47, -2px -59.67px #83eb47, -44px 1.33px #eb47eb, 61px -58.67px #47eb73, 5px -22.67px #47e8eb, -66px -28.67px #ebe247, 42px -123.67px #eb5547, -75px 26.33px #7beb47, 15px -52.67px #a147eb, 36px -51.67px #eb8347, -38px -12.67px #eb5547, -46px -59.67px #47eb81, 78px -114.67px #eb47ba, 15px -156.67px #eb47bf, -36px 1.33px #eb4783, -72px -86.67px #eba147, 31px -46.67px #ebe247, -68px 29.33px #47e2eb, -55px 19.33px #ebe047, -56px 27.33px #4776eb, -13px -91.67px #eb5547, -47px -138.67px #47ebc7, -18px -96.67px #eb47ac, 11px -88.67px #4783eb, -67px -28.67px #47baeb, 53px 10.33px #ba47eb, 11px 19.33px #5247eb, -5px -11.67px #eb4791, -68px -4.67px #47eba7, 95px -37.67px #eb478b, -67px -162.67px #eb5d47, -54px -120.67px #eb6847, 49px -12.67px #ebe047, 88px 8.33px #47ebda, 97px 33.33px #eb8147, 6px -71.67px #ebbc47;
      }
    }
    @keyframes gravity {
      to {
        transform: translateY(80px);
        opacity: 0;
      }
    }
    @keyframes position {
      0%, 19.9% {
        margin-top: 4%;
        margin-left: 47%;
      }
      20%, 39.9% {
        margin-top: 7%;
        margin-left: 30%;
      }
      40%, 59.9% {
        margin-top: 6%;
        margin-left: 70%;
      }
      60%, 79.9% {
        margin-top: 3%;
        margin-left: 20%;
      }
      80%, 99.9% {
        margin-top: 3%;
        margin-left: 80%;
      }
    }
  </style>

  <div class="lh-header-container">
    <div class="lh-scores-wrapper-placeholder"></div>
  </div>
</template>


<!-- Lighthouse footer -->
<template id="tmpl-lh-footer">
  <style>
    .lh-footer {
      padding: var(--footer-padding-vertical) calc(var(--default-padding) * 2);
      max-width: var(--report-width);
      margin: 0 auto;
    }
    .lh-footer .lh-generated {
      text-align: center;
    }
    .lh-env__title {
      font-size: var(--env-item-font-size-big);
      line-height: var(--env-item-line-height-big);
      text-align: center;
      padding: var(--score-container-padding);
    }
    .lh-env {
      padding: var(--default-padding) 0;
    }
    .lh-env__items {
      padding-left: 16px;
      margin: 0 0 var(--audits-margin-bottom);
      padding: 0;
    }
    .lh-env__items .lh-env__item:nth-child(2n) {
      background-color: var(--env-item-background-color);
    }
    .lh-env__item {
      display: flex;
      padding: var(--env-item-padding);
      position: relative;
    }
    span.lh-env__name {
      font-weight: bold;
      min-width: var(--env-name-min-width);
      flex: 0.5;
      padding: 0 8px;
    }
    span.lh-env__description {
      text-align: left;
      flex: 1;
    }
  </style>
  <footer class="lh-footer">
    <!-- TODO(i18n): localize runtime settings -->
    <div class="lh-env">
      <div class="lh-env__title">Runtime Settings</div>
      <ul class="lh-env__items">
        <template id="tmpl-lh-env__items">
          <li class="lh-env__item">
            <span class="lh-env__name"></span>
            <span class="lh-env__description"></span>
          </li>
        </template>
      </ul>
    </div>

    <div class="lh-generated">
      <!-- TODO(i18n): use ICU replacement to replace version w/o concatenation. -->
      Generated by <b>Lighthouse</b> <span class="lh-footer__version"></span> |
      <a href="https://github.com/GoogleChrome/Lighthouse/issues" target="_blank" rel="noopener" class="lh-footer__version_issue">File an issue</a>
    </div>
  </footer>
</template>

<!-- Lighthouse score gauge -->
<template id="tmpl-lh-gauge">
  <a href="#" class="lh-gauge__wrapper">
    <!-- Wrapper exists for the ::before plugin icon. Cannot create pseudo-elements on svgs. -->
    <div class="lh-gauge__svg-wrapper">
      <svg viewBox="0 0 120 120" class="lh-gauge">
        <circle class="lh-gauge-base" r="56" cx="60" cy="60" stroke-width="8"></circle>
        <circle class="lh-gauge-arc"  r="56" cx="60" cy="60" stroke-width="8"></circle>
      </svg>
    </div>
    <div class="lh-gauge__percentage"></div>
    <!-- TODO: should likely be an h2  -->
    <div class="lh-gauge__label"></div>
  </a>
</template>


<!-- Lighthouse PWA badge gauge -->
<template id="tmpl-lh-gauge--pwa">
  <style>
    .lh-gauge--pwa .lh-gauge--pwa__component {
      display: none;
    }
    .lh-gauge--pwa__wrapper:not(.lh-badged--all) .lh-gauge--pwa__logo > path {
      /* Gray logo unless everything is passing. */
      fill: #B0B0B0;
    }

    .lh-gauge--pwa__disc {
      fill: var(--color-gray-200);
    }

    .lh-gauge--pwa__logo--primary-color {
      fill: #304FFE;
    }

    .lh-gauge--pwa__logo--secondary-color {
      fill: #3D3D3D;
    }
    .dark .lh-gauge--pwa__logo--secondary-color {
      fill: #D8B6B6;
    }

    /* No passing groups. */
    .lh-gauge--pwa__wrapper:not([class*='lh-badged--']) .lh-gauge--pwa__na-line {
      display: inline;
    }
    /* Just optimized. Same n/a line as no passing groups. */
    .lh-gauge--pwa__wrapper.lh-badged--pwa-optimized:not(.lh-badged--pwa-installable):not(.lh-badged--pwa-fast-reliable) .lh-gauge--pwa__na-line {
      display: inline;
    }

    /* Just fast and reliable. */
    .lh-gauge--pwa__wrapper.lh-badged--pwa-fast-reliable:not(.lh-badged--pwa-installable) .lh-gauge--pwa__fast-reliable-badge {
      display: inline;
    }

    /* Just installable. */
    .lh-gauge--pwa__wrapper.lh-badged--pwa-installable:not(.lh-badged--pwa-fast-reliable) .lh-gauge--pwa__installable-badge {
      display: inline;
    }

    /* Fast and reliable and installable. */
    .lh-gauge--pwa__wrapper.lh-badged--pwa-fast-reliable.lh-badged--pwa-installable .lh-gauge--pwa__fast-reliable-installable-badges {
      display: inline;
    }

    /* All passing groups. */
    .lh-gauge--pwa__wrapper.lh-badged--all .lh-gauge--pwa__check-circle {
      display: inline;
    }
  </style>

  <a href="#" class="lh-gauge__wrapper lh-gauge--pwa__wrapper">
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 60 60" class="lh-gauge lh-gauge--pwa">
      <defs>
        <linearGradient id="lh-gauge--pwa__check-circle__gradient" x1="50%" y1="0%" x2="50%" y2="100%">
          <stop stop-color="#00C852" offset="0%"></stop>
          <stop stop-color="#009688" offset="100%"></stop>
        </linearGradient>
        <linearGradient id="lh-gauge--pwa__installable__shadow-gradient" x1="76.056%" x2="24.111%" y1="82.995%" y2="24.735%">
          <stop stop-color="#A5D6A7" offset="0%"></stop>
          <stop stop-color="#80CBC4" offset="100%"></stop>
        </linearGradient>
        <linearGradient id="lh-gauge--pwa__fast-reliable__shadow-gradient" x1="76.056%" y1="82.995%" x2="25.678%" y2="26.493%">
          <stop stop-color="#64B5F6" offset="0%"></stop>
          <stop stop-color="#2979FF" offset="100%"></stop>
        </linearGradient>

        <g id="lh-gauge--pwa__fast-reliable-badge">
          <circle fill="#FFFFFF" cx="10" cy="10" r="10"></circle>
          <path fill="#304FFE" d="M10 3.58l5.25 2.34v3.5c0 3.23-2.24 6.26-5.25 7-3.01-.74-5.25-3.77-5.25-7v-3.5L10 3.58zm-.47 10.74l2.76-4.83.03-.07c.04-.08 0-.24-.22-.24h-1.64l.47-3.26h-.47l-2.7 4.77c-.02.01.05-.1-.04.05-.09.16-.1.31.18.31h1.63l-.47 3.27h.47z"/>
        </g>
        <g id="lh-gauge--pwa__installable-badge">
          <circle fill="#FFFFFF" cx="10" cy="10" r="10"></circle>
          <path fill="#009688" d="M10 4.167A5.835 5.835 0 0 0 4.167 10 5.835 5.835 0 0 0 10 15.833 5.835 5.835 0 0 0 15.833 10 5.835 5.835 0 0 0 10 4.167zm2.917 6.416h-2.334v2.334H9.417v-2.334H7.083V9.417h2.334V7.083h1.166v2.334h2.334v1.166z"/>
        </g>
      </defs>

      <g stroke="none" fill-rule="nonzero">
        <!-- Background and PWA logo (color by default) -->
        <circle class="lh-gauge--pwa__disc" cx="30" cy="30" r="30"></circle>
        <g class="lh-gauge--pwa__logo">
          <path class="lh-gauge--pwa__logo--secondary-color" d="M35.66 19.39l.7-1.75h2L37.4 15 38.6 12l3.4 9h-2.51l-.58-1.61z"/>
          <path class="lh-gauge--pwa__logo--primary-color" d="M33.52 21l3.65-9h-2.42l-2.5 5.82L30.5 12h-1.86l-1.9 5.82-1.35-2.65-1.21 3.72L25.4 21h2.38l1.72-5.2 1.64 5.2z"/>
          <path class="lh-gauge--pwa__logo--secondary-color" fill-rule="nonzero" d="M20.3 17.91h1.48c.45 0 .85-.05 1.2-.15l.39-1.18 1.07-3.3a2.64 2.64 0 0 0-.28-.37c-.55-.6-1.36-.91-2.42-.91H18v9h2.3V17.9zm1.96-3.84c.22.22.33.5.33.87 0 .36-.1.65-.29.87-.2.23-.59.35-1.15.35h-.86v-2.41h.87c.52 0 .89.1 1.1.32z"/>
        </g>

        <!-- No badges. -->
        <rect class="lh-gauge--pwa__component lh-gauge--pwa__na-line" fill="#FFFFFF" x="20" y="32" width="20" height="4" rx="2"></rect>

        <!-- Just fast and reliable. -->
        <g class="lh-gauge--pwa__component lh-gauge--pwa__fast-reliable-badge" transform="translate(20, 29)">
          <path fill="url(#lh-gauge--pwa__fast-reliable__shadow-gradient)" d="M33.63 19.49A30 30 0 0 1 16.2 30.36L3 17.14 17.14 3l16.49 16.49z"/>
          <use href="#lh-gauge--pwa__fast-reliable-badge" />
        </g>

        <!-- Just installable. -->
        <g class="lh-gauge--pwa__component lh-gauge--pwa__installable-badge" transform="translate(20, 29)">
          <path fill="url(#lh-gauge--pwa__installable__shadow-gradient)" d="M33.629 19.487c-4.272 5.453-10.391 9.39-17.415 10.869L3 17.142 17.142 3 33.63 19.487z"/>
          <use href="#lh-gauge--pwa__installable-badge" />
        </g>

        <!-- Fast and reliable and installable. -->
        <g class="lh-gauge--pwa__component lh-gauge--pwa__fast-reliable-installable-badges">
          <g transform="translate(8, 29)"> <!-- fast and reliable -->
            <path fill="url(#lh-gauge--pwa__fast-reliable__shadow-gradient)" d="M16.321 30.463L3 17.143 17.142 3l22.365 22.365A29.864 29.864 0 0 1 22 31c-1.942 0-3.84-.184-5.679-.537z"/>
            <use href="#lh-gauge--pwa__fast-reliable-badge" />
          </g>
          <g transform="translate(32, 29)"> <!-- installable -->
            <path fill="url(#lh-gauge--pwa__installable__shadow-gradient)" d="M25.982 11.84a30.107 30.107 0 0 1-13.08 15.203L3 17.143 17.142 3l8.84 8.84z"/>
            <use href="#lh-gauge--pwa__installable-badge" />
          </g>
        </g>

        <!-- Full PWA. -->
        <g class="lh-gauge--pwa__component lh-gauge--pwa__check-circle" transform="translate(18, 28)">
          <circle fill="#FFFFFF" cx="12" cy="12" r="12"></circle>
          <path fill="url(#lh-gauge--pwa__check-circle__gradient)" d="M12 2a10 10 0 1 0 0 20 10 10 0 0 0 0-20zm-2 15l-5-5 1.41-1.41L10 14.17l7.59-7.59L19 8l-9 9z"></path>
        </g>
      </g>
    </svg>

    <div class="lh-gauge__label"></div>
  </a>
</template>

<!-- Lighthouse crtiical request chains component -->
<template id="tmpl-lh-crc">
  <div class="lh-crc-container">
    <style>
      .lh-crc .tree-marker {
        width: 12px;
        height: 26px;
        display: block;
        float: left;
        background-position: top left;
      }
      .lh-crc .horiz-down {
        background: url('data:image/svg+xml;utf8,<svg width="16" height="26" viewBox="0 0 16 26" xmlns="http://www.w3.org/2000/svg"><g fill="%23D8D8D8" fill-rule="evenodd"><path d="M16 12v2H-2v-2z"/><path d="M9 12v14H7V12z"/></g></svg>');
      }
      .lh-crc .right {
        background: url('data:image/svg+xml;utf8,<svg width="16" height="26" viewBox="0 0 16 26" xmlns="http://www.w3.org/2000/svg"><path d="M16 12v2H0v-2z" fill="%23D8D8D8" fill-rule="evenodd"/></svg>');
      }
      .lh-crc .up-right {
        background: url('data:image/svg+xml;utf8,<svg width="16" height="26" viewBox="0 0 16 26" xmlns="http://www.w3.org/2000/svg"><path d="M7 0h2v14H7zm2 12h7v2H9z" fill="%23D8D8D8" fill-rule="evenodd"/></svg>');
      }
      .lh-crc .vert-right {
        background: url('data:image/svg+xml;utf8,<svg width="16" height="26" viewBox="0 0 16 26" xmlns="http://www.w3.org/2000/svg"><path d="M7 0h2v27H7zm2 12h7v2H9z" fill="%23D8D8D8" fill-rule="evenodd"/></svg>');
      }
      .lh-crc .vert {
        background: url('data:image/svg+xml;utf8,<svg width="16" height="26" viewBox="0 0 16 26" xmlns="http://www.w3.org/2000/svg"><path d="M7 0h2v26H7z" fill="%23D8D8D8" fill-rule="evenodd"/></svg>');
      }
      .lh-crc .crc-tree {
        font-size: 14px;
        width: 100%;
        overflow-x: auto;
      }
      .lh-crc .crc-node {
        height: 26px;
        line-height: 26px;
        white-space: nowrap;
      }
      .lh-crc .crc-node__tree-value {
        margin-left: 10px;
      }
      .lh-crc .crc-node__tree-value div {
        display: inline;
      }
      .lh-crc .crc-node__chain-duration {
        font-weight: 700;
      }
      .lh-crc .crc-initial-nav {
        color: #595959;
        font-style: italic;
      }
      .lh-crc__summary-value {
        margin-bottom: 10px;
      }
    </style>
    <div>
      <div class="lh-crc__summary-value">
        <span class="lh-crc__longest_duration_label"></span> <b class="lh-crc__longest_duration"></b>
      </div>
    </div>
    <div class="lh-crc">
      <div class="crc-initial-nav"></div>
      <!-- stamp for each chain -->
      <template id="tmpl-lh-crc__chains">
        <div class="crc-node">
          <span class="crc-node__tree-marker">

          </span>
          <span class="crc-node__tree-value">

          </span>
        </div>
      </template>
    </div>
  </div>
</template>

<template id="tmpl-lh-3p-filter">
  <style>
    .lh-3p-filter {
      background-color: var(--table-higlight-background-color);
      color: var(--color-gray-600);
      float: right;
      padding: 6px;
    }
    .lh-3p-filter-label, .lh-3p-filter-input {
      vertical-align: middle;
      user-select: none;
    }
    .lh-3p-filter-input:disabled + .lh-3p-ui-string {
      text-decoration: line-through;
    }
  </style>
  <div class="lh-3p-filter">
    <label class="lh-3p-filter-label">
      <input type="checkbox" class="lh-3p-filter-input" checked />
      <span class="lh-3p-ui-string">Show 3rd party resources</span> (<span class="lh-3p-filter-count"></span>)
    </label>
  </div>
</template>

<!-- Lighthouse snippet component -->
<template id="tmpl-lh-snippet">
    <div class="lh-snippet">
      <style>
          :root {
            --snippet-highlight-light: #fbf1f2;
            --snippet-highlight-dark: #ffd6d8;
          }

         .lh-snippet__header {
          position: relative;
          overflow: hidden;
          padding: 10px;
          border-bottom: none;
          color: var(--snippet-color);
          background-color: var(--snippet-background-color);
          border: 1px solid var(--report-border-color-secondary);
        }
        .lh-snippet__title {
          font-weight: bold;
          float: left;
        }
        .lh-snippet__node {
          float: left;
          margin-left: 4px;
        }
        .lh-snippet__toggle-expand {
          padding: 1px 7px;
          margin-top: -1px;
          margin-right: -7px;
          float: right;
          background: transparent;
          border: none;
          cursor: pointer;
          font-size: 14px;
          color: #0c50c7;
        }

        .lh-snippet__snippet {
          overflow: auto;
          border: 1px solid var(--report-border-color-secondary);
        }
        /* Container needed so that all children grow to the width of the scroll container */
        .lh-snippet__snippet-inner {
          display: inline-block;
          min-width: 100%;
        }

        .lh-snippet:not(.lh-snippet--expanded) .lh-snippet__show-if-expanded {
          display: none;
        }
        .lh-snippet.lh-snippet--expanded .lh-snippet__show-if-collapsed {
          display: none;
        }

        .lh-snippet__line {
          background: white;
          white-space: pre;
          display: flex;
        }
        .lh-snippet__line:not(.lh-snippet__line--message):first-child {
          padding-top: 4px;
        }
        .lh-snippet__line:not(.lh-snippet__line--message):last-child {
          padding-bottom: 4px;
        }
        .lh-snippet__line--content-highlighted {
          background: var(--snippet-highlight-dark);
        }
        .lh-snippet__line--message {
          background: var(--snippet-highlight-light);
        }
        .lh-snippet__line--message .lh-snippet__line-number {
          padding-top: 10px;
          padding-bottom: 10px;
        }
        .lh-snippet__line--message code {
          padding: 10px;
          padding-left: 5px;
          color: var(--color-fail);
          font-family: var(--report-font-family);
        }
        .lh-snippet__line--message code {
          white-space: normal;
        }
        .lh-snippet__line-icon {
          padding-top: 10px;
          display: none;
        }
        .lh-snippet__line--message .lh-snippet__line-icon {
          display: block;
        }
        .lh-snippet__line-icon:before {
          content: "";
          display: inline-block;
          vertical-align: middle;
          margin-right: 4px;
          width: var(--score-icon-size);
          height: var(--score-icon-size);
          background-image: var(--fail-icon-url);
        }
        .lh-snippet__line-number {
          flex-shrink: 0;
          width: 40px;
          text-align: right;
          font-family: monospace;
          padding-right: 5px;
          margin-right: 5px;
          color: var(--color-gray-600);
          user-select: none;
        }
      </style>
      <template id="tmpl-lh-snippet__header">
        <div class="lh-snippet__header">
          <div class="lh-snippet__title"></div>
          <div class="lh-snippet__node"></div>
          <button class="lh-snippet__toggle-expand">
            <span class="lh-snippet__btn-label-collapse lh-snippet__show-if-expanded"></span>
            <span class="lh-snippet__btn-label-expand lh-snippet__show-if-collapsed"></span>
          </button>
        </div>
      </template>
      <template id="tmpl-lh-snippet__content">
        <div class="lh-snippet__snippet">
          <div class="lh-snippet__snippet-inner"></div>
        </div>
      </template>
      <template id="tmpl-lh-snippet__line">
          <div class="lh-snippet__line">
            <div class="lh-snippet__line-number"></div>
            <div class="lh-snippet__line-icon"></div>
            <code></code>
          </div>
        </template>
    </div>
  </template>


<!-- Lighthouse element screenshot -->
<template id="tmpl-lh-element-screenshot">
  <div class="lh-element-screenshot">
    <div class="lh-element-screenshot__content">
      <div class="lh-element-screenshot__mask">
        <svg xmlns="http://www.w3.org/2000/svg" height="0" width="0">
          <defs>
            <clipPath clipPathUnits="objectBoundingBox"></clipPath>
            <!-- clipPath filled by ElementScreenshotRenderer.renderClipPath -->
          </defs>
        </svg>
      </div>
      <div class="lh-element-screenshot__image"></div>
      <div class="lh-element-screenshot__element-marker"></div>
    </div>
  </div>
</template>

</div>

  <main><!-- report populated here --></main>

  <div id="lh-log"></div>

  <script>/**
 * @license
 * Copyright 2017 The Lighthouse Authors. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS-IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
'use strict';

/* globals self, URL */

/** @typedef {import('./i18n')} I18n */

const ELLIPSIS = '\u2026';
const NBSP = '\xa0';
const PASS_THRESHOLD = 0.9;
const SCREENSHOT_PREFIX = 'data:image/jpeg;base64,';

const RATINGS = {
  PASS: {label: 'pass', minScore: PASS_THRESHOLD},
  AVERAGE: {label: 'average', minScore: 0.5},
  FAIL: {label: 'fail'},
  ERROR: {label: 'error'},
};

// 25 most used tld plus one domains (aka public suffixes) from http archive.
// @see https://github.com/GoogleChrome/lighthouse/pull/5065#discussion_r191926212
// The canonical list is https://publicsuffix.org/learn/ but we're only using subset to conserve bytes
const listOfTlds = [
  'com', 'co', 'gov', 'edu', 'ac', 'org', 'go', 'gob', 'or', 'net', 'in', 'ne', 'nic', 'gouv',
  'web', 'spb', 'blog', 'jus', 'kiev', 'mil', 'wi', 'qc', 'ca', 'bel', 'on',
];

class Util {
  static get PASS_THRESHOLD() {
    return PASS_THRESHOLD;
  }

  static get MS_DISPLAY_VALUE() {
    return `%10d${NBSP}ms`;
  }

  /**
   * Returns a new LHR that's reshaped for slightly better ergonomics within the report rendereer.
   * Also, sets up the localized UI strings used within renderer and makes changes to old LHRs to be
   * compatible with current renderer.
   * The LHR passed in is not mutated.
   * TODO(team): we all agree the LHR shape change is technical debt we should fix
   * @param {LH.Result} result
   * @return {LH.ReportResult}
   */
  static prepareReportResult(result) {
    // If any mutations happen to the report within the renderers, we want the original object untouched
    const clone = /** @type {LH.ReportResult} */ (JSON.parse(JSON.stringify(result)));

    // If LHR is older (≤3.0.3), it has no locale setting. Set default.
    if (!clone.configSettings.locale) {
      clone.configSettings.locale = 'en';
    }

    for (const audit of Object.values(clone.audits)) {
      // Turn 'not-applicable' (LHR <4.0) and 'not_applicable' (older proto versions)
      // into 'notApplicable' (LHR ≥4.0).
      // @ts-expect-error tsc rightly flags that these values shouldn't occur.
      // eslint-disable-next-line max-len
      if (audit.scoreDisplayMode === 'not_applicable' || audit.scoreDisplayMode === 'not-applicable') {
        audit.scoreDisplayMode = 'notApplicable';
      }

      if (audit.details) {
        // Turn `auditDetails.type` of undefined (LHR <4.2) and 'diagnostic' (LHR <5.0)
        // into 'debugdata' (LHR ≥5.0).
        // @ts-expect-error tsc rightly flags that these values shouldn't occur.
        if (audit.details.type === undefined || audit.details.type === 'diagnostic') {
          audit.details.type = 'debugdata';
        }

        // Add the jpg data URL prefix to filmstrip screenshots without them (LHR <5.0).
        if (audit.details.type === 'filmstrip') {
          for (const screenshot of audit.details.items) {
            if (!screenshot.data.startsWith(SCREENSHOT_PREFIX)) {
              screenshot.data = SCREENSHOT_PREFIX + screenshot.data;
            }
          }
        }
      }
    }

    // For convenience, smoosh all AuditResults into their auditRef (which has just weight & group)
    if (typeof clone.categories !== 'object') throw new Error('No categories provided.');
    for (const category of Object.values(clone.categories)) {
      category.auditRefs.forEach(auditRef => {
        const result = clone.audits[auditRef.id];
        auditRef.result = result;

        // attach the stackpacks to the auditRef object
        if (clone.stackPacks) {
          clone.stackPacks.forEach(pack => {
            if (pack.descriptions[auditRef.id]) {
              auditRef.stackPacks = auditRef.stackPacks || [];
              auditRef.stackPacks.push({
                title: pack.title,
                iconDataURL: pack.iconDataURL,
                description: pack.descriptions[auditRef.id],
              });
            }
          });
        }
      });
    }

    return clone;
  }

  /**
   * Used to determine if the "passed" for the purposes of showing up in the "failed" or "passed"
   * sections of the report.
   *
   * @param {{score: (number|null), scoreDisplayMode: string}} audit
   * @return {boolean}
   */
  static showAsPassed(audit) {
    switch (audit.scoreDisplayMode) {
      case 'manual':
      case 'notApplicable':
        return true;
      case 'error':
      case 'informative':
        return false;
      case 'numeric':
      case 'binary':
      default:
        return Number(audit.score) >= RATINGS.PASS.minScore;
    }
  }

  /**
   * Convert a score to a rating label.
   * @param {number|null} score
   * @param {string=} scoreDisplayMode
   * @return {string}
   */
  static calculateRating(score, scoreDisplayMode) {
    // Handle edge cases first, manual and not applicable receive 'pass', errored audits receive 'error'
    if (scoreDisplayMode === 'manual' || scoreDisplayMode === 'notApplicable') {
      return RATINGS.PASS.label;
    } else if (scoreDisplayMode === 'error') {
      return RATINGS.ERROR.label;
    } else if (score === null) {
      return RATINGS.FAIL.label;
    }

    // At this point, we're rating a standard binary/numeric audit
    let rating = RATINGS.FAIL.label;
    if (score >= RATINGS.PASS.minScore) {
      rating = RATINGS.PASS.label;
    } else if (score >= RATINGS.AVERAGE.minScore) {
      rating = RATINGS.AVERAGE.label;
    }
    return rating;
  }

  /**
   * Split a string by markdown code spans (enclosed in `backticks`), splitting
   * into segments that were enclosed in backticks (marked as `isCode === true`)
   * and those that outside the backticks (`isCode === false`).
   * @param {string} text
   * @return {Array<{isCode: true, text: string}|{isCode: false, text: string}>}
   */
  static splitMarkdownCodeSpans(text) {
    /** @type {Array<{isCode: true, text: string}|{isCode: false, text: string}>} */
    const segments = [];

    // Split on backticked code spans.
    const parts = text.split(/`(.*?)`/g);
    for (let i = 0; i < parts.length; i ++) {
      const text = parts[i];

      // Empty strings are an artifact of splitting, not meaningful.
      if (!text) continue;

      // Alternates between plain text and code segments.
      const isCode = i % 2 !== 0;
      segments.push({
        isCode,
        text,
      });
    }

    return segments;
  }

  /**
   * Split a string on markdown links (e.g. [some link](https://...)) into
   * segments of plain text that weren't part of a link (marked as
   * `isLink === false`), and segments with text content and a URL that did make
   * up a link (marked as `isLink === true`).
   * @param {string} text
   * @return {Array<{isLink: true, text: string, linkHref: string}|{isLink: false, text: string}>}
   */
  static splitMarkdownLink(text) {
    /** @type {Array<{isLink: true, text: string, linkHref: string}|{isLink: false, text: string}>} */
    const segments = [];

    const parts = text.split(/\[([^\]]+?)\]\((https?:\/\/.*?)\)/g);
    while (parts.length) {
      // Shift off the same number of elements as the pre-split and capture groups.
      const [preambleText, linkText, linkHref] = parts.splice(0, 3);

      if (preambleText) { // Skip empty text as it's an artifact of splitting, not meaningful.
        segments.push({
          isLink: false,
          text: preambleText,
        });
      }

      // Append link if there are any.
      if (linkText && linkHref) {
        segments.push({
          isLink: true,
          text: linkText,
          linkHref,
        });
      }
    }

    return segments;
  }

  /**
   * @param {URL} parsedUrl
   * @param {{numPathParts?: number, preserveQuery?: boolean, preserveHost?: boolean}=} options
   * @return {string}
   */
  static getURLDisplayName(parsedUrl, options) {
    // Closure optional properties aren't optional in tsc, so fallback needs undefined  values.
    options = options || {numPathParts: undefined, preserveQuery: undefined,
      preserveHost: undefined};
    const numPathParts = options.numPathParts !== undefined ? options.numPathParts : 2;
    const preserveQuery = options.preserveQuery !== undefined ? options.preserveQuery : true;
    const preserveHost = options.preserveHost || false;

    let name;

    if (parsedUrl.protocol === 'about:' || parsedUrl.protocol === 'data:') {
      // Handle 'about:*' and 'data:*' URLs specially since they have no path.
      name = parsedUrl.href;
    } else {
      name = parsedUrl.pathname;
      const parts = name.split('/').filter(part => part.length);
      if (numPathParts && parts.length > numPathParts) {
        name = ELLIPSIS + parts.slice(-1 * numPathParts).join('/');
      }

      if (preserveHost) {
        name = `${parsedUrl.host}/${name.replace(/^\//, '')}`;
      }
      if (preserveQuery) {
        name = `${name}${parsedUrl.search}`;
      }
    }

    const MAX_LENGTH = 64;
    // Always elide hexadecimal hash
    name = name.replace(/([a-f0-9]{7})[a-f0-9]{13}[a-f0-9]*/g, `$1${ELLIPSIS}`);
    // Also elide other hash-like mixed-case strings
    name = name.replace(/([a-zA-Z0-9-_]{9})(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])[a-zA-Z0-9-_]{10,}/g,
      `$1${ELLIPSIS}`);
    // Also elide long number sequences
    name = name.replace(/(\d{3})\d{6,}/g, `$1${ELLIPSIS}`);
    // Merge any adjacent ellipses
    name = name.replace(/\u2026+/g, ELLIPSIS);

    // Elide query params first
    if (name.length > MAX_LENGTH && name.includes('?')) {
      // Try to leave the first query parameter intact
      name = name.replace(/\?([^=]*)(=)?.*/, `?$1$2${ELLIPSIS}`);

      // Remove it all if it's still too long
      if (name.length > MAX_LENGTH) {
        name = name.replace(/\?.*/, `?${ELLIPSIS}`);
      }
    }

    // Elide too long names next
    if (name.length > MAX_LENGTH) {
      const dotIndex = name.lastIndexOf('.');
      if (dotIndex >= 0) {
        name = name.slice(0, MAX_LENGTH - 1 - (name.length - dotIndex)) +
          // Show file extension
          `${ELLIPSIS}${name.slice(dotIndex)}`;
      } else {
        name = name.slice(0, MAX_LENGTH - 1) + ELLIPSIS;
      }
    }

    return name;
  }

  /**
   * Split a URL into a file, hostname and origin for easy display.
   * @param {string} url
   * @return {{file: string, hostname: string, origin: string}}
   */
  static parseURL(url) {
    const parsedUrl = new URL(url);
    return {
      file: Util.getURLDisplayName(parsedUrl),
      hostname: parsedUrl.hostname,
      origin: parsedUrl.origin,
    };
  }

  /**
   * @param {string|URL} value
   * @return {!URL}
   */
  static createOrReturnURL(value) {
    if (value instanceof URL) {
      return value;
    }

    return new URL(value);
  }

  /**
   * Gets the tld of a domain
   *
   * @param {string} hostname
   * @return {string} tld
   */
  static getTld(hostname) {
    const tlds = hostname.split('.').slice(-2);

    if (!listOfTlds.includes(tlds[0])) {
      return `.${tlds[tlds.length - 1]}`;
    }

    return `.${tlds.join('.')}`;
  }

  /**
   * Returns a primary domain for provided hostname (e.g. www.example.com -> example.com).
   * @param {string|URL} url hostname or URL object
   * @returns {string}
   */
  static getRootDomain(url) {
    const hostname = Util.createOrReturnURL(url).hostname;
    const tld = Util.getTld(hostname);

    // tld is .com or .co.uk which means we means that length is 1 to big
    // .com => 2 & .co.uk => 3
    const splitTld = tld.split('.');

    // get TLD + root domain
    return hostname.split('.').slice(-splitTld.length).join('.');
  }

  /**
   * @param {LH.Config.Settings} settings
   * @return {!Array<{name: string, description: string}>}
   */
  static getEnvironmentDisplayValues(settings) {
    const emulationDesc = Util.getEmulationDescriptions(settings);

    return [
      {
        name: Util.i18n.strings.runtimeSettingsDevice,
        description: emulationDesc.deviceEmulation,
      },
      {
        name: Util.i18n.strings.runtimeSettingsNetworkThrottling,
        description: emulationDesc.networkThrottling,
      },
      {
        name: Util.i18n.strings.runtimeSettingsCPUThrottling,
        description: emulationDesc.cpuThrottling,
      },
    ];
  }

  /**
   * @param {LH.Config.Settings} settings
   * @return {{deviceEmulation: string, networkThrottling: string, cpuThrottling: string}}
   */
  static getEmulationDescriptions(settings) {
    let cpuThrottling;
    let networkThrottling;

    const throttling = settings.throttling;

    switch (settings.throttlingMethod) {
      case 'provided':
        cpuThrottling = Util.i18n.strings.throttlingProvided;
        networkThrottling = Util.i18n.strings.throttlingProvided;
        break;
      case 'devtools': {
        const {cpuSlowdownMultiplier, requestLatencyMs} = throttling;
        cpuThrottling = `${Util.i18n.formatNumber(cpuSlowdownMultiplier)}x slowdown (DevTools)`;
        networkThrottling = `${Util.i18n.formatNumber(requestLatencyMs)}${NBSP}ms HTTP RTT, ` +
          `${Util.i18n.formatNumber(throttling.downloadThroughputKbps)}${NBSP}Kbps down, ` +
          `${Util.i18n.formatNumber(throttling.uploadThroughputKbps)}${NBSP}Kbps up (DevTools)`;
        break;
      }
      case 'simulate': {
        const {cpuSlowdownMultiplier, rttMs, throughputKbps} = throttling;
        cpuThrottling = `${Util.i18n.formatNumber(cpuSlowdownMultiplier)}x slowdown (Simulated)`;
        networkThrottling = `${Util.i18n.formatNumber(rttMs)}${NBSP}ms TCP RTT, ` +
          `${Util.i18n.formatNumber(throughputKbps)}${NBSP}Kbps throughput (Simulated)`;
        break;
      }
      default:
        cpuThrottling = Util.i18n.strings.runtimeUnknown;
        networkThrottling = Util.i18n.strings.runtimeUnknown;
    }

    let deviceEmulation = Util.i18n.strings.runtimeNoEmulation;
    if (settings.emulatedFormFactor === 'mobile') {
      deviceEmulation = Util.i18n.strings.runtimeMobileEmulation;
    } else if (settings.emulatedFormFactor === 'desktop') {
      deviceEmulation = Util.i18n.strings.runtimeDesktopEmulation;
    }

    return {
      deviceEmulation,
      cpuThrottling,
      networkThrottling,
    };
  }

  /**
   * Returns only lines that are near a message, or the first few lines if there are
   * no line messages.
   * @param {LH.Audit.Details.SnippetValue['lines']} lines
   * @param {LH.Audit.Details.SnippetValue['lineMessages']} lineMessages
   * @param {number} surroundingLineCount Number of lines to include before and after
   * the message. If this is e.g. 2 this function might return 5 lines.
   */
  static filterRelevantLines(lines, lineMessages, surroundingLineCount) {
    if (lineMessages.length === 0) {
      // no lines with messages, just return the first bunch of lines
      return lines.slice(0, surroundingLineCount * 2 + 1);
    }

    const minGapSize = 3;
    const lineNumbersToKeep = new Set();
    // Sort messages so we can check lineNumbersToKeep to see how big the gap to
    // the previous line is.
    lineMessages = lineMessages.sort((a, b) => (a.lineNumber || 0) - (b.lineNumber || 0));
    lineMessages.forEach(({lineNumber}) => {
      let firstSurroundingLineNumber = lineNumber - surroundingLineCount;
      let lastSurroundingLineNumber = lineNumber + surroundingLineCount;

      while (firstSurroundingLineNumber < 1) {
        // make sure we still show (surroundingLineCount * 2 + 1) lines in total
        firstSurroundingLineNumber++;
        lastSurroundingLineNumber++;
      }
      // If only a few lines would be omitted normally then we prefer to include
      // extra lines to avoid the tiny gap
      if (lineNumbersToKeep.has(firstSurroundingLineNumber - minGapSize - 1)) {
        firstSurroundingLineNumber -= minGapSize;
      }
      for (let i = firstSurroundingLineNumber; i <= lastSurroundingLineNumber; i++) {
        const surroundingLineNumber = i;
        lineNumbersToKeep.add(surroundingLineNumber);
      }
    });

    return lines.filter(line => lineNumbersToKeep.has(line.lineNumber));
  }

  /**
   * @param {string} categoryId
   */
  static isPluginCategory(categoryId) {
    return categoryId.startsWith('lighthouse-plugin-');
  }
}

/**
 * Some parts of the report renderer require data found on the LHR. Instead of wiring it
 * through, we have this global.
 * @type {LH.ReportResult | null}
 */
Util.reportJson = null;

/**
 * An always-increasing counter for making unique SVG ID suffixes.
 */
Util.getUniqueSuffix = (() => {
  let svgSuffix = 0;
  return function() {
    return svgSuffix++;
  };
})();

/** @type {I18n} */
// @ts-expect-error: Is set in report renderer.
Util.i18n = null;

/**
 * Report-renderer-specific strings.
 */
Util.UIStrings = {
  /** Disclaimer shown to users below the metric values (First Contentful Paint, Time to Interactive, etc) to warn them that the numbers they see will likely change slightly the next time they run Lighthouse. */
  varianceDisclaimer: 'Values are estimated and may vary. The [performance score is calculated](https://web.dev/performance-scoring/) directly from these metrics.',
  /** Text link pointing to an interactive calculator that explains Lighthouse scoring. The link text should be fairly short. */
  calculatorLink: 'See calculator.',
  /** Column heading label for the listing of opportunity audits. Each audit title represents an opportunity. There are only 2 columns, so no strict character limit.  */
  opportunityResourceColumnLabel: 'Opportunity',
  /** Column heading label for the estimated page load savings of opportunity audits. Estimated Savings is the total amount of time (in seconds) that Lighthouse computed could be reduced from the total page load time, if the suggested action is taken. There are only 2 columns, so no strict character limit. */
  opportunitySavingsColumnLabel: 'Estimated Savings',

  /** An error string displayed next to a particular audit when it has errored, but not provided any specific error message. */
  errorMissingAuditInfo: 'Report error: no audit information',
  /** A label, shown next to an audit title or metric title, indicating that there was an error computing it. The user can hover on the label to reveal a tooltip with the extended error message. Translation should be short (< 20 characters). */
  errorLabel: 'Error!',
  /** This label is shown above a bulleted list of warnings. It is shown directly below an audit that produced warnings. Warnings describe situations the user should be aware of, as Lighthouse was unable to complete all the work required on this audit. For example, The 'Unable to decode image (biglogo.jpg)' warning may show up below an image encoding audit. */
  warningHeader: 'Warnings: ',
  /** The tooltip text on an expandable chevron icon. Clicking the icon expands a section to reveal a list of audit results that was hidden by default. */
  auditGroupExpandTooltip: 'Show audits',
  /** Section heading shown above a list of passed audits that contain warnings. Audits under this section do not negatively impact the score, but Lighthouse has generated some potentially actionable suggestions that should be reviewed. This section is expanded by default and displays after the failing audits. */
  warningAuditsGroupTitle: 'Passed audits but with warnings',
  /** Section heading shown above a list of audits that are passing. 'Passed' here refers to a passing grade. This section is collapsed by default, as the user should be focusing on the failed audits instead. Users can click this heading to reveal the list. */
  passedAuditsGroupTitle: 'Passed audits',
  /** Section heading shown above a list of audits that do not apply to the page. For example, if an audit is 'Are images optimized?', but the page has no images on it, the audit will be marked as not applicable. This is neither passing or failing. This section is collapsed by default, as the user should be focusing on the failed audits instead. Users can click this heading to reveal the list. */
  notApplicableAuditsGroupTitle: 'Not applicable',
  /** Section heading shown above a list of audits that were not computed by Lighthouse. They serve as a list of suggestions for the user to go and manually check. For example, Lighthouse can't automate testing cross-browser compatibility, so that is listed within this section, so the user is reminded to test it themselves. This section is collapsed by default, as the user should be focusing on the failed audits instead. Users can click this heading to reveal the list. */
  manualAuditsGroupTitle: 'Additional items to manually check',

  /** Label shown preceding any important warnings that may have invalidated the entire report. For example, if the user has Chrome extensions installed, they may add enough performance overhead that Lighthouse's performance metrics are unreliable. If shown, this will be displayed at the top of the report UI. */
  toplevelWarningsMessage: 'There were issues affecting this run of Lighthouse:',

  /** String of text shown in a graphical representation of the flow of network requests for the web page. This label represents the initial network request that fetches an HTML page. This navigation may be redirected (eg. Initial navigation to http://example.com redirects to https://www.example.com). */
  crcInitialNavigation: 'Initial Navigation',
  /** Label of value shown in the summary of critical request chains. Refers to the total amount of time (milliseconds) of the longest critical path chain/sequence of network requests. Example value: 2310 ms */
  crcLongestDurationLabel: 'Maximum critical path latency:',

  /** Label for button that shows all lines of the snippet when clicked */
  snippetExpandButtonLabel: 'Expand snippet',
  /** Label for button that only shows a few lines of the snippet when clicked */
  snippetCollapseButtonLabel: 'Collapse snippet',

  /** Explanation shown to users below performance results to inform them that the test was done with a 4G network connection and to warn them that the numbers they see will likely change slightly the next time they run Lighthouse. 'Lighthouse' becomes link text to additional documentation. */
  lsPerformanceCategoryDescription: '[Lighthouse](https://developers.google.com/web/tools/lighthouse/) analysis of the current page on an emulated mobile network. Values are estimated and may vary.',
  /** Title of the lab data section of the Performance category. Within this section are various speed metrics which quantify the pageload performance into values presented in seconds and milliseconds. "Lab" is an abbreviated form of "laboratory", and refers to the fact that the data is from a controlled test of a website, not measurements from real users visiting that site.  */
  labDataTitle: 'Lab Data',

  /** This label is for a checkbox above a table of items loaded by a web page. The checkbox is used to show or hide third-party (or "3rd-party") resources in the table, where "third-party resources" refers to items loaded by a web page from URLs that aren't controlled by the owner of the web page. */
  thirdPartyResourcesLabel: 'Show 3rd-party resources',

  /** Option in a dropdown menu that opens a small, summary report in a print dialog.  */
  dropdownPrintSummary: 'Print Summary',
  /** Option in a dropdown menu that opens a full Lighthouse report in a print dialog.  */
  dropdownPrintExpanded: 'Print Expanded',
  /** Option in a dropdown menu that copies the Lighthouse JSON object to the system clipboard. */
  dropdownCopyJSON: 'Copy JSON',
  /** Option in a dropdown menu that saves the Lighthouse report HTML locally to the system as a '.html' file. */
  dropdownSaveHTML: 'Save as HTML',
  /** Option in a dropdown menu that saves the Lighthouse JSON object to the local system as a '.json' file. */
  dropdownSaveJSON: 'Save as JSON',
  /** Option in a dropdown menu that opens the current report in the Lighthouse Viewer Application. */
  dropdownViewer: 'Open in Viewer',
  /** Option in a dropdown menu that saves the current report as a new Github Gist. */
  dropdownSaveGist: 'Save as Gist',
  /** Option in a dropdown menu that toggles the themeing of the report between Light(default) and Dark themes. */
  dropdownDarkTheme: 'Toggle Dark Theme',

  /** Title of the Runtime settings table in a Lighthouse report.  Runtime settings are the environment configurations that a specific report used at auditing time. */
  runtimeSettingsTitle: 'Runtime Settings',
  /** Label for a row in a table that shows the URL that was audited during a Lighthouse run. */
  runtimeSettingsUrl: 'URL',
  /** Label for a row in a table that shows the time at which a Lighthouse run was conducted; formatted as a timestamp, e.g. Jan 1, 1970 12:00 AM UTC. */
  runtimeSettingsFetchTime: 'Fetch Time',
  /** Label for a row in a table that describes the kind of device that was emulated for the Lighthouse run.  Example values for row elements: 'No Emulation', 'Emulated Desktop', etc. */
  runtimeSettingsDevice: 'Device',
  /** Label for a row in a table that describes the network throttling conditions that were used during a Lighthouse run, if any. */
  runtimeSettingsNetworkThrottling: 'Network throttling',
  /** Label for a row in a table that describes the CPU throttling conditions that were used during a Lighthouse run, if any.*/
  runtimeSettingsCPUThrottling: 'CPU throttling',
  /** Label for a row in a table that shows in what tool Lighthouse is being run (e.g. The lighthouse CLI, Chrome DevTools, Lightrider, WebPageTest, etc). */
  runtimeSettingsChannel: 'Channel',
  /** Label for a row in a table that shows the User Agent that was detected on the Host machine that ran Lighthouse. */
  runtimeSettingsUA: 'User agent (host)',
  /** Label for a row in a table that shows the User Agent that was used to send out all network requests during the Lighthouse run. */
  runtimeSettingsUANetwork: 'User agent (network)',
  /** Label for a row in a table that shows the estimated CPU power of the machine running Lighthouse. Example row values: 532, 1492, 783. */
  runtimeSettingsBenchmark: 'CPU/Memory Power',
  /** Label for a row in a table that shows the version of the Axe library used. Example row values: 2.1.0, 3.2.3 */
  runtimeSettingsAxeVersion: 'Axe version',

  /** Label for button to create an issue against the Lighthouse Github project. */
  footerIssue: 'File an issue',

  /** Descriptive explanation for emulation setting when no device emulation is set. */
  runtimeNoEmulation: 'No emulation',
  /** Descriptive explanation for emulation setting when emulating a Moto G4 mobile device. */
  runtimeMobileEmulation: 'Emulated Moto G4',
  /** Descriptive explanation for emulation setting when emulating a generic desktop form factor, as opposed to a mobile-device like form factor. */
  runtimeDesktopEmulation: 'Emulated Desktop',
  /** Descriptive explanation for a runtime setting that is set to an unknown value. */
  runtimeUnknown: 'Unknown',

  /** Descriptive explanation for environment throttling that was provided by the runtime environment instead of provided by Lighthouse throttling. */
  throttlingProvided: 'Provided by environment',
};

if (typeof module !== 'undefined' && module.exports) {
  module.exports = Util;
} else {
  self.Util = Util;
}
;
/**
 * @license
 * Copyright 2017 The Lighthouse Authors. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS-IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
'use strict';

/* globals URL self Util */

/** @typedef {HTMLElementTagNameMap & {[id: string]: HTMLElement}} HTMLElementByTagName */

class DOM {
  /**
   * @param {Document} document
   */
  constructor(document) {
    /** @type {Document} */
    this._document = document;
    /** @type {string} */
    this._lighthouseChannel = 'unknown';
  }

  /**
   * @template {string} T
   * @param {T} name
   * @param {string=} className
   * @param {Object<string, (string|undefined)>=} attrs Attribute key/val pairs.
   *     Note: if an attribute key has an undefined value, this method does not
   *     set the attribute on the node.
   * @return {HTMLElementByTagName[T]}
   */
  createElement(name, className, attrs = {}) {
    const element = this._document.createElement(name);
    if (className) {
      element.className = className;
    }
    Object.keys(attrs).forEach(key => {
      const value = attrs[key];
      if (typeof value !== 'undefined') {
        element.setAttribute(key, value);
      }
    });
    return element;
  }

  /**
   * @param {string} namespaceURI
   * @param {string} name
   * @param {string=} className
   * @param {Object<string, (string|undefined)>=} attrs Attribute key/val pairs.
   *     Note: if an attribute key has an undefined value, this method does not
   *     set the attribute on the node.
   * @return {Element}
   */
  createElementNS(namespaceURI, name, className, attrs = {}) {
    const element = this._document.createElementNS(namespaceURI, name);
    if (className) {
      element.className = className;
    }
    Object.keys(attrs).forEach(key => {
      const value = attrs[key];
      if (typeof value !== 'undefined') {
        element.setAttribute(key, value);
      }
    });
    return element;
  }

  /**
   * @return {!DocumentFragment}
   */
  createFragment() {
    return this._document.createDocumentFragment();
  }

  /**
   * @template {string} T
   * @param {Element} parentElem
   * @param {T} elementName
   * @param {string=} className
   * @param {Object<string, (string|undefined)>=} attrs Attribute key/val pairs.
   *     Note: if an attribute key has an undefined value, this method does not
   *     set the attribute on the node.
   * @return {HTMLElementByTagName[T]}
   */
  createChildOf(parentElem, elementName, className, attrs) {
    const element = this.createElement(elementName, className, attrs);
    parentElem.appendChild(element);
    return element;
  }

  /**
   * @param {string} selector
   * @param {ParentNode} context
   * @return {!DocumentFragment} A clone of the template content.
   * @throws {Error}
   */
  cloneTemplate(selector, context) {
    const template = /** @type {?HTMLTemplateElement} */ (context.querySelector(selector));
    if (!template) {
      throw new Error(`Template not found: template${selector}`);
    }

    const clone = this._document.importNode(template.content, true);

    // Prevent duplicate styles in the DOM. After a template has been stamped
    // for the first time, remove the clone's styles so they're not re-added.
    if (template.hasAttribute('data-stamped')) {
      this.findAll('style', clone).forEach(style => style.remove());
    }
    template.setAttribute('data-stamped', 'true');

    return clone;
  }

  /**
   * Resets the "stamped" state of the templates.
   */
  resetTemplates() {
    this.findAll('template[data-stamped]', this._document).forEach(t => {
      t.removeAttribute('data-stamped');
    });
  }

  /**
   * @param {string} text
   * @return {Element}
   */
  convertMarkdownLinkSnippets(text) {
    const element = this.createElement('span');

    for (const segment of Util.splitMarkdownLink(text)) {
      if (!segment.isLink) {
        // Plain text segment.
        element.appendChild(this._document.createTextNode(segment.text));
        continue;
      }

      // Otherwise, append any links found.
      const url = new URL(segment.linkHref);

      const DOCS_ORIGINS = ['https://developers.google.com', 'https://web.dev'];
      if (DOCS_ORIGINS.includes(url.origin)) {
        url.searchParams.set('utm_source', 'lighthouse');
        url.searchParams.set('utm_medium', this._lighthouseChannel);
      }

      const a = this.createElement('a');
      a.rel = 'noopener';
      a.target = '_blank';
      a.textContent = segment.text;
      a.href = url.href;
      element.appendChild(a);
    }

    return element;
  }

  /**
   * @param {string} markdownText
   * @return {Element}
   */
  convertMarkdownCodeSnippets(markdownText) {
    const element = this.createElement('span');

    for (const segment of Util.splitMarkdownCodeSpans(markdownText)) {
      if (segment.isCode) {
        const pre = this.createElement('code');
        pre.textContent = segment.text;
        element.appendChild(pre);
      } else {
        element.appendChild(this._document.createTextNode(segment.text));
      }
    }

    return element;
  }

  /**
   * The channel to use for UTM data when rendering links to the documentation.
   * @param {string} lighthouseChannel
   */
  setLighthouseChannel(lighthouseChannel) {
    this._lighthouseChannel = lighthouseChannel;
  }

  /**
   * @return {Document}
   */
  document() {
    return this._document;
  }

  /**
   * TODO(paulirish): import and conditionally apply the DevTools frontend subclasses instead of this
   * @return {boolean}
   */
  isDevTools() {
    return !!this._document.querySelector('.lh-devtools');
  }

  /**
   * Guaranteed context.querySelector. Always returns an element or throws if
   * nothing matches query.
   * @param {string} query
   * @param {ParentNode} context
   * @return {!HTMLElement}
   */
  find(query, context) {
    /** @type {?HTMLElement} */
    const result = context.querySelector(query);
    if (result === null) {
      throw new Error(`query ${query} not found`);
    }
    return result;
  }

  /**
   * Helper for context.querySelectorAll. Returns an Array instead of a NodeList.
   * @param {string} query
   * @param {ParentNode} context
   * @return {!Array<HTMLElement>}
   */
  findAll(query, context) {
    return Array.from(context.querySelectorAll(query));
  }
}

if (typeof module !== 'undefined' && module.exports) {
  module.exports = DOM;
} else {
  self.DOM = DOM;
}
;
/*
Details Element Polyfill 2.4.0
Copyright © 2019 Javan Makhmali
 */
(function() {
  "use strict";
  var element = document.createElement("details");
  var elementIsNative = typeof HTMLDetailsElement != "undefined" && element instanceof HTMLDetailsElement;
  var support = {
    open: "open" in element || elementIsNative,
    toggle: "ontoggle" in element
  };
  var styles = '\ndetails, summary {\n  display: block;\n}\ndetails:not([open]) > *:not(summary) {\n  display: none;\n}\nsummary::before {\n  content: "►";\n  padding-right: 0.3rem;\n  font-size: 0.6rem;\n  cursor: default;\n}\n[open] > summary::before {\n  content: "▼";\n}\n';
  var _ref = [], forEach = _ref.forEach, slice = _ref.slice;
  if (!support.open) {
    polyfillStyles();
    polyfillProperties();
    polyfillToggle();
    polyfillAccessibility();
  }
  if (support.open && !support.toggle) {
    polyfillToggleEvent();
  }
  function polyfillStyles() {
    document.head.insertAdjacentHTML("afterbegin", "<style>" + styles + "\u003c/style>");
  }
  function polyfillProperties() {
    var prototype = document.createElement("details").constructor.prototype;
    var setAttribute = prototype.setAttribute, removeAttribute = prototype.removeAttribute;
    var open = Object.getOwnPropertyDescriptor(prototype, "open");
    Object.defineProperties(prototype, {
      open: {
        get: function get() {
          if (this.tagName == "DETAILS") {
            return this.hasAttribute("open");
          } else {
            if (open && open.get) {
              return open.get.call(this);
            }
          }
        },
        set: function set(value) {
          if (this.tagName == "DETAILS") {
            return value ? this.setAttribute("open", "") : this.removeAttribute("open");
          } else {
            if (open && open.set) {
              return open.set.call(this, value);
            }
          }
        }
      },
      setAttribute: {
        value: function value(name, _value) {
          var _this = this;
          var call = function call() {
            return setAttribute.call(_this, name, _value);
          };
          if (name == "open" && this.tagName == "DETAILS") {
            var wasOpen = this.hasAttribute("open");
            var result = call();
            if (!wasOpen) {
              var summary = this.querySelector("summary");
              if (summary) summary.setAttribute("aria-expanded", true);
              triggerToggle(this);
            }
            return result;
          }
          return call();
        }
      },
      removeAttribute: {
        value: function value(name) {
          var _this2 = this;
          var call = function call() {
            return removeAttribute.call(_this2, name);
          };
          if (name == "open" && this.tagName == "DETAILS") {
            var wasOpen = this.hasAttribute("open");
            var result = call();
            if (wasOpen) {
              var summary = this.querySelector("summary");
              if (summary) summary.setAttribute("aria-expanded", false);
              triggerToggle(this);
            }
            return result;
          }
          return call();
        }
      }
    });
  }
  function polyfillToggle() {
    onTogglingTrigger(function(element) {
      element.hasAttribute("open") ? element.removeAttribute("open") : element.setAttribute("open", "");
    });
  }
  function polyfillToggleEvent() {
    if (window.MutationObserver) {
      new MutationObserver(function(mutations) {
        forEach.call(mutations, function(mutation) {
          var target = mutation.target, attributeName = mutation.attributeName;
          if (target.tagName == "DETAILS" && attributeName == "open") {
            triggerToggle(target);
          }
        });
      }).observe(document.documentElement, {
        attributes: true,
        subtree: true
      });
    } else {
      onTogglingTrigger(function(element) {
        var wasOpen = element.getAttribute("open");
        setTimeout(function() {
          var isOpen = element.getAttribute("open");
          if (wasOpen != isOpen) {
            triggerToggle(element);
          }
        }, 1);
      });
    }
  }
  function polyfillAccessibility() {
    setAccessibilityAttributes(document);
    if (window.MutationObserver) {
      new MutationObserver(function(mutations) {
        forEach.call(mutations, function(mutation) {
          forEach.call(mutation.addedNodes, setAccessibilityAttributes);
        });
      }).observe(document.documentElement, {
        subtree: true,
        childList: true
      });
    } else {
      document.addEventListener("DOMNodeInserted", function(event) {
        setAccessibilityAttributes(event.target);
      });
    }
  }
  function setAccessibilityAttributes(root) {
    findElementsWithTagName(root, "SUMMARY").forEach(function(summary) {
      var details = findClosestElementWithTagName(summary, "DETAILS");
      summary.setAttribute("aria-expanded", details.hasAttribute("open"));
      if (!summary.hasAttribute("tabindex")) summary.setAttribute("tabindex", "0");
      if (!summary.hasAttribute("role")) summary.setAttribute("role", "button");
    });
  }
  function eventIsSignificant(event) {
    return !(event.defaultPrevented || event.ctrlKey || event.metaKey || event.shiftKey || event.target.isContentEditable);
  }
  function onTogglingTrigger(callback) {
    addEventListener("click", function(event) {
      if (eventIsSignificant(event)) {
        if (event.which <= 1) {
          var element = findClosestElementWithTagName(event.target, "SUMMARY");
          if (element && element.parentNode && element.parentNode.tagName == "DETAILS") {
            callback(element.parentNode);
          }
        }
      }
    }, false);
    addEventListener("keydown", function(event) {
      if (eventIsSignificant(event)) {
        if (event.keyCode == 13 || event.keyCode == 32) {
          var element = findClosestElementWithTagName(event.target, "SUMMARY");
          if (element && element.parentNode && element.parentNode.tagName == "DETAILS") {
            callback(element.parentNode);
            event.preventDefault();
          }
        }
      }
    }, false);
  }
  function triggerToggle(element) {
    var event = document.createEvent("Event");
    event.initEvent("toggle", false, false);
    element.dispatchEvent(event);
  }
  function findElementsWithTagName(root, tagName) {
    return (root.tagName == tagName ? [ root ] : []).concat(typeof root.getElementsByTagName == "function" ? slice.call(root.getElementsByTagName(tagName)) : []);
  }
  function findClosestElementWithTagName(element, tagName) {
    if (typeof element.closest == "function") {
      return element.closest(tagName);
    } else {
      while (element) {
        if (element.tagName == tagName) {
          return element;
        } else {
          element = element.parentNode;
        }
      }
    }
  }
})();
;
/**
 * @license
 * Copyright 2017 The Lighthouse Authors. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS-IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
'use strict';

/* globals self CriticalRequestChainRenderer SnippetRenderer ElementScreenshotRenderer Util URL */

/** @typedef {import('./dom.js')} DOM */

// Convenience types for localized AuditDetails.
/** @typedef {LH.FormattedIcu<LH.Audit.Details>} AuditDetails */
/** @typedef {LH.FormattedIcu<LH.Audit.Details.Opportunity>} OpportunityTable */
/** @typedef {LH.FormattedIcu<LH.Audit.Details.Table>} Table */
/** @typedef {LH.FormattedIcu<LH.Audit.Details.TableItem>} TableItem */
/** @typedef {LH.FormattedIcu<LH.Audit.Details.ItemValue>} TableItemValue */

const URL_PREFIXES = ['http://', 'https://', 'data:'];

class DetailsRenderer {
  /**
   * @param {DOM} dom
   * @param {{fullPageScreenshot?: LH.Audit.Details.FullPageScreenshot}} [options]
   */
  constructor(dom, options = {}) {
    this._dom = dom;
    this._fullPageScreenshot = options.fullPageScreenshot;

    /** @type {ParentNode} */
    this._templateContext; // eslint-disable-line no-unused-expressions
  }

  /**
   * @param {ParentNode} context
   */
  setTemplateContext(context) {
    this._templateContext = context;
  }

  /**
   * @param {AuditDetails} details
   * @return {Element|null}
   */
  render(details) {
    switch (details.type) {
      case 'filmstrip':
        return this._renderFilmstrip(details);
      case 'list':
        return this._renderList(details);
      case 'table':
        return this._renderTable(details);
      case 'criticalrequestchain':
        return CriticalRequestChainRenderer.render(this._dom, this._templateContext, details, this);
      case 'opportunity':
        return this._renderTable(details);

      // Internal-only details, not for rendering.
      case 'screenshot':
      case 'debugdata':
      case 'full-page-screenshot':
        return null;

      default: {
        // @ts-expect-error tsc thinks this is unreachable, but be forward compatible
        // with new unexpected detail types.
        return this._renderUnknown(details.type, details);
      }
    }
  }

  /**
   * @param {{value: number, granularity?: number}} details
   * @return {Element}
   */
  _renderBytes(details) {
    // TODO: handle displayUnit once we have something other than 'kb'
    // Note that 'kb' is historical and actually represents KiB.
    const value = Util.i18n.formatBytesToKiB(details.value, details.granularity);
    const textEl = this._renderText(value);
    textEl.title = Util.i18n.formatBytes(details.value);
    return textEl;
  }

  /**
   * @param {{value: number, granularity?: number, displayUnit?: string}} details
   * @return {Element}
   */
  _renderMilliseconds(details) {
    let value = Util.i18n.formatMilliseconds(details.value, details.granularity);
    if (details.displayUnit === 'duration') {
      value = Util.i18n.formatDuration(details.value);
    }

    return this._renderText(value);
  }

  /**
   * @param {string} text
   * @return {HTMLElement}
   */
  renderTextURL(text) {
    const url = text;

    let displayedPath;
    let displayedHost;
    let title;
    try {
      const parsed = Util.parseURL(url);
      displayedPath = parsed.file === '/' ? parsed.origin : parsed.file;
      displayedHost = parsed.file === '/' || parsed.hostname === '' ? '' : `(${parsed.hostname})`;
      title = url;
    } catch (e) {
      displayedPath = url;
    }

    const element = this._dom.createElement('div', 'lh-text__url');
    element.appendChild(this._renderLink({text: displayedPath, url}));

    if (displayedHost) {
      const hostElem = this._renderText(displayedHost);
      hostElem.classList.add('lh-text__url-host');
      element.appendChild(hostElem);
    }

    if (title) {
      element.title = url;
      // set the url on the element's dataset which we use to check 3rd party origins
      element.dataset.url = url;
    }
    return element;
  }

  /**
   * @param {{text: string, url: string}} details
   * @return {Element}
   */
  _renderLink(details) {
    const allowedProtocols = ['https:', 'http:'];
    let url;
    try {
      url = new URL(details.url);
    } catch (_) {}

    if (!url || !allowedProtocols.includes(url.protocol)) {
      // Fall back to just the link text if invalid or protocol not allowed.
      const element = this._renderText(details.text);
      element.classList.add('lh-link');
      return element;
    }

    const a = this._dom.createElement('a');
    a.rel = 'noopener';
    a.target = '_blank';
    a.textContent = details.text;
    a.href = url.href;
    a.classList.add('lh-link');
    return a;
  }

  /**
   * @param {string} text
   * @return {HTMLDivElement}
   */
  _renderText(text) {
    const element = this._dom.createElement('div', 'lh-text');
    element.textContent = text;
    return element;
  }

  /**
   * @param {{value: number, granularity?: number}} details
   * @return {Element}
   */
  _renderNumeric(details) {
    const value = Util.i18n.formatNumber(details.value, details.granularity);
    const element = this._dom.createElement('div', 'lh-numeric');
    element.textContent = value;
    return element;
  }

  /**
   * Create small thumbnail with scaled down image asset.
   * @param {string} details
   * @return {Element}
   */
  _renderThumbnail(details) {
    const element = this._dom.createElement('img', 'lh-thumbnail');
    const strValue = details;
    element.src = strValue;
    element.title = strValue;
    element.alt = '';
    return element;
  }

  /**
   * @param {string} type
   * @param {*} value
   */
  _renderUnknown(type, value) {
    // eslint-disable-next-line no-console
    console.error(`Unknown details type: ${type}`, value);
    const element = this._dom.createElement('details', 'lh-unknown');
    this._dom.createChildOf(element, 'summary').textContent =
      `We don't know how to render audit details of type \`${type}\`. ` +
      'The Lighthouse version that collected this data is likely newer than the Lighthouse ' +
      'version of the report renderer. Expand for the raw JSON.';
    this._dom.createChildOf(element, 'pre').textContent = JSON.stringify(value, null, 2);
    return element;
  }

  /**
   * Render a details item value for embedding in a table. Renders the value
   * based on the heading's valueType, unless the value itself has a `type`
   * property to override it.
   * @param {TableItemValue} value
   * @param {LH.Audit.Details.OpportunityColumnHeading} heading
   * @return {Element|null}
   */
  _renderTableValue(value, heading) {
    if (value === undefined || value === null) {
      return null;
    }

    // First deal with the possible object forms of value.
    if (typeof value === 'object') {
      // The value's type overrides the heading's for this column.
      switch (value.type) {
        case 'code': {
          return this._renderCode(value.value);
        }
        case 'link': {
          return this._renderLink(value);
        }
        case 'node': {
          return this.renderNode(value);
        }
        case 'numeric': {
          return this._renderNumeric(value);
        }
        case 'source-location': {
          return this.renderSourceLocation(value);
        }
        case 'url': {
          return this.renderTextURL(value.value);
        }
        default: {
          return this._renderUnknown(value.type, value);
        }
      }
    }

    // Next, deal with primitives.
    switch (heading.valueType) {
      case 'bytes': {
        const numValue = Number(value);
        return this._renderBytes({value: numValue, granularity: heading.granularity});
      }
      case 'code': {
        const strValue = String(value);
        return this._renderCode(strValue);
      }
      case 'ms': {
        const msValue = {
          value: Number(value),
          granularity: heading.granularity,
          displayUnit: heading.displayUnit,
        };
        return this._renderMilliseconds(msValue);
      }
      case 'numeric': {
        const numValue = Number(value);
        return this._renderNumeric({value: numValue, granularity: heading.granularity});
      }
      case 'text': {
        const strValue = String(value);
        return this._renderText(strValue);
      }
      case 'thumbnail': {
        const strValue = String(value);
        return this._renderThumbnail(strValue);
      }
      case 'timespanMs': {
        const numValue = Number(value);
        return this._renderMilliseconds({value: numValue});
      }
      case 'url': {
        const strValue = String(value);
        if (URL_PREFIXES.some(prefix => strValue.startsWith(prefix))) {
          return this.renderTextURL(strValue);
        } else {
          // Fall back to <pre> rendering if not actually a URL.
          return this._renderCode(strValue);
        }
      }
      default: {
        return this._renderUnknown(heading.valueType, value);
      }
    }
  }

  /**
   * Get the headings of a table-like details object, converted into the
   * OpportunityColumnHeading type until we have all details use the same
   * heading format.
   * @param {Table|OpportunityTable} tableLike
   * @return {OpportunityTable['headings']}
   */
  _getCanonicalizedHeadingsFromTable(tableLike) {
    if (tableLike.type === 'opportunity') {
      return tableLike.headings;
    }

    return tableLike.headings.map(heading => this._getCanonicalizedHeading(heading));
  }

  /**
   * Get the headings of a table-like details object, converted into the
   * OpportunityColumnHeading type until we have all details use the same
   * heading format.
   * @param {Table['headings'][number]} heading
   * @return {OpportunityTable['headings'][number]}
   */
  _getCanonicalizedHeading(heading) {
    let subItemsHeading;
    if (heading.subItemsHeading) {
      subItemsHeading = this._getCanonicalizedsubItemsHeading(heading.subItemsHeading, heading);
    }

    return {
      key: heading.key,
      valueType: heading.itemType,
      subItemsHeading,
      label: heading.text,
      displayUnit: heading.displayUnit,
      granularity: heading.granularity,
    };
  }

  /**
   * @param {Exclude<LH.Audit.Details.TableColumnHeading['subItemsHeading'], undefined>} subItemsHeading
   * @param {LH.Audit.Details.TableColumnHeading} parentHeading
   * @return {LH.Audit.Details.OpportunityColumnHeading['subItemsHeading']}
   */
  _getCanonicalizedsubItemsHeading(subItemsHeading, parentHeading) {
    // Low-friction way to prevent commiting a falsy key (which is never allowed for
    // a subItemsHeading) from passing in CI.
    if (!subItemsHeading.key) {
      // eslint-disable-next-line no-console
      console.warn('key should not be null');
    }

    return {
      key: subItemsHeading.key || '',
      valueType: subItemsHeading.itemType || parentHeading.itemType,
      granularity: subItemsHeading.granularity || parentHeading.granularity,
      displayUnit: subItemsHeading.displayUnit || parentHeading.displayUnit,
    };
  }

  /**
   * Returns a new heading where the values are defined first by `heading.subItemsHeading`,
   * and secondly by `heading`. If there is no subItemsHeading, returns null, which will
   * be rendered as an empty column.
   * @param {LH.Audit.Details.OpportunityColumnHeading} heading
   * @return {LH.Audit.Details.OpportunityColumnHeading | null}
   */
  _getDerivedsubItemsHeading(heading) {
    if (!heading.subItemsHeading) return null;
    return {
      key: heading.subItemsHeading.key || '',
      valueType: heading.subItemsHeading.valueType || heading.valueType,
      granularity: heading.subItemsHeading.granularity || heading.granularity,
      displayUnit: heading.subItemsHeading.displayUnit || heading.displayUnit,
      label: '',
    };
  }

  /**
   * @param {TableItem} item
   * @param {(LH.Audit.Details.OpportunityColumnHeading | null)[]} headings
   */
  _renderTableRow(item, headings) {
    const rowElem = this._dom.createElement('tr');

    for (const heading of headings) {
      // Empty cell if no heading or heading key for this column.
      if (!heading || !heading.key) {
        this._dom.createChildOf(rowElem, 'td', 'lh-table-column--empty');
        continue;
      }

      const value = item[heading.key];
      let valueElement;
      if (value !== undefined && value !== null) {
        valueElement = this._renderTableValue(value, heading);
      }

      if (valueElement) {
        const classes = `lh-table-column--${heading.valueType}`;
        this._dom.createChildOf(rowElem, 'td', classes).appendChild(valueElement);
      } else {
        // Empty cell is rendered for a column if:
        // - the pair is null
        // - the heading key is null
        // - the value is undefined/null
        this._dom.createChildOf(rowElem, 'td', 'lh-table-column--empty');
      }
    }

    return rowElem;
  }

  /**
   * Renders one or more rows from a details table item. A single table item can
   * expand into multiple rows, if there is a subItemsHeading.
   * @param {TableItem} item
   * @param {LH.Audit.Details.OpportunityColumnHeading[]} headings
   */
  _renderTableRowsFromItem(item, headings) {
    const fragment = this._dom.createFragment();
    fragment.append(this._renderTableRow(item, headings));

    if (!item.subItems) return fragment;

    const subItemsHeadings = headings.map(this._getDerivedsubItemsHeading);
    if (!subItemsHeadings.some(Boolean)) return fragment;

    for (const subItem of item.subItems.items) {
      const rowEl = this._renderTableRow(subItem, subItemsHeadings);
      rowEl.classList.add('lh-sub-item-row');
      fragment.append(rowEl);
    }

    return fragment;
  }

  /**
   * @param {OpportunityTable|Table} details
   * @return {Element}
   */
  _renderTable(details) {
    if (!details.items.length) return this._dom.createElement('span');

    const tableElem = this._dom.createElement('table', 'lh-table');
    const theadElem = this._dom.createChildOf(tableElem, 'thead');
    const theadTrElem = this._dom.createChildOf(theadElem, 'tr');

    const headings = this._getCanonicalizedHeadingsFromTable(details);

    for (const heading of headings) {
      const valueType = heading.valueType || 'text';
      const classes = `lh-table-column--${valueType}`;
      const labelEl = this._dom.createElement('div', 'lh-text');
      labelEl.textContent = heading.label;
      this._dom.createChildOf(theadTrElem, 'th', classes).appendChild(labelEl);
    }

    const tbodyElem = this._dom.createChildOf(tableElem, 'tbody');
    let even = true;
    for (const item of details.items) {
      const rowsFragment = this._renderTableRowsFromItem(item, headings);
      for (const rowEl of this._dom.findAll('tr', rowsFragment)) {
        // For zebra styling.
        rowEl.classList.add(even ? 'lh-row--even' : 'lh-row--odd');
      }
      even = !even;
      tbodyElem.append(rowsFragment);
    }

    return tableElem;
  }

  /**
   * @param {LH.Audit.Details.List} details
   * @return {Element}
   */
  _renderList(details) {
    const listContainer = this._dom.createElement('div', 'lh-list');

    details.items.forEach(item => {
      const snippetEl = SnippetRenderer.render(this._dom, this._templateContext, item, this);
      listContainer.appendChild(snippetEl);
    });

    return listContainer;
  }

  /**
   * @param {LH.Audit.Details.NodeValue} item
   * @return {Element}
   */
  renderNode(item) {
    const element = this._dom.createElement('span', 'lh-node');
    if (item.nodeLabel) {
      const nodeLabelEl = this._dom.createElement('div');
      nodeLabelEl.textContent = item.nodeLabel;
      element.appendChild(nodeLabelEl);
    }
    if (item.snippet) {
      const snippetEl = this._dom.createElement('div');
      snippetEl.classList.add('lh-node__snippet');
      snippetEl.textContent = item.snippet;
      element.appendChild(snippetEl);
    }
    if (item.selector) {
      element.title = item.selector;
    }
    if (item.path) element.setAttribute('data-path', item.path);
    if (item.selector) element.setAttribute('data-selector', item.selector);
    if (item.snippet) element.setAttribute('data-snippet', item.snippet);

    if (!item.boundingRect || !this._fullPageScreenshot) {
      return element;
    }

    const maxThumbnailSize = {width: 147, height: 100};
    const elementScreenshot = ElementScreenshotRenderer.render(
      this._dom,
      this._templateContext,
      this._fullPageScreenshot,
      item.boundingRect,
      maxThumbnailSize
    );
    element.prepend(elementScreenshot);

    return element;
  }

  /**
   * @param {LH.Audit.Details.SourceLocationValue} item
   * @return {Element|null}
   * @protected
   */
  renderSourceLocation(item) {
    if (!item.url) {
      return null;
    }

    // Lines are shown as one-indexed.
    const line = item.line + 1;
    const column = item.column;

    let element;
    if (item.urlProvider === 'network') {
      element = this.renderTextURL(item.url);
      this._dom.find('.lh-link', element).textContent += `:${line}:${column}`;
    } else {
      element = this._renderText(`${item.url}:${line}:${column} (from sourceURL)`);
    }

    element.classList.add('lh-source-location');
    element.setAttribute('data-source-url', item.url);
    // DevTools expects zero-indexed lines.
    element.setAttribute('data-source-line', String(item.line));
    element.setAttribute('data-source-column', String(item.column));
    return element;
  }

  /**
   * @param {LH.Audit.Details.Filmstrip} details
   * @return {Element}
   */
  _renderFilmstrip(details) {
    const filmstripEl = this._dom.createElement('div', 'lh-filmstrip');

    for (const thumbnail of details.items) {
      const frameEl = this._dom.createChildOf(filmstripEl, 'div', 'lh-filmstrip__frame');
      this._dom.createChildOf(frameEl, 'img', 'lh-filmstrip__thumbnail', {
        src: thumbnail.data,
        alt: `Screenshot`,
      });
    }
    return filmstripEl;
  }

  /**
   * @param {string} text
   * @return {Element}
   */
  _renderCode(text) {
    const pre = this._dom.createElement('pre', 'lh-code');
    pre.textContent = text;
    return pre;
  }
}

if (typeof module !== 'undefined' && module.exports) {
  module.exports = DetailsRenderer;
} else {
  self.DetailsRenderer = DetailsRenderer;
}
;
/**
 * @license
 * Copyright 2017 The Lighthouse Authors. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS-IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
'use strict';

/**
 * @fileoverview This file contains helpers for constructing and rendering the
 * critical request chains network tree.
 */

/* globals self Util */

/** @typedef {import('./dom.js')} DOM */
/** @typedef {import('./details-renderer.js')} DetailsRenderer */

class CriticalRequestChainRenderer {
  /**
   * Create render context for critical-request-chain tree display.
   * @param {LH.Audit.SimpleCriticalRequestNode} tree
   * @return {{tree: LH.Audit.SimpleCriticalRequestNode, startTime: number, transferSize: number}}
   */
  static initTree(tree) {
    let startTime = 0;
    const rootNodes = Object.keys(tree);
    if (rootNodes.length > 0) {
      const node = tree[rootNodes[0]];
      startTime = node.request.startTime;
    }

    return {tree, startTime, transferSize: 0};
  }

  /**
   * Helper to create context for each critical-request-chain node based on its
   * parent. Calculates if this node is the last child, whether it has any
   * children itself and what the tree looks like all the way back up to the root,
   * so the tree markers can be drawn correctly.
   * @param {LH.Audit.SimpleCriticalRequestNode} parent
   * @param {string} id
   * @param {number} startTime
   * @param {number} transferSize
   * @param {Array<boolean>=} treeMarkers
   * @param {boolean=} parentIsLastChild
   * @return {CRCSegment}
   */
  static createSegment(parent, id, startTime, transferSize, treeMarkers, parentIsLastChild) {
    const node = parent[id];
    const siblings = Object.keys(parent);
    const isLastChild = siblings.indexOf(id) === (siblings.length - 1);
    const hasChildren = !!node.children && Object.keys(node.children).length > 0;

    // Copy the tree markers so that we don't change by reference.
    const newTreeMarkers = Array.isArray(treeMarkers) ? treeMarkers.slice(0) : [];

    // Add on the new entry.
    if (typeof parentIsLastChild !== 'undefined') {
      newTreeMarkers.push(!parentIsLastChild);
    }

    return {
      node,
      isLastChild,
      hasChildren,
      startTime,
      transferSize: transferSize + node.request.transferSize,
      treeMarkers: newTreeMarkers,
    };
  }

  /**
   * Creates the DOM for a tree segment.
   * @param {DOM} dom
   * @param {DocumentFragment} tmpl
   * @param {CRCSegment} segment
   * @param {DetailsRenderer} detailsRenderer
   * @return {Node}
   */
  static createChainNode(dom, tmpl, segment, detailsRenderer) {
    const chainsEl = dom.cloneTemplate('#tmpl-lh-crc__chains', tmpl);

    // Hovering over request shows full URL.
    dom.find('.crc-node', chainsEl).setAttribute('title', segment.node.request.url);

    const treeMarkeEl = dom.find('.crc-node__tree-marker', chainsEl);

    // Construct lines and add spacers for sub requests.
    segment.treeMarkers.forEach(separator => {
      if (separator) {
        treeMarkeEl.appendChild(dom.createElement('span', 'tree-marker vert'));
        treeMarkeEl.appendChild(dom.createElement('span', 'tree-marker'));
      } else {
        treeMarkeEl.appendChild(dom.createElement('span', 'tree-marker'));
        treeMarkeEl.appendChild(dom.createElement('span', 'tree-marker'));
      }
    });

    if (segment.isLastChild) {
      treeMarkeEl.appendChild(dom.createElement('span', 'tree-marker up-right'));
      treeMarkeEl.appendChild(dom.createElement('span', 'tree-marker right'));
    } else {
      treeMarkeEl.appendChild(dom.createElement('span', 'tree-marker vert-right'));
      treeMarkeEl.appendChild(dom.createElement('span', 'tree-marker right'));
    }

    if (segment.hasChildren) {
      treeMarkeEl.appendChild(dom.createElement('span', 'tree-marker horiz-down'));
    } else {
      treeMarkeEl.appendChild(dom.createElement('span', 'tree-marker right'));
    }

    // Fill in url, host, and request size information.
    const url = segment.node.request.url;
    const linkEl = detailsRenderer.renderTextURL(url);
    const treevalEl = dom.find('.crc-node__tree-value', chainsEl);
    treevalEl.appendChild(linkEl);

    if (!segment.hasChildren) {
      const {startTime, endTime, transferSize} = segment.node.request;
      const span = dom.createElement('span', 'crc-node__chain-duration');
      span.textContent = ' - ' + Util.i18n.formatMilliseconds((endTime - startTime) * 1000) + ', ';
      const span2 = dom.createElement('span', 'crc-node__chain-duration');
      span2.textContent = Util.i18n.formatBytesToKiB(transferSize, 0.01);

      treevalEl.appendChild(span);
      treevalEl.appendChild(span2);
    }

    return chainsEl;
  }

  /**
   * Recursively builds a tree from segments.
   * @param {DOM} dom
   * @param {DocumentFragment} tmpl
   * @param {CRCSegment} segment
   * @param {Element} elem Parent element.
   * @param {LH.Audit.Details.CriticalRequestChain} details
   * @param {DetailsRenderer} detailsRenderer
   */
  static buildTree(dom, tmpl, segment, elem, details, detailsRenderer) {
    elem.appendChild(CRCRenderer.createChainNode(dom, tmpl, segment, detailsRenderer));
    if (segment.node.children) {
      for (const key of Object.keys(segment.node.children)) {
        const childSegment = CRCRenderer.createSegment(segment.node.children, key,
          segment.startTime, segment.transferSize, segment.treeMarkers, segment.isLastChild);
        CRCRenderer.buildTree(dom, tmpl, childSegment, elem, details, detailsRenderer);
      }
    }
  }

  /**
   * @param {DOM} dom
   * @param {ParentNode} templateContext
   * @param {LH.Audit.Details.CriticalRequestChain} details
   * @param {DetailsRenderer} detailsRenderer
   * @return {Element}
   */
  static render(dom, templateContext, details, detailsRenderer) {
    const tmpl = dom.cloneTemplate('#tmpl-lh-crc', templateContext);
    const containerEl = dom.find('.lh-crc', tmpl);

    // Fill in top summary.
    dom.find('.crc-initial-nav', tmpl).textContent = Util.i18n.strings.crcInitialNavigation;
    dom.find('.lh-crc__longest_duration_label', tmpl).textContent =
        Util.i18n.strings.crcLongestDurationLabel;
    dom.find('.lh-crc__longest_duration', tmpl).textContent =
        Util.i18n.formatMilliseconds(details.longestChain.duration);

    // Construct visual tree.
    const root = CRCRenderer.initTree(details.chains);
    for (const key of Object.keys(root.tree)) {
      const segment = CRCRenderer.createSegment(root.tree, key, root.startTime, root.transferSize);
      CRCRenderer.buildTree(dom, tmpl, segment, containerEl, details, detailsRenderer);
    }

    return dom.find('.lh-crc-container', tmpl);
  }
}

// Alias b/c the name is really long.
const CRCRenderer = CriticalRequestChainRenderer;

// Allow Node require()'ing.
if (typeof module !== 'undefined' && module.exports) {
  module.exports = CriticalRequestChainRenderer;
} else {
  self.CriticalRequestChainRenderer = CriticalRequestChainRenderer;
}

/** @typedef {{
      node: LH.Audit.SimpleCriticalRequestNode[string],
      isLastChild: boolean,
      hasChildren: boolean,
      startTime: number,
      transferSize: number,
      treeMarkers: Array<boolean>
  }} CRCSegment
 */
;
/**
 * @license Copyright 2019 The Lighthouse Authors. All Rights Reserved.
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
 */
'use strict';

/* globals self, Util */

/** @typedef {import('./details-renderer')} DetailsRenderer */
/** @typedef {import('./dom')} DOM */

/** @enum {number} */
const LineVisibility = {
  /** Show regardless of whether the snippet is collapsed or expanded */
  ALWAYS: 0,
  WHEN_COLLAPSED: 1,
  WHEN_EXPANDED: 2,
};

/** @enum {number} */
const LineContentType = {
  /** A line of content */
  CONTENT_NORMAL: 0,
  /** A line of content that's emphasized by setting the CSS background color */
  CONTENT_HIGHLIGHTED: 1,
  /** Use when some lines are hidden, shows the "..." placeholder */
  PLACEHOLDER: 2,
  /** A message about a line of content or the snippet in general */
  MESSAGE: 3,
};

/** @typedef {{
    content: string;
    lineNumber: string | number;
    contentType: LineContentType;
    truncated?: boolean;
    visibility?: LineVisibility;
}} LineDetails */

const classNamesByContentType = {
  [LineContentType.CONTENT_NORMAL]: ['lh-snippet__line--content'],
  [LineContentType.CONTENT_HIGHLIGHTED]: [
    'lh-snippet__line--content',
    'lh-snippet__line--content-highlighted',
  ],
  [LineContentType.PLACEHOLDER]: ['lh-snippet__line--placeholder'],
  [LineContentType.MESSAGE]: ['lh-snippet__line--message'],
};

/**
 * @param {LH.Audit.Details.SnippetValue['lines']} lines
 * @param {number} lineNumber
 * @return {{line?: LH.Audit.Details.SnippetValue['lines'][0], previousLine?: LH.Audit.Details.SnippetValue['lines'][0]}}
 */
function getLineAndPreviousLine(lines, lineNumber) {
  return {
    line: lines.find(l => l.lineNumber === lineNumber),
    previousLine: lines.find(l => l.lineNumber === lineNumber - 1),
  };
}

/**
 * @param {LH.Audit.Details.SnippetValue["lineMessages"]} messages
 * @param {number} lineNumber
 */
function getMessagesForLineNumber(messages, lineNumber) {
  return messages.filter(h => h.lineNumber === lineNumber);
}

/**
 * @param {LH.Audit.Details.SnippetValue} details
 * @return {LH.Audit.Details.SnippetValue['lines']}
 */
function getLinesWhenCollapsed(details) {
  const SURROUNDING_LINES_TO_SHOW_WHEN_COLLAPSED = 2;
  return Util.filterRelevantLines(
    details.lines,
    details.lineMessages,
    SURROUNDING_LINES_TO_SHOW_WHEN_COLLAPSED
  );
}

/**
 * Render snippet of text with line numbers and annotations.
 * By default we only show a few lines around each annotation and the user
 * can click "Expand snippet" to show more.
 * Content lines with annotations are highlighted.
 */
class SnippetRenderer {
  /**
   * @param {DOM} dom
   * @param {DocumentFragment} tmpl
   * @param {LH.Audit.Details.SnippetValue} details
   * @param {DetailsRenderer} detailsRenderer
   * @param {function} toggleExpandedFn
   * @return {DocumentFragment}
   */
  static renderHeader(dom, tmpl, details, detailsRenderer, toggleExpandedFn) {
    const linesWhenCollapsed = getLinesWhenCollapsed(details);
    const canExpand = linesWhenCollapsed.length < details.lines.length;

    const header = dom.cloneTemplate('#tmpl-lh-snippet__header', tmpl);
    dom.find('.lh-snippet__title', header).textContent = details.title;

    const {
      snippetCollapseButtonLabel,
      snippetExpandButtonLabel,
    } = Util.i18n.strings;
    dom.find(
      '.lh-snippet__btn-label-collapse',
      header
    ).textContent = snippetCollapseButtonLabel;
    dom.find(
      '.lh-snippet__btn-label-expand',
      header
    ).textContent = snippetExpandButtonLabel;

    const toggleExpandButton = dom.find('.lh-snippet__toggle-expand', header);
    // If we're already showing all the available lines of the snippet, we don't need an
    // expand/collapse button and can remove it from the DOM.
    // If we leave the button in though, wire up the click listener to toggle visibility!
    if (!canExpand) {
      toggleExpandButton.remove();
    } else {
      toggleExpandButton.addEventListener('click', () => toggleExpandedFn());
    }

    // We only show the source node of the snippet in DevTools because then the user can
    // access the full element detail. Just being able to see the outer HTML isn't very useful.
    if (details.node && dom.isDevTools()) {
      const nodeContainer = dom.find('.lh-snippet__node', header);
      nodeContainer.appendChild(detailsRenderer.renderNode(details.node));
    }

    return header;
  }

  /**
   * Renders a line (text content, message, or placeholder) as a DOM element.
   * @param {DOM} dom
   * @param {DocumentFragment} tmpl
   * @param {LineDetails} lineDetails
   * @return {Element}
   */
  static renderSnippetLine(
      dom,
      tmpl,
      {content, lineNumber, truncated, contentType, visibility}
  ) {
    const clonedTemplate = dom.cloneTemplate('#tmpl-lh-snippet__line', tmpl);
    const contentLine = dom.find('.lh-snippet__line', clonedTemplate);
    const {classList} = contentLine;

    classNamesByContentType[contentType].forEach(typeClass =>
      classList.add(typeClass)
    );

    if (visibility === LineVisibility.WHEN_COLLAPSED) {
      classList.add('lh-snippet__show-if-collapsed');
    } else if (visibility === LineVisibility.WHEN_EXPANDED) {
      classList.add('lh-snippet__show-if-expanded');
    }

    const lineContent = content + (truncated ? '…' : '');
    const lineContentEl = dom.find('.lh-snippet__line code', contentLine);
    if (contentType === LineContentType.MESSAGE) {
      lineContentEl.appendChild(dom.convertMarkdownLinkSnippets(lineContent));
    } else {
      lineContentEl.textContent = lineContent;
    }

    dom.find(
      '.lh-snippet__line-number',
      contentLine
    ).textContent = lineNumber.toString();

    return contentLine;
  }

  /**
   * @param {DOM} dom
   * @param {DocumentFragment} tmpl
   * @param {{message: string}} message
   * @return {Element}
   */
  static renderMessage(dom, tmpl, message) {
    return SnippetRenderer.renderSnippetLine(dom, tmpl, {
      lineNumber: ' ',
      content: message.message,
      contentType: LineContentType.MESSAGE,
    });
  }

  /**
   * @param {DOM} dom
   * @param {DocumentFragment} tmpl
   * @param {LineVisibility} visibility
   * @return {Element}
   */
  static renderOmittedLinesPlaceholder(dom, tmpl, visibility) {
    return SnippetRenderer.renderSnippetLine(dom, tmpl, {
      lineNumber: '…',
      content: '',
      visibility,
      contentType: LineContentType.PLACEHOLDER,
    });
  }

  /**
   * @param {DOM} dom
   * @param {DocumentFragment} tmpl
   * @param {LH.Audit.Details.SnippetValue} details
   * @return {DocumentFragment}
   */
  static renderSnippetContent(dom, tmpl, details) {
    const template = dom.cloneTemplate('#tmpl-lh-snippet__content', tmpl);
    const snippetEl = dom.find('.lh-snippet__snippet-inner', template);

    // First render messages that don't belong to specific lines
    details.generalMessages.forEach(m =>
      snippetEl.append(SnippetRenderer.renderMessage(dom, tmpl, m))
    );
    // Then render the lines and their messages, as well as placeholders where lines are omitted
    snippetEl.append(SnippetRenderer.renderSnippetLines(dom, tmpl, details));

    return template;
  }

  /**
   * @param {DOM} dom
   * @param {DocumentFragment} tmpl
   * @param {LH.Audit.Details.SnippetValue} details
   * @return {DocumentFragment}
   */
  static renderSnippetLines(dom, tmpl, details) {
    const {lineMessages, generalMessages, lineCount, lines} = details;
    const linesWhenCollapsed = getLinesWhenCollapsed(details);
    const hasOnlyGeneralMessages =
      generalMessages.length > 0 && lineMessages.length === 0;

    const lineContainer = dom.createFragment();

    // When a line is not shown in the collapsed state we try to see if we also need an
    // omitted lines placeholder for the expanded state, rather than rendering two separate
    // placeholders.
    let hasPendingOmittedLinesPlaceholderForCollapsedState = false;

    for (let lineNumber = 1; lineNumber <= lineCount; lineNumber++) {
      const {line, previousLine} = getLineAndPreviousLine(lines, lineNumber);
      const {
        line: lineWhenCollapsed,
        previousLine: previousLineWhenCollapsed,
      } = getLineAndPreviousLine(linesWhenCollapsed, lineNumber);

      const showLineWhenCollapsed = !!lineWhenCollapsed;
      const showPreviousLineWhenCollapsed = !!previousLineWhenCollapsed;

      // If we went from showing lines in the collapsed state to not showing them
      // we need to render a placeholder
      if (showPreviousLineWhenCollapsed && !showLineWhenCollapsed) {
        hasPendingOmittedLinesPlaceholderForCollapsedState = true;
      }
      // If we are back to lines being visible in the collapsed and the placeholder
      // hasn't been rendered yet then render it now
      if (
        showLineWhenCollapsed &&
        hasPendingOmittedLinesPlaceholderForCollapsedState
      ) {
        lineContainer.append(
          SnippetRenderer.renderOmittedLinesPlaceholder(
            dom,
            tmpl,
            LineVisibility.WHEN_COLLAPSED
          )
        );
        hasPendingOmittedLinesPlaceholderForCollapsedState = false;
      }

      // Render omitted lines placeholder if we have not already rendered one for this gap
      const isFirstOmittedLineWhenExpanded = !line && !!previousLine;
      const isFirstLineOverallAndIsOmittedWhenExpanded =
        !line && lineNumber === 1;
      if (
        isFirstOmittedLineWhenExpanded ||
        isFirstLineOverallAndIsOmittedWhenExpanded
      ) {
        // In the collapsed state we don't show omitted lines placeholders around
        // the edges of the snippet
        const hasRenderedAllLinesVisibleWhenCollapsed = !linesWhenCollapsed.some(
          l => l.lineNumber > lineNumber
        );
        const onlyShowWhenExpanded =
          hasRenderedAllLinesVisibleWhenCollapsed || lineNumber === 1;
        lineContainer.append(
          SnippetRenderer.renderOmittedLinesPlaceholder(
            dom,
            tmpl,
            onlyShowWhenExpanded
              ? LineVisibility.WHEN_EXPANDED
              : LineVisibility.ALWAYS
          )
        );
        hasPendingOmittedLinesPlaceholderForCollapsedState = false;
      }

      if (!line) {
        // Can't render the line if we don't know its content (instead we've rendered a placeholder)
        continue;
      }

      // Now render the line and any messages
      const messages = getMessagesForLineNumber(lineMessages, lineNumber);
      const highlightLine = messages.length > 0 || hasOnlyGeneralMessages;
      const contentLineDetails = Object.assign({}, line, {
        contentType: highlightLine
          ? LineContentType.CONTENT_HIGHLIGHTED
          : LineContentType.CONTENT_NORMAL,
        visibility: lineWhenCollapsed
          ? LineVisibility.ALWAYS
          : LineVisibility.WHEN_EXPANDED,
      });
      lineContainer.append(
        SnippetRenderer.renderSnippetLine(dom, tmpl, contentLineDetails)
      );

      messages.forEach(message => {
        lineContainer.append(SnippetRenderer.renderMessage(dom, tmpl, message));
      });
    }

    return lineContainer;
  }

  /**
   * @param {DOM} dom
   * @param {ParentNode} templateContext
   * @param {LH.Audit.Details.SnippetValue} details
   * @param {DetailsRenderer} detailsRenderer
   * @return {!Element}
   */
  static render(dom, templateContext, details, detailsRenderer) {
    const tmpl = dom.cloneTemplate('#tmpl-lh-snippet', templateContext);
    const snippetEl = dom.find('.lh-snippet', tmpl);

    const header = SnippetRenderer.renderHeader(
      dom,
      tmpl,
      details,
      detailsRenderer,
      () => snippetEl.classList.toggle('lh-snippet--expanded')
    );
    const content = SnippetRenderer.renderSnippetContent(dom, tmpl, details);
    snippetEl.append(header, content);

    return snippetEl;
  }
}

// Allow Node require()'ing.
if (typeof module !== 'undefined' && module.exports) {
  module.exports = SnippetRenderer;
} else {
  self.SnippetRenderer = SnippetRenderer;
}
;
/**
 * @license Copyright 2020 The Lighthouse Authors. All Rights Reserved.
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
 */
'use strict';

/**
 * @fileoverview These functions define {Rect}s and {Size}s using two different coordinate spaces:
 *   1. Screenshot coords (SC suffix): where 0,0 is the top left of the screenshot image
 *   2. Display coords (DC suffix): that match the CSS pixel coordinate space of the LH report's page.
 */

/* globals self Util */

/** @typedef {import('./dom.js')} DOM */
/** @typedef {LH.Artifacts.Rect} Rect */
/** @typedef {{width: number, height: number}} Size */

/**
 * @param {number} value
 * @param {number} min
 * @param {number} max
 */
function clamp(value, min, max) {
  if (value < min) return min;
  if (value > max) return max;
  return value;
}

/**
 * @param {Rect} rect
 */
function getRectCenterPoint(rect) {
  return {
    x: rect.left + rect.width / 2,
    y: rect.top + rect.height / 2,
  };
}

class ElementScreenshotRenderer {
  /**
   * Given the location of an element and the sizes of the preview and screenshot,
   * compute the absolute positions (in screenshot coordinate scale) of the screenshot content
   * and the highlighted rect around the element.
   * @param {Rect} elementRectSC
   * @param {Size} elementPreviewSizeSC
   * @param {Size} screenshotSize
   */
  static getScreenshotPositions(elementRectSC, elementPreviewSizeSC, screenshotSize) {
    const elementRectCenter = getRectCenterPoint(elementRectSC);

    // Try to center clipped region.
    const screenshotLeftVisibleEdge = clamp(
      elementRectCenter.x - elementPreviewSizeSC.width / 2,
      0, screenshotSize.width - elementPreviewSizeSC.width
    );
    const screenshotTopVisisbleEdge = clamp(
      elementRectCenter.y - elementPreviewSizeSC.height / 2,
      0, screenshotSize.height - elementPreviewSizeSC.height
    );

    return {
      screenshot: {
        left: screenshotLeftVisibleEdge,
        top: screenshotTopVisisbleEdge,
      },
      clip: {
        left: elementRectSC.left - screenshotLeftVisibleEdge,
        top: elementRectSC.top - screenshotTopVisisbleEdge,
      },
    };
  }

  /**
   * Render a clipPath SVG element to assist marking the element's rect.
   * The elementRect and previewSize are in screenshot coordinate scale.
   * @param {DOM} dom
   * @param {HTMLElement} maskEl
   * @param {{left: number, top: number}} positionClip
   * @param {LH.Artifacts.Rect} elementRect
   * @param {Size} elementPreviewSize
   */
  static renderClipPathInScreenshot(dom, maskEl, positionClip, elementRect, elementPreviewSize) {
    const clipPathEl = dom.find('clipPath', maskEl);
    const clipId = `clip-${Util.getUniqueSuffix()}`;
    clipPathEl.id = clipId;
    maskEl.style.clipPath = `url(#${clipId})`;

    // Normalize values between 0-1.
    const top = positionClip.top / elementPreviewSize.height;
    const bottom = top + elementRect.height / elementPreviewSize.height;
    const left = positionClip.left / elementPreviewSize.width;
    const right = left + elementRect.width / elementPreviewSize.width;

    const polygonsPoints = [
      `0,0             1,0            1,${top}          0,${top}`,
      `0,${bottom}     1,${bottom}    1,1               0,1`,
      `0,${top}        ${left},${top} ${left},${bottom} 0,${bottom}`,
      `${right},${top} 1,${top}       1,${bottom}       ${right},${bottom}`,
    ];
    for (const points of polygonsPoints) {
      clipPathEl.append(dom.createElementNS(
        'http://www.w3.org/2000/svg', 'polygon', undefined, {points}));
    }
  }

  /**
   * Called externally and must be injected to the report in order to use this renderer.
   * @param {DOM} dom
   * @param {LH.Audit.Details.FullPageScreenshot} fullPageScreenshot
   */
  static createBackgroundImageStyle(dom, fullPageScreenshot) {
    const styleEl = dom.createElement('style');
    styleEl.id = 'full-page-screenshot-style';
    styleEl.textContent = `
      .lh-element-screenshot__image {
        background-image: url(${fullPageScreenshot.data})
      }`;
    return styleEl;
  }

  /**
   * Installs the lightbox elements and wires up click listeners to all .lh-element-screenshot elements.
   * @param {DOM} dom
   * @param {ParentNode} templateContext
   * @param {LH.Audit.Details.FullPageScreenshot} fullPageScreenshot
   */
  static installOverlayFeature(dom, templateContext, fullPageScreenshot) {
    const reportEl = dom.find('.lh-report', dom.document());
    const screenshotOverlayClass = 'lh-feature-screenshot-overlay';
    if (reportEl.classList.contains(screenshotOverlayClass)) return;
    reportEl.classList.add(screenshotOverlayClass);

    const maxLightboxSize = {
      width: dom.document().documentElement.clientWidth,
      height: dom.document().documentElement.clientHeight * 0.75,
    };

    dom.document().addEventListener('click', e => {
      const target = /** @type {?HTMLElement} */ (e.target);
      if (!target) return;
      const el = /** @type {?HTMLElement} */ (target.closest('.lh-element-screenshot'));
      if (!el) return;

      const overlay = dom.createElement('div');
      overlay.classList.add('lh-element-screenshot__overlay');
      const elementRectSC = {
        width: Number(el.dataset['rectWidth']),
        height: Number(el.dataset['rectHeight']),
        left: Number(el.dataset['rectLeft']),
        right: Number(el.dataset['rectLeft']) + Number(el.dataset['rectWidth']),
        top: Number(el.dataset['rectTop']),
        bottom: Number(el.dataset['rectTop']) + Number(el.dataset['rectHeight']),
      };
      overlay.appendChild(ElementScreenshotRenderer.render(
        dom,
        templateContext,
        fullPageScreenshot,
        elementRectSC,
        maxLightboxSize
      ));
      overlay.addEventListener('click', () => {
        overlay.remove();
      });

      reportEl.appendChild(overlay);
    });
  }

  /**
   * Given the size of the element in the screenshot and the total available size of our preview container,
   * compute the factor by which we need to zoom out to view the entire element with context.
   * @param {LH.Artifacts.Rect} elementRectSC
   * @param {Size} renderContainerSizeDC
   * @return {number}
   */
  static _computeZoomFactor(elementRectSC, renderContainerSizeDC) {
    const targetClipToViewportRatio = 0.75;
    const zoomRatioXY = {
      x: renderContainerSizeDC.width / elementRectSC.width,
      y: renderContainerSizeDC.height / elementRectSC.height,
    };
    const zoomFactor = targetClipToViewportRatio * Math.min(zoomRatioXY.x, zoomRatioXY.y);
    return Math.min(1, zoomFactor);
  }

  /**
   * Renders an element with surrounding context from the full page screenshot.
   * Used to render both the thumbnail preview in details tables and the full-page screenshot in the lightbox.
   * @param {DOM} dom
   * @param {ParentNode} templateContext
   * @param {LH.Audit.Details.FullPageScreenshot} fullPageScreenshot
   * @param {LH.Artifacts.Rect} elementRectSC Region of screenshot to highlight.
   * @param {Size} maxRenderSizeDC e.g. maxThumbnailSize or maxLightboxSize.
   * @return {Element}
   */
  static render(dom, templateContext, fullPageScreenshot, elementRectSC, maxRenderSizeDC) {
    const tmpl = dom.cloneTemplate('#tmpl-lh-element-screenshot', templateContext);
    const containerEl = dom.find('.lh-element-screenshot', tmpl);

    containerEl.dataset['rectWidth'] = elementRectSC.width.toString();
    containerEl.dataset['rectHeight'] = elementRectSC.height.toString();
    containerEl.dataset['rectLeft'] = elementRectSC.left.toString();
    containerEl.dataset['rectTop'] = elementRectSC.top.toString();

    // Zoom out when highlighted region takes up most of the viewport.
    // This provides more context for where on the page this element is.
    const zoomFactor = this._computeZoomFactor(elementRectSC, maxRenderSizeDC);

    const elementPreviewSizeSC = {
      width: maxRenderSizeDC.width / zoomFactor,
      height: maxRenderSizeDC.height / zoomFactor,
    };
    elementPreviewSizeSC.width = Math.min(fullPageScreenshot.width, elementPreviewSizeSC.width);
    /* This preview size is either the size of the thumbnail or size of the Lightbox */
    const elementPreviewSizeDC = {
      width: elementPreviewSizeSC.width * zoomFactor,
      height: elementPreviewSizeSC.height * zoomFactor,
    };

    const positions = ElementScreenshotRenderer.getScreenshotPositions(
      elementRectSC,
      elementPreviewSizeSC,
      {width: fullPageScreenshot.width, height: fullPageScreenshot.height}
    );

    const contentEl = dom.find('.lh-element-screenshot__content', containerEl);
    contentEl.style.top = `-${elementPreviewSizeDC.height}px`;

    const imageEl = dom.find('.lh-element-screenshot__image', containerEl);
    imageEl.style.width = elementPreviewSizeDC.width + 'px';
    imageEl.style.height = elementPreviewSizeDC.height + 'px';

    imageEl.style.backgroundPositionY = -(positions.screenshot.top * zoomFactor) + 'px';
    imageEl.style.backgroundPositionX = -(positions.screenshot.left * zoomFactor) + 'px';
    imageEl.style.backgroundSize =
      `${fullPageScreenshot.width * zoomFactor}px ${fullPageScreenshot.height * zoomFactor}px`;

    const markerEl = dom.find('.lh-element-screenshot__element-marker', containerEl);
    markerEl.style.width = elementRectSC.width * zoomFactor + 'px';
    markerEl.style.height = elementRectSC.height * zoomFactor + 'px';
    markerEl.style.left = positions.clip.left * zoomFactor + 'px';
    markerEl.style.top = positions.clip.top * zoomFactor + 'px';

    const maskEl = dom.find('.lh-element-screenshot__mask', containerEl);
    maskEl.style.width = elementPreviewSizeDC.width + 'px';
    maskEl.style.height = elementPreviewSizeDC.height + 'px';

    ElementScreenshotRenderer.renderClipPathInScreenshot(
      dom,
      maskEl,
      positions.clip,
      elementRectSC,
      elementPreviewSizeSC
    );

    return containerEl;
  }
}

if (typeof module !== 'undefined' && module.exports) {
  module.exports = ElementScreenshotRenderer;
} else {
  self.ElementScreenshotRenderer = ElementScreenshotRenderer;
}
;
/**
 * @license Copyright 2017 The Lighthouse Authors. All Rights Reserved.
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
 */
'use strict';

/* global URL */

/**
 * @fileoverview
 * @suppress {reportUnknownTypes}
 */

/**
 * Generate a filenamePrefix of hostname_YYYY-MM-DD_HH-MM-SS
 * Date/time uses the local timezone, however Node has unreliable ICU
 * support, so we must construct a YYYY-MM-DD date format manually. :/
 * @param {{finalUrl: string, fetchTime: string}} lhr
 * @return {string}
 */
function getFilenamePrefix(lhr) {
  const hostname = new URL(lhr.finalUrl).hostname;
  const date = (lhr.fetchTime && new Date(lhr.fetchTime)) || new Date();

  const timeStr = date.toLocaleTimeString('en-US', {hour12: false});
  const dateParts = date.toLocaleDateString('en-US', {
    year: 'numeric', month: '2-digit', day: '2-digit',
  }).split('/');
  // @ts-expect-error - parts exists
  dateParts.unshift(dateParts.pop());
  const dateStr = dateParts.join('-');

  const filenamePrefix = `${hostname}_${dateStr}_${timeStr}`;
  // replace characters that are unfriendly to filenames
  return filenamePrefix.replace(/[/?<>\\:*|"]/g, '-');
}

// don't attempt to export in the browser.
if (typeof module !== 'undefined' && module.exports) {
  module.exports = {getFilenamePrefix};
}
;
/**
 * @license
 * Copyright 2017 The Lighthouse Authors. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS-IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
'use strict';

/**
 * Logs messages via a UI butter.
 */
class Logger {
  /**
   * @param {Element} element
   */
  constructor(element) {
    /** @type {Element} */
    this.el = element;
    this._id = undefined;
  }

  /**
   * Shows a butter bar.
   * @param {string} msg The message to show.
   * @param {boolean=} autoHide True to hide the message after a duration.
   *     Default is true.
   */
  log(msg, autoHide = true) {
    this._id && clearTimeout(this._id);

    this.el.textContent = msg;
    this.el.classList.add('show');
    if (autoHide) {
      this._id = setTimeout(_ => {
        this.el.classList.remove('show');
      }, 7000);
    }
  }

  /**
   * @param {string} msg
   */
  warn(msg) {
    this.log('Warning: ' + msg);
  }

  /**
   * @param {string} msg
   */
  error(msg) {
    this.log(msg);

    // Rethrow to make sure it's auditable as an error, but in a setTimeout so page
    // recovers gracefully and user can try loading a report again.
    setTimeout(_ => {
      throw new Error(msg);
    }, 0);
  }

  /**
   * Explicitly hides the butter bar.
   */
  hide() {
    this._id && clearTimeout(this._id);
    this.el.classList.remove('show');
  }
}

if (typeof module !== 'undefined' && module.exports) {
  module.exports = Logger;
}
;
/**
 * @license
 * Copyright 2017 The Lighthouse Authors. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS-IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
'use strict';

/* eslint-env browser */

/**
 * @fileoverview Adds tools button, print, and other dynamic functionality to
 * the report.
 */

/* globals getFilenamePrefix Util ElementScreenshotRenderer */

/** @typedef {import('./dom')} DOM */

/**
 * @param {HTMLTableElement} tableEl
 * @return {Array<HTMLElement>}
 */
function getTableRows(tableEl) {
  return Array.from(tableEl.tBodies[0].rows);
}

class ReportUIFeatures {
  /**
   * @param {DOM} dom
   */
  constructor(dom) {
    /** @type {LH.Result} */
    this.json; // eslint-disable-line no-unused-expressions
    /** @type {DOM} */
    this._dom = dom;
    /** @type {Document} */
    this._document = this._dom.document();
    /** @type {ParentNode} */
    this._templateContext = this._dom.document();
    /** @type {DropDown} */
    this._dropDown = new DropDown(this._dom);
    /** @type {boolean} */
    this._copyAttempt = false;
    /** @type {HTMLElement} */
    this.topbarEl; // eslint-disable-line no-unused-expressions
    /** @type {HTMLElement} */
    this.scoreScaleEl; // eslint-disable-line no-unused-expressions
    /** @type {HTMLElement} */
    this.stickyHeaderEl; // eslint-disable-line no-unused-expressions
    /** @type {HTMLElement} */
    this.highlightEl; // eslint-disable-line no-unused-expressions

    this.onMediaQueryChange = this.onMediaQueryChange.bind(this);
    this.onCopy = this.onCopy.bind(this);
    this.onDropDownMenuClick = this.onDropDownMenuClick.bind(this);
    this.onKeyUp = this.onKeyUp.bind(this);
    this.collapseAllDetails = this.collapseAllDetails.bind(this);
    this.expandAllDetails = this.expandAllDetails.bind(this);
    this._toggleDarkTheme = this._toggleDarkTheme.bind(this);
    this._updateStickyHeaderOnScroll = this._updateStickyHeaderOnScroll.bind(this);
  }

  /**
   * Adds tools button, print, and other functionality to the report. The method
   * should be called whenever the report needs to be re-rendered.
   * @param {LH.Result} report
   */
  initFeatures(report) {
    this.json = report;

    this._setupMediaQueryListeners();
    this._dropDown.setup(this.onDropDownMenuClick);
    this._setupThirdPartyFilter();
    this._setupElementScreenshotOverlay();
    this._setUpCollapseDetailsAfterPrinting();
    this._resetUIState();
    this._document.addEventListener('keyup', this.onKeyUp);
    this._document.addEventListener('copy', this.onCopy);

    const topbarLogo = this._dom.find('.lh-topbar__logo', this._document);
    topbarLogo.addEventListener('click', () => this._toggleDarkTheme());

    let turnOffTheLights = false;
    // Do not query the system preferences for DevTools - DevTools should only apply dark theme
    // if dark is selected in the settings panel.
    if (!this._dom.isDevTools() && window.matchMedia('(prefers-color-scheme: dark)').matches) {
      turnOffTheLights = true;
    }

    // Fireworks!
    // To get fireworks you need 100 scores in all core categories, except PWA (because going the PWA route is discretionary).
    const fireworksRequiredCategoryIds = ['performance', 'accessibility', 'best-practices', 'seo'];
    const scoresAll100 = fireworksRequiredCategoryIds.every(id => {
      const cat = report.categories[id];
      return cat && cat.score === 1;
    });
    if (scoresAll100) {
      turnOffTheLights = true;
      this._enableFireworks();
    }

    if (turnOffTheLights) {
      this._toggleDarkTheme(true);
    }

    // There is only a sticky header when at least 2 categories are present.
    if (Object.keys(this.json.categories).length >= 2) {
      this._setupStickyHeaderElements();
      const containerEl = this._dom.find('.lh-container', this._document);
      const elToAddScrollListener = this._getScrollParent(containerEl);
      elToAddScrollListener.addEventListener('scroll', this._updateStickyHeaderOnScroll);

      // Use ResizeObserver where available.
      // TODO: there is an issue with incorrect position numbers and, as a result, performance
      // issues due to layout thrashing.
      // See https://github.com/GoogleChrome/lighthouse/pull/9023/files#r288822287 for details.
      // For now, limit to DevTools.
      if (this._dom.isDevTools()) {
        const resizeObserver = new window.ResizeObserver(this._updateStickyHeaderOnScroll);
        resizeObserver.observe(containerEl);
      } else {
        window.addEventListener('resize', this._updateStickyHeaderOnScroll);
      }
    }

    // Show the metric descriptions by default when there is an error.
    const hasMetricError = report.categories.performance && report.categories.performance.auditRefs
      .some(audit => Boolean(audit.group === 'metrics' && report.audits[audit.id].errorMessage));
    if (hasMetricError) {
      const toggleInputEl = /** @type {HTMLInputElement} */ (
        this._dom.find('.lh-metrics-toggle__input', this._document));
      toggleInputEl.checked = true;
    }

    // Fill in all i18n data.
    for (const node of this._dom.findAll('[data-i18n]', this._dom.document())) {
      // These strings are guaranteed to (at least) have a default English string in Util.UIStrings,
      // so this cannot be undefined as long as `report-ui-features.data-i18n` test passes.
      const i18nAttr = /** @type {keyof LH.I18NRendererStrings} */ (node.getAttribute('data-i18n'));
      node.textContent = Util.i18n.strings[i18nAttr];
    }
  }

  /**
   * Define a custom element for <templates> to be extracted from. For example:
   *     this.setTemplateContext(new DOMParser().parseFromString(htmlStr, 'text/html'))
   * @param {ParentNode} context
   */
  setTemplateContext(context) {
    this._templateContext = context;
  }

  /**
   * Finds the first scrollable ancestor of `element`. Falls back to the document.
   * @param {HTMLElement} element
   * @return {Node}
   */
  _getScrollParent(element) {
    const {overflowY} = window.getComputedStyle(element);
    const isScrollable = overflowY !== 'visible' && overflowY !== 'hidden';

    if (isScrollable) {
      return element;
    }

    if (element.parentElement) {
      return this._getScrollParent(element.parentElement);
    }

    return document;
  }

  _enableFireworks() {
    const scoresContainer = this._dom.find('.lh-scores-container', this._document);
    scoresContainer.classList.add('score100');
    scoresContainer.addEventListener('click', _ => {
      scoresContainer.classList.toggle('fireworks-paused');
    });
  }

  /**
   * Fires a custom DOM event on target.
   * @param {string} name Name of the event.
   * @param {Node=} target DOM node to fire the event on.
   * @param {*=} detail Custom data to include.
   */
  _fireEventOn(name, target = this._document, detail) {
    const event = new CustomEvent(name, detail ? {detail} : undefined);
    target.dispatchEvent(event);
  }

  _setupMediaQueryListeners() {
    const mediaQuery = self.matchMedia('(max-width: 500px)');
    mediaQuery.addListener(this.onMediaQueryChange);
    // Ensure the handler is called on init
    this.onMediaQueryChange(mediaQuery);
  }

  /**
   * Handle media query change events.
   * @param {MediaQueryList|MediaQueryListEvent} mql
   */
  onMediaQueryChange(mql) {
    const root = this._dom.find('.lh-root', this._document);
    root.classList.toggle('lh-narrow', mql.matches);
  }

  _setupThirdPartyFilter() {
    // Some audits should not display the third party filter option.
    const thirdPartyFilterAuditExclusions = [
      // This audit deals explicitly with third party resources.
      'uses-rel-preconnect',
    ];
    // Some audits should hide third party by default.
    const thirdPartyFilterAuditHideByDefault = [
      // Only first party resources are actionable.
      'legacy-javascript',
    ];

    // Get all tables with a text url column.
    /** @type {Array<HTMLTableElement>} */
    const tables = Array.from(this._document.querySelectorAll('.lh-table'));
    const tablesWithUrls = tables
      .filter(el =>
        el.querySelector('td.lh-table-column--url, td.lh-table-column--source-location'))
      .filter(el => {
        const containingAudit = el.closest('.lh-audit');
        if (!containingAudit) throw new Error('.lh-table not within audit');
        return !thirdPartyFilterAuditExclusions.includes(containingAudit.id);
      });

    tablesWithUrls.forEach((tableEl, index) => {
      const rowEls = getTableRows(tableEl);
      const thirdPartyRows = this._getThirdPartyRows(rowEls, this.json.finalUrl);

      // create input box
      const filterTemplate = this._dom.cloneTemplate('#tmpl-lh-3p-filter', this._templateContext);
      const filterInput =
        /** @type {HTMLInputElement} */ (this._dom.find('input', filterTemplate));
      const id = `lh-3p-filter-label--${index}`;

      filterInput.id = id;
      filterInput.addEventListener('change', e => {
        const shouldHideThirdParty = e.target instanceof HTMLInputElement && !e.target.checked;
        let even = true;
        let rowEl = rowEls[0];
        while (rowEl) {
          const shouldHide = shouldHideThirdParty && thirdPartyRows.includes(rowEl);

          // Iterate subsequent associated sub item rows.
          do {
            rowEl.classList.toggle('lh-row--hidden', shouldHide);
            // Adjust for zebra styling.
            rowEl.classList.toggle('lh-row--even', !shouldHide && even);
            rowEl.classList.toggle('lh-row--odd', !shouldHide && !even);

            rowEl = /** @type {HTMLElement} */ (rowEl.nextElementSibling);
          } while (rowEl && rowEl.classList.contains('lh-sub-item-row'));

          if (!shouldHide) even = !even;
        }
      });

      this._dom.find('label', filterTemplate).setAttribute('for', id);
      this._dom.find('.lh-3p-filter-count', filterTemplate).textContent =
          `${thirdPartyRows.length}`;
      this._dom.find('.lh-3p-ui-string', filterTemplate).textContent =
          Util.i18n.strings.thirdPartyResourcesLabel;

      const allThirdParty = thirdPartyRows.length === rowEls.length;
      const allFirstParty = !thirdPartyRows.length;

      // If all or none of the rows are 3rd party, disable the checkbox.
      if (allThirdParty || allFirstParty) {
        filterInput.disabled = true;
        filterInput.checked = allThirdParty;
      }

      // Add checkbox to the DOM.
      if (!tableEl.parentNode) return; // Keep tsc happy.
      tableEl.parentNode.insertBefore(filterTemplate, tableEl);

      // Hide third-party rows for some audits by default.
      const containingAudit = tableEl.closest('.lh-audit');
      if (!containingAudit) throw new Error('.lh-table not within audit');
      if (thirdPartyFilterAuditHideByDefault.includes(containingAudit.id) && !allThirdParty) {
        filterInput.click();
      }
    });
  }

  _setupElementScreenshotOverlay() {
    const fullPageScreenshot =
      this.json.audits['full-page-screenshot'] && this.json.audits['full-page-screenshot'].details;
    if (!fullPageScreenshot || fullPageScreenshot.type !== 'full-page-screenshot') return;

    ElementScreenshotRenderer.installOverlayFeature(
      this._dom, this._templateContext, fullPageScreenshot);
  }

  /**
   * From a table with URL entries, finds the rows containing third-party URLs
   * and returns them.
   * @param {HTMLElement[]} rowEls
   * @param {string} finalUrl
   * @return {Array<HTMLElement>}
   */
  _getThirdPartyRows(rowEls, finalUrl) {
    /** @type {Array<HTMLElement>} */
    const thirdPartyRows = [];
    const finalUrlRootDomain = Util.getRootDomain(finalUrl);

    for (const rowEl of rowEls) {
      if (rowEl.classList.contains('lh-sub-item-row')) continue;

      /** @type {HTMLElement|null} */
      const urlItem = rowEl.querySelector('.lh-text__url');
      if (!urlItem) continue;

      const datasetUrl = urlItem.dataset.url;
      if (!datasetUrl) continue;
      const isThirdParty = Util.getRootDomain(datasetUrl) !== finalUrlRootDomain;
      if (!isThirdParty) continue;

      thirdPartyRows.push(rowEl);
    }

    return thirdPartyRows;
  }

  /**
   * From a table, finds and returns URL items.
   * @param {HTMLTableElement} tableEl
   * @return {Array<HTMLElement>}
   */
  _getUrlItems(tableEl) {
    return this._dom.findAll('.lh-text__url', tableEl);
  }

  _setupStickyHeaderElements() {
    this.topbarEl = this._dom.find('.lh-topbar', this._document);
    this.scoreScaleEl = this._dom.find('.lh-scorescale', this._document);
    this.stickyHeaderEl = this._dom.find('.lh-sticky-header', this._document);

    // Highlighter will be absolutely positioned at first gauge, then transformed on scroll.
    this.highlightEl = this._dom.createChildOf(this.stickyHeaderEl, 'div', 'lh-highlighter');
  }

  /**
   * Handle copy events.
   * @param {ClipboardEvent} e
   */
  onCopy(e) {
    // Only handle copy button presses (e.g. ignore the user copying page text).
    if (this._copyAttempt && e.clipboardData) {
      // We want to write our own data to the clipboard, not the user's text selection.
      e.preventDefault();
      e.clipboardData.setData('text/plain', JSON.stringify(this.json, null, 2));

      this._fireEventOn('lh-log', this._document, {
        cmd: 'log', msg: 'Report JSON copied to clipboard',
      });
    }

    this._copyAttempt = false;
  }

  /**
   * Copies the report JSON to the clipboard (if supported by the browser).
   */
  onCopyButtonClick() {
    this._fireEventOn('lh-analytics', this._document, {
      cmd: 'send',
      fields: {hitType: 'event', eventCategory: 'report', eventAction: 'copy'},
    });

    try {
      if (this._document.queryCommandSupported('copy')) {
        this._copyAttempt = true;

        // Note: In Safari 10.0.1, execCommand('copy') returns true if there's
        // a valid text selection on the page. See http://caniuse.com/#feat=clipboard.
        if (!this._document.execCommand('copy')) {
          this._copyAttempt = false; // Prevent event handler from seeing this as a copy attempt.

          this._fireEventOn('lh-log', this._document, {
            cmd: 'warn', msg: 'Your browser does not support copy to clipboard.',
          });
        }
      }
    } catch (/** @type {Error} */ e) {
      this._copyAttempt = false;
      this._fireEventOn('lh-log', this._document, {cmd: 'log', msg: e.message});
    }
  }

  /**
   * Resets the state of page before capturing the page for export.
   * When the user opens the exported HTML page, certain UI elements should
   * be in their closed state (not opened) and the templates should be unstamped.
   */
  _resetUIState() {
    this._dropDown.close();
    this._dom.resetTemplates();
  }

  /**
   * Handler for tool button.
   * @param {Event} e
   */
  onDropDownMenuClick(e) {
    e.preventDefault();

    const el = /** @type {?Element} */ (e.target);

    if (!el || !el.hasAttribute('data-action')) {
      return;
    }

    switch (el.getAttribute('data-action')) {
      case 'copy':
        this.onCopyButtonClick();
        break;
      case 'print-summary':
        this.collapseAllDetails();
        this._print();
        break;
      case 'print-expanded':
        this.expandAllDetails();
        this._print();
        break;
      case 'save-json': {
        const jsonStr = JSON.stringify(this.json, null, 2);
        this._saveFile(new Blob([jsonStr], {type: 'application/json'}));
        break;
      }
      case 'save-html': {
        const htmlStr = this.getReportHtml();
        try {
          this._saveFile(new Blob([htmlStr], {type: 'text/html'}));
        } catch (/** @type {Error} */ e) {
          this._fireEventOn('lh-log', this._document, {
            cmd: 'error', msg: 'Could not export as HTML. ' + e.message,
          });
        }
        break;
      }
      case 'open-viewer': {
        const viewerPath = '/lighthouse/viewer/';
        ReportUIFeatures.openTabAndSendJsonReport(this.json, viewerPath);
        break;
      }
      case 'save-gist': {
        this.saveAsGist();
        break;
      }
      case 'toggle-dark': {
        this._toggleDarkTheme();
        break;
      }
    }

    this._dropDown.close();
  }

  _print() {
    self.print();
  }

  /**
   * Keyup handler for the document.
   * @param {KeyboardEvent} e
   */
  onKeyUp(e) {
    // Ctrl+P - Expands audit details when user prints via keyboard shortcut.
    if ((e.ctrlKey || e.metaKey) && e.keyCode === 80) {
      this._dropDown.close();
    }
  }

  /**
   * Opens a new tab to the online viewer and sends the local page's JSON results
   * to the online viewer using postMessage.
   * @param {LH.Result} reportJson
   * @param {string} viewerPath
   * @protected
   */
  static openTabAndSendJsonReport(reportJson, viewerPath) {
    const VIEWER_ORIGIN = 'https://googlechrome.github.io';
    // Chrome doesn't allow us to immediately postMessage to a popup right
    // after it's created. Normally, we could also listen for the popup window's
    // load event, however it is cross-domain and won't fire. Instead, listen
    // for a message from the target app saying "I'm open".
    const json = reportJson;
    window.addEventListener('message', function msgHandler(messageEvent) {
      if (messageEvent.origin !== VIEWER_ORIGIN) {
        return;
      }
      if (popup && messageEvent.data.opened) {
        popup.postMessage({lhresults: json}, VIEWER_ORIGIN);
        window.removeEventListener('message', msgHandler);
      }
    });

    // The popup's window.name is keyed by version+url+fetchTime, so we reuse/select tabs correctly
    // @ts-expect-error - If this is a v2 LHR, use old `generatedTime`.
    const fallbackFetchTime = /** @type {string} */ (json.generatedTime);
    const fetchTime = json.fetchTime || fallbackFetchTime;
    const windowName = `${json.lighthouseVersion}-${json.requestedUrl}-${fetchTime}`;
    const popup = window.open(`${VIEWER_ORIGIN}${viewerPath}`, windowName);
  }

  /**
   * Expands all audit `<details>`.
   * Ideally, a print stylesheet could take care of this, but CSS has no way to
   * open a `<details>` element.
   */
  expandAllDetails() {
    const details = /** @type {Array<HTMLDetailsElement>} */ (this._dom.findAll(
        '.lh-categories details', this._document));
    details.map(detail => detail.open = true);
  }

  /**
   * Collapses all audit `<details>`.
   * open a `<details>` element.
   */
  collapseAllDetails() {
    const details = /** @type {Array<HTMLDetailsElement>} */ (this._dom.findAll(
        '.lh-categories details', this._document));
    details.map(detail => detail.open = false);
  }

  /**
   * Sets up listeners to collapse audit `<details>` when the user closes the
   * print dialog, all `<details>` are collapsed.
   */
  _setUpCollapseDetailsAfterPrinting() {
    // FF and IE implement these old events.
    if ('onbeforeprint' in self) {
      self.addEventListener('afterprint', this.collapseAllDetails);
    } else {
      const win = /** @type {Window} */ (self);
      // Note: FF implements both window.onbeforeprint and media listeners. However,
      // it doesn't matchMedia doesn't fire when matching 'print'.
      win.matchMedia('print').addListener(mql => {
        if (mql.matches) {
          this.expandAllDetails();
        } else {
          this.collapseAllDetails();
        }
      });
    }
  }

  /**
   * Returns the html that recreates this report.
   * @return {string}
   * @protected
   */
  getReportHtml() {
    this._resetUIState();
    return this._document.documentElement.outerHTML;
  }

  /**
   * Save json as a gist. Unimplemented in base UI features.
   * @protected
   */
  saveAsGist() {
    throw new Error('Cannot save as gist from base report');
  }

  /**
   * Downloads a file (blob) using a[download].
   * @param {Blob|File} blob The file to save.
   * @private
   */
  _saveFile(blob) {
    const filename = getFilenamePrefix({
      finalUrl: this.json.finalUrl,
      fetchTime: this.json.fetchTime,
    });

    const ext = blob.type.match('json') ? '.json' : '.html';
    const href = URL.createObjectURL(blob);

    const a = this._dom.createElement('a');
    a.download = `${filename}${ext}`;
    a.href = href;
    this._document.body.appendChild(a); // Firefox requires anchor to be in the DOM.
    a.click();

    // cleanup.
    this._document.body.removeChild(a);
    setTimeout(_ => URL.revokeObjectURL(href), 500);
  }

  /**
   * @private
   * @param {boolean} [force]
   */
  _toggleDarkTheme(force) {
    const el = this._dom.find('.lh-vars', this._document);
    // This seems unnecessary, but in DevTools, passing "undefined" as the second
    // parameter acts like passing "false".
    // https://github.com/ChromeDevTools/devtools-frontend/blob/dd6a6d4153647c2a4203c327c595692c5e0a4256/front_end/dom_extension/DOMExtension.js#L809-L819
    if (typeof force === 'undefined') {
      el.classList.toggle('dark');
    } else {
      el.classList.toggle('dark', force);
    }
  }

  _updateStickyHeaderOnScroll() {
    // Show sticky header when the score scale begins to go underneath the topbar.
    const topbarBottom = this.topbarEl.getBoundingClientRect().bottom;
    const scoreScaleTop = this.scoreScaleEl.getBoundingClientRect().top;
    const showStickyHeader = topbarBottom >= scoreScaleTop;

    // Highlight mini gauge when section is in view.
    // In view = the last category that starts above the middle of the window.
    const categoryEls = Array.from(this._document.querySelectorAll('.lh-category'));
    const categoriesAboveTheMiddle =
      categoryEls.filter(el => el.getBoundingClientRect().top - window.innerHeight / 2 < 0);
    const highlightIndex =
      categoriesAboveTheMiddle.length > 0 ? categoriesAboveTheMiddle.length - 1 : 0;

    // Category order matches gauge order in sticky header.
    const gaugeWrapperEls = this.stickyHeaderEl.querySelectorAll('.lh-gauge__wrapper');
    const gaugeToHighlight = gaugeWrapperEls[highlightIndex];
    const origin = gaugeWrapperEls[0].getBoundingClientRect().left;
    const offset = gaugeToHighlight.getBoundingClientRect().left - origin;

    // Mutate at end to avoid layout thrashing.
    this.highlightEl.style.transform = `translate(${offset}px)`;
    this.stickyHeaderEl.classList.toggle('lh-sticky-header--visible', showStickyHeader);
  }
}

class DropDown {
  /**
   * @param {DOM} dom
   */
  constructor(dom) {
    /** @type {DOM} */
    this._dom = dom;
    /** @type {HTMLElement} */
    this._toggleEl; // eslint-disable-line no-unused-expressions
    /** @type {HTMLElement} */
    this._menuEl; // eslint-disable-line no-unused-expressions

    this.onDocumentKeyDown = this.onDocumentKeyDown.bind(this);
    this.onToggleClick = this.onToggleClick.bind(this);
    this.onToggleKeydown = this.onToggleKeydown.bind(this);
    this.onMenuFocusOut = this.onMenuFocusOut.bind(this);
    this.onMenuKeydown = this.onMenuKeydown.bind(this);

    this._getNextMenuItem = this._getNextMenuItem.bind(this);
    this._getNextSelectableNode = this._getNextSelectableNode.bind(this);
    this._getPreviousMenuItem = this._getPreviousMenuItem.bind(this);
  }

  /**
   * @param {function(MouseEvent): any} menuClickHandler
   */
  setup(menuClickHandler) {
    this._toggleEl = this._dom.find('.lh-tools__button', this._dom.document());
    this._toggleEl.addEventListener('click', this.onToggleClick);
    this._toggleEl.addEventListener('keydown', this.onToggleKeydown);

    this._menuEl = this._dom.find('.lh-tools__dropdown', this._dom.document());
    this._menuEl.addEventListener('keydown', this.onMenuKeydown);
    this._menuEl.addEventListener('click', menuClickHandler);
  }

  close() {
    this._toggleEl.classList.remove('active');
    this._toggleEl.setAttribute('aria-expanded', 'false');
    if (this._menuEl.contains(this._dom.document().activeElement)) {
      // Refocus on the tools button if the drop down last had focus
      this._toggleEl.focus();
    }
    this._menuEl.removeEventListener('focusout', this.onMenuFocusOut);
    this._dom.document().removeEventListener('keydown', this.onDocumentKeyDown);
  }

  /**
   * @param {HTMLElement} firstFocusElement
   */
  open(firstFocusElement) {
    if (this._toggleEl.classList.contains('active')) {
      // If the drop down is already open focus on the element
      firstFocusElement.focus();
    } else {
      // Wait for drop down transition to complete so options are focusable.
      this._menuEl.addEventListener('transitionend', () => {
        firstFocusElement.focus();
      }, {once: true});
    }

    this._toggleEl.classList.add('active');
    this._toggleEl.setAttribute('aria-expanded', 'true');
    this._menuEl.addEventListener('focusout', this.onMenuFocusOut);
    this._dom.document().addEventListener('keydown', this.onDocumentKeyDown);
  }

  /**
   * Click handler for tools button.
   * @param {Event} e
   */
  onToggleClick(e) {
    e.preventDefault();
    e.stopImmediatePropagation();

    if (this._toggleEl.classList.contains('active')) {
      this.close();
    } else {
      this.open(this._getNextMenuItem());
    }
  }

  /**
   * Handler for tool button.
   * @param {KeyboardEvent} e
   */
  onToggleKeydown(e) {
    switch (e.code) {
      case 'ArrowUp':
        e.preventDefault();
        this.open(this._getPreviousMenuItem());
        break;
      case 'ArrowDown':
      case 'Enter':
      case ' ':
        e.preventDefault();
        this.open(this._getNextMenuItem());
        break;
      default:
       // no op
    }
  }

  /**
   * Handler for tool DropDown.
   * @param {KeyboardEvent} e
   */
  onMenuKeydown(e) {
    const el = /** @type {?HTMLElement} */ (e.target);

    switch (e.code) {
      case 'ArrowUp':
        e.preventDefault();
        this._getPreviousMenuItem(el).focus();
        break;
      case 'ArrowDown':
        e.preventDefault();
        this._getNextMenuItem(el).focus();
        break;
      case 'Home':
        e.preventDefault();
        this._getNextMenuItem().focus();
        break;
      case 'End':
        e.preventDefault();
        this._getPreviousMenuItem().focus();
        break;
      default:
       // no op
    }
  }

  /**
   * Keydown handler for the document.
   * @param {KeyboardEvent} e
   */
  onDocumentKeyDown(e) {
    if (e.keyCode === 27) { // ESC
      this.close();
    }
  }

  /**
   * Focus out handler for the drop down menu.
   * @param {FocusEvent} e
   */
  onMenuFocusOut(e) {
    const focusedEl = /** @type {?HTMLElement} */ (e.relatedTarget);

    if (!this._menuEl.contains(focusedEl)) {
      this.close();
    }
  }

  /**
   * @param {Array<Node>} allNodes
   * @param {?Node=} startNode
   * @returns {Node}
   */
  _getNextSelectableNode(allNodes, startNode) {
    const nodes = allNodes.filter((node) => {
      if (!(node instanceof HTMLElement)) {
        return false;
      }

      // 'Save as Gist' option may be disabled.
      if (node.hasAttribute('disabled')) {
        return false;
      }

      // 'Save as Gist' option may have display none.
      if (window.getComputedStyle(node).display === 'none') {
        return false;
      }

      return true;
    });

    let nextIndex = startNode ? (nodes.indexOf(startNode) + 1) : 0;
    if (nextIndex >= nodes.length) {
      nextIndex = 0;
    }

    return nodes[nextIndex];
  }

  /**
   * @param {?Element=} startEl
   * @returns {HTMLElement}
   */
  _getNextMenuItem(startEl) {
    const nodes = Array.from(this._menuEl.childNodes);
    return /** @type {HTMLElement} */ (this._getNextSelectableNode(nodes, startEl));
  }

  /**
   * @param {?Element=} startEl
   * @returns {HTMLElement}
   */
  _getPreviousMenuItem(startEl) {
    const nodes = Array.from(this._menuEl.childNodes).reverse();
    return /** @type {HTMLElement} */ (this._getNextSelectableNode(nodes, startEl));
  }
}

if (typeof module !== 'undefined' && module.exports) {
  module.exports = ReportUIFeatures;
} else {
  self.ReportUIFeatures = ReportUIFeatures;
}
;
/**
 * @license
 * Copyright 2017 The Lighthouse Authors. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS-IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
'use strict';

/* globals self, Util */

/** @typedef {import('./dom.js')} DOM */
/** @typedef {import('./report-renderer.js')} ReportRenderer */
/** @typedef {import('./details-renderer.js')} DetailsRenderer */
/** @typedef {import('./util.js')} Util */
/** @typedef {'failed'|'warning'|'manual'|'passed'|'notApplicable'} TopLevelClumpId */

class CategoryRenderer {
  /**
   * @param {DOM} dom
   * @param {DetailsRenderer} detailsRenderer
   */
  constructor(dom, detailsRenderer) {
    /** @type {DOM} */
    this.dom = dom;
    /** @type {DetailsRenderer} */
    this.detailsRenderer = detailsRenderer;
    /** @type {ParentNode} */
    this.templateContext = this.dom.document();

    this.detailsRenderer.setTemplateContext(this.templateContext);
  }

  /**
   * Display info per top-level clump. Define on class to avoid race with Util init.
   */
  get _clumpTitles() {
    return {
      warning: Util.i18n.strings.warningAuditsGroupTitle,
      manual: Util.i18n.strings.manualAuditsGroupTitle,
      passed: Util.i18n.strings.passedAuditsGroupTitle,
      notApplicable: Util.i18n.strings.notApplicableAuditsGroupTitle,
    };
  }

  /**
   * @param {LH.ReportResult.AuditRef} audit
   * @return {Element}
   */
  renderAudit(audit) {
    const tmpl = this.dom.cloneTemplate('#tmpl-lh-audit', this.templateContext);
    return this.populateAuditValues(audit, tmpl);
  }

  /**
   * Populate an DOM tree with audit details. Used by renderAudit and renderOpportunity
   * @param {LH.ReportResult.AuditRef} audit
   * @param {DocumentFragment} tmpl
   * @return {!Element}
   */
  populateAuditValues(audit, tmpl) {
    const strings = Util.i18n.strings;
    const auditEl = this.dom.find('.lh-audit', tmpl);
    auditEl.id = audit.result.id;
    const scoreDisplayMode = audit.result.scoreDisplayMode;

    if (audit.result.displayValue) {
      this.dom.find('.lh-audit__display-text', auditEl).textContent = audit.result.displayValue;
    }

    const titleEl = this.dom.find('.lh-audit__title', auditEl);
    titleEl.appendChild(this.dom.convertMarkdownCodeSnippets(audit.result.title));
    this.dom.find('.lh-audit__description', auditEl)
        .appendChild(this.dom.convertMarkdownLinkSnippets(audit.result.description));

    if (audit.stackPacks) {
      audit.stackPacks.forEach(pack => {
        const packElm = this.dom.createElement('div');
        packElm.classList.add('lh-audit__stackpack');

        const packElmImg = this.dom.createElement('img');
        packElmImg.classList.add('lh-audit__stackpack__img');
        packElmImg.src = pack.iconDataURL;
        packElmImg.alt = pack.title;
        packElm.appendChild(packElmImg);

        packElm.appendChild(this.dom.convertMarkdownLinkSnippets(pack.description));

        this.dom.find('.lh-audit__stackpacks', auditEl)
          .appendChild(packElm);
      });
    }

    const header = /** @type {HTMLDetailsElement} */ (this.dom.find('details', auditEl));
    if (audit.result.details) {
      const elem = this.detailsRenderer.render(audit.result.details);
      if (elem) {
        elem.classList.add('lh-details');
        header.appendChild(elem);
      }
    }

    // Add chevron SVG to the end of the summary
    this.dom.find('.lh-chevron-container', auditEl).appendChild(this._createChevron());
    this._setRatingClass(auditEl, audit.result.score, scoreDisplayMode);

    if (audit.result.scoreDisplayMode === 'error') {
      auditEl.classList.add(`lh-audit--error`);
      const textEl = this.dom.find('.lh-audit__display-text', auditEl);
      textEl.textContent = strings.errorLabel;
      textEl.classList.add('tooltip-boundary');
      const tooltip = this.dom.createChildOf(textEl, 'div', 'tooltip tooltip--error');
      tooltip.textContent = audit.result.errorMessage || strings.errorMissingAuditInfo;
    } else if (audit.result.explanation) {
      const explEl = this.dom.createChildOf(titleEl, 'div', 'lh-audit-explanation');
      explEl.textContent = audit.result.explanation;
    }
    const warnings = audit.result.warnings;
    if (!warnings || warnings.length === 0) return auditEl;

    // Add list of warnings or singular warning
    const summaryEl = this.dom.find('summary', header);
    const warningsEl = this.dom.createChildOf(summaryEl, 'div', 'lh-warnings');
    this.dom.createChildOf(warningsEl, 'span').textContent = strings.warningHeader;
    if (warnings.length === 1) {
      warningsEl.appendChild(this.dom.document().createTextNode(warnings.join('')));
    } else {
      const warningsUl = this.dom.createChildOf(warningsEl, 'ul');
      for (const warning of warnings) {
        const item = this.dom.createChildOf(warningsUl, 'li');
        item.textContent = warning;
      }
    }
    return auditEl;
  }

  /**
   * @return {HTMLElement}
   */
  _createChevron() {
    const chevronTmpl = this.dom.cloneTemplate('#tmpl-lh-chevron', this.templateContext);
    const chevronEl = this.dom.find('.lh-chevron', chevronTmpl);
    return chevronEl;
  }

  /**
   * @param {Element} element DOM node to populate with values.
   * @param {number|null} score
   * @param {string} scoreDisplayMode
   * @return {!Element}
   */
  _setRatingClass(element, score, scoreDisplayMode) {
    const rating = Util.calculateRating(score, scoreDisplayMode);
    element.classList.add(`lh-audit--${scoreDisplayMode.toLowerCase()}`);
    if (scoreDisplayMode !== 'informative') {
      element.classList.add(`lh-audit--${rating}`);
    }
    return element;
  }

  /**
   * @param {LH.ReportResult.Category} category
   * @param {Record<string, LH.Result.ReportGroup>} groupDefinitions
   * @return {Element}
   */
  renderCategoryHeader(category, groupDefinitions) {
    const tmpl = this.dom.cloneTemplate('#tmpl-lh-category-header', this.templateContext);

    const gaugeContainerEl = this.dom.find('.lh-score__gauge', tmpl);
    const gaugeEl = this.renderScoreGauge(category, groupDefinitions);
    gaugeContainerEl.appendChild(gaugeEl);

    if (category.description) {
      const descEl = this.dom.convertMarkdownLinkSnippets(category.description);
      this.dom.find('.lh-category-header__description', tmpl).appendChild(descEl);
    }

    return /** @type {Element} */ (tmpl.firstElementChild);
  }

  /**
   * Renders the group container for a group of audits. Individual audit elements can be added
   * directly to the returned element.
   * @param {LH.Result.ReportGroup} group
   * @return {Element}
   */
  renderAuditGroup(group) {
    const groupEl = this.dom.createElement('div', 'lh-audit-group');

    const auditGroupHeader = this.dom.createElement('div', 'lh-audit-group__header');

    this.dom.createChildOf(auditGroupHeader, 'span', 'lh-audit-group__title')
      .textContent = group.title;
    if (group.description) {
      const descriptionEl = this.dom.convertMarkdownLinkSnippets(group.description);
      descriptionEl.classList.add('lh-audit-group__description');
      auditGroupHeader.appendChild(descriptionEl);
    }
    groupEl.appendChild(auditGroupHeader);

    return groupEl;
  }

  /**
   * Takes an array of auditRefs, groups them if requested, then returns an
   * array of audit and audit-group elements.
   * @param {Array<LH.ReportResult.AuditRef>} auditRefs
   * @param {Object<string, LH.Result.ReportGroup>} groupDefinitions
   * @return {Array<Element>}
   */
  _renderGroupedAudits(auditRefs, groupDefinitions) {
    // Audits grouped by their group (or under notAGroup).
    /** @type {Map<string, Array<LH.ReportResult.AuditRef>>} */
    const grouped = new Map();

    // Add audits without a group first so they will appear first.
    const notAGroup = 'NotAGroup';
    grouped.set(notAGroup, []);

    for (const auditRef of auditRefs) {
      const groupId = auditRef.group || notAGroup;
      const groupAuditRefs = grouped.get(groupId) || [];
      groupAuditRefs.push(auditRef);
      grouped.set(groupId, groupAuditRefs);
    }

    /** @type {Array<Element>} */
    const auditElements = [];

    for (const [groupId, groupAuditRefs] of grouped) {
      if (groupId === notAGroup) {
        // Push not-grouped audits individually.
        for (const auditRef of groupAuditRefs) {
          auditElements.push(this.renderAudit(auditRef));
        }
        continue;
      }

      // Push grouped audits as a group.
      const groupDef = groupDefinitions[groupId];
      const auditGroupElem = this.renderAuditGroup(groupDef);
      for (const auditRef of groupAuditRefs) {
        auditGroupElem.appendChild(this.renderAudit(auditRef));
      }
      auditGroupElem.classList.add(`lh-audit-group--${groupId}`);
      auditElements.push(auditGroupElem);
    }

    return auditElements;
  }

  /**
   * Take a set of audits, group them if they have groups, then render in a top-level
   * clump that can't be expanded/collapsed.
   * @param {Array<LH.ReportResult.AuditRef>} auditRefs
   * @param {Object<string, LH.Result.ReportGroup>} groupDefinitions
   * @return {Element}
   */
  renderUnexpandableClump(auditRefs, groupDefinitions) {
    const clumpElement = this.dom.createElement('div');
    const elements = this._renderGroupedAudits(auditRefs, groupDefinitions);
    elements.forEach(elem => clumpElement.appendChild(elem));
    return clumpElement;
  }

  /**
   * Take a set of audits and render in a top-level, expandable clump that starts
   * in a collapsed state.
   * @param {Exclude<TopLevelClumpId, 'failed'>} clumpId
   * @param {{auditRefs: Array<LH.ReportResult.AuditRef>, description?: string}} clumpOpts
   * @return {!Element}
   */
  renderClump(clumpId, {auditRefs, description}) {
    const clumpTmpl = this.dom.cloneTemplate('#tmpl-lh-clump', this.templateContext);
    const clumpElement = this.dom.find('.lh-clump', clumpTmpl);

    if (clumpId === 'warning') {
      clumpElement.setAttribute('open', '');
    }

    const summaryInnerEl = this.dom.find('.lh-audit-group__summary', clumpElement);
    const chevronEl = summaryInnerEl.appendChild(this._createChevron());
    chevronEl.title = Util.i18n.strings.auditGroupExpandTooltip;

    const headerEl = this.dom.find('.lh-audit-group__header', clumpElement);
    const title = this._clumpTitles[clumpId];
    this.dom.find('.lh-audit-group__title', headerEl).textContent = title;
    if (description) {
      const descriptionEl = this.dom.convertMarkdownLinkSnippets(description);
      descriptionEl.classList.add('lh-audit-group__description');
      headerEl.appendChild(descriptionEl);
    }

    const itemCountEl = this.dom.find('.lh-audit-group__itemcount', clumpElement);
    itemCountEl.textContent = `(${auditRefs.length})`;

    // Add all audit results to the clump.
    const auditElements = auditRefs.map(this.renderAudit.bind(this));
    clumpElement.append(...auditElements);

    clumpElement.classList.add(`lh-clump--${clumpId.toLowerCase()}`);
    return clumpElement;
  }

  /**
   * @param {ParentNode} context
   */
  setTemplateContext(context) {
    this.templateContext = context;
    this.detailsRenderer.setTemplateContext(context);
  }

  /**
   * @param {LH.ReportResult.Category} category
   * @param {Record<string, LH.Result.ReportGroup>} groupDefinitions
   * @return {DocumentFragment}
   */
  renderScoreGauge(category, groupDefinitions) { // eslint-disable-line no-unused-vars
    const tmpl = this.dom.cloneTemplate('#tmpl-lh-gauge', this.templateContext);
    const wrapper = /** @type {HTMLAnchorElement} */ (this.dom.find('.lh-gauge__wrapper', tmpl));
    wrapper.href = `#${category.id}`;

    if (Util.isPluginCategory(category.id)) {
      wrapper.classList.add('lh-gauge__wrapper--plugin');
    }

    // Cast `null` to 0
    const numericScore = Number(category.score);
    const gauge = this.dom.find('.lh-gauge', tmpl);
    /** @type {?SVGCircleElement} */
    const gaugeArc = gauge.querySelector('.lh-gauge-arc');

    if (gaugeArc) this._setGaugeArc(gaugeArc, numericScore);

    const scoreOutOf100 = Math.round(numericScore * 100);
    const percentageEl = this.dom.find('.lh-gauge__percentage', tmpl);
    percentageEl.textContent = scoreOutOf100.toString();
    if (category.score === null) {
      percentageEl.textContent = '?';
      percentageEl.title = Util.i18n.strings.errorLabel;
    }

    // Render a numerical score if the category has applicable audits, or no audits whatsoever.
    if (category.auditRefs.length === 0 || this.hasApplicableAudits(category)) {
      wrapper.classList.add(`lh-gauge__wrapper--${Util.calculateRating(category.score)}`);
    } else {
      wrapper.classList.add(`lh-gauge__wrapper--not-applicable`);
      percentageEl.textContent = '-';
      percentageEl.title = Util.i18n.strings.notApplicableAuditsGroupTitle;
    }

    this.dom.find('.lh-gauge__label', tmpl).textContent = category.title;
    return tmpl;
  }

  /**
   * Returns true if an LH category has any non-"notApplicable" audits.
   * @param {LH.ReportResult.Category} category
   * @return {boolean}
   */
  hasApplicableAudits(category) {
    return category.auditRefs.some(ref => ref.result.scoreDisplayMode !== 'notApplicable');
  }

  /**
   * Define the score arc of the gauge
   * Credit to xgad for the original technique: https://codepen.io/xgad/post/svg-radial-progress-meters
   * @param {SVGCircleElement} arcElem
   * @param {number} percent
   */
  _setGaugeArc(arcElem, percent) {
    const circumferencePx = 2 * Math.PI * Number(arcElem.getAttribute('r'));
    // The rounded linecap of the stroke extends the arc past its start and end.
    // First, we tweak the -90deg rotation to start exactly at the top of the circle.
    const strokeWidthPx = Number(arcElem.getAttribute('stroke-width'));
    const rotationalAdjustmentPercent = 0.25 * strokeWidthPx / circumferencePx;
    arcElem.style.transform = `rotate(${-90 + rotationalAdjustmentPercent * 360}deg)`;

    // Then, we terminate the line a little early as well.
    let arcLengthPx = percent * circumferencePx - strokeWidthPx / 2;
    // Special cases. No dot for 0, and full ring if 100
    if (percent === 0) arcElem.style.opacity = '0';
    if (percent === 1) arcLengthPx = circumferencePx;

    arcElem.style.strokeDasharray = `${Math.max(arcLengthPx, 0)} ${circumferencePx}`;
  }

  /**
   * @param {LH.ReportResult.AuditRef} audit
   * @return {boolean}
   */
  _auditHasWarning(audit) {
    return Boolean(audit.result.warnings && audit.result.warnings.length);
  }

  /**
   * Returns the id of the top-level clump to put this audit in.
   * @param {LH.ReportResult.AuditRef} auditRef
   * @return {TopLevelClumpId}
   */
  _getClumpIdForAuditRef(auditRef) {
    const scoreDisplayMode = auditRef.result.scoreDisplayMode;
    if (scoreDisplayMode === 'manual' || scoreDisplayMode === 'notApplicable') {
      return scoreDisplayMode;
    }

    if (Util.showAsPassed(auditRef.result)) {
      if (this._auditHasWarning(auditRef)) {
        return 'warning';
      } else {
        return 'passed';
      }
    } else {
      return 'failed';
    }
  }

  /**
   * Renders a set of top level sections (clumps), under a status of failed, warning,
   * manual, passed, or notApplicable. The result ends up something like:
   *
   * failed clump
   *   ├── audit 1 (w/o group)
   *   ├── audit 2 (w/o group)
   *   ├── audit group
   *   |  ├── audit 3
   *   |  └── audit 4
   *   └── audit group
   *      ├── audit 5
   *      └── audit 6
   * other clump (e.g. 'manual')
   *   ├── audit 1
   *   ├── audit 2
   *   ├── …
   *   ⋮
   * @param {LH.ReportResult.Category} category
   * @param {Object<string, LH.Result.ReportGroup>} [groupDefinitions]
   * @return {Element}
   */
  render(category, groupDefinitions = {}) {
    const element = this.dom.createElement('div', 'lh-category');
    this.createPermalinkSpan(element, category.id);
    element.appendChild(this.renderCategoryHeader(category, groupDefinitions));

    // Top level clumps for audits, in order they will appear in the report.
    /** @type {Map<TopLevelClumpId, Array<LH.ReportResult.AuditRef>>} */
    const clumps = new Map();
    clumps.set('failed', []);
    clumps.set('warning', []);
    clumps.set('manual', []);
    clumps.set('passed', []);
    clumps.set('notApplicable', []);

    // Sort audits into clumps.
    for (const auditRef of category.auditRefs) {
      const clumpId = this._getClumpIdForAuditRef(auditRef);
      const clump = /** @type {Array<LH.ReportResult.AuditRef>} */ (clumps.get(clumpId)); // already defined
      clump.push(auditRef);
      clumps.set(clumpId, clump);
    }

    // Render each clump.
    for (const [clumpId, auditRefs] of clumps) {
      if (auditRefs.length === 0) continue;

      if (clumpId === 'failed') {
        const clumpElem = this.renderUnexpandableClump(auditRefs, groupDefinitions);
        clumpElem.classList.add(`lh-clump--failed`);
        element.appendChild(clumpElem);
        continue;
      }

      const description = clumpId === 'manual' ? category.manualDescription : undefined;
      const clumpElem = this.renderClump(clumpId, {auditRefs, description});
      element.appendChild(clumpElem);
    }

    return element;
  }

  /**
   * Create a non-semantic span used for hash navigation of categories
   * @param {Element} element
   * @param {string} id
   */
  createPermalinkSpan(element, id) {
    const permalinkEl = this.dom.createChildOf(element, 'span', 'lh-permalink');
    permalinkEl.id = id;
  }
}

if (typeof module !== 'undefined' && module.exports) {
  module.exports = CategoryRenderer;
} else {
  self.CategoryRenderer = CategoryRenderer;
}
;
/**
 * @license
 * Copyright 2018 The Lighthouse Authors. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS-IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
'use strict';

/* globals self, Util, CategoryRenderer */

/** @typedef {import('./dom.js')} DOM */

class PerformanceCategoryRenderer extends CategoryRenderer {
  /**
   * @param {LH.ReportResult.AuditRef} audit
   * @return {!Element}
   */
  _renderMetric(audit) {
    const tmpl = this.dom.cloneTemplate('#tmpl-lh-metric', this.templateContext);
    const element = this.dom.find('.lh-metric', tmpl);
    element.id = audit.result.id;
    const rating = Util.calculateRating(audit.result.score, audit.result.scoreDisplayMode);
    element.classList.add(`lh-metric--${rating}`);

    const titleEl = this.dom.find('.lh-metric__title', tmpl);
    titleEl.textContent = audit.result.title;

    const valueEl = this.dom.find('.lh-metric__value', tmpl);
    valueEl.textContent = audit.result.displayValue || '';

    const descriptionEl = this.dom.find('.lh-metric__description', tmpl);
    descriptionEl.appendChild(this.dom.convertMarkdownLinkSnippets(audit.result.description));

    if (audit.result.scoreDisplayMode === 'error') {
      descriptionEl.textContent = '';
      valueEl.textContent = 'Error!';
      const tooltip = this.dom.createChildOf(descriptionEl, 'span');
      tooltip.textContent = audit.result.errorMessage || 'Report error: no metric information';
    }

    return element;
  }

  /**
   * @param {LH.ReportResult.AuditRef} audit
   * @param {number} scale
   * @return {!Element}
   */
  _renderOpportunity(audit, scale) {
    const oppTmpl = this.dom.cloneTemplate('#tmpl-lh-opportunity', this.templateContext);
    const element = this.populateAuditValues(audit, oppTmpl);
    element.id = audit.result.id;

    if (!audit.result.details || audit.result.scoreDisplayMode === 'error') {
      return element;
    }
    const details = audit.result.details;
    if (details.type !== 'opportunity') {
      return element;
    }

    // Overwrite the displayValue with opportunity's wastedMs
    const displayEl = this.dom.find('.lh-audit__display-text', element);
    const sparklineWidthPct = `${details.overallSavingsMs / scale * 100}%`;
    this.dom.find('.lh-sparkline__bar', element).style.width = sparklineWidthPct;
    displayEl.textContent = Util.i18n.formatSeconds(details.overallSavingsMs, 0.01);

    // Set [title] tooltips
    if (audit.result.displayValue) {
      const displayValue = audit.result.displayValue;
      this.dom.find('.lh-load-opportunity__sparkline', element).title = displayValue;
      displayEl.title = displayValue;
    }

    return element;
  }

  /**
   * Get an audit's wastedMs to sort the opportunity by, and scale the sparkline width
   * Opportunities with an error won't have a details object, so MIN_VALUE is returned to keep any
   * erroring opportunities last in sort order.
   * @param {LH.ReportResult.AuditRef} audit
   * @return {number}
   */
  _getWastedMs(audit) {
    if (audit.result.details && audit.result.details.type === 'opportunity') {
      const details = audit.result.details;
      if (typeof details.overallSavingsMs !== 'number') {
        throw new Error('non-opportunity details passed to _getWastedMs');
      }
      return details.overallSavingsMs;
    } else {
      return Number.MIN_VALUE;
    }
  }

  /**
   * Get a link to the interactive scoring calculator with the metric values.
   * @param {LH.ReportResult.AuditRef[]} auditRefs
   * @return {string}
   */
  _getScoringCalculatorHref(auditRefs) {
    const v5andv6metrics = auditRefs.filter(audit => audit.group === 'metrics');
    const fci = auditRefs.find(audit => audit.id === 'first-cpu-idle');
    const fmp = auditRefs.find(audit => audit.id === 'first-meaningful-paint');
    if (fci) v5andv6metrics.push(fci);
    if (fmp) v5andv6metrics.push(fmp);

    /** @type {Record<string, string>} */
    const acronymMapping = {
      'cumulative-layout-shift': 'CLS',
      'first-contentful-paint': 'FCP',
      'first-cpu-idle': 'FCI',
      'first-meaningful-paint': 'FMP',
      'interactive': 'TTI',
      'largest-contentful-paint': 'LCP',
      'speed-index': 'SI',
      'total-blocking-time': 'TBT',
    };

    /**
     * Clamp figure to 2 decimal places
     * @param {number} val
     * @return {number}
     */
    const clampTo2Decimals = val => Math.round(val * 100) / 100;

    const metricPairs = v5andv6metrics.map(audit => {
      let value;
      if (typeof audit.result.numericValue === 'number') {
        value = audit.id === 'cumulative-layout-shift' ?
          clampTo2Decimals(audit.result.numericValue) :
          Math.round(audit.result.numericValue);
        value = value.toString();
      } else {
        value = 'null';
      }
      return [acronymMapping[audit.id] || audit.id, value];
    });
    const paramPairs = [...metricPairs];

    if (Util.reportJson) {
      paramPairs.push(['device', Util.reportJson.configSettings.emulatedFormFactor]);
      paramPairs.push(['version', Util.reportJson.lighthouseVersion]);
    }

    const params = new URLSearchParams(paramPairs);
    const url = new URL('https://googlechrome.github.io/lighthouse/scorecalc/');
    url.hash = params.toString();
    return url.href;
  }

  /**
   * @param {LH.ReportResult.Category} category
   * @param {Object<string, LH.Result.ReportGroup>} groups
   * @param {'PSI'=} environment 'PSI' and undefined are the only valid values
   * @return {Element}
   * @override
   */
  render(category, groups, environment) {
    const strings = Util.i18n.strings;
    const element = this.dom.createElement('div', 'lh-category');
    if (environment === 'PSI') {
      const gaugeEl = this.dom.createElement('div', 'lh-score__gauge');
      gaugeEl.appendChild(this.renderScoreGauge(category, groups));
      element.appendChild(gaugeEl);
    } else {
      this.createPermalinkSpan(element, category.id);
      element.appendChild(this.renderCategoryHeader(category, groups));
    }

    // Metrics.
    const metricAuditsEl = this.renderAuditGroup(groups.metrics);

    // Metric descriptions toggle.
    const toggleTmpl = this.dom.cloneTemplate('#tmpl-lh-metrics-toggle', this.templateContext);
    const _toggleEl = this.dom.find('.lh-metrics-toggle', toggleTmpl);
    metricAuditsEl.append(..._toggleEl.childNodes);

    const metricAudits = category.auditRefs.filter(audit => audit.group === 'metrics');
    const metricsBoxesEl = this.dom.createChildOf(metricAuditsEl, 'div', 'lh-metrics-container');

    metricAudits.forEach(item => {
      metricsBoxesEl.appendChild(this._renderMetric(item));
    });

    const estValuesEl = this.dom.createChildOf(metricAuditsEl, 'div', 'lh-metrics__disclaimer');
    const disclaimerEl = this.dom.convertMarkdownLinkSnippets(strings.varianceDisclaimer);
    estValuesEl.appendChild(disclaimerEl);

    // Add link to score calculator.
    const calculatorLink = this.dom.createChildOf(estValuesEl, 'a', 'lh-calclink');
    calculatorLink.target = '_blank';
    calculatorLink.textContent = strings.calculatorLink;
    calculatorLink.href = this._getScoringCalculatorHref(category.auditRefs);


    metricAuditsEl.classList.add('lh-audit-group--metrics');
    element.appendChild(metricAuditsEl);

    // Filmstrip
    const timelineEl = this.dom.createChildOf(element, 'div', 'lh-filmstrip-container');
    const thumbnailAudit = category.auditRefs.find(audit => audit.id === 'screenshot-thumbnails');
    const thumbnailResult = thumbnailAudit && thumbnailAudit.result;
    if (thumbnailResult && thumbnailResult.details) {
      timelineEl.id = thumbnailResult.id;
      const filmstripEl = this.detailsRenderer.render(thumbnailResult.details);
      filmstripEl && timelineEl.appendChild(filmstripEl);
    }

    // Budgets
    /** @type {Array<Element>} */
    const budgetTableEls = [];
    ['performance-budget', 'timing-budget'].forEach((id) => {
      const audit = category.auditRefs.find(audit => audit.id === id);
      if (audit && audit.result.details) {
        const table = this.detailsRenderer.render(audit.result.details);
        if (table) {
          table.id = id;
          table.classList.add('lh-audit');
          budgetTableEls.push(table);
        }
      }
    });
    if (budgetTableEls.length > 0) {
      const budgetsGroupEl = this.renderAuditGroup(groups.budgets);
      budgetTableEls.forEach(table => budgetsGroupEl.appendChild(table));
      budgetsGroupEl.classList.add('lh-audit-group--budgets');
      element.appendChild(budgetsGroupEl);
    }

    // Opportunities
    const opportunityAudits = category.auditRefs
        .filter(audit => audit.group === 'load-opportunities' && !Util.showAsPassed(audit.result))
        .sort((auditA, auditB) => this._getWastedMs(auditB) - this._getWastedMs(auditA));

    if (opportunityAudits.length) {
      // Scale the sparklines relative to savings, minimum 2s to not overstate small savings
      const minimumScale = 2000;
      const wastedMsValues = opportunityAudits.map(audit => this._getWastedMs(audit));
      const maxWaste = Math.max(...wastedMsValues);
      const scale = Math.max(Math.ceil(maxWaste / 1000) * 1000, minimumScale);
      const groupEl = this.renderAuditGroup(groups['load-opportunities']);
      const tmpl = this.dom.cloneTemplate('#tmpl-lh-opportunity-header', this.templateContext);

      this.dom.find('.lh-load-opportunity__col--one', tmpl).textContent =
        strings.opportunityResourceColumnLabel;
      this.dom.find('.lh-load-opportunity__col--two', tmpl).textContent =
        strings.opportunitySavingsColumnLabel;

      const headerEl = this.dom.find('.lh-load-opportunity__header', tmpl);
      groupEl.appendChild(headerEl);
      opportunityAudits.forEach(item => groupEl.appendChild(this._renderOpportunity(item, scale)));
      groupEl.classList.add('lh-audit-group--load-opportunities');
      element.appendChild(groupEl);
    }

    // Diagnostics
    const diagnosticAudits = category.auditRefs
        .filter(audit => audit.group === 'diagnostics' && !Util.showAsPassed(audit.result))
        .sort((a, b) => {
          const scoreA = a.result.scoreDisplayMode === 'informative' ? 100 : Number(a.result.score);
          const scoreB = b.result.scoreDisplayMode === 'informative' ? 100 : Number(b.result.score);
          return scoreA - scoreB;
        });

    if (diagnosticAudits.length) {
      const groupEl = this.renderAuditGroup(groups['diagnostics']);
      diagnosticAudits.forEach(item => groupEl.appendChild(this.renderAudit(item)));
      groupEl.classList.add('lh-audit-group--diagnostics');
      element.appendChild(groupEl);
    }

    // Passed audits
    const passedAudits = category.auditRefs
        .filter(audit => (audit.group === 'load-opportunities' || audit.group === 'diagnostics') &&
            Util.showAsPassed(audit.result));

    if (!passedAudits.length) return element;

    const clumpOpts = {
      auditRefs: passedAudits,
      groupDefinitions: groups,
    };
    const passedElem = this.renderClump('passed', clumpOpts);
    element.appendChild(passedElem);
    return element;
  }
}

if (typeof module !== 'undefined' && module.exports) {
  module.exports = PerformanceCategoryRenderer;
} else {
  self.PerformanceCategoryRenderer = PerformanceCategoryRenderer;
}
;
/**
 * @license
 * Copyright 2018 The Lighthouse Authors. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS-IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
'use strict';

/* globals self, Util, CategoryRenderer */

class PwaCategoryRenderer extends CategoryRenderer {
  /**
   * @param {LH.ReportResult.Category} category
   * @param {Object<string, LH.Result.ReportGroup>} [groupDefinitions]
   * @return {Element}
   */
  render(category, groupDefinitions = {}) {
    const categoryElem = this.dom.createElement('div', 'lh-category');
    this.createPermalinkSpan(categoryElem, category.id);
    categoryElem.appendChild(this.renderCategoryHeader(category, groupDefinitions));

    const auditRefs = category.auditRefs;

    // Regular audits aren't split up into pass/fail/notApplicable clumps, they're
    // all put in a top-level clump that isn't expandable/collapsible.
    const regularAuditRefs = auditRefs.filter(ref => ref.result.scoreDisplayMode !== 'manual');
    const auditsElem = this._renderAudits(regularAuditRefs, groupDefinitions);
    categoryElem.appendChild(auditsElem);

    // Manual audits are still in a manual clump.
    const manualAuditRefs = auditRefs.filter(ref => ref.result.scoreDisplayMode === 'manual');
    const manualElem = this.renderClump('manual',
      {auditRefs: manualAuditRefs, description: category.manualDescription});
    categoryElem.appendChild(manualElem);

    return categoryElem;
  }

  /**
   * @param {LH.ReportResult.Category} category
   * @param {Record<string, LH.Result.ReportGroup>} groupDefinitions
   * @return {DocumentFragment}
   */
  renderScoreGauge(category, groupDefinitions) {
    // Defer to parent-gauge style if category error.
    if (category.score === null) {
      return super.renderScoreGauge(category, groupDefinitions);
    }

    const tmpl = this.dom.cloneTemplate('#tmpl-lh-gauge--pwa', this.templateContext);
    const wrapper = /** @type {HTMLAnchorElement} */ (this.dom.find('.lh-gauge--pwa__wrapper',
      tmpl));
    wrapper.href = `#${category.id}`;

    // Correct IDs in case multiple instances end up in the page.
    const svgRoot = tmpl.querySelector('svg');
    if (!svgRoot) throw new Error('no SVG element found in PWA score gauge template');
    PwaCategoryRenderer._makeSvgReferencesUnique(svgRoot);

    const allGroups = this._getGroupIds(category.auditRefs);
    const passingGroupIds = this._getPassingGroupIds(category.auditRefs);

    if (passingGroupIds.size === allGroups.size) {
      wrapper.classList.add('lh-badged--all');
    } else {
      for (const passingGroupId of passingGroupIds) {
        wrapper.classList.add(`lh-badged--${passingGroupId}`);
      }
    }

    this.dom.find('.lh-gauge__label', tmpl).textContent = category.title;
    wrapper.title = this._getGaugeTooltip(category.auditRefs, groupDefinitions);
    return tmpl;
  }

  /**
   * Returns the group IDs found in auditRefs.
   * @param {Array<LH.ReportResult.AuditRef>} auditRefs
   * @return {!Set<string>}
   */
  _getGroupIds(auditRefs) {
    const groupIds = auditRefs.map(ref => ref.group).filter(/** @return {g is string} */ g => !!g);
    return new Set(groupIds);
  }

  /**
   * Returns the group IDs whose audits are all considered passing.
   * @param {Array<LH.ReportResult.AuditRef>} auditRefs
   * @return {Set<string>}
   */
  _getPassingGroupIds(auditRefs) {
    const uniqueGroupIds = this._getGroupIds(auditRefs);

    // Remove any that have a failing audit.
    for (const auditRef of auditRefs) {
      if (!Util.showAsPassed(auditRef.result) && auditRef.group) {
        uniqueGroupIds.delete(auditRef.group);
      }
    }

    return uniqueGroupIds;
  }

  /**
   * Returns a tooltip string summarizing group pass rates.
   * @param {Array<LH.ReportResult.AuditRef>} auditRefs
   * @param {Record<string, LH.Result.ReportGroup>} groupDefinitions
   * @return {string}
   */
  _getGaugeTooltip(auditRefs, groupDefinitions) {
    const groupIds = this._getGroupIds(auditRefs);

    const tips = [];
    for (const groupId of groupIds) {
      const groupAuditRefs = auditRefs.filter(ref => ref.group === groupId);
      const auditCount = groupAuditRefs.length;
      const passedCount = groupAuditRefs.filter(ref => Util.showAsPassed(ref.result)).length;

      const title = groupDefinitions[groupId].title;
      tips.push(`${title}: ${passedCount}/${auditCount}`);
    }

    return tips.join(', ');
  }

  /**
   * Render non-manual audits in groups, giving a badge to any group that has
   * all passing audits.
   * @param {Array<LH.ReportResult.AuditRef>} auditRefs
   * @param {Object<string, LH.Result.ReportGroup>} groupDefinitions
   * @return {Element}
   */
  _renderAudits(auditRefs, groupDefinitions) {
    const auditsElem = this.renderUnexpandableClump(auditRefs, groupDefinitions);

    // Add a 'badged' class to group if all audits in that group pass.
    const passsingGroupIds = this._getPassingGroupIds(auditRefs);
    for (const groupId of passsingGroupIds) {
      const groupElem = this.dom.find(`.lh-audit-group--${groupId}`, auditsElem);
      groupElem.classList.add('lh-badged');
    }

    return auditsElem;
  }

  /**
   * Alters SVG id references so multiple instances of an SVG element can coexist
   * in a single page. If `svgRoot` has a `<defs>` block, gives all elements defined
   * in it unique ids, then updates id references (`<use xlink:href="...">`,
   * `fill="url(#...)"`) to the altered ids in all descendents of `svgRoot`.
   * @param {SVGElement} svgRoot
   */
  static _makeSvgReferencesUnique(svgRoot) {
    const defsEl = svgRoot.querySelector('defs');
    if (!defsEl) return;

    const idSuffix = Util.getUniqueSuffix();
    const elementsToUpdate = defsEl.querySelectorAll('[id]');
    for (const el of elementsToUpdate) {
      const oldId = el.id;
      const newId = `${oldId}-${idSuffix}`;
      el.id = newId;

      // Update all <use>s.
      const useEls = svgRoot.querySelectorAll(`use[href="#${oldId}"]`);
      for (const useEl of useEls) {
        useEl.setAttribute('href', `#${newId}`);
      }

      // Update all fill="url(#...)"s.
      const fillEls = svgRoot.querySelectorAll(`[fill="url(#${oldId})"]`);
      for (const fillEl of fillEls) {
        fillEl.setAttribute('fill', `url(#${newId})`);
      }
    }
  }
}

if (typeof module !== 'undefined' && module.exports) {
  module.exports = PwaCategoryRenderer;
} else {
  self.PwaCategoryRenderer = PwaCategoryRenderer;
}
;
/**
 * @license
 * Copyright 2017 The Lighthouse Authors. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS-IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
'use strict';

/**
 * @fileoverview The entry point for rendering the Lighthouse report based on the JSON output.
 *    This file is injected into the report HTML along with the JSON report.
 *
 * Dummy text for ensuring report robustness: \u003c/script> pre$`post %%LIGHTHOUSE_JSON%%
 */

/** @typedef {import('./category-renderer')} CategoryRenderer */
/** @typedef {import('./dom.js')} DOM */

/* globals self, Util, DetailsRenderer, CategoryRenderer, I18n, PerformanceCategoryRenderer, PwaCategoryRenderer, ElementScreenshotRenderer */

class ReportRenderer {
  /**
   * @param {DOM} dom
   */
  constructor(dom) {
    /** @type {DOM} */
    this._dom = dom;
    /** @type {ParentNode} */
    this._templateContext = this._dom.document();
  }

  /**
   * @param {LH.Result} result
   * @param {Element} container Parent element to render the report into.
   * @return {!Element}
   */
  renderReport(result, container) {
    this._dom.setLighthouseChannel(result.configSettings.channel || 'unknown');

    const report = Util.prepareReportResult(result);

    container.textContent = ''; // Remove previous report.
    container.appendChild(this._renderReport(report));

    return container;
  }

  /**
   * Define a custom element for <templates> to be extracted from. For example:
   *     this.setTemplateContext(new DOMParser().parseFromString(htmlStr, 'text/html'))
   * @param {ParentNode} context
   */
  setTemplateContext(context) {
    this._templateContext = context;
  }

  /**
   * @param {LH.ReportResult} report
   * @return {DocumentFragment}
   */
  _renderReportTopbar(report) {
    const el = this._dom.cloneTemplate('#tmpl-lh-topbar', this._templateContext);
    const metadataUrl = /** @type {HTMLAnchorElement} */ (this._dom.find('.lh-topbar__url', el));
    metadataUrl.href = metadataUrl.textContent = report.finalUrl;
    metadataUrl.title = report.finalUrl;
    return el;
  }

  /**
   * @return {DocumentFragment}
   */
  _renderReportHeader() {
    const el = this._dom.cloneTemplate('#tmpl-lh-heading', this._templateContext);
    const domFragment = this._dom.cloneTemplate('#tmpl-lh-scores-wrapper', this._templateContext);
    const placeholder = this._dom.find('.lh-scores-wrapper-placeholder', el);
    /** @type {HTMLDivElement} */ (placeholder.parentNode).replaceChild(domFragment, placeholder);
    return el;
  }

  /**
   * @param {LH.ReportResult} report
   * @return {DocumentFragment}
   */
  _renderReportFooter(report) {
    const footer = this._dom.cloneTemplate('#tmpl-lh-footer', this._templateContext);

    const env = this._dom.find('.lh-env__items', footer);
    env.id = 'runtime-settings';
    this._dom.find('.lh-env__title', footer).textContent = Util.i18n.strings.runtimeSettingsTitle;

    const envValues = Util.getEnvironmentDisplayValues(report.configSettings || {});
    const runtimeValues = [
      {name: Util.i18n.strings.runtimeSettingsUrl, description: report.finalUrl},
      {name: Util.i18n.strings.runtimeSettingsFetchTime,
        description: Util.i18n.formatDateTime(report.fetchTime)},
      ...envValues,
      {name: Util.i18n.strings.runtimeSettingsChannel, description: report.configSettings.channel},
      {name: Util.i18n.strings.runtimeSettingsUA, description: report.userAgent},
      {name: Util.i18n.strings.runtimeSettingsUANetwork, description: report.environment &&
        report.environment.networkUserAgent},
      {name: Util.i18n.strings.runtimeSettingsBenchmark, description: report.environment &&
        report.environment.benchmarkIndex.toFixed(0)},
    ];
    if (report.environment.credits && report.environment.credits['axe-core']) {
      runtimeValues.push({
        name: Util.i18n.strings.runtimeSettingsAxeVersion,
        description: report.environment.credits['axe-core'],
      });
    }

    for (const runtime of runtimeValues) {
      if (!runtime.description) continue;

      const item = this._dom.cloneTemplate('#tmpl-lh-env__items', env);
      this._dom.find('.lh-env__name', item).textContent = runtime.name;
      this._dom.find('.lh-env__description', item).textContent = runtime.description;
      env.appendChild(item);
    }

    this._dom.find('.lh-footer__version_issue', footer).textContent = Util.i18n.strings.footerIssue;
    this._dom.find('.lh-footer__version', footer).textContent = report.lighthouseVersion;
    return footer;
  }

  /**
   * Returns a div with a list of top-level warnings, or an empty div if no warnings.
   * @param {LH.ReportResult} report
   * @return {Node}
   */
  _renderReportWarnings(report) {
    if (!report.runWarnings || report.runWarnings.length === 0) {
      return this._dom.createElement('div');
    }

    const container = this._dom.cloneTemplate('#tmpl-lh-warnings--toplevel', this._templateContext);
    const message = this._dom.find('.lh-warnings__msg', container);
    message.textContent = Util.i18n.strings.toplevelWarningsMessage;

    const warnings = this._dom.find('ul', container);
    for (const warningString of report.runWarnings) {
      const warning = warnings.appendChild(this._dom.createElement('li'));
      warning.textContent = warningString;
    }

    return container;
  }

  /**
   * @param {LH.ReportResult} report
   * @param {CategoryRenderer} categoryRenderer
   * @param {Record<string, CategoryRenderer>} specificCategoryRenderers
   * @return {!DocumentFragment[]}
   */
  _renderScoreGauges(report, categoryRenderer, specificCategoryRenderers) {
    // Group gauges in this order: default, pwa, plugins.
    const defaultGauges = [];
    const customGauges = []; // PWA.
    const pluginGauges = [];

    for (const category of Object.values(report.categories)) {
      const renderer = specificCategoryRenderers[category.id] || categoryRenderer;
      const categoryGauge = renderer.renderScoreGauge(category, report.categoryGroups || {});

      if (Util.isPluginCategory(category.id)) {
        pluginGauges.push(categoryGauge);
      } else if (renderer.renderScoreGauge === categoryRenderer.renderScoreGauge) {
        // The renderer for default categories is just the default CategoryRenderer.
        // If the functions are equal, then renderer is an instance of CategoryRenderer.
        // For example, the PWA category uses PwaCategoryRenderer, which overrides
        // CategoryRenderer.renderScoreGauge, so it would fail this check and be placed
        // in the customGauges bucket.
        defaultGauges.push(categoryGauge);
      } else {
        customGauges.push(categoryGauge);
      }
    }

    return [...defaultGauges, ...customGauges, ...pluginGauges];
  }

  /**
   * @param {LH.ReportResult} report
   * @return {!DocumentFragment}
   */
  _renderReport(report) {
    const i18n = new I18n(report.configSettings.locale, {
      // Set missing renderer strings to default (english) values.
      ...Util.UIStrings,
      ...report.i18n.rendererFormattedStrings,
    });
    Util.i18n = i18n;
    Util.reportJson = report;

    const fullPageScreenshot =
      report.audits['full-page-screenshot'] && report.audits['full-page-screenshot'].details &&
      report.audits['full-page-screenshot'].details.type === 'full-page-screenshot' ?
      report.audits['full-page-screenshot'].details : undefined;
    const detailsRenderer = new DetailsRenderer(this._dom, {
      fullPageScreenshot,
    });
    const fullPageScreenshotStyleEl = fullPageScreenshot &&
      ElementScreenshotRenderer.createBackgroundImageStyle(this._dom, fullPageScreenshot);

    const categoryRenderer = new CategoryRenderer(this._dom, detailsRenderer);
    categoryRenderer.setTemplateContext(this._templateContext);

    /** @type {Record<string, CategoryRenderer>} */
    const specificCategoryRenderers = {
      performance: new PerformanceCategoryRenderer(this._dom, detailsRenderer),
      pwa: new PwaCategoryRenderer(this._dom, detailsRenderer),
    };
    Object.values(specificCategoryRenderers).forEach(renderer => {
      renderer.setTemplateContext(this._templateContext);
    });

    const headerContainer = this._dom.createElement('div');
    headerContainer.appendChild(this._renderReportHeader());

    const reportContainer = this._dom.createElement('div', 'lh-container');
    const reportSection = this._dom.createElement('div', 'lh-report');
    reportSection.appendChild(this._renderReportWarnings(report));

    let scoreHeader;
    const isSoloCategory = Object.keys(report.categories).length === 1;
    if (!isSoloCategory) {
      scoreHeader = this._dom.createElement('div', 'lh-scores-header');
    } else {
      headerContainer.classList.add('lh-header--solo-category');
    }

    if (scoreHeader) {
      const scoreScale = this._dom.cloneTemplate('#tmpl-lh-scorescale', this._templateContext);
      const scoresContainer = this._dom.find('.lh-scores-container', headerContainer);
      scoreHeader.append(
        ...this._renderScoreGauges(report, categoryRenderer, specificCategoryRenderers));
      scoresContainer.appendChild(scoreHeader);
      scoresContainer.appendChild(scoreScale);

      const stickyHeader = this._dom.createElement('div', 'lh-sticky-header');
      stickyHeader.append(
        ...this._renderScoreGauges(report, categoryRenderer, specificCategoryRenderers));
      reportContainer.appendChild(stickyHeader);
    }

    const categories = reportSection.appendChild(this._dom.createElement('div', 'lh-categories'));
    for (const category of Object.values(report.categories)) {
      const renderer = specificCategoryRenderers[category.id] || categoryRenderer;
      // .lh-category-wrapper is full-width and provides horizontal rules between categories.
      // .lh-category within has the max-width: var(--report-width);
      const wrapper = renderer.dom.createChildOf(categories, 'div', 'lh-category-wrapper');
      wrapper.appendChild(renderer.render(category, report.categoryGroups));
    }

    const reportFragment = this._dom.createFragment();
    const topbarDocumentFragment = this._renderReportTopbar(report);

    reportFragment.appendChild(topbarDocumentFragment);
    reportFragment.appendChild(reportContainer);
    reportContainer.appendChild(headerContainer);
    reportContainer.appendChild(reportSection);
    fullPageScreenshotStyleEl && reportContainer.appendChild(fullPageScreenshotStyleEl);
    reportSection.appendChild(this._renderReportFooter(report));

    return reportFragment;
  }
}

if (typeof module !== 'undefined' && module.exports) {
  module.exports = ReportRenderer;
} else {
  self.ReportRenderer = ReportRenderer;
}
;
/**
 * @license Copyright 2020 The Lighthouse Authors. All Rights Reserved.
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
 */
'use strict';

/* globals self, URL */

// Not named `NBSP` because that creates a duplicate identifier (util.js).
const NBSP2 = '\xa0';

class I18n {
  /**
   * @param {LH.Locale} locale
   * @param {LH.I18NRendererStrings=} strings
   */
  constructor(locale, strings) {
    // When testing, use a locale with more exciting numeric formatting.
    if (locale === 'en-XA') locale = 'de';

    this._numberDateLocale = locale;
    this._numberFormatter = new Intl.NumberFormat(locale);
    this._strings = /** @type {LH.I18NRendererStrings} */ (strings || {});
  }

  get strings() {
    return this._strings;
  }

  /**
   * Format number.
   * @param {number} number
   * @param {number=} granularity Number of decimal places to include. Defaults to 0.1.
   * @return {string}
   */
  formatNumber(number, granularity = 0.1) {
    const coarseValue = Math.round(number / granularity) * granularity;
    return this._numberFormatter.format(coarseValue);
  }

  /**
   * @param {number} size
   * @param {number=} granularity Controls how coarse the displayed value is, defaults to 0.1
   * @return {string}
   */
  formatBytesToKiB(size, granularity = 0.1) {
    const kbs = this._numberFormatter.format(Math.round(size / 1024 / granularity) * granularity);
    return `${kbs}${NBSP2}KiB`;
  }

  /**
   * @param {number} size
   * @param {number=} granularity Controls how coarse the displayed value is, defaults to 0.1
   * @return {string}
   */
  formatBytes(size, granularity = 1) {
    const kbs = this._numberFormatter.format(Math.round(size / granularity) * granularity);
    return `${kbs}${NBSP2}bytes`;
  }

  /**
   * @param {number} ms
   * @param {number=} granularity Controls how coarse the displayed value is, defaults to 10
   * @return {string}
   */
  formatMilliseconds(ms, granularity = 10) {
    const coarseTime = Math.round(ms / granularity) * granularity;
    return coarseTime === 0
      ? `${this._numberFormatter.format(0)}${NBSP2}ms`
      : `${this._numberFormatter.format(coarseTime)}${NBSP2}ms`;
  }

  /**
   * @param {number} ms
   * @param {number=} granularity Controls how coarse the displayed value is, defaults to 0.1
   * @return {string}
   */
  formatSeconds(ms, granularity = 0.1) {
    const coarseTime = Math.round(ms / 1000 / granularity) * granularity;
    return `${this._numberFormatter.format(coarseTime)}${NBSP2}s`;
  }

  /**
   * Format time.
   * @param {string} date
   * @return {string}
   */
  formatDateTime(date) {
    /** @type {Intl.DateTimeFormatOptions} */
    const options = {
      month: 'short', day: 'numeric', year: 'numeric',
      hour: 'numeric', minute: 'numeric', timeZoneName: 'short',
    };

    // Force UTC if runtime timezone could not be detected.
    // See https://github.com/GoogleChrome/lighthouse/issues/1056
    // and https://github.com/GoogleChrome/lighthouse/pull/9822
    let formatter;
    try {
      formatter = new Intl.DateTimeFormat(this._numberDateLocale, options);
    } catch (err) {
      options.timeZone = 'UTC';
      formatter = new Intl.DateTimeFormat(this._numberDateLocale, options);
    }

    return formatter.format(new Date(date));
  }

  /**
   * Converts a time in milliseconds into a duration string, i.e. `1d 2h 13m 52s`
   * @param {number} timeInMilliseconds
   * @return {string}
   */
  formatDuration(timeInMilliseconds) {
    let timeInSeconds = timeInMilliseconds / 1000;
    if (Math.round(timeInSeconds) === 0) {
      return 'None';
    }

    /** @type {Array<string>} */
    const parts = [];
    const unitLabels = /** @type {Object<string, number>} */ ({
      d: 60 * 60 * 24,
      h: 60 * 60,
      m: 60,
      s: 1,
    });

    Object.keys(unitLabels).forEach(label => {
      const unit = unitLabels[label];
      const numberOfUnits = Math.floor(timeInSeconds / unit);
      if (numberOfUnits > 0) {
        timeInSeconds -= numberOfUnits * unit;
        parts.push(`${numberOfUnits}\xa0${label}`);
      }
    });

    return parts.join(' ');
  }
}

if (typeof module !== 'undefined' && module.exports) {
  module.exports = I18n;
} else {
  self.I18n = I18n;
}

  //# sourceURL=compiled-reportrenderer.js
  </script>
  <script>window.__LIGHTHOUSE_JSON__ = {"userAgent":"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/86.0.4240.198 Safari/537.36","environment":{"networkUserAgent":"Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4143.7 Mobile Safari/537.36 Chrome-Lighthouse","hostUserAgent":"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/86.0.4240.198 Safari/537.36","benchmarkIndex":665.5,"credits":{"axe-core":"3.5.5"}},"lighthouseVersion":"6.4.1","fetchTime":"2020-11-17T02:26:23.904Z","requestedUrl":"https://www.pinayu.com/","finalUrl":"https://www.pinayu.com/","runWarnings":[],"audits":{"is-on-https":{"id":"is-on-https","title":"Uses HTTPS","description":"All sites should be protected with HTTPS, even ones that don't handle sensitive data. This includes avoiding [mixed content](https://developers.google.com/web/fundamentals/security/prevent-mixed-content/what-is-mixed-content), where some resources are loaded over HTTP despite the initial request being served over HTTPS. HTTPS prevents intruders from tampering with or passively listening in on the communications between your app and your users, and is a prerequisite for HTTP/2 and many new web platform APIs. [Learn more](https://web.dev/is-on-https/).","score":1,"scoreDisplayMode":"binary","details":{"type":"table","headings":[],"items":[]}},"redirects-http":{"id":"redirects-http","title":"Does not redirect HTTP traffic to HTTPS","description":"If you've already set up HTTPS, make sure that you redirect all HTTP traffic to HTTPS in order to enable secure web features for all your users. [Learn more](https://web.dev/redirects-http/).","score":0,"scoreDisplayMode":"binary"},"service-worker":{"id":"service-worker","title":"Does not register a service worker that controls page and `start_url`","description":"The service worker is the technology that enables your app to use many Progressive Web App features, such as offline, add to homescreen, and push notifications. [Learn more](https://web.dev/service-worker/).","score":0,"scoreDisplayMode":"binary"},"works-offline":{"id":"works-offline","title":"Current page does not respond with a 200 when offline","description":"If you're building a Progressive Web App, consider using a service worker so that your app can work offline. [Learn more](https://web.dev/works-offline/).","score":0,"scoreDisplayMode":"binary","warnings":[]},"viewport":{"id":"viewport","title":"Has a `\u003cmeta name=\"viewport\">` tag with `width` or `initial-scale`","description":"Add a `\u003cmeta name=\"viewport\">` tag to optimize your app for mobile screens. [Learn more](https://web.dev/viewport/).","score":1,"scoreDisplayMode":"binary","warnings":[]},"without-javascript":{"id":"without-javascript","title":"Contains some content when JavaScript is not available","description":"Your app should display some content when JavaScript is disabled, even if it's just a warning to the user that JavaScript is required to use the app. [Learn more](https://web.dev/without-javascript/).","score":1,"scoreDisplayMode":"binary"},"first-contentful-paint":{"id":"first-contentful-paint","title":"First Contentful Paint","description":"First Contentful Paint marks the time at which the first text or image is painted. [Learn more](https://web.dev/first-contentful-paint/).","score":0.18,"scoreDisplayMode":"numeric","numericValue":5869.22,"numericUnit":"millisecond","displayValue":"5.9 s"},"largest-contentful-paint":{"id":"largest-contentful-paint","title":"Largest Contentful Paint","description":"Largest Contentful Paint marks the time at which the largest text or image is painted. [Learn More](https://web.dev/lighthouse-largest-contentful-paint/)","score":0.04,"scoreDisplayMode":"numeric","numericValue":7522.720000000001,"numericUnit":"millisecond","displayValue":"7.5 s"},"first-meaningful-paint":{"id":"first-meaningful-paint","title":"First Meaningful Paint","description":"First Meaningful Paint measures when the primary content of a page is visible. [Learn more](https://web.dev/first-meaningful-paint/).","score":0.16,"scoreDisplayMode":"numeric","numericValue":6058.72,"numericUnit":"millisecond","displayValue":"6.1 s"},"load-fast-enough-for-pwa":{"id":"load-fast-enough-for-pwa","title":"Page load is not fast enough on mobile networks","description":"A fast page load over a cellular network ensures a good mobile user experience. [Learn more](https://web.dev/load-fast-enough-for-pwa/).","score":0,"scoreDisplayMode":"binary","numericValue":10364.720000000001,"numericUnit":"millisecond","displayValue":"Interactive at 10.4 s","explanation":"Your page loads too slowly and is not interactive within 10 seconds. Look at the opportunities and diagnostics in the \"Performance\" section to learn how to improve."},"speed-index":{"id":"speed-index","title":"Speed Index","description":"Speed Index shows how quickly the contents of a page are visibly populated. [Learn more](https://web.dev/speed-index/).","score":0.05,"scoreDisplayMode":"numeric","numericValue":11505.293529493601,"numericUnit":"millisecond","displayValue":"11.5 s"},"screenshot-thumbnails":{"id":"screenshot-thumbnails","title":"Screenshot Thumbnails","description":"This is what the load of your site looked like.","score":null,"scoreDisplayMode":"informative","details":{"type":"filmstrip","scale":5586,"items":[{"timing":559,"timestamp":1188598342441,"data":"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRQBAwQEBQQFCQUFCRQNCw0UFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFP/AABEIANUAeAMBEQACEQEDEQH/xAGiAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgsQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+gEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoLEQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2gAMAwEAAhEDEQA/AP1ToAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgD//Z"},{"timing":1117,"timestamp":1188598901041.0002,"data":"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRQBAwQEBQQFCQUFCRQNCw0UFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFP/AABEIANUAeAMBEQACEQEDEQH/xAGiAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgsQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+gEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoLEQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2gAMAwEAAhEDEQA/AP1ToAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgD//Z"},{"timing":1676,"timestamp":1188599459641,"data":"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRQBAwQEBQQFCQUFCRQNCw0UFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFP/AABEIANUAeAMBEQACEQEDEQH/xAGiAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgsQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+gEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoLEQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2gAMAwEAAhEDEQA/AP1ToAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgD//Z"},{"timing":2234,"timestamp":1188600018241.0002,"data":"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRQBAwQEBQQFCQUFCRQNCw0UFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFP/AABEIANUAeAMBEQACEQEDEQH/xAGiAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgsQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+gEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoLEQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2gAMAwEAAhEDEQA/AP1ToAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgD//Z"},{"timing":2793,"timestamp":1188600576841,"data":"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRQBAwQEBQQFCQUFCRQNCw0UFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFP/AABEIANUAeAMBEQACEQEDEQH/xAGiAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgsQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+gEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoLEQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2gAMAwEAAhEDEQA/AP1ToAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgD//Z"},{"timing":3352,"timestamp":1188601135441,"data":"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRQBAwQEBQQFCQUFCRQNCw0UFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFP/AABEIANUAeAMBEQACEQEDEQH/xAGiAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgsQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+gEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoLEQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2gAMAwEAAhEDEQA/AP1ToAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgD//Z"},{"timing":3910,"timestamp":1188601694041.0002,"data":"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRQBAwQEBQQFCQUFCRQNCw0UFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFP/AABEIANUAeAMBEQACEQEDEQH/xAGiAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgsQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+gEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoLEQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2gAMAwEAAhEDEQA/AP1ToAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKAKt/qFvpltJc3U8dtbxKXkllcIiKASSSSAAACc07X2E3bd2OV1b4v+EtDu2tr3XbSK4S5Fo8W/LJIQD82OigHlj8q4IJBGK3jQqTV0jhq4/DUXapUSd+Xfr+hnJ+0B4Ae2M48T2axrGZT5paNgASOVYAgkjhSAWyMZyKr6vV7HJDOMvnBVI14tNNrXWy0enq/1N8eP9GfXNJ02LULeaTVY7prSSOZGSZrdkWWNTnLONzHAzgRyZxisnTkk21tueh9Yp+0p0ubWSbXZpW/HVDvA/jiy8dWF7cWayRPZXs+n3MEww0U0TlSPQgjaw9mGcHIBUpunKzFhsTDFQ9pB+R0lZHWFABQAUAFABQAUAIzBRkkAe9ABuA7ijzAw/F/i/RfBWkTanrmpW+m2UY5knbG44J2qByzEA4UAk4PFaU4SqPlirnNiMRRw0OevK0fz9O5+dPxc+OfiH4r65PcXNxJpumbTbw2FnK6L5O4OA5z8zbgCSMDhQQdoNfVYehGhHXc/GMyzKrjqzn9nWK9NzzKJYLFVgjVIIzlhHGoVcgcnA78Cuw8b3p+8SRXCyA7Sc9CPYjP8iPzpice5JaSyadbwW9m5s7eKdrlIYGZFWRgoLqAQA5EaAtjOEX0rNwjqzZV5pKMpaLVep2XgS+8Y+I/HFvZ+GdVvbPxFrM/ltdQ3htjIzHdJJLIOSPlLt94nBIBbAPPVhShTvNXiuh6eBq4zE4tRoVLSlpf/M9Wm/aG+IHwg1C802PxPp/jqxtbqfTJJ72CUtBdwkefE24pLuVnTBJZGjaNkPJx51Ojh8Yn7OPK0fUYjHZhkdSEK9T2kZfmrafie9fDL9rfwb43t4YdVuI/C+qsSDb30v7k8ZBE5AUDH97bzwM8Z4a2Cq0n3PocHxFgsUkqk1CXZ/57fie4Wt5b31vHPbTx3EEihkkicMrA8ggjgiuBxcXZo+mjKM4qUXdMmpFBQAUAFAGf4gtLy/0W9t9OvBp2oSQutteNCJhBKVOyQoSA4VsHaTzjFGl1cmSbTSdmfIuvfE/9ofw/BdaVL4fu7jULc4OpWWj/AGhXGMgoUVkbI9FJB4IByB7EaeEl7zl8j4erj88py9m6Kb6NW/z0+ZzHi39nj4veNtAm8WeKtTiupLW3ub1dNv7uRriJTl2SKNUaOMuETCBhjCggYwOili6FF8tKO/U4MVkuZY6DrYuqrraP/B2Pm6NYLyMSRNxMPllXMbEeoPXoMgjgjkZBr2FaSuj4JxdNuNthxgWYwSF1lKjhlGFcEYPGTx3HJ+tC11J5km0hyiKAogKqcBQCfwH86rToP3papFe41NLW4gjkG2ORl/fEnYqknLE4zxjoAc8evETny2OmjQVZXT9PU04ri70jVIvJe60/UIkjuYpU3QyIGUSRyI/BB27HDKeAykHkVnzRrJwew1Gpg5xrLSUfVW+XW5o+J/GeveNL0Xmv6ze6vcKNiNdSlgg4XCL0UfKMgAZOSckk1VKlGj8KLxePxOYSjUxDvbbSxP4I+H+t/EvxDa6HoVo9xdXJ5l+ZY4E4Bldx9xRuXLdeQACxAqa9aFKF5BgsHWxlZUqS+dtEfpv4A8E2Xw98J6doGnoPs9nGFMnQyP1ZyOcZOTjt0HAFfHzm5ycmfuOGoRw1NUobI6SoOkKACgAoAa5CrknAHc0AVWv7OPG66hA95BQLU8m/aa+Ilz4O+E+pz6Lumu7wiwN1bOc2ayAqZcqQVIOFVgRh2Q84wezCU41aqU3ojwc6xVXCYVyoxu3p6eZ+depaHcar4dum086jJqlvJvkjtLUSxLbBDvkeTOVIYoMBccjLDIB+krTcJJJrlPy7DYeFejKpyuVS+3T101v8rHof7N3wu8OfFPRtQm8SDxJDJZyqgv8AT7y3WC4Yjc0YRoMgqChbDH74PGRnzcTialL4GfVZXluGxjf1ii04+b/yPpbSPgj8FtJitRL4QuL+S3KM019dSSiYrzmSPzBGwJAyu3aeQRjivNljK8lrI+phkeX05qcaX4v8r2Pjv4xaBpo+IHibSNOgv9GtLK+LWkU5O8IT8hUsNrAg/Lu38FGOeGP0GHmqlGKm9T8vzOj9Qxs1ShaEnon1028j7Z8DeGtE8ZfB7QtK+Kmk2U2rRW6rGiQfZbm2txITCgMARocKqjYpX5cBhksK+eqVHTqy9lJ2P0/DYRY3CQeYQUp9dLPy2tYsR/Az4IGQn+wFznjdeXePy8zFX9dxG3MZS4dyuT5vY/jL/M9S+Hfhbwj4R0ldO8J2lrZ2qksywsWkc/3ndiXc9ssSeAK5p1Z1Hebuezh8LRwkPZ0I8q/rvqdjWR1BQAUAFABQA10DqVYBgeoIyKAKT6Fp0hJaygJP+wKAIZPC+lyIymxhwwIOFoC7Wxz8vwn0YzXEsBltnuJPMk8vHztgDJ4yTgAZPNDs3cFotl9xVf4T25zsv5R/vIDQHSwi/CaD+K/lP0QCkBYHwi0SVomuw948LeZEZQp8t8Eb14yDhiMjsSO9Um1swfvO8kmyeb4XaTI2UkuIvZXBH6il5Br1Ih8KdNzzdXRH1X/CgDb0Twfp2gS+bbI5m27fMkbJxQBt0AFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQAUAFABQB/9k="},{"timing":4469,"timestamp":1188602252641,"data":"data:image/jpeg;base64,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"},{"timing":5027,"timestamp":1188602811241.0002,"data":"data:image/jpeg;base64,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"},{"timing":5586,"timestamp":1188603369841,"data":"data:image/jpeg;base64,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"}]}},"final-screenshot":{"id":"final-screenshot","title":"Final Screenshot","description":"The last screenshot captured of the pageload.","score":null,"scoreDisplayMode":"informative","details":{"type":"screenshot","timing":5587,"timestamp":1188603370629,"data":"data:image/jpeg;base64,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gCIiAIiICO68ppquxMhpow+Q1dMcOjL24EzCSWjmAMk+i0Hc11sZePzRhqZZ4I80cToou7/6wYDjk5IdjfYcuasFFnGey2NM6VKXFvz/AP36lZy3C9Nt1NMaitklgdM11O2J8b5QJPA5riwhx4cYa4AHOSRzWTZobmKiSKGe4NMctdO6N4Ia54mzE0kj4pBzgHdWGiydnLoYLHe+7kVxR1l7Zaah81RUSukEDXACQOie53jcSY9hjmGg46YzlZWmJ7xV3qhirZ6wU0MdUXkxlokIkYI+IkAnwuJHU496nqI7E+x6qGmvaILcp767V08cdQ6CmjngFO0se5kkZDe8yAwgkniGSRw4B9/yopZx2ZsgMMglD2ksMRcQO/BOW8yMb+5TtF54nTkPA67vrv8AMrJ0FbHJUyWum754qmTQvZTOgjc/uJBjgPkQ3LuvEPJdorLuAxkNVc30L2UxqpnwkSRPc494GeHPLGcA8PTCshY9fRU9wpjT1cQkiJDsZIwQcggjcEEZyF74ifVGP5dr3WaXQ1XPV2uqdUTzT93WTxMfKMO4GvIbkYHQKRLooaOnoKZtPSRiOFpJDQSdyckknckkk5K71rk03ujfXFxikwiIvDMIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAi66meKlgfNUPbHEwZc53IBaD+UNV3PtnwVP8ABuf0vEOPh+Vwc8fevVFvoa52xhykSNF1008VVAyane2SJ4y1zeRC7F4bE9+aCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgC66meOmgkmncGRRguc49Auxa+/wBC+42ippYnBskjRwk8sggjPpsvV15mM21FuPU1lNBLqCoZV1rHxW2NwdBTu2Mp+W/08gth8O2v2z2T2yLv+Lg4c9fLPLPosCV14uUcdIaU2+M7Tz961xI8mY8/M4wtl8DUHwX8H+zM9kxjg/bnz9Vk9u5Hhx9Yfq33/v8AdzWVMM2n531dDG+W3SOLp6du5jPy2enmFv6aeOpgjmgcHxSAOa4dQtDE68W2OSkFKbjGNoJ+9a0geT8+XmM5WysFC+3WimpZXB0jAeIjlkkk49N0l03Pam1LZLZfs/Q2CIiwJIREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQH//2Q=="}},"estimated-input-latency":{"id":"estimated-input-latency","title":"Estimated Input Latency","description":"Estimated Input Latency is an estimate of how long your app takes to respond to user input, in milliseconds, during the busiest 5s window of page load. If your latency is higher than 50 ms, users may perceive your app as laggy. [Learn more](https://web.dev/estimated-input-latency/).","score":0,"scoreDisplayMode":"numeric","numericValue":1353.2000000000005,"numericUnit":"millisecond","displayValue":"1,350 ms"},"total-blocking-time":{"id":"total-blocking-time","title":"Total Blocking Time","description":"Sum of all time periods between FCP and Time to Interactive, when task length exceeded 50ms, expressed in milliseconds. [Learn more](https://web.dev/lighthouse-total-blocking-time/).","score":0,"scoreDisplayMode":"numeric","numericValue":2987.000000000001,"numericUnit":"millisecond","displayValue":"2,990 ms"},"max-potential-fid":{"id":"max-potential-fid","title":"Max Potential First Input Delay","description":"The maximum potential First Input Delay that your users could experience is the duration of the longest task. [Learn more](https://web.dev/lighthouse-max-potential-fid/).","score":0,"scoreDisplayMode":"numeric","numericValue":2175.5000000000005,"numericUnit":"millisecond","displayValue":"2,180 ms"},"cumulative-layout-shift":{"id":"cumulative-layout-shift","title":"Cumulative Layout Shift","description":"Cumulative Layout Shift measures the movement of visible elements within the viewport. [Learn more](https://web.dev/cls/).","score":0.32,"scoreDisplayMode":"numeric","numericValue":0.3479838434855143,"numericUnit":"unitless","displayValue":"0.348","details":{"type":"debugdata","items":[{"finalLayoutShiftTraceEventFound":true}]}},"errors-in-console":{"id":"errors-in-console","title":"No browser errors logged to the console","description":"Errors logged to the console indicate unresolved problems. They can come from network request failures and other browser concerns. [Learn more](https://web.dev/errors-in-console/)","score":1,"scoreDisplayMode":"binary","details":{"type":"table","headings":[],"items":[]}},"server-response-time":{"id":"server-response-time","title":"Initial server response time was short","description":"Keep the server response time for the main document short because all other requests depend on it. [Learn more](https://web.dev/time-to-first-byte/).","score":1,"scoreDisplayMode":"binary","numericValue":116.50400000000002,"numericUnit":"millisecond","displayValue":"Root document took 120 ms","details":{"type":"opportunity","headings":[{"key":"url","valueType":"url","label":"URL"},{"key":"responseTime","valueType":"timespanMs","label":"Time Spent"}],"items":[{"url":"https://www.pinayu.com/","responseTime":116.50400000000002}],"overallSavingsMs":16.50400000000002}},"first-cpu-idle":{"id":"first-cpu-idle","title":"First CPU Idle","description":"First CPU Idle marks the first time at which the page's main thread is quiet enough to handle input.  [Learn more](https://web.dev/first-cpu-idle/).","score":0.18,"scoreDisplayMode":"numeric","numericValue":9900.22,"numericUnit":"millisecond","displayValue":"9.9 s"},"interactive":{"id":"interactive","title":"Time to Interactive","description":"Time to interactive is the amount of time it takes for the page to become fully interactive. [Learn more](https://web.dev/interactive/).","score":0.25,"scoreDisplayMode":"numeric","numericValue":10364.720000000001,"numericUnit":"millisecond","displayValue":"10.4 s"},"user-timings":{"id":"user-timings","title":"User Timing marks and measures","description":"Consider instrumenting your app with the User Timing API to measure your app's real-world performance during key user experiences. [Learn more](https://web.dev/user-timings/).","score":null,"scoreDisplayMode":"notApplicable","details":{"type":"table","headings":[],"items":[]}},"critical-request-chains":{"id":"critical-request-chains","title":"Avoid chaining critical requests","description":"The Critical Request Chains below show you what resources are loaded with a high priority. Consider reducing the length of chains, reducing the download size of resources, or deferring the download of unnecessary resources to improve page load. [Learn more](https://web.dev/critical-request-chains/).","score":null,"scoreDisplayMode":"informative","displayValue":"4 chains found","details":{"type":"criticalrequestchain","chains":{"0BF61C152BAE456024ADA14BA4F56B91":{"request":{"url":"https://www.pinayu.com/","startTime":1188597.851471,"endTime":1188598.36065,"responseReceivedTime":1188598.354197,"transferSize":7933},"children":{"676631.2":{"request":{"url":"https://fonts.googleapis.com/css2?family=Lobster&display=swap","startTime":1188598.648309,"endTime":1188598.772843,"responseReceivedTime":1188598.732724,"transferSize":956},"children":{"676631.99":{"request":{"url":"https://fonts.gstatic.com/s/lobster/v23/neILzCirqoswsqX9zoKmM4MwWJU.woff2","startTime":1188601.454669,"endTime":1188601.523558,"responseReceivedTime":1188601.522905,"transferSize":16855}}}},"676631.3":{"request":{"url":"https://www.pinayu.com/newstyle.css?ver=101","startTime":1188598.650386,"endTime":1188598.708388,"responseReceivedTime":1188598.706132,"transferSize":16827}},"676631.4":{"request":{"url":"https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js","startTime":1188598.656175,"endTime":1188598.818495,"responseReceivedTime":1188598.804394,"transferSize":30472}},"676631.5":{"request":{"url":"https://www.pinayu.com/functions.js?ver=101","startTime":1188598.660044,"endTime":1188598.723739,"responseReceivedTime":1188598.715949,"transferSize":6992}}}}},"longestChain":{"duration":3672.0870002172887,"length":3,"transferSize":16855}}},"redirects":{"id":"redirects","title":"Avoid multiple page redirects","description":"Redirects introduce additional delays before the page can be loaded. [Learn more](https://web.dev/redirects/).","score":1,"scoreDisplayMode":"numeric","numericValue":0,"numericUnit":"millisecond","displayValue":"","details":{"type":"opportunity","headings":[],"items":[],"overallSavingsMs":0}},"installable-manifest":{"id":"installable-manifest","title":"Web app manifest does not meet the installability requirements","description":"Browsers can proactively prompt users to add your app to their homescreen, which can lead to higher engagement. [Learn more](https://web.dev/installable-manifest/).","score":0,"scoreDisplayMode":"binary","explanation":"Failures: No manifest was fetched.","details":{"type":"debugdata","items":[{"failures":["No manifest was fetched"],"manifestUrl":null,"isParseFailure":true,"parseFailureReason":"No manifest was fetched"}]}},"apple-touch-icon":{"id":"apple-touch-icon","title":"Does not provide a valid `apple-touch-icon`","description":"For ideal appearance on iOS when users add a progressive web app to the home screen, define an `apple-touch-icon`. It must point to a non-transparent 192px (or 180px) square PNG. [Learn More](https://web.dev/apple-touch-icon/).","score":0,"scoreDisplayMode":"binary","warnings":[]},"splash-screen":{"id":"splash-screen","title":"Is not configured for a custom splash screen","description":"A themed splash screen ensures a high-quality experience when users launch your app from their homescreens. [Learn more](https://web.dev/splash-screen/).","score":0,"scoreDisplayMode":"binary","explanation":"Failures: No manifest was fetched.","details":{"type":"debugdata","items":[{"failures":["No manifest was fetched"],"isParseFailure":true,"parseFailureReason":"No manifest was fetched"}]}},"themed-omnibox":{"id":"themed-omnibox","title":"Does not set a theme color for the address bar.","description":"The browser address bar can be themed to match your site. [Learn more](https://web.dev/themed-omnibox/).","score":0,"scoreDisplayMode":"binary","explanation":"Failures: No manifest was fetched,\nNo `\u003cmeta name=\"theme-color\">` tag found.","details":{"type":"debugdata","items":[{"failures":["No manifest was fetched","No `\u003cmeta name=\"theme-color\">` tag found"],"themeColor":null,"isParseFailure":true,"parseFailureReason":"No manifest was fetched"}]}},"maskable-icon":{"id":"maskable-icon","title":"Manifest doesn't have a maskable icon","description":"A maskable icon ensures that the image fills the entire shape without being letterboxed when installing the app on a device. [Learn more](https://web.dev/maskable-icon-audit/).","score":0,"scoreDisplayMode":"binary","explanation":"No manifest was fetched"},"content-width":{"id":"content-width","title":"Content is sized correctly for the viewport","description":"If the width of your app's content doesn't match the width of the viewport, your app might not be optimized for mobile screens. [Learn more](https://web.dev/content-width/).","score":1,"scoreDisplayMode":"binary"},"image-aspect-ratio":{"id":"image-aspect-ratio","title":"Displays images with correct aspect ratio","description":"Image display dimensions should match natural aspect ratio. [Learn more](https://web.dev/image-aspect-ratio/).","score":1,"scoreDisplayMode":"binary","warnings":[],"details":{"type":"table","headings":[],"items":[]}},"image-size-responsive":{"id":"image-size-responsive","title":"Serves images with appropriate resolution","description":"Image natural dimensions should be proportional to the display size and the pixel ratio to maximize image clarity. [Learn more](https://web.dev/serve-responsive-images/).","score":1,"scoreDisplayMode":"binary","details":{"type":"table","headings":[],"items":[]}},"preload-fonts":{"id":"preload-fonts","title":"Fonts with `font-display: optional` are preloaded","description":"Preload `optional` fonts so first-time visitors may use them. [Learn More](https://web.dev/preload-optional-fonts/)","score":null,"scoreDisplayMode":"notApplicable","details":{"type":"table","headings":[],"items":[]}},"deprecations":{"id":"deprecations","title":"Avoids deprecated APIs","description":"Deprecated APIs will eventually be removed from the browser. [Learn more](https://web.dev/deprecations/).","score":1,"scoreDisplayMode":"binary","details":{"type":"table","headings":[],"items":[]}},"mainthread-work-breakdown":{"id":"mainthread-work-breakdown","title":"Minimize main-thread work","description":"Consider reducing the time spent parsing, compiling and executing JS. You may find delivering smaller JS payloads helps with this. [Learn more](https://web.dev/mainthread-work-breakdown/)","score":0.01,"scoreDisplayMode":"numeric","numericValue":14923.863999999974,"numericUnit":"millisecond","displayValue":"14.9 s","details":{"type":"table","headings":[{"key":"groupLabel","itemType":"text","text":"Category"},{"key":"duration","itemType":"ms","granularity":1,"text":"Time Spent"}],"items":[{"group":"other","groupLabel":"Other","duration":5754.251999999985},{"group":"styleLayout","groupLabel":"Style & Layout","duration":3905.712000000001},{"group":"scriptEvaluation","groupLabel":"Script Evaluation","duration":3029.0759999999914},{"group":"paintCompositeRender","groupLabel":"Rendering","duration":1093.0919999999983},{"group":"parseHTML","groupLabel":"Parse HTML & CSS","duration":955.5039999999992},{"group":"scriptParseCompile","groupLabel":"Script Parsing & Compilation","duration":186.22799999999998}]}},"bootup-time":{"id":"bootup-time","title":"Reduce JavaScript execution time","description":"Consider reducing the time spent parsing, compiling, and executing JS. You may find delivering smaller JS payloads helps with this. [Learn more](https://web.dev/bootup-time/).","score":0.54,"scoreDisplayMode":"numeric","numericValue":3212.823999999997,"numericUnit":"millisecond","displayValue":"3.2 s","details":{"type":"table","headings":[{"key":"url","itemType":"url","text":"URL"},{"key":"total","granularity":1,"itemType":"ms","text":"Total CPU Time"},{"key":"scripting","granularity":1,"itemType":"ms","text":"Script Evaluation"},{"key":"scriptParseCompile","granularity":1,"itemType":"ms","text":"Script Parse"}],"items":[{"url":"https://www.pinayu.com/","total":8434.839999999998,"scripting":1690.4959999999992,"scriptParseCompile":48.73600000000001},{"url":"Unattributable","total":4513.779999999995,"scripting":35.408,"scriptParseCompile":1.1680000000000001},{"url":"https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js","total":1035.6119999999974,"scripting":736.6279999999975,"scriptParseCompile":20.06},{"url":"https://www.google-analytics.com/analytics.js","total":787.2319999999999,"scripting":566.3759999999999,"scriptParseCompile":113.952},{"url":"https://www.pinayu.com/newstyle.css?ver=101","total":117.016,"scripting":0,"scriptParseCompile":0}],"summary":{"wastedMs":3212.823999999997}}},"uses-rel-preload":{"id":"uses-rel-preload","title":"Preload key requests","description":"Consider using `\u003clink rel=preload>` to prioritize fetching resources that are currently requested later in page load. [Learn more](https://web.dev/uses-rel-preload/).","score":1,"scoreDisplayMode":"numeric","numericValue":0,"numericUnit":"millisecond","displayValue":"","details":{"type":"opportunity","headings":[],"items":[],"overallSavingsMs":0}},"uses-rel-preconnect":{"id":"uses-rel-preconnect","title":"Preconnect to required origins","description":"Consider adding `preconnect` or `dns-prefetch` resource hints to establish early connections to important third-party origins. [Learn more](https://web.dev/uses-rel-preconnect/).","score":0.75,"scoreDisplayMode":"numeric","numericValue":304.76800000000003,"numericUnit":"millisecond","displayValue":"Potential savings of 300 ms","warnings":[],"details":{"type":"opportunity","headings":[{"key":"url","valueType":"url","label":"URL"},{"key":"wastedMs","valueType":"timespanMs","label":"Potential Savings"}],"items":[{"url":"https://fonts.gstatic.com","wastedMs":304.76800000000003},{"url":"https://www.google-analytics.com","wastedMs":301.512}],"overallSavingsMs":304.76800000000003}},"font-display":{"id":"font-display","title":"All text remains visible during webfont loads","description":"Leverage the font-display CSS feature to ensure text is user-visible while webfonts are loading. [Learn more](https://web.dev/font-display/).","score":1,"scoreDisplayMode":"binary","warnings":[],"details":{"type":"table","headings":[],"items":[]}},"diagnostics":{"id":"diagnostics","title":"Diagnostics","description":"Collection of useful page vitals.","score":null,"scoreDisplayMode":"informative","details":{"type":"debugdata","items":[{"numRequests":47,"numScripts":3,"numStylesheets":2,"numFonts":1,"numTasks":814,"numTasksOver10ms":43,"numTasksOver25ms":23,"numTasksOver50ms":13,"numTasksOver100ms":7,"numTasksOver500ms":2,"rtt":12.823999999999998,"throughput":66238213.676797874,"maxRtt":31.71799999999999,"maxServerLatency":26.648000000000007,"totalByteWeight":3442549,"totalTaskTime":3730.965999999993,"mainDocumentTransferSize":7933}]}},"network-requests":{"id":"network-requests","title":"Network Requests","description":"Lists the network requests that were made during page load.","score":null,"scoreDisplayMode":"informative","details":{"type":"table","headings":[{"key":"url","itemType":"url","text":"URL"},{"key":"protocol","itemType":"text","text":"Protocol"},{"key":"startTime","itemType":"ms","granularity":1,"text":"Start Time"},{"key":"endTime","itemType":"ms","granularity":1,"text":"End Time"},{"key":"transferSize","itemType":"bytes","displayUnit":"kb","granularity":1,"text":"Transfer Size"},{"key":"resourceSize","itemType":"bytes","displayUnit":"kb","granularity":1,"text":"Resource Size"},{"key":"statusCode","itemType":"text","text":"Status Code"},{"key":"mimeType","itemType":"text","text":"MIME Type"},{"key":"resourceType","itemType":"text","text":"Resource Type"}],"items":[{"url":"https://www.pinayu.com/","protocol":"h2","startTime":0,"endTime":509.17900004424155,"finished":true,"transferSize":7933,"resourceSize":25105,"statusCode":200,"mimeType":"text/html","resourceType":"Document"},{"url":"https://fonts.googleapis.com/css2?family=Lobster&display=swap","protocol":"h2","startTime":796.838000183925,"endTime":921.3720001280308,"finished":true,"transferSize":956,"resourceSize":1693,"statusCode":200,"mimeType":"text/css","resourceType":"Stylesheet"},{"url":"https://www.pinayu.com/newstyle.css?ver=101","protocol":"h2","startTime":798.915000166744,"endTime":856.9170001428574,"finished":true,"transferSize":16827,"resourceSize":16654,"statusCode":200,"mimeType":"text/css","resourceType":"Stylesheet"},{"url":"https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js","protocol":"h2","startTime":804.7040000092238,"endTime":967.0240001287311,"finished":true,"transferSize":30472,"resourceSize":85578,"statusCode":200,"mimeType":"text/javascript","resourceType":"Script"},{"url":"https://www.pinayu.com/functions.js?ver=101","protocol":"h2","startTime":808.5730001330376,"endTime":872.268000151962,"finished":true,"transferSize":6992,"resourceSize":6827,"statusCode":200,"mimeType":"application/javascript","resourceType":"Script"},{"url":"https://www.pinayu.com/newimages/logo.svg","protocol":"h2","startTime":983.3880001679063,"endTime":1030.862000072375,"finished":true,"transferSize":3608,"resourceSize":3449,"statusCode":200,"mimeType":"image/svg+xml","resourceType":"Image"},{"url":"https://www.pinayu.com/newimages/menu-puntos.svg","protocol":"h2","startTime":997.0200001262128,"endTime":1039.8290001321584,"finished":true,"transferSize":733,"resourceSize":584,"statusCode":200,"mimeType":"image/svg+xml","resourceType":"Image"},{"url":"https://www.pinayu.com/newimages/pinayu-david-foto.jpg","protocol":"h2","startTime":1137.2470001224428,"endTime":1289.858000120148,"finished":true,"transferSize":202856,"resourceSize":202481,"statusCode":200,"mimeType":"image/jpeg","resourceType":"Image"},{"url":"https://www.pinayu.com/newimages/ilustracion.svg","protocol":"h2","startTime":1139.8990000598133,"endTime":1267.623000079766,"finished":true,"transferSize":1289,"resourceSize":1139,"statusCode":200,"mimeType":"image/svg+xml","resourceType":"Image"},{"url":"https://www.pinayu.com/newimages/diseno-grafico.svg","protocol":"h2","startTime":1146.2500002235174,"endTime":1268.8720000442117,"finished":true,"transferSize":2707,"resourceSize":2548,"statusCode":200,"mimeType":"image/svg+xml","resourceType":"Image"},{"url":"https://www.pinayu.com/newimages/fotografia.svg","protocol":"h2","startTime":1147.5910001900047,"endTime":1270.4930000472814,"finished":true,"transferSize":3537,"resourceSize":3378,"statusCode":200,"mimeType":"image/svg+xml","resourceType":"Image"},{"url":"https://www.pinayu.com/newimages/video-animacion.svg","protocol":"h2","startTime":1154.7170002013445,"endTime":1272.817000048235,"finished":true,"transferSize":981,"resourceSize":832,"statusCode":200,"mimeType":"image/svg+xml","resourceType":"Image"},{"url":"https://www.pinayu.com/proyectos/1/trampolin-atardecer-pareja.jpg","protocol":"h2","startTime":1155.2870001178235,"endTime":1285.1480001118034,"finished":true,"transferSize":46762,"resourceSize":46559,"statusCode":200,"mimeType":"image/jpeg","resourceType":"Image"},{"url":"https://www.pinayu.com/proyectos/4/animal-principal.jpg","protocol":"h2","startTime":1155.7880002073944,"endTime":1312.7020001411438,"finished":true,"transferSize":123192,"resourceSize":122898,"statusCode":200,"mimeType":"image/jpeg","resourceType":"Image"},{"url":"https://www.pinayu.com/proyectos/9/lapu-lapu-logo-propuesta-favorita.jpg","protocol":"h2","startTime":1158.2770000677556,"endTime":1294.6390002034605,"finished":true,"transferSize":61253,"resourceSize":61032,"statusCode":200,"mimeType":"image/jpeg","resourceType":"Image"},{"url":"https://www.pinayu.com/proyectos/19/zorro-corto-animado-sin-palabras.jpg","protocol":"h2","startTime":1161.2410000525415,"endTime":1367.2450000885874,"finished":true,"transferSize":112244,"resourceSize":111968,"statusCode":200,"mimeType":"image/jpeg","resourceType":"Image"},{"url":"https://www.pinayu.com/proyectos/6/raxia-consulting-logotipo.jpg","protocol":"h2","startTime":1162.0180001482368,"endTime":1332.1310000028461,"finished":true,"transferSize":29162,"resourceSize":28978,"statusCode":200,"mimeType":"image/jpeg","resourceType":"Image"},{"url":"https://www.pinayu.com/proyectos/11/des-papiers-caches-sous-les-ailes.jpg","protocol":"h2","startTime":1164.0490000136197,"endTime":1358.6280001327395,"finished":true,"transferSize":110318,"resourceSize":110042,"statusCode":200,"mimeType":"image/jpeg","resourceType":"Image"},{"url":"https://www.pinayu.com/proyectos/14/macro-fotografia-hoja-en-espiral.jpg","protocol":"h2","startTime":1165.1860000565648,"endTime":1365.7310002017766,"finished":true,"transferSize":156505,"resourceSize":156175,"statusCode":200,"mimeType":"image/jpeg","resourceType":"Image"},{"url":"https://www.pinayu.com/proyectos/20/snowboard-animacion.jpg","protocol":"h2","startTime":1167.0970001723617,"endTime":1354.0690001100302,"finished":true,"transferSize":87902,"resourceSize":87653,"statusCode":200,"mimeType":"image/jpeg","resourceType":"Image"},{"url":"https://www.pinayu.com/proyectos/3/diorama-pinayu-principal.jpg","protocol":"h2","startTime":1168.8350001350045,"endTime":1462.9480000585318,"finished":true,"transferSize":146740,"resourceSize":146427,"statusCode":200,"mimeType":"image/jpeg","resourceType":"Image"},{"url":"https://www.pinayu.com/proyectos/8/zyp-propuesta-logotipo.jpg","protocol":"h2","startTime":1169.4010000210255,"endTime":1456.7710000555962,"finished":true,"transferSize":55672,"resourceSize":55461,"statusCode":200,"mimeType":"image/jpeg","resourceType":"Image"},{"url":"https://www.pinayu.com/proyectos/10/exterior-restaurante-noche.jpg","protocol":"h2","startTime":1170.7830000668764,"endTime":1477.9830002225935,"finished":true,"transferSize":170284,"resourceSize":169945,"statusCode":200,"mimeType":"image/jpeg","resourceType":"Image"},{"url":"https://www.pinayu.com/proyectos/15/game-over-ilustracion-principal.jpg","protocol":"h2","startTime":1173.3990001957864,"endTime":1489.6630002185702,"finished":true,"transferSize":105076,"resourceSize":104809,"statusCode":200,"mimeType":"image/jpeg","resourceType":"Image"},{"url":"https://www.pinayu.com/proyectos/2/the-cobardes-monstruos-juntos.jpg","protocol":"h2","startTime":1174.0110001992434,"endTime":1498.58900019899,"finished":true,"transferSize":181452,"resourceSize":181095,"statusCode":200,"mimeType":"image/jpeg","resourceType":"Image"},{"url":"https://www.pinayu.com/proyectos/5/portada-cortometraje-malaga.jpg","protocol":"h2","startTime":1175.493000075221,"endTime":1566.1780000664294,"finished":true,"transferSize":131896,"resourceSize":131593,"statusCode":200,"mimeType":"image/jpeg","resourceType":"Image"},{"url":"https://www.pinayu.com/proyectos/18/edificio-frankfurt.jpg","protocol":"h2","startTime":1176.0190001223236,"endTime":1534.2420001979917,"finished":true,"transferSize":247120,"resourceSize":246691,"statusCode":200,"mimeType":"image/jpeg","resourceType":"Image"},{"url":"https://www.pinayu.com/proyectos/23/logotipos-creados-por-pinayu.jpg","protocol":"h2","startTime":1176.48100014776,"endTime":1534.918000223115,"finished":true,"transferSize":96324,"resourceSize":96067,"statusCode":200,"mimeType":"image/jpeg","resourceType":"Image"},{"url":"https://www.pinayu.com/proyectos/7/caratulas-piezas-musicales.jpg","protocol":"h2","startTime":1177.4220000952482,"endTime":1555.4940002039075,"finished":true,"transferSize":189403,"resourceSize":189037,"statusCode":200,"mimeType":"image/jpeg","resourceType":"Image"},{"url":"https://www.pinayu.com/proyectos/12/ilustracion-graciosa-todo-archivado.jpg","protocol":"h2","startTime":1179.659000132233,"endTime":1552.1050000097603,"finished":true,"transferSize":130460,"resourceSize":130166,"statusCode":200,"mimeType":"image/jpeg","resourceType":"Image"},{"url":"https://www.pinayu.com/proyectos/16/timelapse-puente-autobus.jpg","protocol":"h2","startTime":1180.2210002206266,"endTime":1403.9350000675768,"finished":true,"transferSize":202532,"resourceSize":202157,"statusCode":200,"mimeType":"image/jpeg","resourceType":"Image"},{"url":"https://www.pinayu.com/proyectos/24/diseno-capturas-web.jpg","protocol":"h2","startTime":1180.7750000152737,"endTime":1388.1760002113879,"finished":true,"transferSize":76708,"resourceSize":76469,"statusCode":200,"mimeType":"image/jpeg","resourceType":"Image"},{"url":"https://www.pinayu.com/proyectos/13/iphoncitos-personajes-iphone.jpg","protocol":"h2","startTime":1181.2840001657605,"endTime":1401.5140000265092,"finished":true,"transferSize":135190,"resourceSize":134887,"statusCode":200,"mimeType":"image/jpeg","resourceType":"Image"},{"url":"https://www.pinayu.com/proyectos/17/eolicas-foto-principal.jpg","protocol":"h2","startTime":1182.4000000488013,"endTime":1405.1150002051145,"finished":true,"transferSize":161652,"resourceSize":161322,"statusCode":200,"mimeType":"image/jpeg","resourceType":"Image"},{"url":"https://www.pinayu.com/proyectos/21/eden-creativo-diseno-grafico-web.jpg","protocol":"h2","startTime":1183.930000057444,"endTime":1392.435000045225,"finished":true,"transferSize":25202,"resourceSize":25018,"statusCode":200,"mimeType":"image/jpeg","resourceType":"Image"},{"url":"https://www.pinayu.com/proyectos/22/pinayu-animaciones.jpg","protocol":"h2","startTime":1184.4680001959205,"endTime":1412.668000208214,"finished":true,"transferSize":84360,"resourceSize":84112,"statusCode":200,"mimeType":"image/jpeg","resourceType":"Image"},{"url":"https://www.pinayu.com/newimages/david/david-lopez-gonzalez-disenador-ilustrador.jpg","protocol":"h2","startTime":1184.8560001235455,"endTime":1422.0150001347065,"finished":true,"transferSize":150550,"resourceSize":150229,"statusCode":200,"mimeType":"image/jpeg","resourceType":"Image"},{"url":"https://www.pinayu.com/newimages/david/cv-pdf.jpg","protocol":"h2","startTime":1187.2480001766235,"endTime":1410.4250001255423,"finished":true,"transferSize":39079,"resourceSize":38885,"statusCode":200,"mimeType":"image/jpeg","resourceType":"Image"},{"url":"https://www.pinayu.com/blog/images/de-que-escribir-cuando-no-sabes-de-que-escribir.jpg","protocol":"h2","startTime":1187.8450000658631,"endTime":1415.394000010565,"finished":true,"transferSize":23184,"resourceSize":23009,"statusCode":200,"mimeType":"image/jpeg","resourceType":"Image"},{"url":"https://www.pinayu.com/images/linkedin.svg","protocol":"h2","startTime":1188.2730000652373,"endTime":1417.6090001128614,"finished":true,"transferSize":8738,"resourceSize":8570,"statusCode":200,"mimeType":"image/svg+xml","resourceType":"Image"},{"url":"https://www.pinayu.com/images/instagram.svg","protocol":"h2","startTime":1189.9880000855774,"endTime":1420.551000162959,"finished":true,"transferSize":7535,"resourceSize":7376,"statusCode":200,"mimeType":"image/svg+xml","resourceType":"Image"},{"url":"https://www.pinayu.com/images/500px.svg","protocol":"h2","startTime":1212.9960001911968,"endTime":1427.396000130102,"finished":true,"transferSize":4954,"resourceSize":4795,"statusCode":200,"mimeType":"image/svg+xml","resourceType":"Image"},{"url":"https://www.pinayu.com/newimages/subir-arriba.svg","protocol":"h2","startTime":1213.7370000127703,"endTime":1442.2670002095401,"finished":true,"transferSize":9272,"resourceSize":9103,"statusCode":200,"mimeType":"image/svg+xml","resourceType":"Image"},{"url":"https://www.google-analytics.com/analytics.js","protocol":"h2","startTime":1215.131000149995,"endTime":1296.1570001207292,"finished":true,"transferSize":19218,"resourceSize":47051,"statusCode":200,"mimeType":"text/javascript","resourceType":"Script"},{"url":"https://www.pinayu.com/newimages/cargador.gif","protocol":"h2","startTime":1601.8970001023263,"endTime":1646.0680000018328,"finished":true,"transferSize":16657,"resourceSize":16482,"statusCode":200,"mimeType":"image/gif","resourceType":"Image"},{"url":"https://fonts.gstatic.com/s/lobster/v23/neILzCirqoswsqX9zoKmM4MwWJU.woff2","protocol":"h2","startTime":3603.198000229895,"endTime":3672.0870002172887,"finished":true,"transferSize":16855,"resourceSize":16496,"statusCode":200,"mimeType":"font/woff2","resourceType":"Font"},{"url":"https://www.google-analytics.com/j/collect?v=1&_v=j87&a=1160338889&t=pageview&_s=1&dl=https%3A%2F%2Fwww.pinayu.com%2F&ul=en-us&de=UTF-8&dt=Pinayu%20-%20David%20L%C3%B3pez%20Gonz%C3%A1lez&sd=24-bit&sr=360x640&vp=360x640&je=0&_u=IEBAAEABAAAAAC~&jid=13249365&gjid=942364155&cid=1087638664.1605579990&tid=UA-74451017-1&_gid=1632845362.1605579990&_r=1&_slc=1&z=2027594948","protocol":"h2","startTime":3892.1430001500994,"endTime":3949.0040000528097,"finished":true,"transferSize":207,"resourceSize":2,"statusCode":200,"mimeType":"text/plain","resourceType":"XHR"}]}},"network-rtt":{"id":"network-rtt","title":"Network Round Trip Times","description":"Network round trip times (RTT) have a large impact on performance. If the RTT to an origin is high, it's an indication that servers closer to the user could improve performance. [Learn more](https://hpbn.co/primer-on-latency-and-bandwidth/).","score":null,"scoreDisplayMode":"informative","numericValue":31.71799999999999,"numericUnit":"millisecond","displayValue":"30 ms","details":{"type":"table","headings":[{"key":"origin","itemType":"text","text":"URL"},{"key":"rtt","itemType":"ms","granularity":1,"text":"Time Spent"}],"items":[{"origin":"https://www.pinayu.com","rtt":31.71799999999999},{"origin":"https://fonts.gstatic.com","rtt":15.208000000000002},{"origin":"https://fonts.googleapis.com","rtt":13.684000000000001},{"origin":"https://www.google-analytics.com","rtt":13.579999999999998},{"origin":"https://ajax.googleapis.com","rtt":12.823999999999998}]}},"network-server-latency":{"id":"network-server-latency","title":"Server Backend Latencies","description":"Server latencies can impact web performance. If the server latency of an origin is high, it's an indication the server is overloaded or has poor backend performance. [Learn more](https://hpbn.co/primer-on-web-performance/#analyzing-the-resource-waterfall).","score":null,"scoreDisplayMode":"informative","numericValue":26.648000000000007,"numericUnit":"millisecond","displayValue":"30 ms","details":{"type":"table","headings":[{"key":"origin","itemType":"text","text":"URL"},{"key":"serverResponseTime","itemType":"ms","granularity":1,"text":"Time Spent"}],"items":[{"origin":"https://fonts.googleapis.com","serverResponseTime":26.648000000000007},{"origin":"https://www.pinayu.com","serverResponseTime":11.538000000000011},{"origin":"https://fonts.gstatic.com","serverResponseTime":2.1210000000000058},{"origin":"https://ajax.googleapis.com","serverResponseTime":0},{"origin":"https://www.google-analytics.com","serverResponseTime":0}]}},"main-thread-tasks":{"id":"main-thread-tasks","title":"Tasks","description":"Lists the toplevel main thread tasks that executed during page load.","score":null,"scoreDisplayMode":"informative","details":{"type":"table","headings":[{"key":"startTime","itemType":"ms","granularity":1,"text":"Start Time"},{"key":"duration","itemType":"ms","granularity":1,"text":"End Time"}],"items":[{"duration":150.526,"startTime":625.687},{"duration":5.089,"startTime":776.414},{"duration":19.651,"startTime":782.241},{"duration":14.787,"startTime":801.923},{"duration":21.783,"startTime":816.785},{"duration":9.848,"startTime":838.581},{"duration":175.111,"startTime":848.44},{"duration":29.254,"startTime":1024.83},{"duration":5.165,"startTime":1054.663},{"duration":8.226,"startTime":1059.837},{"duration":13.15,"startTime":1071.626},{"duration":708.556,"startTime":1091.866},{"duration":758.565,"startTime":1800.444},{"duration":189.59,"startTime":2559.118},{"duration":32.296,"startTime":2748.727},{"duration":68.14,"startTime":2781.034},{"duration":37.705,"startTime":2849.919},{"duration":8.714,"startTime":2887.689},{"duration":7.679,"startTime":2896.535},{"duration":57.298,"startTime":2904.238},{"duration":105.005,"startTime":2961.561},{"duration":58.419,"startTime":3066.596},{"duration":58.664,"startTime":3125.181},{"duration":57.412,"startTime":3183.892},{"duration":14.656,"startTime":3241.374},{"duration":13.445,"startTime":3256.063},{"duration":9.435,"startTime":3269.54},{"duration":5.749,"startTime":3279.005},{"duration":19.788,"startTime":3284.814},{"duration":8.85,"startTime":3304.613},{"duration":6.853,"startTime":3323.761},{"duration":8.818,"startTime":3332.326},{"duration":11.25,"startTime":3345.441},{"duration":9.595,"startTime":3358.46},{"duration":5.502,"startTime":3368.064},{"duration":5.478,"startTime":3378.459},{"duration":11.963,"startTime":3383.969},{"duration":23.829,"startTime":3395.941},{"duration":28.845,"startTime":3419.786},{"duration":38.167,"startTime":3449.798},{"duration":21.636,"startTime":3488},{"duration":48.113,"startTime":3509.653},{"duration":15.547,"startTime":3573.094},{"duration":44.222,"startTime":3588.836},{"duration":6.607,"startTime":3633.069},{"duration":5.216,"startTime":3639.712},{"duration":10.062,"startTime":3644.969},{"duration":14.911,"startTime":3655.161},{"duration":8.285,"startTime":3670.084},{"duration":8.624,"startTime":3678.378},{"duration":5.864,"startTime":3710.233},{"duration":8.011,"startTime":3732.944},{"duration":25.804,"startTime":3745.366},{"duration":8.196,"startTime":3772.185},{"duration":6.256,"startTime":3780.663},{"duration":5.63,"startTime":3794.987},{"duration":7.275,"startTime":3801.131},{"duration":175.45,"startTime":3815.229},{"duration":27.472,"startTime":3990.808},{"duration":8.432,"startTime":4018.404},{"duration":47.054,"startTime":4026.951},{"duration":21.582,"startTime":4074.2},{"duration":21.358,"startTime":4098.057},{"duration":93.99,"startTime":4119.499},{"duration":18.853,"startTime":4213.533},{"duration":8.025,"startTime":4234.22},{"duration":19.813,"startTime":4322.049},{"duration":5.611,"startTime":4358.989},{"duration":17.003,"startTime":4404.591},{"duration":17.209,"startTime":4500.242},{"duration":9.864,"startTime":4741.804},{"duration":9.191,"startTime":5304.418}]}},"metrics":{"id":"metrics","title":"Metrics","description":"Collects all available metrics.","score":null,"scoreDisplayMode":"informative","numericValue":10365,"numericUnit":"millisecond","details":{"type":"debugdata","items":[{"firstContentfulPaint":5869,"firstMeaningfulPaint":6059,"largestContentfulPaint":7523,"firstCPUIdle":9900,"interactive":10365,"speedIndex":11505,"estimatedInputLatency":1353,"totalBlockingTime":2987,"maxPotentialFID":2176,"cumulativeLayoutShift":0.3479838434855143,"observedTimeOrigin":0,"observedTimeOriginTs":1188597783841,"observedNavigationStart":0,"observedNavigationStartTs":1188597783841,"observedFirstPaint":2586,"observedFirstPaintTs":1188600369504,"observedFirstContentfulPaint":2586,"observedFirstContentfulPaintTs":1188600369504,"observedFirstMeaningfulPaint":2586,"observedFirstMeaningfulPaintTs":1188600369504,"observedLargestContentfulPaint":4192,"observedLargestContentfulPaintTs":1188601975866,"observedTraceEnd":5656,"observedTraceEndTs":1188603440063,"observedLoad":4173,"observedLoadTs":1188601957194,"observedDomContentLoaded":1630,"observedDomContentLoadedTs":1188599413766,"observedCumulativeLayoutShift":0.3479838434855143,"observedFirstVisualChange":3786,"observedFirstVisualChangeTs":1188601569841,"observedLastVisualChange":5586,"observedLastVisualChangeTs":1188603369841,"observedSpeedIndex":4569,"observedSpeedIndexTs":1188602352836},{"lcpInvalidated":false}]}},"offline-start-url":{"id":"offline-start-url","title":"`start_url` does not respond with a 200 when offline","description":"A service worker enables your web app to be reliable in unpredictable network conditions. [Learn more](https://web.dev/offline-start-url/).","score":0,"scoreDisplayMode":"binary","explanation":"No usable web app manifest found on page.","warnings":[]},"performance-budget":{"id":"performance-budget","title":"Performance budget","description":"Keep the quantity and size of network requests under the targets set by the provided performance budget. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/budgets).","score":null,"scoreDisplayMode":"notApplicable"},"timing-budget":{"id":"timing-budget","title":"Timing budget","description":"Set a timing budget to help you keep an eye on the performance of your site. Performant sites load fast and respond to user input events quickly. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/budgets).","score":null,"scoreDisplayMode":"notApplicable"},"resource-summary":{"id":"resource-summary","title":"Keep request counts low and transfer sizes small","description":"To set budgets for the quantity and size of page resources, add a budget.json file. [Learn more](https://web.dev/use-lighthouse-for-performance-budgets/).","score":null,"scoreDisplayMode":"informative","displayValue":"47 requests • 3,362 KiB","details":{"type":"table","headings":[{"key":"label","itemType":"text","text":"Resource Type"},{"key":"requestCount","itemType":"numeric","text":"Requests"},{"key":"transferSize","itemType":"bytes","text":"Transfer Size"}],"items":[{"resourceType":"total","label":"Total","requestCount":47,"transferSize":3442549},{"resourceType":"image","label":"Image","requestCount":39,"transferSize":3343089},{"resourceType":"script","label":"Script","requestCount":3,"transferSize":56682},{"resourceType":"stylesheet","label":"Stylesheet","requestCount":2,"transferSize":17783},{"resourceType":"font","label":"Font","requestCount":1,"transferSize":16855},{"resourceType":"document","label":"Document","requestCount":1,"transferSize":7933},{"resourceType":"other","label":"Other","requestCount":1,"transferSize":207},{"resourceType":"media","label":"Media","requestCount":0,"transferSize":0},{"resourceType":"third-party","label":"Third-party","requestCount":5,"transferSize":67708}]}},"third-party-summary":{"id":"third-party-summary","title":"Reduce the impact of third-party code","description":"Third-party code can significantly impact load performance. Limit the number of redundant third-party providers and try to load third-party code after your page has primarily finished loading. [Learn more](https://developers.google.com/web/fundamentals/performance/optimizing-content-efficiency/loading-third-party-javascript/).","score":0,"scoreDisplayMode":"binary","displayValue":"Third-party code blocked the main thread for 1,100 ms","details":{"type":"table","headings":[{"key":"entity","itemType":"link","text":"Third-Party","subItemsHeading":{"key":"url","itemType":"url"}},{"key":"transferSize","granularity":1,"itemType":"bytes","text":"Transfer Size","subItemsHeading":{"key":"transferSize"}},{"key":"blockingTime","granularity":1,"itemType":"ms","text":"Main-Thread Blocking Time","subItemsHeading":{"key":"blockingTime"}}],"items":[{"mainThreadTime":787.2319999999999,"blockingTime":555.604,"transferSize":19425,"entity":{"type":"link","text":"Google Analytics","url":"https://www.google.com/analytics/analytics/"},"subItems":{"type":"subitems","items":[{"url":"https://www.google-analytics.com/analytics.js","mainThreadTime":787.2319999999999,"blockingTime":555.604,"transferSize":19218}]}},{"mainThreadTime":1035.6119999999976,"blockingTime":548.8119999999999,"transferSize":30472,"entity":{"type":"link","text":"Google CDN","url":"https://developers.google.com/speed/libraries/"},"subItems":{"type":"subitems","items":[{"url":"https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js","mainThreadTime":1035.6119999999976,"blockingTime":548.8119999999999,"transferSize":30472}]}},{"mainThreadTime":32.903999999999996,"blockingTime":0,"transferSize":17811,"entity":{"type":"link","text":"Google Fonts","url":"https://fonts.google.com/"},"subItems":{"type":"subitems","items":[{"url":"https://fonts.gstatic.com/s/lobster/v23/neILzCirqoswsqX9zoKmM4MwWJU.woff2","mainThreadTime":0,"blockingTime":0,"transferSize":16855}]}}],"summary":{"wastedBytes":67708,"wastedMs":1104.416}}},"largest-contentful-paint-element":{"id":"largest-contentful-paint-element","title":"Largest Contentful Paint element","description":"This is the largest contentful element painted within the viewport. [Learn More](https://web.dev/lighthouse-largest-contentful-paint/)","score":null,"scoreDisplayMode":"informative","displayValue":"1 element found","details":{"type":"table","headings":[{"key":"node","itemType":"node","text":"Element"}],"items":[{"node":{"type":"node","path":"2,HTML,1,BODY,2,DIV,2,A,0,IMG","selector":"body > div#pinayu > a > img","nodeLabel":"Imagen de entrada","snippet":"\u003cimg src=\"newimages/pinayu-david-foto.jpg\" alt=\"Imagen de entrada\">","boundingRect":{"top":167,"bottom":411,"left":0,"right":360,"width":360,"height":244}}}]}},"layout-shift-elements":{"id":"layout-shift-elements","title":"Avoid large layout shifts","description":"These DOM elements contribute most to the CLS of the page.","score":null,"scoreDisplayMode":"informative","displayValue":"5 elements found","details":{"type":"table","headings":[{"key":"node","itemType":"node","text":"Element"},{"key":"score","itemType":"numeric","granularity":0.001,"text":"CLS Contribution"}],"items":[{"node":{"type":"node","path":"2,HTML,1,BODY,2,DIV","selector":"body > div#pinayu","nodeLabel":"Pinayu come cookies... ¡OK! +Info","snippet":"\u003cdiv id=\"pinayu\">","boundingRect":{"top":108,"bottom":421,"left":0,"right":360,"width":360,"height":313}},"score":0.17440992585056203},{"node":{"type":"node","path":"2,HTML,1,BODY,9,DIV","selector":"body > div#footer","nodeLabel":"  \nPinayu.com © 2016 - 2020\nRastrear el Blog\n","snippet":"\u003cdiv id=\"footer\">","boundingRect":{"top":421,"bottom":639,"left":0,"right":360,"width":360,"height":218}},"score":0.16388179115565937},{"node":{"type":"node","path":"2,HTML,1,BODY,9,DIV","selector":"body > div#footer","nodeLabel":"  \nPinayu.com © 2016 - 2020\nRastrear el Blog\n","snippet":"\u003cdiv id=\"footer\">","boundingRect":{"top":421,"bottom":639,"left":0,"right":360,"width":360,"height":218}},"score":0.002714082792207792},{"node":{"type":"node","path":"2,HTML,1,BODY,9,DIV","selector":"body > div#footer","nodeLabel":"  \nPinayu.com © 2016 - 2020\nRastrear el Blog\n","snippet":"\u003cdiv id=\"footer\">","boundingRect":{"top":421,"bottom":639,"left":0,"right":360,"width":360,"height":218}},"score":0.002714082792207792},{"node":{"type":"node","path":"2,HTML,1,BODY,9,DIV,6,A","selector":"body > div#footer > a","nodeLabel":"Rastrear el Blog","snippet":"\u003ca href=\"https://www.pinayu.com/blog/\">","boundingRect":{"top":531,"bottom":547,"left":130,"right":230,"width":100,"height":16}},"score":0.002714082792207792}]}},"long-tasks":{"id":"long-tasks","title":"Avoid long main-thread tasks","description":"Lists the longest tasks on the main thread, useful for identifying worst contributors to input delay. [Learn more](https://web.dev/long-tasks-devtools/)","score":null,"scoreDisplayMode":"informative","displayValue":"20 long tasks found","details":{"type":"table","headings":[{"key":"url","itemType":"url","text":"URL"},{"key":"startTime","itemType":"ms","granularity":1,"text":"Start Time"},{"key":"duration","itemType":"ms","granularity":1,"text":"Duration"}],"items":[{"url":"https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js","duration":2834.000000000001,"startTime":2515.2200000000003},{"url":"https://www.pinayu.com/","duration":1517,"startTime":5349.220000000001},{"url":"https://www.google-analytics.com/analytics.js","duration":702,"startTime":9179.220000000001},{"url":"https://www.pinayu.com/","duration":700.0000000000002,"startTime":1645.22},{"url":"https://www.pinayu.com/","duration":602,"startTime":818.22},{"url":"Unattributable","duration":379,"startTime":6866.220000000001},{"url":"Unattributable","duration":210,"startTime":7712.220000000001},{"url":"Unattributable","duration":188,"startTime":9991.220000000001},{"url":"https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js","duration":188,"startTime":10350.220000000001},{"url":"Unattributable","duration":151,"startTime":7446.220000000001},{"url":"https://www.pinayu.com/","duration":136,"startTime":7310.220000000001},{"url":"https://www.pinayu.com/newstyle.css?ver=101","duration":117,"startTime":2345.2200000000003},{"url":"Unattributable","duration":117,"startTime":7922.220000000001},{"url":"Unattributable","duration":117,"startTime":8039.220000000001},{"url":"https://www.pinayu.com/","duration":115,"startTime":7597.220000000001},{"url":"Unattributable","duration":115,"startTime":8156.220000000001},{"url":"https://www.pinayu.com/","duration":110,"startTime":9881.220000000001},{"url":"Unattributable","duration":96,"startTime":8781.220000000001},{"url":"https://www.pinayu.com/","duration":88,"startTime":8939.220000000001},{"url":"Unattributable","duration":87,"startTime":1558.22}]}},"no-unload-listeners":{"id":"no-unload-listeners","title":"Avoids `unload` event listeners","description":"The `unload` event does not fire reliably and listening for it can prevent browser optimizations like the Back-Forward Cache. Consider using the `pagehide` or `visibilitychange` events instead. [Learn More](https://developers.google.com/web/updates/2018/07/page-lifecycle-api#the-unload-event)","score":1,"scoreDisplayMode":"binary"},"non-composited-animations":{"id":"non-composited-animations","title":"Avoid non-composited animations","description":"Animations which are not composited can be janky and increase CLS. [Learn more](https://web.dev/non-composited-animations)","score":null,"scoreDisplayMode":"notApplicable","details":{"type":"table","headings":[],"items":[]}},"unsized-images":{"id":"unsized-images","title":"Image elements do not have explicit `width` and `height`","description":"Set an explicit width and height on image elements to reduce layout shifts and improve CLS. [Learn more](https://web.dev/optimize-cls/#images-without-dimensions)","score":0,"scoreDisplayMode":"binary","details":{"type":"table","headings":[{"key":"url","itemType":"thumbnail","text":""},{"key":"url","itemType":"url","text":"URL"},{"key":"node","itemType":"node","text":"Failing Elements"}],"items":[{"url":"https://www.pinayu.com/newimages/logo.svg","node":{"type":"node","path":"2,HTML,1,BODY,1,DIV,0,DIV,2,DIV,0,A,0,IMG","selector":"div#header > div#btn_logo > a > img#logo","nodeLabel":"Logo Pinayu.com - botón siguiente sección","snippet":"\u003cimg src=\"newimages/logo.svg\" alt=\"Logo Pinayu.com - botón siguiente sección\" id=\"logo\">"}},{"url":"https://www.pinayu.com/newimages/menu-puntos.svg","node":{"type":"node","path":"2,HTML,1,BODY,1,DIV,1,DIV,0,A,0,IMG","selector":"div#header_all > div#puntos_menu > a > img#imgmenupuntos","nodeLabel":"Menú resonsive - indicador de sección","snippet":"\u003cimg src=\"newimages/menu-puntos.svg\" alt=\"Menú resonsive - indicador de sección\" id=\"imgmenupuntos\" width=\"50px\">"}},{"url":"https://www.pinayu.com/newimages/pinayu-david-foto.jpg","node":{"type":"node","path":"2,HTML,1,BODY,2,DIV,2,A,0,IMG","selector":"body > div#pinayu > a > img","nodeLabel":"Imagen de entrada","snippet":"\u003cimg src=\"newimages/pinayu-david-foto.jpg\" alt=\"Imagen de entrada\">"}},{"url":"https://www.pinayu.com/newimages/ilustracion.svg","node":{"type":"node","path":"2,HTML,1,BODY,4,DIV,0,A,0,IMG","selector":"body > div#selector_portfolio > a > img#btn_ilus","nodeLabel":"ilustración","snippet":"\u003cimg src=\"newimages/ilustracion.svg\" id=\"btn_ilus\" alt=\"ilustración\" class=\"movi1\">"}},{"url":"https://www.pinayu.com/newimages/diseno-grafico.svg","node":{"type":"node","path":"2,HTML,1,BODY,4,DIV,1,A,0,IMG","selector":"body > div#selector_portfolio > a > img#btn_disgraf","nodeLabel":"diseño gráfico","snippet":"\u003cimg src=\"newimages/diseno-grafico.svg\" id=\"btn_disgraf\" alt=\"diseño gráfico\" class=\"movi2\">"}},{"url":"https://www.pinayu.com/newimages/fotografia.svg","node":{"type":"node","path":"2,HTML,1,BODY,4,DIV,2,A,0,IMG","selector":"body > div#selector_portfolio > a > img#btn_fotos","nodeLabel":"fotografía","snippet":"\u003cimg src=\"newimages/fotografia.svg\" id=\"btn_fotos\" alt=\"fotografía\" class=\"movi3\">"}},{"url":"https://www.pinayu.com/newimages/video-animacion.svg","node":{"type":"node","path":"2,HTML,1,BODY,4,DIV,3,A,0,IMG","selector":"body > div#selector_portfolio > a > img#btn_video","nodeLabel":"vídeo animación","snippet":"\u003cimg src=\"newimages/video-animacion.svg\" id=\"btn_video\" alt=\"vídeo animación\" class=\"movi4\">"}},{"url":"https://www.pinayu.com/proyectos/1/trampolin-atardecer-pareja.jpg","node":{"type":"node","path":"2,HTML,1,BODY,5,DIV,0,DIV,0,A,0,IMG","selector":"div#portfolio > div.portfolio_ilus > a > img.img_portfolio","nodeLabel":"Últimos días del verano","snippet":"\u003cimg src=\"https://www.pinayu.com/proyectos/1/trampolin-atardecer-pareja.jpg\" alt=\"Últimos días del verano\" class=\"img_portfolio\">"}},{"url":"https://www.pinayu.com/proyectos/4/animal-principal.jpg","node":{"type":"node","path":"2,HTML,1,BODY,5,DIV,1,DIV,0,A,0,IMG","selector":"div#portfolio > div.portfolio_fotos > a > img.img_portfolio","nodeLabel":"Felinos y otros animales","snippet":"\u003cimg src=\"https://www.pinayu.com/proyectos/4/animal-principal.jpg\" alt=\"Felinos y otros animales\" class=\"img_portfolio\">"}},{"url":"https://www.pinayu.com/proyectos/9/lapu-lapu-logo-propuesta-favorita.jpg","node":{"type":"node","path":"2,HTML,1,BODY,5,DIV,2,DIV,0,A,0,IMG","selector":"div#portfolio > div.portfolio_disgraf > a > img.img_portfolio","nodeLabel":"Lapu-Lapu Producciones","snippet":"\u003cimg src=\"https://www.pinayu.com/proyectos/9/lapu-lapu-logo-propuesta-favorita.jpg\" alt=\"Lapu-Lapu Producciones\" class=\"img_portfolio\">"}},{"url":"https://www.pinayu.com/proyectos/19/zorro-corto-animado-sin-palabras.jpg","node":{"type":"node","path":"2,HTML,1,BODY,5,DIV,3,DIV,0,A,0,IMG","selector":"div#portfolio > div.portfolio_video > a > img.img_portfolio","nodeLabel":"Chico y Zorro","snippet":"\u003cimg src=\"https://www.pinayu.com/proyectos/19/zorro-corto-animado-sin-palabras.jpg\" alt=\"Chico y Zorro\" class=\"img_portfolio\">"}},{"url":"https://www.pinayu.com/proyectos/6/raxia-consulting-logotipo.jpg","node":{"type":"node","path":"2,HTML,1,BODY,5,DIV,4,DIV,0,A,0,IMG","selector":"div#portfolio > div.portfolio_disgraf > a > img.img_portfolio","nodeLabel":"Raxia Consulting","snippet":"\u003cimg src=\"https://www.pinayu.com/proyectos/6/raxia-consulting-logotipo.jpg\" alt=\"Raxia Consulting\" class=\"img_portfolio\">"}},{"url":"https://www.pinayu.com/proyectos/11/des-papiers-caches-sous-les-ailes.jpg","node":{"type":"node","path":"2,HTML,1,BODY,5,DIV,5,DIV,0,A,0,IMG","selector":"div#portfolio > div.portfolio_ilus > a > img.img_portfolio","nodeLabel":"Des papiers cachés sous les ailes?","snippet":"\u003cimg src=\"https://www.pinayu.com/proyectos/11/des-papiers-caches-sous-les-ailes.jpg\" alt=\"Des papiers cachés sous les ailes?\" class=\"img_portfolio\">"}},{"url":"https://www.pinayu.com/proyectos/14/macro-fotografia-hoja-en-espiral.jpg","node":{"type":"node","path":"2,HTML,1,BODY,5,DIV,6,DIV,0,A,0,IMG","selector":"div#portfolio > div.portfolio_fotos > a > img.img_portfolio","nodeLabel":"Macrofotografía","snippet":"\u003cimg src=\"https://www.pinayu.com/proyectos/14/macro-fotografia-hoja-en-espiral.jpg\" alt=\"Macrofotografía\" class=\"img_portfolio\">"}},{"url":"https://www.pinayu.com/proyectos/20/snowboard-animacion.jpg","node":{"type":"node","path":"2,HTML,1,BODY,5,DIV,7,DIV,0,A,0,IMG","selector":"div#portfolio > div.portfolio_video > a > img.img_portfolio","nodeLabel":"Deportes extremos","snippet":"\u003cimg src=\"https://www.pinayu.com/proyectos/20/snowboard-animacion.jpg\" alt=\"Deportes extremos\" class=\"img_portfolio\">"}},{"url":"https://www.pinayu.com/proyectos/3/diorama-pinayu-principal.jpg","node":{"type":"node","path":"2,HTML,1,BODY,5,DIV,8,DIV,0,A,0,IMG","selector":"div#portfolio > div.portfolio_ilus > a > img.img_portfolio","nodeLabel":"Dioramas de Pinayu","snippet":"\u003cimg src=\"https://www.pinayu.com/proyectos/3/diorama-pinayu-principal.jpg\" alt=\"Dioramas de Pinayu\" class=\"img_portfolio\">"}},{"url":"https://www.pinayu.com/proyectos/8/zyp-propuesta-logotipo.jpg","node":{"type":"node","path":"2,HTML,1,BODY,5,DIV,9,DIV,0,A,0,IMG","selector":"div#portfolio > div.portfolio_disgraf > a > img.img_portfolio","nodeLabel":"ZYP logotipo","snippet":"\u003cimg src=\"https://www.pinayu.com/proyectos/8/zyp-propuesta-logotipo.jpg\" alt=\"ZYP logotipo\" class=\"img_portfolio\">"}},{"url":"https://www.pinayu.com/proyectos/10/exterior-restaurante-noche.jpg","node":{"type":"node","path":"2,HTML,1,BODY,5,DIV,10,DIV,0,A,0,IMG","selector":"div#portfolio > div.portfolio_fotos > a > img.img_portfolio","nodeLabel":"Fotografías nocturnas","snippet":"\u003cimg src=\"https://www.pinayu.com/proyectos/10/exterior-restaurante-noche.jpg\" alt=\"Fotografías nocturnas\" class=\"img_portfolio\">"}},{"url":"https://www.pinayu.com/proyectos/15/game-over-ilustracion-principal.jpg","node":{"type":"node","path":"2,HTML,1,BODY,5,DIV,11,DIV,0,A,0,IMG","selector":"div#portfolio > div.portfolio_video > a > img.img_portfolio","nodeLabel":"Game over?","snippet":"\u003cimg src=\"https://www.pinayu.com/proyectos/15/game-over-ilustracion-principal.jpg\" alt=\"Game over?\" class=\"img_portfolio\">"}},{"url":"https://www.pinayu.com/proyectos/2/the-cobardes-monstruos-juntos.jpg","node":{"type":"node","path":"2,HTML,1,BODY,5,DIV,12,DIV,0,A,0,IMG","selector":"div#portfolio > div.portfolio_ilus > a > img.img_portfolio","nodeLabel":"Monstruos The Cobardes","snippet":"\u003cimg src=\"https://www.pinayu.com/proyectos/2/the-cobardes-monstruos-juntos.jpg\" alt=\"Monstruos The Cobardes\" class=\"img_portfolio\">"}},{"url":"https://www.pinayu.com/proyectos/5/portada-cortometraje-malaga.jpg","node":{"type":"node","path":"2,HTML,1,BODY,5,DIV,13,DIV,0,A,0,IMG","selector":"div#portfolio > div.portfolio_video > a > img.img_portfolio","nodeLabel":"Corto experimental","snippet":"\u003cimg src=\"https://www.pinayu.com/proyectos/5/portada-cortometraje-malaga.jpg\" alt=\"Corto experimental\" class=\"img_portfolio\">"}},{"url":"https://www.pinayu.com/proyectos/18/edificio-frankfurt.jpg","node":{"type":"node","path":"2,HTML,1,BODY,5,DIV,14,DIV,0,A,0,IMG","selector":"div#portfolio > div.portfolio_fotos > a > img.img_portfolio","nodeLabel":"Arquitectura y detalles","snippet":"\u003cimg src=\"https://www.pinayu.com/proyectos/18/edificio-frankfurt.jpg\" alt=\"Arquitectura y detalles\" class=\"img_portfolio\">"}},{"url":"https://www.pinayu.com/proyectos/23/logotipos-creados-por-pinayu.jpg","node":{"type":"node","path":"2,HTML,1,BODY,5,DIV,15,DIV,0,A,0,IMG","selector":"div#portfolio > div.portfolio_disgraf > a > img.img_portfolio","nodeLabel":"Logotipos propios","snippet":"\u003cimg src=\"https://www.pinayu.com/proyectos/23/logotipos-creados-por-pinayu.jpg\" alt=\"Logotipos propios\" class=\"img_portfolio\">"}},{"url":"https://www.pinayu.com/proyectos/7/caratulas-piezas-musicales.jpg","node":{"type":"node","path":"2,HTML,1,BODY,5,DIV,16,DIV,0,A,0,IMG","selector":"div#portfolio > div.portfolio_video > a > img.img_portfolio","nodeLabel":"Mis 14 mejores composiciones","snippet":"\u003cimg src=\"https://www.pinayu.com/proyectos/7/caratulas-piezas-musicales.jpg\" alt=\"Mis 14 mejores composiciones\" class=\"img_portfolio\">"}},{"url":"https://www.pinayu.com/proyectos/12/ilustracion-graciosa-todo-archivado.jpg","node":{"type":"node","path":"2,HTML,1,BODY,5,DIV,17,DIV,0,A,0,IMG","selector":"div#portfolio > div.portfolio_ilus > a > img.img_portfolio","nodeLabel":"Humor blanco","snippet":"\u003cimg src=\"https://www.pinayu.com/proyectos/12/ilustracion-graciosa-todo-archivado.jpg\" alt=\"Humor blanco\" class=\"img_portfolio\">"}},{"url":"https://www.pinayu.com/proyectos/16/timelapse-puente-autobus.jpg","node":{"type":"node","path":"2,HTML,1,BODY,5,DIV,18,DIV,0,A,0,IMG","selector":"div#portfolio > div.portfolio_fotos > a > img.img_portfolio","nodeLabel":"Timelapse - noches","snippet":"\u003cimg src=\"https://www.pinayu.com/proyectos/16/timelapse-puente-autobus.jpg\" alt=\"Timelapse - noches\" class=\"img_portfolio\">"}},{"url":"https://www.pinayu.com/proyectos/24/diseno-capturas-web.jpg","node":{"type":"node","path":"2,HTML,1,BODY,5,DIV,19,DIV,0,A,0,IMG","selector":"div#portfolio > div.portfolio_disgraf > a > img.img_portfolio","nodeLabel":"Capturas de webs","snippet":"\u003cimg src=\"https://www.pinayu.com/proyectos/24/diseno-capturas-web.jpg\" alt=\"Capturas de webs\" class=\"img_portfolio\">"}},{"url":"https://www.pinayu.com/proyectos/13/iphoncitos-personajes-iphone.jpg","node":{"type":"node","path":"2,HTML,1,BODY,5,DIV,20,DIV,0,A,0,IMG","selector":"div#portfolio > div.portfolio_ilus > a > img.img_portfolio","nodeLabel":"Iphoncitos","snippet":"\u003cimg src=\"https://www.pinayu.com/proyectos/13/iphoncitos-personajes-iphone.jpg\" alt=\"Iphoncitos\" class=\"img_portfolio\">"}},{"url":"https://www.pinayu.com/proyectos/17/eolicas-foto-principal.jpg","node":{"type":"node","path":"2,HTML,1,BODY,5,DIV,21,DIV,0,A,0,IMG","selector":"div#portfolio > div.portfolio_fotos > a > img.img_portfolio","nodeLabel":"Paisajes naturales","snippet":"\u003cimg src=\"https://www.pinayu.com/proyectos/17/eolicas-foto-principal.jpg\" alt=\"Paisajes naturales\" class=\"img_portfolio\">"}},{"url":"https://www.pinayu.com/proyectos/21/eden-creativo-diseno-grafico-web.jpg","node":{"type":"node","path":"2,HTML,1,BODY,5,DIV,22,DIV,0,A,0,IMG","selector":"div#portfolio > div.portfolio_disgraf > a > img.img_portfolio","nodeLabel":"Edén creativo","snippet":"\u003cimg src=\"https://www.pinayu.com/proyectos/21/eden-creativo-diseno-grafico-web.jpg\" alt=\"Edén creativo\" class=\"img_portfolio\">"}},{"url":"https://www.pinayu.com/proyectos/22/pinayu-animaciones.jpg","node":{"type":"node","path":"2,HTML,1,BODY,5,DIV,23,DIV,0,A,0,IMG","selector":"div#portfolio > div.portfolio_video > a > img.img_portfolio","nodeLabel":"Pinayu en movimiento","snippet":"\u003cimg src=\"https://www.pinayu.com/proyectos/22/pinayu-animaciones.jpg\" alt=\"Pinayu en movimiento\" class=\"img_portfolio\">"}},{"url":"https://www.pinayu.com/newimages/david/david-lopez-gonzalez-disenador-ilustrador.jpg","node":{"type":"node","path":"2,HTML,1,BODY,6,DIV,2,IMG","selector":"body > div#david > img.movi3","nodeLabel":"David López González - Diseñador, ilustrador","snippet":"\u003cimg src=\"newimages/david/david-lopez-gonzalez-disenador-ilustrador.jpg\" alt=\"David López González - Diseñador, ilustrador\" class=\"movi3\">"}},{"url":"","node":{"type":"node","path":"2,HTML,1,BODY,6,DIV,5,P,0,IMG","selector":"body > div#david > p.movi4 > img.movi5","nodeLabel":"Capturas de juegos hechos en QBasic","snippet":"\u003cimg src=\"newimages/david/capturas-juegos-qbasic-2000.jpg\" loading=\"lazy\" alt=\"Capturas de juegos hechos en QBasic\" class=\"movi5\">"}},{"url":"https://www.pinayu.com/newimages/david/cv-pdf.jpg","node":{"type":"node","path":"2,HTML,1,BODY,6,DIV,11,A,0,IMG","selector":"body > div#david > a > img","nodeLabel":"CV en PDF","snippet":"\u003cimg src=\"newimages/david/cv-pdf.jpg\" alt=\"CV en PDF\">"}},{"url":"","node":{"type":"node","path":"2,HTML,1,BODY,6,DIV,14,IMG","selector":"body > div#david > img","nodeLabel":"Diseño conceptual de la aplicación Novatrans","snippet":"\u003cimg src=\"newimages/david/aplicacion-novatrans.jpg\" loading=\"lazy\" alt=\"Diseño conceptual de la aplicación Novatrans\">"}},{"url":"","node":{"type":"node","path":"2,HTML,1,BODY,6,DIV,18,IMG","selector":"body > div#david > img","nodeLabel":"Captura de la web Malaga Transfer","snippet":"\u003cimg src=\"newimages/david/web-malaga-transfer.jpg\" loading=\"lazy\" alt=\"Captura de la web Malaga Transfer\">"}},{"url":"","node":{"type":"node","path":"2,HTML,1,BODY,6,DIV,19,IMG","selector":"body > div#david > img","nodeLabel":"Captura de la web Rent a Car","snippet":"\u003cimg src=\"newimages/david/web-rent-a-car.jpg\" loading=\"lazy\" alt=\"Captura de la web Rent a Car\">"}},{"url":"https://www.pinayu.com/newimages/pinayu-david-foto.jpg","node":{"type":"node","path":"2,HTML,1,BODY,6,DIV,23,A,0,IMG","selector":"body > div#david > a > img.movi7","nodeLabel":"Ver Portfolio","snippet":"\u003cimg src=\"newimages/pinayu-david-foto.jpg\" loading=\"lazy\" alt=\"Ver Portfolio\" class=\"movi7\">"}},{"url":"https://www.pinayu.com/blog/images/de-que-escribir-cuando-no-sabes-de-que-escribir.jpg","node":{"type":"node","path":"2,HTML,1,BODY,7,DIV,1,DIV,0,A,0,IMG","selector":"div#blog > div.post-home > a > img.img_blog","nodeLabel":"Imagen del post","snippet":"\u003cimg src=\"https://www.pinayu.com/blog/images/de-que-escribir-cuando-no-sabes-de-que-…\" alt=\"Imagen del post\" class=\"img_blog\">"}},{"url":"","node":{"type":"node","path":"2,HTML,1,BODY,7,DIV,2,DIV,0,A,0,IMG","selector":"div#blog > div.post-home > a > img.img_blog","nodeLabel":"Imagen del post","snippet":"\u003cimg src=\"https://www.pinayu.com/blog/images/como-uso-degradados-en-ilustraciones-ad…\" loading=\"lazy\" alt=\"Imagen del post\" class=\"img_blog\">"}},{"url":"","node":{"type":"node","path":"2,HTML,1,BODY,7,DIV,3,DIV,0,A,0,IMG","selector":"div#blog > div.post-home > a > img.img_blog","nodeLabel":"Imagen del post","snippet":"\u003cimg src=\"https://www.pinayu.com/blog/images/diseno-personajes-en-sketchbook-sombras…\" loading=\"lazy\" alt=\"Imagen del post\" class=\"img_blog\">"}},{"url":"","node":{"type":"node","path":"2,HTML,1,BODY,7,DIV,4,DIV,0,A,0,IMG","selector":"div#blog > div.post-home > a > img.img_blog","nodeLabel":"Imagen del post","snippet":"\u003cimg src=\"https://www.pinayu.com/blog/images/como-disenar-perspectiva-isometrica.jpg\" loading=\"lazy\" alt=\"Imagen del post\" class=\"img_blog\">"}},{"url":"https://www.pinayu.com/images/linkedin.svg","node":{"type":"node","path":"2,HTML,1,BODY,9,DIV,0,A,0,IMG","selector":"body > div#footer > a > img.redes_sociales","nodeLabel":"Hablemos por Linkedin","snippet":"\u003cimg src=\"../images/linkedin.svg\" alt=\"Hablemos por Linkedin\" class=\"redes_sociales\">"}},{"url":"https://www.pinayu.com/images/instagram.svg","node":{"type":"node","path":"2,HTML,1,BODY,9,DIV,1,A,0,IMG","selector":"body > div#footer > a > img.redes_sociales","nodeLabel":"Sígueme en Instagram","snippet":"\u003cimg src=\"../images/instagram.svg\" alt=\"Sígueme en Instagram\" class=\"redes_sociales\">"}},{"url":"https://www.pinayu.com/images/500px.svg","node":{"type":"node","path":"2,HTML,1,BODY,9,DIV,2,A,0,IMG","selector":"body > div#footer > a > img.redes_sociales","nodeLabel":"Descubre mis fotografías en 500px","snippet":"\u003cimg src=\"../images/500px.svg\" alt=\"Descubre mis fotografías en 500px\" class=\"redes_sociales\">"}},{"url":"https://www.pinayu.com/newimages/subir-arriba.svg","node":{"type":"node","path":"2,HTML,1,BODY,9,DIV,8,A,0,IMG","selector":"body > div#footer > a#subir > img#boton_subir","nodeLabel":"subir","snippet":"\u003cimg id=\"boton_subir\" src=\"newimages/subir-arriba.svg\" alt=\"subir\">"}}]}},"valid-source-maps":{"id":"valid-source-maps","title":"Page has valid source maps","description":"Source maps translate minified code to the original source code. This helps developers debug in production. In addition, Lighthouse is able to provide further insights. Consider deploying source maps to take advantage of these benefits. [Learn more](https://developers.google.com/web/tools/chrome-devtools/javascript/source-maps).","score":1,"scoreDisplayMode":"binary","details":{"type":"table","headings":[],"items":[]}},"pwa-cross-browser":{"id":"pwa-cross-browser","title":"Site works cross-browser","description":"To reach the most number of users, sites should work across every major browser. [Learn more](https://web.dev/pwa-cross-browser/).","score":null,"scoreDisplayMode":"manual"},"pwa-page-transitions":{"id":"pwa-page-transitions","title":"Page transitions don't feel like they block on the network","description":"Transitions should feel snappy as you tap around, even on a slow network. This experience is key to a user's perception of performance. [Learn more](https://web.dev/pwa-page-transitions/).","score":null,"scoreDisplayMode":"manual"},"pwa-each-page-has-url":{"id":"pwa-each-page-has-url","title":"Each page has a URL","description":"Ensure individual pages are deep linkable via URL and that URLs are unique for the purpose of shareability on social media. [Learn more](https://web.dev/pwa-each-page-has-url/).","score":null,"scoreDisplayMode":"manual"},"accesskeys":{"id":"accesskeys","title":"`[accesskey]` values are unique","description":"Access keys let users quickly focus a part of the page. For proper navigation, each access key must be unique. [Learn more](https://web.dev/accesskeys/).","score":null,"scoreDisplayMode":"notApplicable"},"aria-allowed-attr":{"id":"aria-allowed-attr","title":"`[aria-*]` attributes match their roles","description":"Each ARIA `role` supports a specific subset of `aria-*` attributes. Mismatching these invalidates the `aria-*` attributes. [Learn more](https://web.dev/aria-allowed-attr/).","score":null,"scoreDisplayMode":"notApplicable"},"aria-hidden-body":{"id":"aria-hidden-body","title":"`[aria-hidden=\"true\"]` is not present on the document `\u003cbody>`","description":"Assistive technologies, like screen readers, work inconsistently when `aria-hidden=\"true\"` is set on the document `\u003cbody>`. [Learn more](https://web.dev/aria-hidden-body/).","score":1,"scoreDisplayMode":"binary","details":{"type":"table","headings":[],"items":[]}},"aria-hidden-focus":{"id":"aria-hidden-focus","title":"`[aria-hidden=\"true\"]` elements do not contain focusable descendents","description":"Focusable descendents within an `[aria-hidden=\"true\"]` element prevent those interactive elements from being available to users of assistive technologies like screen readers. [Learn more](https://web.dev/aria-hidden-focus/).","score":null,"scoreDisplayMode":"notApplicable"},"aria-input-field-name":{"id":"aria-input-field-name","title":"ARIA input fields have accessible names","description":"When an input field doesn't have an accessible name, screen readers announce it with a generic name, making it unusable for users who rely on screen readers. [Learn more](https://web.dev/aria-input-field-name/).","score":null,"scoreDisplayMode":"notApplicable"},"aria-required-attr":{"id":"aria-required-attr","title":"`[role]`s have all required `[aria-*]` attributes","description":"Some ARIA roles have required attributes that describe the state of the element to screen readers. [Learn more](https://web.dev/aria-required-attr/).","score":null,"scoreDisplayMode":"notApplicable"},"aria-required-children":{"id":"aria-required-children","title":"Elements with an ARIA `[role]` that require children to contain a specific `[role]` have all required children.","description":"Some ARIA parent roles must contain specific child roles to perform their intended accessibility functions. [Learn more](https://web.dev/aria-required-children/).","score":null,"scoreDisplayMode":"notApplicable"},"aria-required-parent":{"id":"aria-required-parent","title":"`[role]`s are contained by their required parent element","description":"Some ARIA child roles must be contained by specific parent roles to properly perform their intended accessibility functions. [Learn more](https://web.dev/aria-required-parent/).","score":null,"scoreDisplayMode":"notApplicable"},"aria-roles":{"id":"aria-roles","title":"`[role]` values are valid","description":"ARIA roles must have valid values in order to perform their intended accessibility functions. [Learn more](https://web.dev/aria-roles/).","score":null,"scoreDisplayMode":"notApplicable"},"aria-toggle-field-name":{"id":"aria-toggle-field-name","title":"ARIA toggle fields have accessible names","description":"When a toggle field doesn't have an accessible name, screen readers announce it with a generic name, making it unusable for users who rely on screen readers. [Learn more](https://web.dev/aria-toggle-field-name/).","score":null,"scoreDisplayMode":"notApplicable"},"aria-valid-attr-value":{"id":"aria-valid-attr-value","title":"`[aria-*]` attributes have valid values","description":"Assistive technologies, like screen readers, can't interpret ARIA attributes with invalid values. [Learn more](https://web.dev/aria-valid-attr-value/).","score":null,"scoreDisplayMode":"notApplicable"},"aria-valid-attr":{"id":"aria-valid-attr","title":"`[aria-*]` attributes are valid and not misspelled","description":"Assistive technologies, like screen readers, can't interpret ARIA attributes with invalid names. [Learn more](https://web.dev/aria-valid-attr/).","score":null,"scoreDisplayMode":"notApplicable"},"button-name":{"id":"button-name","title":"Buttons have an accessible name","description":"When a button doesn't have an accessible name, screen readers announce it as \"button\", making it unusable for users who rely on screen readers. [Learn more](https://web.dev/button-name/).","score":null,"scoreDisplayMode":"notApplicable"},"bypass":{"id":"bypass","title":"The page contains a heading, skip link, or landmark region","description":"Adding ways to bypass repetitive content lets keyboard users navigate the page more efficiently. [Learn more](https://web.dev/bypass/).","score":1,"scoreDisplayMode":"binary","details":{"type":"table","headings":[],"items":[]}},"color-contrast":{"id":"color-contrast","title":"Background and foreground colors have a sufficient contrast ratio","description":"Low-contrast text is difficult or impossible for many users to read. [Learn more](https://web.dev/color-contrast/).","score":1,"scoreDisplayMode":"binary","details":{"type":"table","headings":[],"items":[]}},"definition-list":{"id":"definition-list","title":"`\u003cdl>`'s contain only properly-ordered `\u003cdt>` and `\u003cdd>` groups, `\u003cscript>`, `\u003ctemplate>` or `\u003cdiv>` elements.","description":"When definition lists are not properly marked up, screen readers may produce confusing or inaccurate output. [Learn more](https://web.dev/definition-list/).","score":null,"scoreDisplayMode":"notApplicable"},"dlitem":{"id":"dlitem","title":"Definition list items are wrapped in `\u003cdl>` elements","description":"Definition list items (`\u003cdt>` and `\u003cdd>`) must be wrapped in a parent `\u003cdl>` element to ensure that screen readers can properly announce them. [Learn more](https://web.dev/dlitem/).","score":null,"scoreDisplayMode":"notApplicable"},"document-title":{"id":"document-title","title":"Document has a `\u003ctitle>` element","description":"The title gives screen reader users an overview of the page, and search engine users rely on it heavily to determine if a page is relevant to their search. [Learn more](https://web.dev/document-title/).","score":1,"scoreDisplayMode":"binary","details":{"type":"table","headings":[],"items":[]}},"duplicate-id-active":{"id":"duplicate-id-active","title":"`[id]` attributes on active, focusable elements are unique","description":"All focusable elements must have a unique `id` to ensure that they're visible to assistive technologies. [Learn more](https://web.dev/duplicate-id-active/).","score":1,"scoreDisplayMode":"binary","details":{"type":"table","headings":[],"items":[]}},"duplicate-id-aria":{"id":"duplicate-id-aria","title":"ARIA IDs are unique","description":"The value of an ARIA ID must be unique to prevent other instances from being overlooked by assistive technologies. [Learn more](https://web.dev/duplicate-id-aria/).","score":null,"scoreDisplayMode":"notApplicable"},"form-field-multiple-labels":{"id":"form-field-multiple-labels","title":"No form fields have multiple labels","description":"Form fields with multiple labels can be confusingly announced by assistive technologies like screen readers which use either the first, the last, or all of the labels. [Learn more](https://web.dev/form-field-multiple-labels/).","score":null,"scoreDisplayMode":"notApplicable"},"frame-title":{"id":"frame-title","title":"`\u003cframe>` or `\u003ciframe>` elements have a title","description":"Screen reader users rely on frame titles to describe the contents of frames. [Learn more](https://web.dev/frame-title/).","score":null,"scoreDisplayMode":"notApplicable"},"heading-order":{"id":"heading-order","title":"Heading elements appear in a sequentially-descending order","description":"Properly ordered headings that do not skip levels convey the semantic structure of the page, making it easier to navigate and understand when using assistive technologies. [Learn more](https://web.dev/heading-order/).","score":null,"scoreDisplayMode":"notApplicable"},"html-has-lang":{"id":"html-has-lang","title":"`\u003chtml>` element has a `[lang]` attribute","description":"If a page doesn't specify a lang attribute, a screen reader assumes that the page is in the default language that the user chose when setting up the screen reader. If the page isn't actually in the default language, then the screen reader might not announce the page's text correctly. [Learn more](https://web.dev/html-has-lang/).","score":1,"scoreDisplayMode":"binary","details":{"type":"table","headings":[],"items":[]}},"html-lang-valid":{"id":"html-lang-valid","title":"`\u003chtml>` element has a valid value for its `[lang]` attribute","description":"Specifying a valid [BCP 47 language](https://www.w3.org/International/questions/qa-choosing-language-tags#question) helps screen readers announce text properly. [Learn more](https://web.dev/html-lang-valid/).","score":1,"scoreDisplayMode":"binary","details":{"type":"table","headings":[],"items":[]}},"image-alt":{"id":"image-alt","title":"Image elements have `[alt]` attributes","description":"Informative elements should aim for short, descriptive alternate text. Decorative elements can be ignored with an empty alt attribute. [Learn more](https://web.dev/image-alt/).","score":1,"scoreDisplayMode":"binary","details":{"type":"table","headings":[],"items":[]}},"input-image-alt":{"id":"input-image-alt","title":"`\u003cinput type=\"image\">` elements have `[alt]` text","description":"When an image is being used as an `\u003cinput>` button, providing alternative text can help screen reader users understand the purpose of the button. [Learn more](https://web.dev/input-image-alt/).","score":null,"scoreDisplayMode":"notApplicable"},"label":{"id":"label","title":"Form elements have associated labels","description":"Labels ensure that form controls are announced properly by assistive technologies, like screen readers. [Learn more](https://web.dev/label/).","score":null,"scoreDisplayMode":"notApplicable"},"layout-table":{"id":"layout-table","title":"Presentational `\u003ctable>` elements avoid using `\u003cth>`, `\u003ccaption>` or the `[summary]` attribute.","description":"A table being used for layout purposes should not include data elements, such as the th or caption elements or the summary attribute, because this can create a confusing experience for screen reader users. [Learn more](https://web.dev/layout-table/).","score":null,"scoreDisplayMode":"notApplicable"},"link-name":{"id":"link-name","title":"Links have a discernible name","description":"Link text (and alternate text for images, when used as links) that is discernible, unique, and focusable improves the navigation experience for screen reader users. [Learn more](https://web.dev/link-name/).","score":1,"scoreDisplayMode":"binary","details":{"type":"table","headings":[],"items":[]}},"list":{"id":"list","title":"Lists contain only `\u003cli>` elements and script supporting elements (`\u003cscript>` and `\u003ctemplate>`).","description":"Screen readers have a specific way of announcing lists. Ensuring proper list structure aids screen reader output. [Learn more](https://web.dev/list/).","score":null,"scoreDisplayMode":"notApplicable"},"listitem":{"id":"listitem","title":"List items (`\u003cli>`) are contained within `\u003cul>` or `\u003col>` parent elements","description":"Screen readers require list items (`\u003cli>`) to be contained within a parent `\u003cul>` or `\u003col>` to be announced properly. [Learn more](https://web.dev/listitem/).","score":null,"scoreDisplayMode":"notApplicable"},"meta-refresh":{"id":"meta-refresh","title":"The document does not use `\u003cmeta http-equiv=\"refresh\">`","description":"Users do not expect a page to refresh automatically, and doing so will move focus back to the top of the page. This may create a frustrating or confusing experience. [Learn more](https://web.dev/meta-refresh/).","score":null,"scoreDisplayMode":"notApplicable"},"meta-viewport":{"id":"meta-viewport","title":"`[user-scalable=\"no\"]` is not used in the `\u003cmeta name=\"viewport\">` element and the `[maximum-scale]` attribute is not less than 5.","description":"Disabling zooming is problematic for users with low vision who rely on screen magnification to properly see the contents of a web page. [Learn more](https://web.dev/meta-viewport/).","score":1,"scoreDisplayMode":"binary","details":{"type":"table","headings":[],"items":[]}},"object-alt":{"id":"object-alt","title":"`\u003cobject>` elements have `[alt]` text","description":"Screen readers cannot translate non-text content. Adding alt text to `\u003cobject>` elements helps screen readers convey meaning to users. [Learn more](https://web.dev/object-alt/).","score":null,"scoreDisplayMode":"notApplicable"},"tabindex":{"id":"tabindex","title":"No element has a `[tabindex]` value greater than 0","description":"A value greater than 0 implies an explicit navigation ordering. Although technically valid, this often creates frustrating experiences for users who rely on assistive technologies. [Learn more](https://web.dev/tabindex/).","score":null,"scoreDisplayMode":"notApplicable"},"td-headers-attr":{"id":"td-headers-attr","title":"Cells in a `\u003ctable>` element that use the `[headers]` attribute refer to table cells within the same table.","description":"Screen readers have features to make navigating tables easier. Ensuring `\u003ctd>` cells using the `[headers]` attribute only refer to other cells in the same table may improve the experience for screen reader users. [Learn more](https://web.dev/td-headers-attr/).","score":null,"scoreDisplayMode":"notApplicable"},"th-has-data-cells":{"id":"th-has-data-cells","title":"`\u003cth>` elements and elements with `[role=\"columnheader\"/\"rowheader\"]` have data cells they describe.","description":"Screen readers have features to make navigating tables easier. Ensuring table headers always refer to some set of cells may improve the experience for screen reader users. [Learn more](https://web.dev/th-has-data-cells/).","score":null,"scoreDisplayMode":"notApplicable"},"valid-lang":{"id":"valid-lang","title":"`[lang]` attributes have a valid value","description":"Specifying a valid [BCP 47 language](https://www.w3.org/International/questions/qa-choosing-language-tags#question) on elements helps ensure that text is pronounced correctly by a screen reader. [Learn more](https://web.dev/valid-lang/).","score":null,"scoreDisplayMode":"notApplicable"},"video-caption":{"id":"video-caption","title":"`\u003cvideo>` elements contain a `\u003ctrack>` element with `[kind=\"captions\"]`","description":"When a video provides a caption it is easier for deaf and hearing impaired users to access its information. [Learn more](https://web.dev/video-caption/).","score":null,"scoreDisplayMode":"notApplicable"},"video-description":{"id":"video-description","title":"`\u003cvideo>` elements contain a `\u003ctrack>` element with `[kind=\"description\"]`","description":"Audio descriptions provide relevant information for videos that dialogue cannot, such as facial expressions and scenes. [Learn more](https://web.dev/video-description/).","score":null,"scoreDisplayMode":"notApplicable"},"custom-controls-labels":{"id":"custom-controls-labels","title":"Custom controls have associated labels","description":"Custom interactive controls have associated labels, provided by aria-label or aria-labelledby. [Learn more](https://web.dev/custom-controls-labels/).","score":null,"scoreDisplayMode":"manual"},"custom-controls-roles":{"id":"custom-controls-roles","title":"Custom controls have ARIA roles","description":"Custom interactive controls have appropriate ARIA roles. [Learn more](https://web.dev/custom-control-roles/).","score":null,"scoreDisplayMode":"manual"},"focus-traps":{"id":"focus-traps","title":"User focus is not accidentally trapped in a region","description":"A user can tab into and out of any control or region without accidentally trapping their focus. [Learn more](https://web.dev/focus-traps/).","score":null,"scoreDisplayMode":"manual"},"focusable-controls":{"id":"focusable-controls","title":"Interactive controls are keyboard focusable","description":"Custom interactive controls are keyboard focusable and display a focus indicator. [Learn more](https://web.dev/focusable-controls/).","score":null,"scoreDisplayMode":"manual"},"interactive-element-affordance":{"id":"interactive-element-affordance","title":"Interactive elements indicate their purpose and state","description":"Interactive elements, such as links and buttons, should indicate their state and be distinguishable from non-interactive elements. [Learn more](https://web.dev/interactive-element-affordance/).","score":null,"scoreDisplayMode":"manual"},"logical-tab-order":{"id":"logical-tab-order","title":"The page has a logical tab order","description":"Tabbing through the page follows the visual layout. Users cannot focus elements that are offscreen. [Learn more](https://web.dev/logical-tab-order/).","score":null,"scoreDisplayMode":"manual"},"managed-focus":{"id":"managed-focus","title":"The user's focus is directed to new content added to the page","description":"If new content, such as a dialog, is added to the page, the user's focus is directed to it. [Learn more](https://web.dev/managed-focus/).","score":null,"scoreDisplayMode":"manual"},"offscreen-content-hidden":{"id":"offscreen-content-hidden","title":"Offscreen content is hidden from assistive technology","description":"Offscreen content is hidden with display: none or aria-hidden=true. [Learn more](https://web.dev/offscreen-content-hidden/).","score":null,"scoreDisplayMode":"manual"},"use-landmarks":{"id":"use-landmarks","title":"HTML5 landmark elements are used to improve navigation","description":"Landmark elements (\u003cmain>, \u003cnav>, etc.) are used to improve the keyboard navigation of the page for assistive technology. [Learn more](https://web.dev/use-landmarks/).","score":null,"scoreDisplayMode":"manual"},"visual-order-follows-dom":{"id":"visual-order-follows-dom","title":"Visual order on the page follows DOM order","description":"DOM order matches the visual order, improving navigation for assistive technology. [Learn more](https://web.dev/visual-order-follows-dom/).","score":null,"scoreDisplayMode":"manual"},"uses-long-cache-ttl":{"id":"uses-long-cache-ttl","title":"Serve static assets with an efficient cache policy","description":"A long cache lifetime can speed up repeat visits to your page. [Learn more](https://web.dev/uses-long-cache-ttl/).","score":0,"scoreDisplayMode":"numeric","numericValue":3381321.5,"numericUnit":"byte","displayValue":"42 resources found","details":{"type":"table","headings":[{"key":"url","itemType":"url","text":"URL"},{"key":"cacheLifetimeMs","itemType":"ms","text":"Cache TTL","displayUnit":"duration"},{"key":"totalBytes","itemType":"bytes","text":"Transfer Size","displayUnit":"kb","granularity":1}],"items":[{"url":"https://www.pinayu.com/proyectos/18/edificio-frankfurt.jpg","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":247120,"wastedBytes":247120},{"url":"https://www.pinayu.com/newimages/pinayu-david-foto.jpg","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":202856,"wastedBytes":202856},{"url":"https://www.pinayu.com/proyectos/16/timelapse-puente-autobus.jpg","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":202532,"wastedBytes":202532},{"url":"https://www.pinayu.com/proyectos/7/caratulas-piezas-musicales.jpg","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":189403,"wastedBytes":189403},{"url":"https://www.pinayu.com/proyectos/2/the-cobardes-monstruos-juntos.jpg","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":181452,"wastedBytes":181452},{"url":"https://www.pinayu.com/proyectos/10/exterior-restaurante-noche.jpg","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":170284,"wastedBytes":170284},{"url":"https://www.pinayu.com/proyectos/17/eolicas-foto-principal.jpg","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":161652,"wastedBytes":161652},{"url":"https://www.pinayu.com/proyectos/14/macro-fotografia-hoja-en-espiral.jpg","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":156505,"wastedBytes":156505},{"url":"https://www.pinayu.com/newimages/david/david-lopez-gonzalez-disenador-ilustrador.jpg","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":150550,"wastedBytes":150550},{"url":"https://www.pinayu.com/proyectos/3/diorama-pinayu-principal.jpg","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":146740,"wastedBytes":146740},{"url":"https://www.pinayu.com/proyectos/13/iphoncitos-personajes-iphone.jpg","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":135190,"wastedBytes":135190},{"url":"https://www.pinayu.com/proyectos/5/portada-cortometraje-malaga.jpg","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":131896,"wastedBytes":131896},{"url":"https://www.pinayu.com/proyectos/12/ilustracion-graciosa-todo-archivado.jpg","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":130460,"wastedBytes":130460},{"url":"https://www.pinayu.com/proyectos/4/animal-principal.jpg","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":123192,"wastedBytes":123192},{"url":"https://www.pinayu.com/proyectos/19/zorro-corto-animado-sin-palabras.jpg","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":112244,"wastedBytes":112244},{"url":"https://www.pinayu.com/proyectos/11/des-papiers-caches-sous-les-ailes.jpg","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":110318,"wastedBytes":110318},{"url":"https://www.pinayu.com/proyectos/15/game-over-ilustracion-principal.jpg","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":105076,"wastedBytes":105076},{"url":"https://www.pinayu.com/proyectos/23/logotipos-creados-por-pinayu.jpg","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":96324,"wastedBytes":96324},{"url":"https://www.pinayu.com/proyectos/20/snowboard-animacion.jpg","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":87902,"wastedBytes":87902},{"url":"https://www.pinayu.com/proyectos/22/pinayu-animaciones.jpg","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":84360,"wastedBytes":84360},{"url":"https://www.pinayu.com/proyectos/24/diseno-capturas-web.jpg","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":76708,"wastedBytes":76708},{"url":"https://www.pinayu.com/proyectos/9/lapu-lapu-logo-propuesta-favorita.jpg","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":61253,"wastedBytes":61253},{"url":"https://www.pinayu.com/proyectos/8/zyp-propuesta-logotipo.jpg","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":55672,"wastedBytes":55672},{"url":"https://www.pinayu.com/proyectos/1/trampolin-atardecer-pareja.jpg","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":46762,"wastedBytes":46762},{"url":"https://www.pinayu.com/newimages/david/cv-pdf.jpg","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":39079,"wastedBytes":39079},{"url":"https://www.pinayu.com/proyectos/6/raxia-consulting-logotipo.jpg","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":29162,"wastedBytes":29162},{"url":"https://www.pinayu.com/proyectos/21/eden-creativo-diseno-grafico-web.jpg","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":25202,"wastedBytes":25202},{"url":"https://www.pinayu.com/blog/images/de-que-escribir-cuando-no-sabes-de-que-escribir.jpg","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":23184,"wastedBytes":23184},{"url":"https://www.pinayu.com/newstyle.css?ver=101","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":16827,"wastedBytes":16827},{"url":"https://www.pinayu.com/newimages/cargador.gif","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":16657,"wastedBytes":16657},{"url":"https://www.pinayu.com/newimages/subir-arriba.svg","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":9272,"wastedBytes":9272},{"url":"https://www.pinayu.com/images/linkedin.svg","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":8738,"wastedBytes":8738},{"url":"https://www.pinayu.com/images/instagram.svg","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":7535,"wastedBytes":7535},{"url":"https://www.pinayu.com/functions.js?ver=101","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":6992,"wastedBytes":6992},{"url":"https://www.pinayu.com/images/500px.svg","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":4954,"wastedBytes":4954},{"url":"https://www.pinayu.com/newimages/logo.svg","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":3608,"wastedBytes":3608},{"url":"https://www.pinayu.com/newimages/fotografia.svg","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":3537,"wastedBytes":3537},{"url":"https://www.pinayu.com/newimages/diseno-grafico.svg","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":2707,"wastedBytes":2707},{"url":"https://www.pinayu.com/newimages/ilustracion.svg","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":1289,"wastedBytes":1289},{"url":"https://www.pinayu.com/newimages/video-animacion.svg","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":981,"wastedBytes":981},{"url":"https://www.pinayu.com/newimages/menu-puntos.svg","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":733,"wastedBytes":733},{"url":"https://www.google-analytics.com/analytics.js","debugData":{"type":"debugdata","public":true,"max-age":7200},"cacheLifetimeMs":7200000,"cacheHitProbability":0.25,"totalBytes":19218,"wastedBytes":14413.5}],"summary":{"wastedBytes":3381321.5}}},"total-byte-weight":{"id":"total-byte-weight","title":"Avoid enormous network payloads","description":"Large network payloads cost users real money and are highly correlated with long load times. [Learn more](https://web.dev/total-byte-weight/).","score":0.71,"scoreDisplayMode":"numeric","numericValue":3442549,"numericUnit":"byte","displayValue":"Total size was 3,362 KiB","details":{"type":"table","headings":[{"key":"url","itemType":"url","text":"URL"},{"key":"totalBytes","itemType":"bytes","text":"Transfer Size"}],"items":[{"url":"https://www.pinayu.com/proyectos/18/edificio-frankfurt.jpg","totalBytes":247120},{"url":"https://www.pinayu.com/newimages/pinayu-david-foto.jpg","totalBytes":202856},{"url":"https://www.pinayu.com/proyectos/16/timelapse-puente-autobus.jpg","totalBytes":202532},{"url":"https://www.pinayu.com/proyectos/7/caratulas-piezas-musicales.jpg","totalBytes":189403},{"url":"https://www.pinayu.com/proyectos/2/the-cobardes-monstruos-juntos.jpg","totalBytes":181452},{"url":"https://www.pinayu.com/proyectos/10/exterior-restaurante-noche.jpg","totalBytes":170284},{"url":"https://www.pinayu.com/proyectos/17/eolicas-foto-principal.jpg","totalBytes":161652},{"url":"https://www.pinayu.com/proyectos/14/macro-fotografia-hoja-en-espiral.jpg","totalBytes":156505},{"url":"https://www.pinayu.com/newimages/david/david-lopez-gonzalez-disenador-ilustrador.jpg","totalBytes":150550},{"url":"https://www.pinayu.com/proyectos/3/diorama-pinayu-principal.jpg","totalBytes":146740}]}},"offscreen-images":{"id":"offscreen-images","title":"Defer offscreen images","description":"Consider lazy-loading offscreen and hidden images after all critical resources have finished loading to lower time to interactive. [Learn more](https://web.dev/offscreen-images/).","score":1,"scoreDisplayMode":"numeric","numericValue":0,"numericUnit":"millisecond","displayValue":"Potential savings of 645 KiB","warnings":[],"details":{"type":"opportunity","headings":[{"key":"url","valueType":"thumbnail","label":""},{"key":"url","valueType":"url","label":"URL"},{"key":"totalBytes","valueType":"bytes","label":"Resource Size"},{"key":"wastedBytes","valueType":"bytes","label":"Potential Savings"}],"items":[{"url":"https://www.pinayu.com/proyectos/14/macro-fotografia-hoja-en-espiral.jpg","requestStartTime":1188599.016657,"totalBytes":156175,"wastedBytes":156175,"wastedPercent":100},{"url":"https://www.pinayu.com/proyectos/4/animal-principal.jpg","requestStartTime":1188599.007259,"totalBytes":122898,"wastedBytes":122898,"wastedPercent":100},{"url":"https://www.pinayu.com/proyectos/19/zorro-corto-animado-sin-palabras.jpg","requestStartTime":1188599.012712,"totalBytes":111968,"wastedBytes":111968,"wastedPercent":100},{"url":"https://www.pinayu.com/proyectos/11/des-papiers-caches-sous-les-ailes.jpg","requestStartTime":1188599.01552,"totalBytes":110042,"wastedBytes":110042,"wastedPercent":100},{"url":"https://www.pinayu.com/proyectos/9/lapu-lapu-logo-propuesta-favorita.jpg","requestStartTime":1188599.009748,"totalBytes":61032,"wastedBytes":61032,"wastedPercent":100},{"url":"https://www.pinayu.com/proyectos/1/trampolin-atardecer-pareja.jpg","requestStartTime":1188599.006758,"totalBytes":46559,"wastedBytes":46559,"wastedPercent":100},{"url":"https://www.pinayu.com/proyectos/6/raxia-consulting-logotipo.jpg","requestStartTime":1188599.013489,"totalBytes":28978,"wastedBytes":28978,"wastedPercent":100},{"url":"https://www.pinayu.com/newimages/cargador.gif","requestStartTime":1188599.453368,"totalBytes":16482,"wastedBytes":16482,"wastedPercent":100},{"url":"https://www.pinayu.com/newimages/fotografia.svg","requestStartTime":1188598.999062,"totalBytes":3378,"wastedBytes":3378,"wastedPercent":100},{"url":"https://www.pinayu.com/newimages/diseno-grafico.svg","requestStartTime":1188598.997721,"totalBytes":2548,"wastedBytes":2548,"wastedPercent":100}],"overallSavingsMs":0,"overallSavingsBytes":660060}},"render-blocking-resources":{"id":"render-blocking-resources","title":"Eliminate render-blocking resources","description":"Resources are blocking the first paint of your page. Consider delivering critical JS/CSS inline and deferring all non-critical JS/styles. [Learn more](https://web.dev/render-blocking-resources/).","score":0.25,"scoreDisplayMode":"numeric","numericValue":2834,"numericUnit":"millisecond","displayValue":"Potential savings of 2,830 ms","details":{"type":"opportunity","headings":[{"key":"url","valueType":"url","label":"URL"},{"key":"totalBytes","valueType":"bytes","label":"Transfer Size"},{"key":"wastedMs","valueType":"timespanMs","label":"Potential Savings"}],"items":[{"url":"https://fonts.googleapis.com/css2?family=Lobster&display=swap","totalBytes":956,"wastedMs":779},{"url":"https://www.pinayu.com/newstyle.css?ver=101","totalBytes":16827,"wastedMs":338},{"url":"https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js","totalBytes":30472,"wastedMs":1080},{"url":"https://www.pinayu.com/functions.js?ver=101","totalBytes":6992,"wastedMs":687}],"overallSavingsMs":2834}},"unminified-css":{"id":"unminified-css","title":"Minify CSS","description":"Minifying CSS files can reduce network payload sizes. [Learn more](https://web.dev/unminified-css/).","score":1,"scoreDisplayMode":"numeric","numericValue":0,"numericUnit":"millisecond","displayValue":"Potential savings of 5 KiB","details":{"type":"opportunity","headings":[{"key":"url","valueType":"url","label":"URL"},{"key":"totalBytes","valueType":"bytes","label":"Transfer Size"},{"key":"wastedBytes","valueType":"bytes","label":"Potential Savings"}],"items":[{"url":"https://www.pinayu.com/newstyle.css?ver=101","totalBytes":16827,"wastedBytes":4704,"wastedPercent":27.957247508106164}],"overallSavingsMs":0,"overallSavingsBytes":4704}},"unminified-javascript":{"id":"unminified-javascript","title":"Minify JavaScript","description":"Minifying JavaScript files can reduce payload sizes and script parse time. [Learn more](https://web.dev/unminified-javascript/).","score":1,"scoreDisplayMode":"numeric","numericValue":0,"numericUnit":"millisecond","displayValue":"","warnings":[],"details":{"type":"opportunity","headings":[],"items":[],"overallSavingsMs":0,"overallSavingsBytes":0}},"unused-css-rules":{"id":"unused-css-rules","title":"Remove unused CSS","description":"Remove dead rules from stylesheets and defer the loading of CSS not used for above-the-fold content to reduce unnecessary bytes consumed by network activity. [Learn more](https://web.dev/unused-css-rules/).","score":0.86,"scoreDisplayMode":"numeric","numericValue":170,"numericUnit":"millisecond","displayValue":"Potential savings of 13 KiB","details":{"type":"opportunity","headings":[{"key":"url","valueType":"url","label":"URL"},{"key":"totalBytes","valueType":"bytes","label":"Transfer Size"},{"key":"wastedBytes","valueType":"bytes","label":"Potential Savings"}],"items":[{"url":"https://www.pinayu.com/newstyle.css?ver=101","wastedBytes":12851,"wastedPercent":76.3720427524919,"totalBytes":16827}],"overallSavingsMs":170,"overallSavingsBytes":12851}},"unused-javascript":{"id":"unused-javascript","title":"Remove unused JavaScript","description":"Remove unused JavaScript to reduce bytes consumed by network activity. [Learn more](https://web.dev/unused-javascript/).","score":1,"scoreDisplayMode":"numeric","numericValue":0,"numericUnit":"millisecond","displayValue":"","details":{"type":"opportunity","headings":[],"items":[],"overallSavingsMs":0,"overallSavingsBytes":0}},"uses-webp-images":{"id":"uses-webp-images","title":"Serve images in next-gen formats","description":"Image formats like JPEG 2000, JPEG XR, and WebP often provide better compression than PNG or JPEG, which means faster downloads and less data consumption. [Learn more](https://web.dev/uses-webp-images/).","score":0.11,"scoreDisplayMode":"numeric","numericValue":4050,"numericUnit":"millisecond","displayValue":"Potential savings of 817 KiB","warnings":[],"details":{"type":"opportunity","headings":[{"key":"url","valueType":"thumbnail","label":""},{"key":"url","valueType":"url","label":"URL"},{"key":"totalBytes","valueType":"bytes","label":"Resource Size"},{"key":"wastedBytes","valueType":"bytes","label":"Potential Savings"}],"items":[{"url":"https://www.pinayu.com/proyectos/18/edificio-frankfurt.jpg","fromProtocol":true,"isCrossOrigin":false,"totalBytes":246691,"wastedBytes":85155},{"url":"https://www.pinayu.com/newimages/pinayu-david-foto.jpg","fromProtocol":true,"isCrossOrigin":false,"totalBytes":202481,"wastedBytes":79645},{"url":"https://www.pinayu.com/proyectos/3/diorama-pinayu-principal.jpg","fromProtocol":true,"isCrossOrigin":false,"totalBytes":146427,"wastedBytes":67261},{"url":"https://www.pinayu.com/proyectos/7/caratulas-piezas-musicales.jpg","fromProtocol":true,"isCrossOrigin":false,"totalBytes":189037,"wastedBytes":66439},{"url":"https://www.pinayu.com/proyectos/12/ilustracion-graciosa-todo-archivado.jpg","fromProtocol":true,"isCrossOrigin":false,"totalBytes":130166,"wastedBytes":65772},{"url":"https://www.pinayu.com/proyectos/13/iphoncitos-personajes-iphone.jpg","fromProtocol":true,"isCrossOrigin":false,"totalBytes":134887,"wastedBytes":63691},{"url":"https://www.pinayu.com/proyectos/15/game-over-ilustracion-principal.jpg","fromProtocol":true,"isCrossOrigin":false,"totalBytes":104809,"wastedBytes":54537},{"url":"https://www.pinayu.com/proyectos/10/exterior-restaurante-noche.jpg","fromProtocol":true,"isCrossOrigin":false,"totalBytes":169945,"wastedBytes":52903},{"url":"https://www.pinayu.com/proyectos/11/des-papiers-caches-sous-les-ailes.jpg","fromProtocol":true,"isCrossOrigin":false,"totalBytes":110042,"wastedBytes":51116},{"url":"https://www.pinayu.com/proyectos/23/logotipos-creados-por-pinayu.jpg","fromProtocol":true,"isCrossOrigin":false,"totalBytes":96067,"wastedBytes":47837},{"url":"https://www.pinayu.com/proyectos/22/pinayu-animaciones.jpg","fromProtocol":true,"isCrossOrigin":false,"totalBytes":84112,"wastedBytes":47300},{"url":"https://www.pinayu.com/newimages/david/david-lopez-gonzalez-disenador-ilustrador.jpg","fromProtocol":true,"isCrossOrigin":false,"totalBytes":150229,"wastedBytes":46481},{"url":"https://www.pinayu.com/proyectos/20/snowboard-animacion.jpg","fromProtocol":true,"isCrossOrigin":false,"totalBytes":87653,"wastedBytes":46177},{"url":"https://www.pinayu.com/proyectos/19/zorro-corto-animado-sin-palabras.jpg","fromProtocol":true,"isCrossOrigin":false,"totalBytes":111968,"wastedBytes":33468},{"url":"https://www.pinayu.com/proyectos/14/macro-fotografia-hoja-en-espiral.jpg","fromProtocol":true,"isCrossOrigin":false,"totalBytes":156175,"wastedBytes":20475},{"url":"https://www.pinayu.com/proyectos/17/eolicas-foto-principal.jpg","fromProtocol":true,"isCrossOrigin":false,"totalBytes":161322,"wastedBytes":8808}],"overallSavingsMs":4050,"overallSavingsBytes":837065}},"uses-optimized-images":{"id":"uses-optimized-images","title":"Efficiently encode images","description":"Optimized images load faster and consume less cellular data. [Learn more](https://web.dev/uses-optimized-images/).","score":0.86,"scoreDisplayMode":"numeric","numericValue":170,"numericUnit":"millisecond","displayValue":"Potential savings of 13 KiB","warnings":[],"details":{"type":"opportunity","headings":[{"key":"url","valueType":"thumbnail","label":""},{"key":"url","valueType":"url","label":"URL"},{"key":"totalBytes","valueType":"bytes","label":"Resource Size"},{"key":"wastedBytes","valueType":"bytes","label":"Potential Savings"}],"items":[{"url":"https://www.pinayu.com/proyectos/18/edificio-frankfurt.jpg","fromProtocol":true,"isCrossOrigin":false,"totalBytes":246691,"wastedBytes":13598}],"overallSavingsMs":170,"overallSavingsBytes":13598}},"uses-text-compression":{"id":"uses-text-compression","title":"Enable text compression","description":"Text-based resources should be served with compression (gzip, deflate or brotli) to minimize total network bytes. [Learn more](https://web.dev/uses-text-compression/).","score":0.86,"scoreDisplayMode":"numeric","numericValue":170,"numericUnit":"millisecond","displayValue":"Potential savings of 18 KiB","details":{"type":"opportunity","headings":[{"key":"url","valueType":"url","label":"URL"},{"key":"totalBytes","valueType":"bytes","label":"Transfer Size"},{"key":"wastedBytes","valueType":"bytes","label":"Potential Savings"}],"items":[{"url":"https://www.pinayu.com/newstyle.css?ver=101","totalBytes":16654,"wastedBytes":12942},{"url":"https://www.pinayu.com/functions.js?ver=101","totalBytes":6827,"wastedBytes":5265}],"overallSavingsMs":170,"overallSavingsBytes":18207}},"uses-responsive-images":{"id":"uses-responsive-images","title":"Properly size images","description":"Serve images that are appropriately-sized to save cellular data and improve load time. [Learn more](https://web.dev/uses-responsive-images/).","score":1,"scoreDisplayMode":"numeric","numericValue":0,"numericUnit":"millisecond","displayValue":"","warnings":[],"details":{"type":"opportunity","headings":[],"items":[],"overallSavingsMs":0,"overallSavingsBytes":0}},"efficient-animated-content":{"id":"efficient-animated-content","title":"Use video formats for animated content","description":"Large GIFs are inefficient for delivering animated content. Consider using MPEG4/WebM videos for animations and PNG/WebP for static images instead of GIF to save network bytes. [Learn more](https://web.dev/efficient-animated-content/)","score":1,"scoreDisplayMode":"numeric","numericValue":0,"numericUnit":"millisecond","displayValue":"","details":{"type":"opportunity","headings":[],"items":[],"overallSavingsMs":0,"overallSavingsBytes":0}},"duplicated-javascript":{"id":"duplicated-javascript","title":"Remove duplicate modules in JavaScript bundles","description":"Remove large, duplicate JavaScript modules from bundles to reduce unnecessary bytes consumed by network activity. ","score":1,"scoreDisplayMode":"numeric","numericValue":0,"numericUnit":"millisecond","displayValue":"","details":{"type":"opportunity","headings":[],"items":[],"overallSavingsMs":0,"overallSavingsBytes":0}},"legacy-javascript":{"id":"legacy-javascript","title":"Avoid serving legacy JavaScript to modern browsers","description":"Polyfills and transforms enable legacy browsers to use new JavaScript features. However, many aren't necessary for modern browsers. For your bundled JavaScript, adopt a modern script deployment strategy using module/nomodule feature detection to reduce the amount of code shipped to modern browsers, while retaining support for legacy browsers. [Learn More](https://philipwalton.com/articles/deploying-es2015-code-in-production-today/)","score":1,"scoreDisplayMode":"numeric","numericValue":0,"numericUnit":"millisecond","displayValue":"","details":{"type":"opportunity","headings":[],"items":[],"overallSavingsMs":0,"overallSavingsBytes":0}},"appcache-manifest":{"id":"appcache-manifest","title":"Avoids Application Cache","description":"Application Cache is deprecated. [Learn more](https://web.dev/appcache-manifest/).","score":1,"scoreDisplayMode":"binary"},"doctype":{"id":"doctype","title":"Page lacks the HTML doctype, thus triggering quirks-mode","description":"Specifying a doctype prevents the browser from switching to quirks-mode. [Learn more](https://web.dev/doctype/).","score":0,"scoreDisplayMode":"binary","explanation":"Expected publicId to be an empty string"},"charset":{"id":"charset","title":"Properly defines charset","description":"A character encoding declaration is required. It can be done with a `\u003cmeta>` tag in the first 1024 bytes of the HTML or in the Content-Type HTTP response header. [Learn more](https://web.dev/charset/).","score":1,"scoreDisplayMode":"binary"},"dom-size":{"id":"dom-size","title":"Avoids an excessive DOM size","description":"A large DOM will increase memory usage, cause longer [style calculations](https://developers.google.com/web/fundamentals/performance/rendering/reduce-the-scope-and-complexity-of-style-calculations), and produce costly [layout reflows](https://developers.google.com/speed/articles/reflow). [Learn more](https://web.dev/dom-size/).","score":1,"scoreDisplayMode":"numeric","numericValue":309,"numericUnit":"element","displayValue":"309 elements","details":{"type":"table","headings":[{"key":"statistic","itemType":"text","text":"Statistic"},{"key":"element","itemType":"code","text":"Element"},{"key":"value","itemType":"numeric","text":"Value"}],"items":[{"statistic":"Total DOM Elements","element":"","value":"309"},{"statistic":"Maximum DOM Depth","element":{"type":"code","value":"\u003cimg src=\"newimages/logo.svg\" alt=\"Logo Pinayu.com - botón siguiente sección\" id=\"logo\">"},"value":"6"},{"statistic":"Maximum Child Elements","element":{"type":"code","value":"\u003cdiv id=\"david\">"},"value":"26"}]}},"external-anchors-use-rel-noopener":{"id":"external-anchors-use-rel-noopener","title":"Links to cross-origin destinations are safe","description":"Add `rel=\"noopener\"` or `rel=\"noreferrer\"` to any external links to improve performance and prevent security vulnerabilities. [Learn more](https://web.dev/external-anchors-use-rel-noopener/).","score":1,"scoreDisplayMode":"binary","warnings":[],"details":{"type":"table","headings":[],"items":[]}},"geolocation-on-start":{"id":"geolocation-on-start","title":"Avoids requesting the geolocation permission on page load","description":"Users are mistrustful of or confused by sites that request their location without context. Consider tying the request to a user action instead. [Learn more](https://web.dev/geolocation-on-start/).","score":1,"scoreDisplayMode":"binary","details":{"type":"table","headings":[],"items":[]}},"no-document-write":{"id":"no-document-write","title":"Avoids `document.write()`","description":"For users on slow connections, external scripts dynamically injected via `document.write()` can delay page load by tens of seconds. [Learn more](https://web.dev/no-document-write/).","score":1,"scoreDisplayMode":"binary","details":{"type":"table","headings":[],"items":[]}},"no-vulnerable-libraries":{"id":"no-vulnerable-libraries","title":"Includes front-end JavaScript libraries with known security vulnerabilities","description":"Some third-party scripts may contain known security vulnerabilities that are easily identified and exploited by attackers. [Learn more](https://web.dev/no-vulnerable-libraries/).","score":0,"scoreDisplayMode":"binary","displayValue":"4 vulnerabilities detected","details":{"type":"table","headings":[{"key":"detectedLib","itemType":"link","text":"Library Version"},{"key":"vulnCount","itemType":"text","text":"Vulnerability Count"},{"key":"highestSeverity","itemType":"text","text":"Highest Severity"}],"items":[{"highestSeverity":"Medium","vulnCount":4,"detectedLib":{"text":"jQuery@2.2.4","url":"https://snyk.io/vuln/npm:jquery?lh=2.2.4&utm_source=lighthouse&utm_medium=ref&utm_campaign=audit","type":"link"}}],"summary":{}}},"js-libraries":{"id":"js-libraries","title":"Detected JavaScript libraries","description":"All front-end JavaScript libraries detected on the page. [Learn more](https://web.dev/js-libraries/).","score":1,"scoreDisplayMode":"binary","details":{"type":"table","headings":[{"key":"name","itemType":"text","text":"Name"},{"key":"version","itemType":"text","text":"Version"}],"items":[{"name":"jQuery","version":"2.2.4","npm":"jquery"}],"summary":{},"debugData":{"type":"debugdata","stacks":[{"id":"jquery","version":"2.2.4"},{"id":"jquery-fast"}]}}},"notification-on-start":{"id":"notification-on-start","title":"Avoids requesting the notification permission on page load","description":"Users are mistrustful of or confused by sites that request to send notifications without context. Consider tying the request to user gestures instead. [Learn more](https://web.dev/notification-on-start/).","score":1,"scoreDisplayMode":"binary","details":{"type":"table","headings":[],"items":[]}},"password-inputs-can-be-pasted-into":{"id":"password-inputs-can-be-pasted-into","title":"Allows users to paste into password fields","description":"Preventing password pasting undermines good security policy. [Learn more](https://web.dev/password-inputs-can-be-pasted-into/).","score":1,"scoreDisplayMode":"binary","details":{"type":"table","headings":[],"items":[]}},"uses-http2":{"id":"uses-http2","title":"Use HTTP/2","description":"HTTP/2 offers many benefits over HTTP/1.1, including binary headers, multiplexing, and server push. [Learn more](https://web.dev/uses-http2/).","score":1,"scoreDisplayMode":"binary","numericValue":0,"numericUnit":"millisecond","details":{"type":"opportunity","headings":[],"items":[],"overallSavingsMs":0}},"uses-passive-event-listeners":{"id":"uses-passive-event-listeners","title":"Uses passive listeners to improve scrolling performance","description":"Consider marking your touch and wheel event listeners as `passive` to improve your page's scroll performance. [Learn more](https://web.dev/uses-passive-event-listeners/).","score":1,"scoreDisplayMode":"binary","details":{"type":"table","headings":[],"items":[]}},"meta-description":{"id":"meta-description","title":"Document has a meta description","description":"Meta descriptions may be included in search results to concisely summarize page content. [Learn more](https://web.dev/meta-description/).","score":1,"scoreDisplayMode":"binary"},"http-status-code":{"id":"http-status-code","title":"Page has successful HTTP status code","description":"Pages with unsuccessful HTTP status codes may not be indexed properly. [Learn more](https://web.dev/http-status-code/).","score":1,"scoreDisplayMode":"binary"},"font-size":{"id":"font-size","title":"Document uses legible font sizes","description":"Font sizes less than 12px are too small to be legible and require mobile visitors to “pinch to zoom” in order to read. Strive to have >60% of page text ≥12px. [Learn more](https://web.dev/font-size/).","score":1,"scoreDisplayMode":"binary","displayValue":"100% legible text","details":{"type":"table","headings":[{"key":"source","itemType":"source-location","text":"Source"},{"key":"selector","itemType":"code","text":"Selector"},{"key":"coverage","itemType":"text","text":"% of Page Text"},{"key":"fontSize","itemType":"text","text":"Font Size"}],"items":[{"source":{"type":"code","value":"Legible text"},"selector":"","coverage":"100.00%","fontSize":"≥ 12px"}]}},"link-text":{"id":"link-text","title":"Links have descriptive text","description":"Descriptive link text helps search engines understand your content. [Learn more](https://web.dev/link-text/).","score":1,"scoreDisplayMode":"binary","details":{"type":"table","headings":[],"items":[],"summary":{}}},"crawlable-anchors":{"id":"crawlable-anchors","title":"Links are crawlable","description":"Search engines may use `href` attributes on links to crawl websites. Ensure that the `href` attribute of anchor elements links to an appropriate destination, so more pages of the site can be discovered. [Learn More](https://support.google.com/webmasters/answer/9112205)","score":1,"scoreDisplayMode":"binary","details":{"type":"table","headings":[],"items":[]}},"is-crawlable":{"id":"is-crawlable","title":"Page isn’t blocked from indexing","description":"Search engines are unable to include your pages in search results if they don't have permission to crawl them. [Learn more](https://web.dev/is-crawable/).","score":1,"scoreDisplayMode":"binary","details":{"type":"table","headings":[],"items":[]}},"robots-txt":{"id":"robots-txt","title":"robots.txt is valid","description":"If your robots.txt file is malformed, crawlers may not be able to understand how you want your website to be crawled or indexed. [Learn more](https://web.dev/robots-txt/).","score":1,"scoreDisplayMode":"binary","details":{"type":"table","headings":[],"items":[],"summary":{}}},"tap-targets":{"id":"tap-targets","title":"Tap targets are not sized appropriately","description":"Interactive elements like buttons and links should be large enough (48x48px), and have enough space around them, to be easy enough to tap without overlapping onto other elements. [Learn more](https://web.dev/tap-targets/).","score":0.59,"scoreDisplayMode":"binary","displayValue":"67% appropriately sized tap targets","details":{"type":"table","headings":[{"key":"tapTarget","itemType":"node","text":"Tap Target"},{"key":"size","itemType":"text","text":"Size"},{"key":"overlappingTarget","itemType":"node","text":"Overlapping Target"}],"items":[{"tapTarget":{"type":"node","snippet":"\u003ca href=\"javascript:opcion_logo()\">","path":"2,HTML,1,BODY,1,DIV,1,DIV,0,A","selector":"body > div#header_all > div#puntos_menu > a","boundingRect":{"left":155,"right":205,"top":92.390625,"bottom":112.390625,"width":50,"height":20},"nodeLabel":"Menú resonsive - indicador de sección"},"overlappingTarget":{"type":"node","snippet":"\u003ca href=\"javascript:opcion_logo()\">","path":"2,HTML,1,BODY,1,DIV,0,DIV,2,DIV,0,A","selector":"div#header_all > div#header > div#btn_logo > a","boundingRect":{"left":120,"right":240,"top":15,"bottom":93.390625,"width":120,"height":78.390625},"nodeLabel":"Logo Pinayu.com - botón siguiente sección"},"tapTargetScore":960,"overlappingTargetScore":720,"overlapScoreRatio":0.75,"size":"50x20","width":50,"height":20}]}},"hreflang":{"id":"hreflang","title":"Document has a valid `hreflang`","description":"hreflang links tell search engines what version of a page they should list in search results for a given language or region. [Learn more](https://web.dev/hreflang/).","score":1,"scoreDisplayMode":"binary","details":{"type":"table","headings":[],"items":[]}},"plugins":{"id":"plugins","title":"Document avoids plugins","description":"Search engines can't index plugin content, and many devices restrict plugins or don't support them. [Learn more](https://web.dev/plugins/).","score":1,"scoreDisplayMode":"binary","details":{"type":"table","headings":[],"items":[]}},"canonical":{"id":"canonical","title":"Document has a valid `rel=canonical`","description":"Canonical links suggest which URL to show in search results. [Learn more](https://web.dev/canonical/).","score":1,"scoreDisplayMode":"binary"},"structured-data":{"id":"structured-data","title":"Structured data is valid","description":"Run the [Structured Data Testing Tool](https://search.google.com/structured-data/testing-tool/) and the [Structured Data Linter](http://linter.structured-data.org/) to validate structured data. [Learn more](https://web.dev/structured-data/).","score":null,"scoreDisplayMode":"manual"}},"configSettings":{"output":"json","maxWaitForFcp":30000,"maxWaitForLoad":45000,"throttlingMethod":"simulate","throttling":{"rttMs":150,"throughputKbps":1638.4,"requestLatencyMs":562.5,"downloadThroughputKbps":1474.5600000000002,"uploadThroughputKbps":675,"cpuSlowdownMultiplier":4},"auditMode":false,"gatherMode":false,"disableStorageReset":false,"emulatedFormFactor":"mobile","internalDisableDeviceScreenEmulation":false,"channel":"node","budgets":null,"locale":"en-US","blockedUrlPatterns":null,"additionalTraceCategories":null,"extraHeaders":null,"precomputedLanternData":null,"onlyAudits":null,"onlyCategories":null,"skipAudits":null},"categories":{"performance":{"title":"Performance","auditRefs":[{"id":"first-contentful-paint","weight":15,"group":"metrics"},{"id":"speed-index","weight":15,"group":"metrics"},{"id":"largest-contentful-paint","weight":25,"group":"metrics"},{"id":"interactive","weight":15,"group":"metrics"},{"id":"total-blocking-time","weight":25,"group":"metrics"},{"id":"cumulative-layout-shift","weight":5,"group":"metrics"},{"id":"first-cpu-idle","weight":0},{"id":"max-potential-fid","weight":0},{"id":"first-meaningful-paint","weight":0},{"id":"estimated-input-latency","weight":0},{"id":"render-blocking-resources","weight":0,"group":"load-opportunities"},{"id":"uses-responsive-images","weight":0,"group":"load-opportunities"},{"id":"offscreen-images","weight":0,"group":"load-opportunities"},{"id":"unminified-css","weight":0,"group":"load-opportunities"},{"id":"unminified-javascript","weight":0,"group":"load-opportunities"},{"id":"unused-css-rules","weight":0,"group":"load-opportunities"},{"id":"unused-javascript","weight":0,"group":"load-opportunities"},{"id":"uses-optimized-images","weight":0,"group":"load-opportunities"},{"id":"uses-webp-images","weight":0,"group":"load-opportunities"},{"id":"uses-text-compression","weight":0,"group":"load-opportunities"},{"id":"uses-rel-preconnect","weight":0,"group":"load-opportunities"},{"id":"server-response-time","weight":0,"group":"load-opportunities"},{"id":"redirects","weight":0,"group":"load-opportunities"},{"id":"uses-rel-preload","weight":0,"group":"load-opportunities"},{"id":"uses-http2","weight":0,"group":"load-opportunities"},{"id":"efficient-animated-content","weight":0,"group":"load-opportunities"},{"id":"duplicated-javascript","weight":0,"group":"load-opportunities"},{"id":"legacy-javascript","weight":0,"group":"load-opportunities"},{"id":"total-byte-weight","weight":0,"group":"diagnostics"},{"id":"uses-long-cache-ttl","weight":0,"group":"diagnostics"},{"id":"dom-size","weight":0,"group":"diagnostics"},{"id":"critical-request-chains","weight":0,"group":"diagnostics"},{"id":"user-timings","weight":0,"group":"diagnostics"},{"id":"bootup-time","weight":0,"group":"diagnostics"},{"id":"mainthread-work-breakdown","weight":0,"group":"diagnostics"},{"id":"font-display","weight":0,"group":"diagnostics"},{"id":"performance-budget","weight":0,"group":"budgets"},{"id":"timing-budget","weight":0,"group":"budgets"},{"id":"resource-summary","weight":0,"group":"diagnostics"},{"id":"third-party-summary","weight":0,"group":"diagnostics"},{"id":"largest-contentful-paint-element","weight":0,"group":"diagnostics"},{"id":"layout-shift-elements","weight":0,"group":"diagnostics"},{"id":"uses-passive-event-listeners","weight":0,"group":"diagnostics"},{"id":"no-document-write","weight":0,"group":"diagnostics"},{"id":"long-tasks","weight":0,"group":"diagnostics"},{"id":"non-composited-animations","weight":0,"group":"diagnostics"},{"id":"unsized-images","weight":0,"group":"diagnostics"},{"id":"network-requests","weight":0},{"id":"network-rtt","weight":0},{"id":"network-server-latency","weight":0},{"id":"main-thread-tasks","weight":0},{"id":"diagnostics","weight":0},{"id":"metrics","weight":0},{"id":"screenshot-thumbnails","weight":0},{"id":"final-screenshot","weight":0}],"id":"performance","score":0.1},"accessibility":{"title":"Accessibility","description":"These checks highlight opportunities to [improve the accessibility of your web app](https://developers.google.com/web/fundamentals/accessibility). Only a subset of accessibility issues can be automatically detected so manual testing is also encouraged.","manualDescription":"These items address areas which an automated testing tool cannot cover. Learn more in our guide on [conducting an accessibility review](https://developers.google.com/web/fundamentals/accessibility/how-to-review).","auditRefs":[{"id":"accesskeys","weight":0,"group":"a11y-navigation"},{"id":"aria-allowed-attr","weight":0,"group":"a11y-aria"},{"id":"aria-hidden-body","weight":10,"group":"a11y-aria"},{"id":"aria-hidden-focus","weight":0,"group":"a11y-aria"},{"id":"aria-input-field-name","weight":0,"group":"a11y-aria"},{"id":"aria-required-attr","weight":0,"group":"a11y-aria"},{"id":"aria-required-children","weight":0,"group":"a11y-aria"},{"id":"aria-required-parent","weight":0,"group":"a11y-aria"},{"id":"aria-roles","weight":0,"group":"a11y-aria"},{"id":"aria-toggle-field-name","weight":0,"group":"a11y-aria"},{"id":"aria-valid-attr-value","weight":0,"group":"a11y-aria"},{"id":"aria-valid-attr","weight":0,"group":"a11y-aria"},{"id":"button-name","weight":0,"group":"a11y-names-labels"},{"id":"bypass","weight":3,"group":"a11y-navigation"},{"id":"color-contrast","weight":3,"group":"a11y-color-contrast"},{"id":"definition-list","weight":0,"group":"a11y-tables-lists"},{"id":"dlitem","weight":0,"group":"a11y-tables-lists"},{"id":"document-title","weight":3,"group":"a11y-names-labels"},{"id":"duplicate-id-active","weight":3,"group":"a11y-navigation"},{"id":"duplicate-id-aria","weight":0,"group":"a11y-aria"},{"id":"form-field-multiple-labels","weight":0,"group":"a11y-names-labels"},{"id":"frame-title","weight":0,"group":"a11y-names-labels"},{"id":"heading-order","weight":0,"group":"a11y-navigation"},{"id":"html-has-lang","weight":3,"group":"a11y-language"},{"id":"html-lang-valid","weight":3,"group":"a11y-language"},{"id":"image-alt","weight":10,"group":"a11y-names-labels"},{"id":"input-image-alt","weight":0,"group":"a11y-names-labels"},{"id":"label","weight":0,"group":"a11y-names-labels"},{"id":"layout-table","weight":0,"group":"a11y-tables-lists"},{"id":"link-name","weight":3,"group":"a11y-names-labels"},{"id":"list","weight":0,"group":"a11y-tables-lists"},{"id":"listitem","weight":0,"group":"a11y-tables-lists"},{"id":"meta-refresh","weight":0,"group":"a11y-best-practices"},{"id":"meta-viewport","weight":10,"group":"a11y-best-practices"},{"id":"object-alt","weight":0,"group":"a11y-names-labels"},{"id":"tabindex","weight":0,"group":"a11y-navigation"},{"id":"td-headers-attr","weight":0,"group":"a11y-tables-lists"},{"id":"th-has-data-cells","weight":0,"group":"a11y-tables-lists"},{"id":"valid-lang","weight":0,"group":"a11y-language"},{"id":"video-caption","weight":0,"group":"a11y-audio-video"},{"id":"video-description","weight":0,"group":"a11y-audio-video"},{"id":"logical-tab-order","weight":0},{"id":"focusable-controls","weight":0},{"id":"interactive-element-affordance","weight":0},{"id":"managed-focus","weight":0},{"id":"focus-traps","weight":0},{"id":"custom-controls-labels","weight":0},{"id":"custom-controls-roles","weight":0},{"id":"visual-order-follows-dom","weight":0},{"id":"offscreen-content-hidden","weight":0},{"id":"use-landmarks","weight":0}],"id":"accessibility","score":1},"best-practices":{"title":"Best Practices","auditRefs":[{"id":"is-on-https","weight":1,"group":"best-practices-trust-safety"},{"id":"external-anchors-use-rel-noopener","weight":1,"group":"best-practices-trust-safety"},{"id":"geolocation-on-start","weight":1,"group":"best-practices-trust-safety"},{"id":"notification-on-start","weight":1,"group":"best-practices-trust-safety"},{"id":"no-vulnerable-libraries","weight":1,"group":"best-practices-trust-safety"},{"id":"password-inputs-can-be-pasted-into","weight":1,"group":"best-practices-ux"},{"id":"image-aspect-ratio","weight":1,"group":"best-practices-ux"},{"id":"image-size-responsive","weight":1,"group":"best-practices-ux"},{"id":"preload-fonts","weight":0,"group":"best-practices-ux"},{"id":"doctype","weight":1,"group":"best-practices-browser-compat"},{"id":"charset","weight":1,"group":"best-practices-browser-compat"},{"id":"no-unload-listeners","weight":1,"group":"best-practices-general"},{"id":"appcache-manifest","weight":1,"group":"best-practices-general"},{"id":"js-libraries","weight":0,"group":"best-practices-general"},{"id":"deprecations","weight":1,"group":"best-practices-general"},{"id":"errors-in-console","weight":1,"group":"best-practices-general"},{"id":"valid-source-maps","weight":0,"group":"best-practices-general"}],"id":"best-practices","score":0.86},"seo":{"title":"SEO","description":"These checks ensure that your page is optimized for search engine results ranking. There are additional factors Lighthouse does not check that may affect your search ranking. [Learn more](https://support.google.com/webmasters/answer/35769).","manualDescription":"Run these additional validators on your site to check additional SEO best practices.","auditRefs":[{"id":"viewport","weight":1,"group":"seo-mobile"},{"id":"document-title","weight":1,"group":"seo-content"},{"id":"meta-description","weight":1,"group":"seo-content"},{"id":"http-status-code","weight":1,"group":"seo-crawl"},{"id":"link-text","weight":1,"group":"seo-content"},{"id":"crawlable-anchors","weight":1,"group":"seo-crawl"},{"id":"is-crawlable","weight":1,"group":"seo-crawl"},{"id":"robots-txt","weight":1,"group":"seo-crawl"},{"id":"image-alt","weight":1,"group":"seo-content"},{"id":"hreflang","weight":1,"group":"seo-content"},{"id":"canonical","weight":1,"group":"seo-content"},{"id":"font-size","weight":1,"group":"seo-mobile"},{"id":"plugins","weight":1,"group":"seo-content"},{"id":"tap-targets","weight":1,"group":"seo-mobile"},{"id":"structured-data","weight":0}],"id":"seo","score":0.97},"pwa":{"title":"Progressive Web App","description":"These checks validate the aspects of a Progressive Web App. [Learn more](https://developers.google.com/web/progressive-web-apps/checklist).","manualDescription":"These checks are required by the baseline [PWA Checklist](https://developers.google.com/web/progressive-web-apps/checklist) but are not automatically checked by Lighthouse. They do not affect your score but it's important that you verify them manually.","auditRefs":[{"id":"load-fast-enough-for-pwa","weight":7,"group":"pwa-fast-reliable"},{"id":"works-offline","weight":5,"group":"pwa-fast-reliable"},{"id":"offline-start-url","weight":1,"group":"pwa-fast-reliable"},{"id":"is-on-https","weight":2,"group":"pwa-installable"},{"id":"service-worker","weight":1,"group":"pwa-installable"},{"id":"installable-manifest","weight":2,"group":"pwa-installable"},{"id":"redirects-http","weight":2,"group":"pwa-optimized"},{"id":"splash-screen","weight":1,"group":"pwa-optimized"},{"id":"themed-omnibox","weight":1,"group":"pwa-optimized"},{"id":"content-width","weight":1,"group":"pwa-optimized"},{"id":"viewport","weight":2,"group":"pwa-optimized"},{"id":"without-javascript","weight":1,"group":"pwa-optimized"},{"id":"apple-touch-icon","weight":1,"group":"pwa-optimized"},{"id":"maskable-icon","weight":1,"group":"pwa-optimized"},{"id":"pwa-cross-browser","weight":0},{"id":"pwa-page-transitions","weight":0},{"id":"pwa-each-page-has-url","weight":0}],"id":"pwa","score":0.21}},"categoryGroups":{"metrics":{"title":"Metrics"},"load-opportunities":{"title":"Opportunities","description":"These suggestions can help your page load faster. They don't [directly affect](https://web.dev/performance-scoring/) the Performance score."},"budgets":{"title":"Budgets","description":"Performance budgets set standards for the performance of your site."},"diagnostics":{"title":"Diagnostics","description":"More information about the performance of your application. These numbers don't [directly affect](https://web.dev/performance-scoring/) the Performance score."},"pwa-fast-reliable":{"title":"Fast and reliable"},"pwa-installable":{"title":"Installable"},"pwa-optimized":{"title":"PWA Optimized"},"a11y-best-practices":{"title":"Best practices","description":"These items highlight common accessibility best practices."},"a11y-color-contrast":{"title":"Contrast","description":"These are opportunities to improve the legibility of your content."},"a11y-names-labels":{"title":"Names and labels","description":"These are opportunities to improve the semantics of the controls in your application. This may enhance the experience for users of assistive technology, like a screen reader."},"a11y-navigation":{"title":"Navigation","description":"These are opportunities to improve keyboard navigation in your application."},"a11y-aria":{"title":"ARIA","description":"These are opportunities to improve the usage of ARIA in your application which may enhance the experience for users of assistive technology, like a screen reader."},"a11y-language":{"title":"Internationalization and localization","description":"These are opportunities to improve the interpretation of your content by users in different locales."},"a11y-audio-video":{"title":"Audio and video","description":"These are opportunities to provide alternative content for audio and video. This may improve the experience for users with hearing or vision impairments."},"a11y-tables-lists":{"title":"Tables and lists","description":"These are opportunities to improve the experience of reading tabular or list data using assistive technology, like a screen reader."},"seo-mobile":{"title":"Mobile Friendly","description":"Make sure your pages are mobile friendly so users don’t have to pinch or zoom in order to read the content pages. [Learn more](https://developers.google.com/search/mobile-sites/)."},"seo-content":{"title":"Content Best Practices","description":"Format your HTML in a way that enables crawlers to better understand your app’s content."},"seo-crawl":{"title":"Crawling and Indexing","description":"To appear in search results, crawlers need access to your app."},"best-practices-trust-safety":{"title":"Trust and Safety"},"best-practices-ux":{"title":"User Experience"},"best-practices-browser-compat":{"title":"Browser Compatibility"},"best-practices-general":{"title":"General"}},"timing":{"entries":[{"startTime":1692.95,"name":"lh:init:config","duration":1346.46,"entryType":"measure"},{"startTime":1703.18,"name":"lh:config:requireGatherers","duration":147.34,"entryType":"measure"},{"startTime":1850.84,"name":"lh:config:requireAudits","duration":969.6,"entryType":"measure"},{"startTime":3040,"name":"lh:runner:run","duration":32011.82,"entryType":"measure"},{"startTime":3043.18,"name":"lh:init:connect","duration":67.2,"entryType":"measure"},{"startTime":3110.49,"name":"lh:gather:loadBlank","duration":309.65,"entryType":"measure"},{"startTime":3420.38,"name":"lh:gather:getVersion","duration":0.53,"entryType":"measure"},{"startTime":3422.53,"name":"lh:gather:getBenchmarkIndex","duration":1051.58,"entryType":"measure"},{"startTime":4474.39,"name":"lh:gather:setupDriver","duration":111.04,"entryType":"measure"},{"startTime":4585.96,"name":"lh:gather:runPass-defaultPass","duration":20852.73,"entryType":"measure"},{"startTime":4585.98,"name":"lh:gather:loadBlank","duration":54.15,"entryType":"measure"},{"startTime":4640.69,"name":"lh:gather:setupPassNetwork","duration":2.03,"entryType":"measure"},{"startTime":4642.87,"name":"lh:driver:cleanBrowserCaches","duration":15,"entryType":"measure"},{"startTime":4658.13,"name":"lh:gather:beforePass","duration":18.36,"entryType":"measure"},{"startTime":4658.19,"name":"lh:gather:beforePass:CSSUsage","duration":0.11,"entryType":"measure"},{"startTime":4658.32,"name":"lh:gather:beforePass:JsUsage","duration":5.73,"entryType":"measure"},{"startTime":4664.07,"name":"lh:gather:beforePass:ViewportDimensions","duration":0.03,"entryType":"measure"},{"startTime":4664.11,"name":"lh:gather:beforePass:RuntimeExceptions","duration":0.07,"entryType":"measure"},{"startTime":4664.19,"name":"lh:gather:beforePass:ConsoleMessages","duration":7.86,"entryType":"measure"},{"startTime":4672.07,"name":"lh:gather:beforePass:AnchorElements","duration":0.03,"entryType":"measure"},{"startTime":4672.11,"name":"lh:gather:beforePass:ImageElements","duration":0.02,"entryType":"measure"},{"startTime":4672.13,"name":"lh:gather:beforePass:LinkElements","duration":0.01,"entryType":"measure"},{"startTime":4672.15,"name":"lh:gather:beforePass:MetaElements","duration":0.01,"entryType":"measure"},{"startTime":4672.17,"name":"lh:gather:beforePass:ScriptElements","duration":0.01,"entryType":"measure"},{"startTime":4672.18,"name":"lh:gather:beforePass:IFrameElements","duration":0.01,"entryType":"measure"},{"startTime":4672.19,"name":"lh:gather:beforePass:FormElements","duration":0.01,"entryType":"measure"},{"startTime":4672.21,"name":"lh:gather:beforePass:MainDocumentContent","duration":0.01,"entryType":"measure"},{"startTime":4672.22,"name":"lh:gather:beforePass:GlobalListeners","duration":0.01,"entryType":"measure"},{"startTime":4672.23,"name":"lh:gather:beforePass:AppCacheManifest","duration":0.01,"entryType":"measure"},{"startTime":4672.25,"name":"lh:gather:beforePass:Doctype","duration":0.01,"entryType":"measure"},{"startTime":4672.26,"name":"lh:gather:beforePass:DOMStats","duration":0.03,"entryType":"measure"},{"startTime":4672.29,"name":"lh:gather:beforePass:OptimizedImages","duration":0.01,"entryType":"measure"},{"startTime":4672.31,"name":"lh:gather:beforePass:PasswordInputsWithPreventedPaste","duration":0.01,"entryType":"measure"},{"startTime":4672.32,"name":"lh:gather:beforePass:ResponseCompression","duration":0.01,"entryType":"measure"},{"startTime":4672.34,"name":"lh:gather:beforePass:TagsBlockingFirstPaint","duration":1.38,"entryType":"measure"},{"startTime":4673.73,"name":"lh:gather:beforePass:FontSize","duration":0.02,"entryType":"measure"},{"startTime":4673.75,"name":"lh:gather:beforePass:EmbeddedContent","duration":0.01,"entryType":"measure"},{"startTime":4673.76,"name":"lh:gather:beforePass:RobotsTxt","duration":0.01,"entryType":"measure"},{"startTime":4673.78,"name":"lh:gather:beforePass:TapTargets","duration":0.01,"entryType":"measure"},{"startTime":4673.79,"name":"lh:gather:beforePass:Accessibility","duration":0.01,"entryType":"measure"},{"startTime":4673.8,"name":"lh:gather:beforePass:TraceElements","duration":0.71,"entryType":"measure"},{"startTime":4674.54,"name":"lh:gather:beforePass:InspectorIssues","duration":1.76,"entryType":"measure"},{"startTime":4676.31,"name":"lh:gather:beforePass:SourceMaps","duration":0.17,"entryType":"measure"},{"startTime":4676.59,"name":"lh:gather:beginRecording","duration":750.72,"entryType":"measure"},{"startTime":4676.84,"name":"lh:gather:getVersion","duration":0.47,"entryType":"measure"},{"startTime":5427.61,"name":"lh:gather:loadPage-defaultPass","duration":5596.65,"entryType":"measure"},{"startTime":11026.5,"name":"lh:gather:pass","duration":17.58,"entryType":"measure"},{"startTime":11045.2,"name":"lh:gather:getTrace","duration":3241.64,"entryType":"measure"},{"startTime":14287.4,"name":"lh:gather:getDevtoolsLog","duration":24.93,"entryType":"measure"},{"startTime":14326.81,"name":"lh:gather:afterPass","duration":11107.02,"entryType":"measure"},{"startTime":14360.7,"name":"lh:gather:afterPass:CSSUsage","duration":184.08,"entryType":"measure"},{"startTime":14544.85,"name":"lh:gather:afterPass:JsUsage","duration":183.96,"entryType":"measure"},{"startTime":14728.85,"name":"lh:gather:afterPass:ViewportDimensions","duration":18.97,"entryType":"measure"},{"startTime":14747.85,"name":"lh:gather:afterPass:RuntimeExceptions","duration":6.21,"entryType":"measure"},{"startTime":14754.32,"name":"lh:gather:afterPass:ConsoleMessages","duration":8.46,"entryType":"measure"},{"startTime":14762.8,"name":"lh:gather:afterPass:AnchorElements","duration":1277.5,"entryType":"measure"},{"startTime":16040.75,"name":"lh:gather:afterPass:ImageElements","duration":1699.06,"entryType":"measure"},{"startTime":17739.83,"name":"lh:gather:afterPass:LinkElements","duration":40.03,"entryType":"measure"},{"startTime":17780.59,"name":"lh:gather:afterPass:MetaElements","duration":10.1,"entryType":"measure"},{"startTime":17790.71,"name":"lh:gather:afterPass:ScriptElements","duration":67.38,"entryType":"measure"},{"startTime":17858.96,"name":"lh:gather:afterPass:IFrameElements","duration":24.16,"entryType":"measure"},{"startTime":17884.12,"name":"lh:gather:afterPass:FormElements","duration":65.76,"entryType":"measure"},{"startTime":17952.82,"name":"lh:gather:afterPass:MainDocumentContent","duration":24.99,"entryType":"measure"},{"startTime":17978.17,"name":"lh:gather:afterPass:GlobalListeners","duration":15.5,"entryType":"measure"},{"startTime":17993.98,"name":"lh:gather:afterPass:AppCacheManifest","duration":16.54,"entryType":"measure"},{"startTime":18011.16,"name":"lh:gather:afterPass:Doctype","duration":19.88,"entryType":"measure"},{"startTime":18031.36,"name":"lh:gather:afterPass:DOMStats","duration":35.59,"entryType":"measure"},{"startTime":18066.97,"name":"lh:gather:afterPass:OptimizedImages","duration":5064.72,"entryType":"measure"},{"startTime":23131.71,"name":"lh:gather:afterPass:PasswordInputsWithPreventedPaste","duration":7.35,"entryType":"measure"},{"startTime":23139.08,"name":"lh:gather:afterPass:ResponseCompression","duration":48.7,"entryType":"measure"},{"startTime":23187.79,"name":"lh:gather:afterPass:TagsBlockingFirstPaint","duration":12.45,"entryType":"measure"},{"startTime":23200.26,"name":"lh:gather:afterPass:FontSize","duration":40.45,"entryType":"measure"},{"startTime":23241,"name":"lh:gather:afterPass:EmbeddedContent","duration":5.51,"entryType":"measure"},{"startTime":23246.79,"name":"lh:gather:afterPass:RobotsTxt","duration":94.88,"entryType":"measure"},{"startTime":23341.69,"name":"lh:gather:afterPass:TapTargets","duration":40.48,"entryType":"measure"},{"startTime":23382.2,"name":"lh:gather:afterPass:Accessibility","duration":1054.36,"entryType":"measure"},{"startTime":24437.75,"name":"lh:gather:afterPass:TraceElements","duration":951.34,"entryType":"measure"},{"startTime":25390.05,"name":"lh:gather:afterPass:InspectorIssues","duration":6.49,"entryType":"measure"},{"startTime":25397.13,"name":"lh:gather:afterPass:SourceMaps","duration":36.68,"entryType":"measure"},{"startTime":25682.73,"name":"lh:gather:runPass-offlinePass","duration":1443.61,"entryType":"measure"},{"startTime":25683.49,"name":"lh:gather:loadBlank","duration":267.75,"entryType":"measure"},{"startTime":25951.27,"name":"lh:gather:setupPassNetwork","duration":11.06,"entryType":"measure"},{"startTime":25962.36,"name":"lh:gather:beforePass","duration":22.78,"entryType":"measure"},{"startTime":25962.39,"name":"lh:gather:beforePass:ServiceWorker","duration":13.06,"entryType":"measure"},{"startTime":25975.46,"name":"lh:gather:beforePass:Offline","duration":9.61,"entryType":"measure"},{"startTime":25985.08,"name":"lh:gather:beforePass:StartUrl","duration":0.04,"entryType":"measure"},{"startTime":25985.16,"name":"lh:gather:beginRecording","duration":0.02,"entryType":"measure"},{"startTime":25985.19,"name":"lh:gather:loadPage-offlinePass","duration":1054.98,"entryType":"measure"},{"startTime":27040.21,"name":"lh:gather:pass","duration":0.08,"entryType":"measure"},{"startTime":27040.3,"name":"lh:gather:getDevtoolsLog","duration":3.87,"entryType":"measure"},{"startTime":27110.48,"name":"lh:gather:afterPass","duration":15.51,"entryType":"measure"},{"startTime":27117.13,"name":"lh:gather:afterPass:ServiceWorker","duration":3.24,"entryType":"measure"},{"startTime":27120.38,"name":"lh:gather:afterPass:Offline","duration":1.47,"entryType":"measure"},{"startTime":27121.87,"name":"lh:gather:afterPass:StartUrl","duration":4.11,"entryType":"measure"},{"startTime":27127.14,"name":"lh:gather:runPass-redirectPass","duration":785.22,"entryType":"measure"},{"startTime":27127.17,"name":"lh:gather:loadBlank","duration":261.7,"entryType":"measure"},{"startTime":27388.88,"name":"lh:gather:setupPassNetwork","duration":9.59,"entryType":"measure"},{"startTime":27398.49,"name":"lh:gather:beforePass","duration":3.02,"entryType":"measure"},{"startTime":27398.51,"name":"lh:gather:beforePass:HTTPRedirect","duration":1.89,"entryType":"measure"},{"startTime":27400.41,"name":"lh:gather:beforePass:HTMLWithoutJavaScript","duration":1.09,"entryType":"measure"},{"startTime":27401.52,"name":"lh:gather:beginRecording","duration":0.04,"entryType":"measure"},{"startTime":27401.56,"name":"lh:gather:loadPage-redirectPass","duration":428.36,"entryType":"measure"},{"startTime":27829.95,"name":"lh:gather:pass","duration":0.72,"entryType":"measure"},{"startTime":27830.69,"name":"lh:gather:getDevtoolsLog","duration":1.33,"entryType":"measure"},{"startTime":27850.7,"name":"lh:gather:afterPass","duration":61.64,"entryType":"measure"},{"startTime":27865.93,"name":"lh:gather:afterPass:HTTPRedirect","duration":28.54,"entryType":"measure"},{"startTime":27894.49,"name":"lh:gather:afterPass:HTMLWithoutJavaScript","duration":17.84,"entryType":"measure"},{"startTime":27914.82,"name":"lh:gather:disconnect","duration":115.55,"entryType":"measure"},{"startTime":28040.98,"name":"lh:runner:auditing","duration":6965.3,"entryType":"measure"},{"startTime":28118.42,"name":"lh:audit:is-on-https","duration":82.89,"entryType":"measure"},{"startTime":28161.78,"name":"lh:computed:NetworkRecords","duration":9.08,"entryType":"measure"},{"startTime":28206.12,"name":"lh:audit:redirects-http","duration":14.4,"entryType":"measure"},{"startTime":28232.06,"name":"lh:audit:service-worker","duration":14.46,"entryType":"measure"},{"startTime":28253.29,"name":"lh:audit:works-offline","duration":43.42,"entryType":"measure"},{"startTime":28313.44,"name":"lh:audit:viewport","duration":32.42,"entryType":"measure"},{"startTime":28322.55,"name":"lh:computed:ViewportMeta","duration":13.47,"entryType":"measure"},{"startTime":28351.52,"name":"lh:audit:without-javascript","duration":10,"entryType":"measure"},{"startTime":28366.89,"name":"lh:audit:first-contentful-paint","duration":292.08,"entryType":"measure"},{"startTime":28370.37,"name":"lh:computed:FirstContentfulPaint","duration":227.17,"entryType":"measure"},{"startTime":28373.99,"name":"lh:computed:TraceOfTab","duration":99.39,"entryType":"measure"},{"startTime":28474.94,"name":"lh:computed:LanternFirstContentfulPaint","duration":122.59,"entryType":"measure"},{"startTime":28487.64,"name":"lh:computed:PageDependencyGraph","duration":42.32,"entryType":"measure"},{"startTime":28530.02,"name":"lh:computed:LoadSimulator","duration":29.13,"entryType":"measure"},{"startTime":28533.81,"name":"lh:computed:NetworkAnalysis","duration":19.45,"entryType":"measure"},{"startTime":28662.79,"name":"lh:audit:largest-contentful-paint","duration":35.42,"entryType":"measure"},{"startTime":28664.88,"name":"lh:computed:LargestContentfulPaint","duration":31.35,"entryType":"measure"},{"startTime":28666.18,"name":"lh:computed:LanternLargestContentfulPaint","duration":30.04,"entryType":"measure"},{"startTime":28700.44,"name":"lh:audit:first-meaningful-paint","duration":8.95,"entryType":"measure"},{"startTime":28701.64,"name":"lh:computed:FirstMeaningfulPaint","duration":6.5,"entryType":"measure"},{"startTime":28701.97,"name":"lh:computed:LanternFirstMeaningfulPaint","duration":6.16,"entryType":"measure"},{"startTime":28713,"name":"lh:audit:load-fast-enough-for-pwa","duration":52,"entryType":"measure"},{"startTime":28721.51,"name":"lh:computed:Interactive","duration":38.8,"entryType":"measure"},{"startTime":28724.23,"name":"lh:computed:LanternInteractive","duration":36.07,"entryType":"measure"},{"startTime":28776.96,"name":"lh:audit:speed-index","duration":2274.49,"entryType":"measure"},{"startTime":28779.87,"name":"lh:computed:SpeedIndex","duration":2249.89,"entryType":"measure"},{"startTime":28780.36,"name":"lh:computed:LanternSpeedIndex","duration":2249.38,"entryType":"measure"},{"startTime":28781.57,"name":"lh:computed:Speedline","duration":2131.18,"entryType":"measure"},{"startTime":31051.49,"name":"lh:audit:screenshot-thumbnails","duration":1291.59,"entryType":"measure"},{"startTime":32343.11,"name":"lh:audit:final-screenshot","duration":1.65,"entryType":"measure"},{"startTime":32344.04,"name":"lh:computed:Screenshots","duration":0.67,"entryType":"measure"},{"startTime":32348.75,"name":"lh:audit:estimated-input-latency","duration":96.32,"entryType":"measure"},{"startTime":32360.18,"name":"lh:computed:EstimatedInputLatency","duration":64.29,"entryType":"measure"},{"startTime":32360.26,"name":"lh:computed:LanternEstimatedInputLatency","duration":64.2,"entryType":"measure"},{"startTime":32456.22,"name":"lh:audit:total-blocking-time","duration":76.36,"entryType":"measure"},{"startTime":32457.49,"name":"lh:computed:TotalBlockingTime","duration":73.29,"entryType":"measure"},{"startTime":32457.57,"name":"lh:computed:LanternTotalBlockingTime","duration":73.2,"entryType":"measure"},{"startTime":32533.48,"name":"lh:audit:max-potential-fid","duration":40.1,"entryType":"measure"},{"startTime":32534.59,"name":"lh:computed:MaxPotentialFID","duration":36.66,"entryType":"measure"},{"startTime":32534.66,"name":"lh:computed:LanternMaxPotentialFID","duration":36.57,"entryType":"measure"},{"startTime":32574.47,"name":"lh:audit:cumulative-layout-shift","duration":27.08,"entryType":"measure"},{"startTime":32575.37,"name":"lh:computed:CumulativeLayoutShift","duration":0.91,"entryType":"measure"},{"startTime":32605.36,"name":"lh:audit:errors-in-console","duration":15.93,"entryType":"measure"},{"startTime":32623.35,"name":"lh:audit:server-response-time","duration":63.67,"entryType":"measure"},{"startTime":32678.05,"name":"lh:computed:MainResource","duration":3.76,"entryType":"measure"},{"startTime":32690.34,"name":"lh:audit:first-cpu-idle","duration":18.23,"entryType":"measure"},{"startTime":32691.76,"name":"lh:computed:FirstCPUIdle","duration":14.74,"entryType":"measure"},{"startTime":32692.79,"name":"lh:computed:LanternFirstCPUIdle","duration":13.69,"entryType":"measure"},{"startTime":32709.28,"name":"lh:audit:interactive","duration":2.55,"entryType":"measure"},{"startTime":32716.14,"name":"lh:audit:user-timings","duration":9.08,"entryType":"measure"},{"startTime":32719.1,"name":"lh:computed:UserTimings","duration":2.11,"entryType":"measure"},{"startTime":32727.49,"name":"lh:audit:critical-request-chains","duration":49.31,"entryType":"measure"},{"startTime":32731.05,"name":"lh:computed:CriticalRequestChains","duration":1.58,"entryType":"measure"},{"startTime":32777.5,"name":"lh:audit:redirects","duration":4.23,"entryType":"measure"},{"startTime":32782.82,"name":"lh:audit:installable-manifest","duration":9.12,"entryType":"measure"},{"startTime":32784.17,"name":"lh:computed:ManifestValues","duration":0.44,"entryType":"measure"},{"startTime":32793.02,"name":"lh:audit:apple-touch-icon","duration":4.7,"entryType":"measure"},{"startTime":32799.09,"name":"lh:audit:splash-screen","duration":3.78,"entryType":"measure"},{"startTime":32800.18,"name":"lh:computed:ManifestValues","duration":0.03,"entryType":"measure"},{"startTime":32806.29,"name":"lh:audit:themed-omnibox","duration":3.39,"entryType":"measure"},{"startTime":32807.52,"name":"lh:computed:ManifestValues","duration":0.05,"entryType":"measure"},{"startTime":32810.85,"name":"lh:audit:maskable-icon","duration":3.4,"entryType":"measure"},{"startTime":32815.32,"name":"lh:audit:content-width","duration":3.07,"entryType":"measure"},{"startTime":32819.36,"name":"lh:audit:image-aspect-ratio","duration":4.51,"entryType":"measure"},{"startTime":32824.78,"name":"lh:audit:image-size-responsive","duration":4.17,"entryType":"measure"},{"startTime":32829.82,"name":"lh:audit:preload-fonts","duration":8.37,"entryType":"measure"},{"startTime":32838.99,"name":"lh:audit:deprecations","duration":2.68,"entryType":"measure"},{"startTime":32842.73,"name":"lh:audit:mainthread-work-breakdown","duration":85.39,"entryType":"measure"},{"startTime":32844.16,"name":"lh:computed:MainThreadTasks","duration":72,"entryType":"measure"},{"startTime":32931.36,"name":"lh:audit:bootup-time","duration":14.42,"entryType":"measure"},{"startTime":32946.93,"name":"lh:audit:uses-rel-preload","duration":6.86,"entryType":"measure"},{"startTime":32948.73,"name":"lh:computed:LoadSimulator","duration":0.14,"entryType":"measure"},{"startTime":32954.65,"name":"lh:audit:uses-rel-preconnect","duration":8.77,"entryType":"measure"},{"startTime":32964.68,"name":"lh:audit:font-display","duration":5.05,"entryType":"measure"},{"startTime":32969.75,"name":"lh:audit:diagnostics","duration":1.45,"entryType":"measure"},{"startTime":32971.33,"name":"lh:audit:network-requests","duration":3.35,"entryType":"measure"},{"startTime":32975.93,"name":"lh:audit:network-rtt","duration":4.09,"entryType":"measure"},{"startTime":32981.69,"name":"lh:audit:network-server-latency","duration":4.02,"entryType":"measure"},{"startTime":32985.73,"name":"lh:audit:main-thread-tasks","duration":6.59,"entryType":"measure"},{"startTime":32992.35,"name":"lh:audit:metrics","duration":3.76,"entryType":"measure"},{"startTime":32992.78,"name":"lh:computed:TimingSummary","duration":3.23,"entryType":"measure"},{"startTime":32997.53,"name":"lh:audit:offline-start-url","duration":3.9,"entryType":"measure"},{"startTime":33002.42,"name":"lh:audit:performance-budget","duration":6.48,"entryType":"measure"},{"startTime":33004.01,"name":"lh:computed:ResourceSummary","duration":2.94,"entryType":"measure"},{"startTime":33009.88,"name":"lh:audit:timing-budget","duration":3.61,"entryType":"measure"},{"startTime":33014.45,"name":"lh:audit:resource-summary","duration":9.34,"entryType":"measure"},{"startTime":33025.64,"name":"lh:audit:third-party-summary","duration":29.11,"entryType":"measure"},{"startTime":33056.64,"name":"lh:audit:largest-contentful-paint-element","duration":5.82,"entryType":"measure"},{"startTime":33063.17,"name":"lh:audit:layout-shift-elements","duration":5.27,"entryType":"measure"},{"startTime":33069.27,"name":"lh:audit:long-tasks","duration":23.58,"entryType":"measure"},{"startTime":33094.67,"name":"lh:audit:no-unload-listeners","duration":9.49,"entryType":"measure"},{"startTime":33105.48,"name":"lh:audit:non-composited-animations","duration":8.12,"entryType":"measure"},{"startTime":33114.81,"name":"lh:audit:unsized-images","duration":12.53,"entryType":"measure"},{"startTime":33129.8,"name":"lh:audit:valid-source-maps","duration":14.05,"entryType":"measure"},{"startTime":33144.96,"name":"lh:audit:pwa-cross-browser","duration":2.56,"entryType":"measure"},{"startTime":33149.27,"name":"lh:audit:pwa-page-transitions","duration":4.24,"entryType":"measure"},{"startTime":33154.77,"name":"lh:audit:pwa-each-page-has-url","duration":3.09,"entryType":"measure"},{"startTime":33159.97,"name":"lh:audit:accesskeys","duration":5.9,"entryType":"measure"},{"startTime":33167.32,"name":"lh:audit:aria-allowed-attr","duration":6.87,"entryType":"measure"},{"startTime":33177.57,"name":"lh:audit:aria-hidden-body","duration":55.6,"entryType":"measure"},{"startTime":33240.64,"name":"lh:audit:aria-hidden-focus","duration":17.01,"entryType":"measure"},{"startTime":33263.71,"name":"lh:audit:aria-input-field-name","duration":11.69,"entryType":"measure"},{"startTime":33277.12,"name":"lh:audit:aria-required-attr","duration":11.61,"entryType":"measure"},{"startTime":33290.61,"name":"lh:audit:aria-required-children","duration":17.71,"entryType":"measure"},{"startTime":33309.99,"name":"lh:audit:aria-required-parent","duration":19.75,"entryType":"measure"},{"startTime":33331.71,"name":"lh:audit:aria-roles","duration":11.17,"entryType":"measure"},{"startTime":33345.5,"name":"lh:audit:aria-toggle-field-name","duration":24.54,"entryType":"measure"},{"startTime":33372.49,"name":"lh:audit:aria-valid-attr-value","duration":14.29,"entryType":"measure"},{"startTime":33388.97,"name":"lh:audit:aria-valid-attr","duration":14.88,"entryType":"measure"},{"startTime":33405.73,"name":"lh:audit:button-name","duration":9.32,"entryType":"measure"},{"startTime":33415.89,"name":"lh:audit:bypass","duration":32.93,"entryType":"measure"},{"startTime":33449.8,"name":"lh:audit:color-contrast","duration":12.75,"entryType":"measure"},{"startTime":33465.27,"name":"lh:audit:definition-list","duration":6.41,"entryType":"measure"},{"startTime":33472.51,"name":"lh:audit:dlitem","duration":6,"entryType":"measure"},{"startTime":33479.31,"name":"lh:audit:document-title","duration":12.84,"entryType":"measure"},{"startTime":33493.02,"name":"lh:audit:duplicate-id-active","duration":13.85,"entryType":"measure"},{"startTime":33518.34,"name":"lh:audit:duplicate-id-aria","duration":7.38,"entryType":"measure"},{"startTime":33526.61,"name":"lh:audit:form-field-multiple-labels","duration":9.43,"entryType":"measure"},{"startTime":33537.09,"name":"lh:audit:frame-title","duration":19.67,"entryType":"measure"},{"startTime":33558.67,"name":"lh:audit:heading-order","duration":10.33,"entryType":"measure"},{"startTime":33570.15,"name":"lh:audit:html-has-lang","duration":19.43,"entryType":"measure"},{"startTime":33590.8,"name":"lh:audit:html-lang-valid","duration":26.78,"entryType":"measure"},{"startTime":33618.81,"name":"lh:audit:image-alt","duration":21.73,"entryType":"measure"},{"startTime":33643.19,"name":"lh:audit:input-image-alt","duration":14.63,"entryType":"measure"},{"startTime":33659.41,"name":"lh:audit:label","duration":26.76,"entryType":"measure"},{"startTime":33691.82,"name":"lh:audit:layout-table","duration":36.42,"entryType":"measure"},{"startTime":33732.35,"name":"lh:audit:link-name","duration":23.2,"entryType":"measure"},{"startTime":33757.43,"name":"lh:audit:list","duration":19.68,"entryType":"measure"},{"startTime":33777.95,"name":"lh:audit:listitem","duration":16.71,"entryType":"measure"},{"startTime":33795.66,"name":"lh:audit:meta-refresh","duration":17.85,"entryType":"measure"},{"startTime":33815.03,"name":"lh:audit:meta-viewport","duration":24.18,"entryType":"measure"},{"startTime":33841,"name":"lh:audit:object-alt","duration":22.93,"entryType":"measure"},{"startTime":33866.63,"name":"lh:audit:tabindex","duration":26.36,"entryType":"measure"},{"startTime":33894.46,"name":"lh:audit:td-headers-attr","duration":28.54,"entryType":"measure"},{"startTime":33924.15,"name":"lh:audit:th-has-data-cells","duration":15.9,"entryType":"measure"},{"startTime":33940.95,"name":"lh:audit:valid-lang","duration":19.8,"entryType":"measure"},{"startTime":33961.82,"name":"lh:audit:video-caption","duration":18.55,"entryType":"measure"},{"startTime":33981.67,"name":"lh:audit:video-description","duration":32.61,"entryType":"measure"},{"startTime":34014.95,"name":"lh:audit:custom-controls-labels","duration":0.2,"entryType":"measure"},{"startTime":34015.17,"name":"lh:audit:custom-controls-roles","duration":0.03,"entryType":"measure"},{"startTime":34015.21,"name":"lh:audit:focus-traps","duration":0.02,"entryType":"measure"},{"startTime":34015.25,"name":"lh:audit:focusable-controls","duration":0.02,"entryType":"measure"},{"startTime":34015.28,"name":"lh:audit:interactive-element-affordance","duration":0.02,"entryType":"measure"},{"startTime":34015.31,"name":"lh:audit:logical-tab-order","duration":0.02,"entryType":"measure"},{"startTime":34015.34,"name":"lh:audit:managed-focus","duration":0.02,"entryType":"measure"},{"startTime":34015.41,"name":"lh:audit:offscreen-content-hidden","duration":0.04,"entryType":"measure"},{"startTime":34015.47,"name":"lh:audit:use-landmarks","duration":0.02,"entryType":"measure"},{"startTime":34015.5,"name":"lh:audit:visual-order-follows-dom","duration":0.02,"entryType":"measure"},{"startTime":34016.36,"name":"lh:audit:uses-long-cache-ttl","duration":14.16,"entryType":"measure"},{"startTime":34032.72,"name":"lh:audit:total-byte-weight","duration":5.78,"entryType":"measure"},{"startTime":34039.76,"name":"lh:audit:offscreen-images","duration":33.38,"entryType":"measure"},{"startTime":34074.32,"name":"lh:audit:render-blocking-resources","duration":12.71,"entryType":"measure"},{"startTime":34077.32,"name":"lh:computed:UnusedCSS","duration":1.48,"entryType":"measure"},{"startTime":34078.86,"name":"lh:computed:FirstContentfulPaint","duration":4.25,"entryType":"measure"},{"startTime":34078.92,"name":"lh:computed:LanternFirstContentfulPaint","duration":4.11,"entryType":"measure"},{"startTime":34087.94,"name":"lh:audit:unminified-css","duration":24.82,"entryType":"measure"},{"startTime":34113.45,"name":"lh:audit:unminified-javascript","duration":127.52,"entryType":"measure"},{"startTime":34242.56,"name":"lh:audit:unused-css-rules","duration":9.39,"entryType":"measure"},{"startTime":34255.17,"name":"lh:audit:unused-javascript","duration":77.04,"entryType":"measure"},{"startTime":34259.34,"name":"lh:computed:JSBundles","duration":0.33,"entryType":"measure"},{"startTime":34259.82,"name":"lh:computed:UnusedJavascriptSummary","duration":19.87,"entryType":"measure"},{"startTime":34279.81,"name":"lh:computed:UnusedJavascriptSummary","duration":17.94,"entryType":"measure"},{"startTime":34297.92,"name":"lh:computed:UnusedJavascriptSummary","duration":0.08,"entryType":"measure"},{"startTime":34298.04,"name":"lh:computed:UnusedJavascriptSummary","duration":1.12,"entryType":"measure"},{"startTime":34332.95,"name":"lh:audit:uses-webp-images","duration":28.61,"entryType":"measure"},{"startTime":34362.51,"name":"lh:audit:uses-optimized-images","duration":29.82,"entryType":"measure"},{"startTime":34394.11,"name":"lh:audit:uses-text-compression","duration":31.35,"entryType":"measure"},{"startTime":34425.96,"name":"lh:audit:uses-responsive-images","duration":20.29,"entryType":"measure"},{"startTime":34448.3,"name":"lh:audit:efficient-animated-content","duration":23.29,"entryType":"measure"},{"startTime":34473.26,"name":"lh:audit:duplicated-javascript","duration":26.17,"entryType":"measure"},{"startTime":34483.48,"name":"lh:computed:ModuleDuplication","duration":0.82,"entryType":"measure"},{"startTime":34484.02,"name":"lh:computed:JSBundles","duration":0.1,"entryType":"measure"},{"startTime":34500.32,"name":"lh:audit:legacy-javascript","duration":122.87,"entryType":"measure"},{"startTime":34623.82,"name":"lh:audit:appcache-manifest","duration":1.51,"entryType":"measure"},{"startTime":34626.02,"name":"lh:audit:doctype","duration":6.89,"entryType":"measure"},{"startTime":34633.93,"name":"lh:audit:charset","duration":13.12,"entryType":"measure"},{"startTime":34648.7,"name":"lh:audit:dom-size","duration":18.42,"entryType":"measure"},{"startTime":34668.47,"name":"lh:audit:external-anchors-use-rel-noopener","duration":13.66,"entryType":"measure"},{"startTime":34682.97,"name":"lh:audit:geolocation-on-start","duration":10.16,"entryType":"measure"},{"startTime":34693.83,"name":"lh:audit:no-document-write","duration":8.75,"entryType":"measure"},{"startTime":34704.47,"name":"lh:audit:no-vulnerable-libraries","duration":65.52,"entryType":"measure"},{"startTime":34770.54,"name":"lh:audit:js-libraries","duration":6.65,"entryType":"measure"},{"startTime":34782.58,"name":"lh:audit:notification-on-start","duration":9.76,"entryType":"measure"},{"startTime":34793.21,"name":"lh:audit:password-inputs-can-be-pasted-into","duration":11.02,"entryType":"measure"},{"startTime":34806.8,"name":"lh:audit:uses-http2","duration":16.03,"entryType":"measure"},{"startTime":34825.95,"name":"lh:audit:uses-passive-event-listeners","duration":6.29,"entryType":"measure"},{"startTime":34832.91,"name":"lh:audit:meta-description","duration":4.77,"entryType":"measure"},{"startTime":34839.14,"name":"lh:audit:http-status-code","duration":4.33,"entryType":"measure"},{"startTime":34845.72,"name":"lh:audit:font-size","duration":31.35,"entryType":"measure"},{"startTime":34880.63,"name":"lh:audit:link-text","duration":14.14,"entryType":"measure"},{"startTime":34903.87,"name":"lh:audit:crawlable-anchors","duration":5.76,"entryType":"measure"},{"startTime":34910.52,"name":"lh:audit:is-crawlable","duration":21.38,"entryType":"measure"},{"startTime":34932.85,"name":"lh:audit:robots-txt","duration":6.69,"entryType":"measure"},{"startTime":34940.33,"name":"lh:audit:tap-targets","duration":31.25,"entryType":"measure"},{"startTime":34972.36,"name":"lh:audit:hreflang","duration":17.35,"entryType":"measure"},{"startTime":34990.33,"name":"lh:audit:plugins","duration":2.11,"entryType":"measure"},{"startTime":34993.1,"name":"lh:audit:canonical","duration":9.17,"entryType":"measure"},{"startTime":35003.27,"name":"lh:audit:structured-data","duration":2.99,"entryType":"measure"},{"startTime":35006.29,"name":"lh:runner:generate","duration":45.51,"entryType":"measure"}],"total":32011.82},"i18n":{"rendererFormattedStrings":{"auditGroupExpandTooltip":"Show audits","calculatorLink":"See calculator.","crcInitialNavigation":"Initial Navigation","crcLongestDurationLabel":"Maximum critical path latency:","dropdownCopyJSON":"Copy JSON","dropdownDarkTheme":"Toggle Dark Theme","dropdownPrintExpanded":"Print Expanded","dropdownPrintSummary":"Print Summary","dropdownSaveGist":"Save as Gist","dropdownSaveHTML":"Save as HTML","dropdownSaveJSON":"Save as JSON","dropdownViewer":"Open in Viewer","errorLabel":"Error!","errorMissingAuditInfo":"Report error: no audit information","footerIssue":"File an issue","labDataTitle":"Lab Data","lsPerformanceCategoryDescription":"[Lighthouse](https://developers.google.com/web/tools/lighthouse/) analysis of the current page on an emulated mobile network. Values are estimated and may vary.","manualAuditsGroupTitle":"Additional items to manually check","notApplicableAuditsGroupTitle":"Not applicable","opportunityResourceColumnLabel":"Opportunity","opportunitySavingsColumnLabel":"Estimated Savings","passedAuditsGroupTitle":"Passed audits","runtimeDesktopEmulation":"Emulated Desktop","runtimeMobileEmulation":"Emulated Moto G4","runtimeNoEmulation":"No emulation","runtimeSettingsAxeVersion":"Axe version","runtimeSettingsBenchmark":"CPU/Memory Power","runtimeSettingsChannel":"Channel","runtimeSettingsCPUThrottling":"CPU throttling","runtimeSettingsDevice":"Device","runtimeSettingsFetchTime":"Fetch Time","runtimeSettingsNetworkThrottling":"Network throttling","runtimeSettingsTitle":"Runtime Settings","runtimeSettingsUA":"User agent (host)","runtimeSettingsUANetwork":"User agent (network)","runtimeSettingsUrl":"URL","runtimeUnknown":"Unknown","snippetCollapseButtonLabel":"Collapse snippet","snippetExpandButtonLabel":"Expand snippet","thirdPartyResourcesLabel":"Show 3rd-party resources","throttlingProvided":"Provided by environment","toplevelWarningsMessage":"There were issues affecting this run of Lighthouse:","varianceDisclaimer":"Values are estimated and may vary. The [performance score is calculated](https://web.dev/performance-scoring/) directly from these metrics.","warningAuditsGroupTitle":"Passed audits but with warnings","warningHeader":"Warnings: "},"icuMessagePaths":{"lighthouse-core/audits/is-on-https.js | title":["audits[is-on-https].title"],"lighthouse-core/audits/is-on-https.js | description":["audits[is-on-https].description"],"lighthouse-core/audits/redirects-http.js | failureTitle":["audits[redirects-http].title"],"lighthouse-core/audits/redirects-http.js | description":["audits[redirects-http].description"],"lighthouse-core/audits/service-worker.js | failureTitle":["audits[service-worker].title"],"lighthouse-core/audits/service-worker.js | description":["audits[service-worker].description"],"lighthouse-core/audits/works-offline.js | failureTitle":["audits[works-offline].title"],"lighthouse-core/audits/works-offline.js | description":["audits[works-offline].description"],"lighthouse-core/audits/viewport.js | title":["audits.viewport.title"],"lighthouse-core/audits/viewport.js | description":["audits.viewport.description"],"lighthouse-core/audits/without-javascript.js | title":["audits[without-javascript].title"],"lighthouse-core/audits/without-javascript.js | description":["audits[without-javascript].description"],"lighthouse-core/lib/i18n/i18n.js | firstContentfulPaintMetric":["audits[first-contentful-paint].title"],"lighthouse-core/audits/metrics/first-contentful-paint.js | description":["audits[first-contentful-paint].description"],"lighthouse-core/lib/i18n/i18n.js | seconds":[{"values":{"timeInMs":5869.22},"path":"audits[first-contentful-paint].displayValue"},{"values":{"timeInMs":7522.720000000001},"path":"audits[largest-contentful-paint].displayValue"},{"values":{"timeInMs":6058.72},"path":"audits[first-meaningful-paint].displayValue"},{"values":{"timeInMs":11505.293529493601},"path":"audits[speed-index].displayValue"},{"values":{"timeInMs":9900.22},"path":"audits[first-cpu-idle].displayValue"},{"values":{"timeInMs":10364.720000000001},"path":"audits.interactive.displayValue"},{"values":{"timeInMs":14923.863999999974},"path":"audits[mainthread-work-breakdown].displayValue"},{"values":{"timeInMs":3212.823999999997},"path":"audits[bootup-time].displayValue"}],"lighthouse-core/lib/i18n/i18n.js | largestContentfulPaintMetric":["audits[largest-contentful-paint].title"],"lighthouse-core/audits/metrics/largest-contentful-paint.js | description":["audits[largest-contentful-paint].description"],"lighthouse-core/lib/i18n/i18n.js | firstMeaningfulPaintMetric":["audits[first-meaningful-paint].title"],"lighthouse-core/audits/metrics/first-meaningful-paint.js | description":["audits[first-meaningful-paint].description"],"lighthouse-core/audits/load-fast-enough-for-pwa.js | failureTitle":["audits[load-fast-enough-for-pwa].title"],"lighthouse-core/audits/load-fast-enough-for-pwa.js | description":["audits[load-fast-enough-for-pwa].description"],"lighthouse-core/audits/load-fast-enough-for-pwa.js | displayValueText":[{"values":{"timeInMs":10364.720000000001},"path":"audits[load-fast-enough-for-pwa].displayValue"}],"lighthouse-core/audits/load-fast-enough-for-pwa.js | explanationLoadSlow":["audits[load-fast-enough-for-pwa].explanation"],"lighthouse-core/lib/i18n/i18n.js | speedIndexMetric":["audits[speed-index].title"],"lighthouse-core/audits/metrics/speed-index.js | description":["audits[speed-index].description"],"lighthouse-core/lib/i18n/i18n.js | estimatedInputLatencyMetric":["audits[estimated-input-latency].title"],"lighthouse-core/audits/metrics/estimated-input-latency.js | description":["audits[estimated-input-latency].description"],"lighthouse-core/lib/i18n/i18n.js | ms":[{"values":{"timeInMs":1353.2000000000005},"path":"audits[estimated-input-latency].displayValue"},{"values":{"timeInMs":2987.000000000001},"path":"audits[total-blocking-time].displayValue"},{"values":{"timeInMs":2175.5000000000005},"path":"audits[max-potential-fid].displayValue"},{"values":{"timeInMs":31.71799999999999},"path":"audits[network-rtt].displayValue"},{"values":{"timeInMs":26.648000000000007},"path":"audits[network-server-latency].displayValue"}],"lighthouse-core/lib/i18n/i18n.js | totalBlockingTimeMetric":["audits[total-blocking-time].title"],"lighthouse-core/audits/metrics/total-blocking-time.js | description":["audits[total-blocking-time].description"],"lighthouse-core/lib/i18n/i18n.js | maxPotentialFIDMetric":["audits[max-potential-fid].title"],"lighthouse-core/audits/metrics/max-potential-fid.js | description":["audits[max-potential-fid].description"],"lighthouse-core/lib/i18n/i18n.js | cumulativeLayoutShiftMetric":["audits[cumulative-layout-shift].title"],"lighthouse-core/audits/metrics/cumulative-layout-shift.js | description":["audits[cumulative-layout-shift].description"],"lighthouse-core/audits/errors-in-console.js | title":["audits[errors-in-console].title"],"lighthouse-core/audits/errors-in-console.js | description":["audits[errors-in-console].description"],"lighthouse-core/audits/server-response-time.js | title":["audits[server-response-time].title"],"lighthouse-core/audits/server-response-time.js | description":["audits[server-response-time].description"],"lighthouse-core/audits/server-response-time.js | displayValue":[{"values":{"timeInMs":116.50400000000002},"path":"audits[server-response-time].displayValue"}],"lighthouse-core/lib/i18n/i18n.js | columnURL":["audits[server-response-time].details.headings[0].label","audits[bootup-time].details.headings[0].text","audits[uses-rel-preconnect].details.headings[0].label","audits[network-rtt].details.headings[0].text","audits[network-server-latency].details.headings[0].text","audits[long-tasks].details.headings[0].text","audits[unsized-images].details.headings[1].text","audits[uses-long-cache-ttl].details.headings[0].text","audits[total-byte-weight].details.headings[0].text","audits[offscreen-images].details.headings[1].label","audits[render-blocking-resources].details.headings[0].label","audits[unminified-css].details.headings[0].label","audits[unused-css-rules].details.headings[0].label","audits[uses-webp-images].details.headings[1].label","audits[uses-optimized-images].details.headings[1].label","audits[uses-text-compression].details.headings[0].label"],"lighthouse-core/lib/i18n/i18n.js | columnTimeSpent":["audits[server-response-time].details.headings[1].label","audits[mainthread-work-breakdown].details.headings[1].text","audits[network-rtt].details.headings[1].text","audits[network-server-latency].details.headings[1].text"],"lighthouse-core/lib/i18n/i18n.js | firstCPUIdleMetric":["audits[first-cpu-idle].title"],"lighthouse-core/audits/metrics/first-cpu-idle.js | description":["audits[first-cpu-idle].description"],"lighthouse-core/lib/i18n/i18n.js | interactiveMetric":["audits.interactive.title"],"lighthouse-core/audits/metrics/interactive.js | description":["audits.interactive.description"],"lighthouse-core/audits/user-timings.js | title":["audits[user-timings].title"],"lighthouse-core/audits/user-timings.js | description":["audits[user-timings].description"],"lighthouse-core/audits/critical-request-chains.js | title":["audits[critical-request-chains].title"],"lighthouse-core/audits/critical-request-chains.js | description":["audits[critical-request-chains].description"],"lighthouse-core/audits/critical-request-chains.js | displayValue":[{"values":{"itemCount":4},"path":"audits[critical-request-chains].displayValue"}],"lighthouse-core/audits/redirects.js | title":["audits.redirects.title"],"lighthouse-core/audits/redirects.js | description":["audits.redirects.description"],"lighthouse-core/audits/installable-manifest.js | failureTitle":["audits[installable-manifest].title"],"lighthouse-core/audits/installable-manifest.js | description":["audits[installable-manifest].description"],"lighthouse-core/audits/apple-touch-icon.js | failureTitle":["audits[apple-touch-icon].title"],"lighthouse-core/audits/apple-touch-icon.js | description":["audits[apple-touch-icon].description"],"lighthouse-core/audits/splash-screen.js | failureTitle":["audits[splash-screen].title"],"lighthouse-core/audits/splash-screen.js | description":["audits[splash-screen].description"],"lighthouse-core/audits/themed-omnibox.js | failureTitle":["audits[themed-omnibox].title"],"lighthouse-core/audits/themed-omnibox.js | description":["audits[themed-omnibox].description"],"lighthouse-core/audits/maskable-icon.js | failureTitle":["audits[maskable-icon].title"],"lighthouse-core/audits/maskable-icon.js | description":["audits[maskable-icon].description"],"lighthouse-core/audits/content-width.js | title":["audits[content-width].title"],"lighthouse-core/audits/content-width.js | description":["audits[content-width].description"],"lighthouse-core/audits/image-aspect-ratio.js | title":["audits[image-aspect-ratio].title"],"lighthouse-core/audits/image-aspect-ratio.js | description":["audits[image-aspect-ratio].description"],"lighthouse-core/audits/image-size-responsive.js | title":["audits[image-size-responsive].title"],"lighthouse-core/audits/image-size-responsive.js | description":["audits[image-size-responsive].description"],"lighthouse-core/audits/preload-fonts.js | title":["audits[preload-fonts].title"],"lighthouse-core/audits/preload-fonts.js | description":["audits[preload-fonts].description"],"lighthouse-core/audits/deprecations.js | title":["audits.deprecations.title"],"lighthouse-core/audits/deprecations.js | description":["audits.deprecations.description"],"lighthouse-core/audits/mainthread-work-breakdown.js | failureTitle":["audits[mainthread-work-breakdown].title"],"lighthouse-core/audits/mainthread-work-breakdown.js | description":["audits[mainthread-work-breakdown].description"],"lighthouse-core/audits/mainthread-work-breakdown.js | columnCategory":["audits[mainthread-work-breakdown].details.headings[0].text"],"lighthouse-core/audits/bootup-time.js | failureTitle":["audits[bootup-time].title"],"lighthouse-core/audits/bootup-time.js | description":["audits[bootup-time].description"],"lighthouse-core/audits/bootup-time.js | columnTotal":["audits[bootup-time].details.headings[1].text"],"lighthouse-core/audits/bootup-time.js | columnScriptEval":["audits[bootup-time].details.headings[2].text"],"lighthouse-core/audits/bootup-time.js | columnScriptParse":["audits[bootup-time].details.headings[3].text"],"lighthouse-core/audits/uses-rel-preload.js | title":["audits[uses-rel-preload].title"],"lighthouse-core/audits/uses-rel-preload.js | description":["audits[uses-rel-preload].description"],"lighthouse-core/audits/uses-rel-preconnect.js | title":["audits[uses-rel-preconnect].title"],"lighthouse-core/audits/uses-rel-preconnect.js | description":["audits[uses-rel-preconnect].description"],"lighthouse-core/lib/i18n/i18n.js | displayValueMsSavings":[{"values":{"wastedMs":304.76800000000003},"path":"audits[uses-rel-preconnect].displayValue"},{"values":{"wastedMs":2834},"path":"audits[render-blocking-resources].displayValue"}],"lighthouse-core/lib/i18n/i18n.js | columnWastedBytes":["audits[uses-rel-preconnect].details.headings[1].label","audits[offscreen-images].details.headings[3].label","audits[render-blocking-resources].details.headings[2].label","audits[unminified-css].details.headings[2].label","audits[unused-css-rules].details.headings[2].label","audits[uses-webp-images].details.headings[3].label","audits[uses-optimized-images].details.headings[3].label","audits[uses-text-compression].details.headings[2].label"],"lighthouse-core/audits/font-display.js | title":["audits[font-display].title"],"lighthouse-core/audits/font-display.js | description":["audits[font-display].description"],"lighthouse-core/audits/network-rtt.js | title":["audits[network-rtt].title"],"lighthouse-core/audits/network-rtt.js | description":["audits[network-rtt].description"],"lighthouse-core/audits/network-server-latency.js | title":["audits[network-server-latency].title"],"lighthouse-core/audits/network-server-latency.js | description":["audits[network-server-latency].description"],"lighthouse-core/audits/offline-start-url.js | failureTitle":["audits[offline-start-url].title"],"lighthouse-core/audits/offline-start-url.js | description":["audits[offline-start-url].description"],"lighthouse-core/audits/performance-budget.js | title":["audits[performance-budget].title"],"lighthouse-core/audits/performance-budget.js | description":["audits[performance-budget].description"],"lighthouse-core/audits/timing-budget.js | title":["audits[timing-budget].title"],"lighthouse-core/audits/timing-budget.js | description":["audits[timing-budget].description"],"lighthouse-core/audits/resource-summary.js | title":["audits[resource-summary].title"],"lighthouse-core/audits/resource-summary.js | description":["audits[resource-summary].description"],"lighthouse-core/audits/resource-summary.js | displayValue":[{"values":{"requestCount":47,"byteCount":3442549},"path":"audits[resource-summary].displayValue"}],"lighthouse-core/lib/i18n/i18n.js | columnResourceType":["audits[resource-summary].details.headings[0].text"],"lighthouse-core/lib/i18n/i18n.js | columnRequests":["audits[resource-summary].details.headings[1].text"],"lighthouse-core/lib/i18n/i18n.js | columnTransferSize":["audits[resource-summary].details.headings[2].text","audits[third-party-summary].details.headings[1].text","audits[uses-long-cache-ttl].details.headings[2].text","audits[total-byte-weight].details.headings[1].text","audits[render-blocking-resources].details.headings[1].label","audits[unminified-css].details.headings[1].label","audits[unused-css-rules].details.headings[1].label","audits[uses-text-compression].details.headings[1].label"],"lighthouse-core/lib/i18n/i18n.js | totalResourceType":["audits[resource-summary].details.items[0].label"],"lighthouse-core/lib/i18n/i18n.js | imageResourceType":["audits[resource-summary].details.items[1].label"],"lighthouse-core/lib/i18n/i18n.js | scriptResourceType":["audits[resource-summary].details.items[2].label"],"lighthouse-core/lib/i18n/i18n.js | stylesheetResourceType":["audits[resource-summary].details.items[3].label"],"lighthouse-core/lib/i18n/i18n.js | fontResourceType":["audits[resource-summary].details.items[4].label"],"lighthouse-core/lib/i18n/i18n.js | documentResourceType":["audits[resource-summary].details.items[5].label"],"lighthouse-core/lib/i18n/i18n.js | otherResourceType":["audits[resource-summary].details.items[6].label"],"lighthouse-core/lib/i18n/i18n.js | mediaResourceType":["audits[resource-summary].details.items[7].label"],"lighthouse-core/lib/i18n/i18n.js | thirdPartyResourceType":["audits[resource-summary].details.items[8].label"],"lighthouse-core/audits/third-party-summary.js | failureTitle":["audits[third-party-summary].title"],"lighthouse-core/audits/third-party-summary.js | description":["audits[third-party-summary].description"],"lighthouse-core/audits/third-party-summary.js | displayValue":[{"values":{"timeInMs":1104.416},"path":"audits[third-party-summary].displayValue"}],"lighthouse-core/audits/third-party-summary.js | columnThirdParty":["audits[third-party-summary].details.headings[0].text"],"lighthouse-core/audits/third-party-summary.js | columnBlockingTime":["audits[third-party-summary].details.headings[2].text"],"lighthouse-core/audits/largest-contentful-paint-element.js | title":["audits[largest-contentful-paint-element].title"],"lighthouse-core/audits/largest-contentful-paint-element.js | description":["audits[largest-contentful-paint-element].description"],"lighthouse-core/lib/i18n/i18n.js | displayValueElementsFound":[{"values":{"nodeCount":1},"path":"audits[largest-contentful-paint-element].displayValue"},{"values":{"nodeCount":5},"path":"audits[layout-shift-elements].displayValue"}],"lighthouse-core/lib/i18n/i18n.js | columnElement":["audits[largest-contentful-paint-element].details.headings[0].text","audits[layout-shift-elements].details.headings[0].text","audits[dom-size].details.headings[1].text"],"lighthouse-core/audits/layout-shift-elements.js | title":["audits[layout-shift-elements].title"],"lighthouse-core/audits/layout-shift-elements.js | description":["audits[layout-shift-elements].description"],"lighthouse-core/audits/layout-shift-elements.js | columnContribution":["audits[layout-shift-elements].details.headings[1].text"],"lighthouse-core/audits/long-tasks.js | title":["audits[long-tasks].title"],"lighthouse-core/audits/long-tasks.js | description":["audits[long-tasks].description"],"lighthouse-core/audits/long-tasks.js | displayValue":[{"values":{"itemCount":20},"path":"audits[long-tasks].displayValue"}],"lighthouse-core/lib/i18n/i18n.js | columnStartTime":["audits[long-tasks].details.headings[1].text"],"lighthouse-core/lib/i18n/i18n.js | columnDuration":["audits[long-tasks].details.headings[2].text"],"lighthouse-core/audits/no-unload-listeners.js | title":["audits[no-unload-listeners].title"],"lighthouse-core/audits/no-unload-listeners.js | description":["audits[no-unload-listeners].description"],"lighthouse-core/audits/non-composited-animations.js | title":["audits[non-composited-animations].title"],"lighthouse-core/audits/non-composited-animations.js | description":["audits[non-composited-animations].description"],"lighthouse-core/audits/unsized-images.js | failureTitle":["audits[unsized-images].title"],"lighthouse-core/audits/unsized-images.js | description":["audits[unsized-images].description"],"lighthouse-core/lib/i18n/i18n.js | columnFailingElem":["audits[unsized-images].details.headings[2].text"],"lighthouse-core/audits/valid-source-maps.js | title":["audits[valid-source-maps].title"],"lighthouse-core/audits/valid-source-maps.js | description":["audits[valid-source-maps].description"],"lighthouse-core/audits/manual/pwa-cross-browser.js | title":["audits[pwa-cross-browser].title"],"lighthouse-core/audits/manual/pwa-cross-browser.js | description":["audits[pwa-cross-browser].description"],"lighthouse-core/audits/manual/pwa-page-transitions.js | title":["audits[pwa-page-transitions].title"],"lighthouse-core/audits/manual/pwa-page-transitions.js | description":["audits[pwa-page-transitions].description"],"lighthouse-core/audits/manual/pwa-each-page-has-url.js | title":["audits[pwa-each-page-has-url].title"],"lighthouse-core/audits/manual/pwa-each-page-has-url.js | description":["audits[pwa-each-page-has-url].description"],"lighthouse-core/audits/accessibility/accesskeys.js | title":["audits.accesskeys.title"],"lighthouse-core/audits/accessibility/accesskeys.js | description":["audits.accesskeys.description"],"lighthouse-core/audits/accessibility/aria-allowed-attr.js | title":["audits[aria-allowed-attr].title"],"lighthouse-core/audits/accessibility/aria-allowed-attr.js | description":["audits[aria-allowed-attr].description"],"lighthouse-core/audits/accessibility/aria-hidden-body.js | title":["audits[aria-hidden-body].title"],"lighthouse-core/audits/accessibility/aria-hidden-body.js | description":["audits[aria-hidden-body].description"],"lighthouse-core/audits/accessibility/aria-hidden-focus.js | title":["audits[aria-hidden-focus].title"],"lighthouse-core/audits/accessibility/aria-hidden-focus.js | description":["audits[aria-hidden-focus].description"],"lighthouse-core/audits/accessibility/aria-input-field-name.js | title":["audits[aria-input-field-name].title"],"lighthouse-core/audits/accessibility/aria-input-field-name.js | description":["audits[aria-input-field-name].description"],"lighthouse-core/audits/accessibility/aria-required-attr.js | title":["audits[aria-required-attr].title"],"lighthouse-core/audits/accessibility/aria-required-attr.js | description":["audits[aria-required-attr].description"],"lighthouse-core/audits/accessibility/aria-required-children.js | title":["audits[aria-required-children].title"],"lighthouse-core/audits/accessibility/aria-required-children.js | description":["audits[aria-required-children].description"],"lighthouse-core/audits/accessibility/aria-required-parent.js | title":["audits[aria-required-parent].title"],"lighthouse-core/audits/accessibility/aria-required-parent.js | description":["audits[aria-required-parent].description"],"lighthouse-core/audits/accessibility/aria-roles.js | title":["audits[aria-roles].title"],"lighthouse-core/audits/accessibility/aria-roles.js | description":["audits[aria-roles].description"],"lighthouse-core/audits/accessibility/aria-toggle-field-name.js | title":["audits[aria-toggle-field-name].title"],"lighthouse-core/audits/accessibility/aria-toggle-field-name.js | description":["audits[aria-toggle-field-name].description"],"lighthouse-core/audits/accessibility/aria-valid-attr-value.js | title":["audits[aria-valid-attr-value].title"],"lighthouse-core/audits/accessibility/aria-valid-attr-value.js | description":["audits[aria-valid-attr-value].description"],"lighthouse-core/audits/accessibility/aria-valid-attr.js | title":["audits[aria-valid-attr].title"],"lighthouse-core/audits/accessibility/aria-valid-attr.js | description":["audits[aria-valid-attr].description"],"lighthouse-core/audits/accessibility/button-name.js | title":["audits[button-name].title"],"lighthouse-core/audits/accessibility/button-name.js | description":["audits[button-name].description"],"lighthouse-core/audits/accessibility/bypass.js | title":["audits.bypass.title"],"lighthouse-core/audits/accessibility/bypass.js | description":["audits.bypass.description"],"lighthouse-core/audits/accessibility/color-contrast.js | title":["audits[color-contrast].title"],"lighthouse-core/audits/accessibility/color-contrast.js | description":["audits[color-contrast].description"],"lighthouse-core/audits/accessibility/definition-list.js | title":["audits[definition-list].title"],"lighthouse-core/audits/accessibility/definition-list.js | description":["audits[definition-list].description"],"lighthouse-core/audits/accessibility/dlitem.js | title":["audits.dlitem.title"],"lighthouse-core/audits/accessibility/dlitem.js | description":["audits.dlitem.description"],"lighthouse-core/audits/accessibility/document-title.js | title":["audits[document-title].title"],"lighthouse-core/audits/accessibility/document-title.js | description":["audits[document-title].description"],"lighthouse-core/audits/accessibility/duplicate-id-active.js | title":["audits[duplicate-id-active].title"],"lighthouse-core/audits/accessibility/duplicate-id-active.js | description":["audits[duplicate-id-active].description"],"lighthouse-core/audits/accessibility/duplicate-id-aria.js | title":["audits[duplicate-id-aria].title"],"lighthouse-core/audits/accessibility/duplicate-id-aria.js | description":["audits[duplicate-id-aria].description"],"lighthouse-core/audits/accessibility/form-field-multiple-labels.js | title":["audits[form-field-multiple-labels].title"],"lighthouse-core/audits/accessibility/form-field-multiple-labels.js | description":["audits[form-field-multiple-labels].description"],"lighthouse-core/audits/accessibility/frame-title.js | title":["audits[frame-title].title"],"lighthouse-core/audits/accessibility/frame-title.js | description":["audits[frame-title].description"],"lighthouse-core/audits/accessibility/heading-order.js | title":["audits[heading-order].title"],"lighthouse-core/audits/accessibility/heading-order.js | description":["audits[heading-order].description"],"lighthouse-core/audits/accessibility/html-has-lang.js | title":["audits[html-has-lang].title"],"lighthouse-core/audits/accessibility/html-has-lang.js | description":["audits[html-has-lang].description"],"lighthouse-core/audits/accessibility/html-lang-valid.js | title":["audits[html-lang-valid].title"],"lighthouse-core/audits/accessibility/html-lang-valid.js | description":["audits[html-lang-valid].description"],"lighthouse-core/audits/accessibility/image-alt.js | title":["audits[image-alt].title"],"lighthouse-core/audits/accessibility/image-alt.js | description":["audits[image-alt].description"],"lighthouse-core/audits/accessibility/input-image-alt.js | title":["audits[input-image-alt].title"],"lighthouse-core/audits/accessibility/input-image-alt.js | description":["audits[input-image-alt].description"],"lighthouse-core/audits/accessibility/label.js | title":["audits.label.title"],"lighthouse-core/audits/accessibility/label.js | description":["audits.label.description"],"lighthouse-core/audits/accessibility/layout-table.js | title":["audits[layout-table].title"],"lighthouse-core/audits/accessibility/layout-table.js | description":["audits[layout-table].description"],"lighthouse-core/audits/accessibility/link-name.js | title":["audits[link-name].title"],"lighthouse-core/audits/accessibility/link-name.js | description":["audits[link-name].description"],"lighthouse-core/audits/accessibility/list.js | title":["audits.list.title"],"lighthouse-core/audits/accessibility/list.js | description":["audits.list.description"],"lighthouse-core/audits/accessibility/listitem.js | title":["audits.listitem.title"],"lighthouse-core/audits/accessibility/listitem.js | description":["audits.listitem.description"],"lighthouse-core/audits/accessibility/meta-refresh.js | title":["audits[meta-refresh].title"],"lighthouse-core/audits/accessibility/meta-refresh.js | description":["audits[meta-refresh].description"],"lighthouse-core/audits/accessibility/meta-viewport.js | title":["audits[meta-viewport].title"],"lighthouse-core/audits/accessibility/meta-viewport.js | description":["audits[meta-viewport].description"],"lighthouse-core/audits/accessibility/object-alt.js | title":["audits[object-alt].title"],"lighthouse-core/audits/accessibility/object-alt.js | description":["audits[object-alt].description"],"lighthouse-core/audits/accessibility/tabindex.js | title":["audits.tabindex.title"],"lighthouse-core/audits/accessibility/tabindex.js | description":["audits.tabindex.description"],"lighthouse-core/audits/accessibility/td-headers-attr.js | title":["audits[td-headers-attr].title"],"lighthouse-core/audits/accessibility/td-headers-attr.js | description":["audits[td-headers-attr].description"],"lighthouse-core/audits/accessibility/th-has-data-cells.js | title":["audits[th-has-data-cells].title"],"lighthouse-core/audits/accessibility/th-has-data-cells.js | description":["audits[th-has-data-cells].description"],"lighthouse-core/audits/accessibility/valid-lang.js | title":["audits[valid-lang].title"],"lighthouse-core/audits/accessibility/valid-lang.js | description":["audits[valid-lang].description"],"lighthouse-core/audits/accessibility/video-caption.js | title":["audits[video-caption].title"],"lighthouse-core/audits/accessibility/video-caption.js | description":["audits[video-caption].description"],"lighthouse-core/audits/accessibility/video-description.js | title":["audits[video-description].title"],"lighthouse-core/audits/accessibility/video-description.js | description":["audits[video-description].description"],"lighthouse-core/audits/byte-efficiency/uses-long-cache-ttl.js | failureTitle":["audits[uses-long-cache-ttl].title"],"lighthouse-core/audits/byte-efficiency/uses-long-cache-ttl.js | description":["audits[uses-long-cache-ttl].description"],"lighthouse-core/audits/byte-efficiency/uses-long-cache-ttl.js | displayValue":[{"values":{"itemCount":42},"path":"audits[uses-long-cache-ttl].displayValue"}],"lighthouse-core/lib/i18n/i18n.js | columnCacheTTL":["audits[uses-long-cache-ttl].details.headings[1].text"],"lighthouse-core/audits/byte-efficiency/total-byte-weight.js | failureTitle":["audits[total-byte-weight].title"],"lighthouse-core/audits/byte-efficiency/total-byte-weight.js | description":["audits[total-byte-weight].description"],"lighthouse-core/audits/byte-efficiency/total-byte-weight.js | displayValue":[{"values":{"totalBytes":3442549},"path":"audits[total-byte-weight].displayValue"}],"lighthouse-core/audits/byte-efficiency/offscreen-images.js | title":["audits[offscreen-images].title"],"lighthouse-core/audits/byte-efficiency/offscreen-images.js | description":["audits[offscreen-images].description"],"lighthouse-core/lib/i18n/i18n.js | displayValueByteSavings":[{"values":{"wastedBytes":660060},"path":"audits[offscreen-images].displayValue"},{"values":{"wastedBytes":4704},"path":"audits[unminified-css].displayValue"},{"values":{"wastedBytes":12851},"path":"audits[unused-css-rules].displayValue"},{"values":{"wastedBytes":837065},"path":"audits[uses-webp-images].displayValue"},{"values":{"wastedBytes":13598},"path":"audits[uses-optimized-images].displayValue"},{"values":{"wastedBytes":18207},"path":"audits[uses-text-compression].displayValue"}],"lighthouse-core/lib/i18n/i18n.js | columnResourceSize":["audits[offscreen-images].details.headings[2].label","audits[uses-webp-images].details.headings[2].label","audits[uses-optimized-images].details.headings[2].label"],"lighthouse-core/audits/byte-efficiency/render-blocking-resources.js | title":["audits[render-blocking-resources].title"],"lighthouse-core/audits/byte-efficiency/render-blocking-resources.js | description":["audits[render-blocking-resources].description"],"lighthouse-core/audits/byte-efficiency/unminified-css.js | title":["audits[unminified-css].title"],"lighthouse-core/audits/byte-efficiency/unminified-css.js | description":["audits[unminified-css].description"],"lighthouse-core/audits/byte-efficiency/unminified-javascript.js | title":["audits[unminified-javascript].title"],"lighthouse-core/audits/byte-efficiency/unminified-javascript.js | description":["audits[unminified-javascript].description"],"lighthouse-core/audits/byte-efficiency/unused-css-rules.js | title":["audits[unused-css-rules].title"],"lighthouse-core/audits/byte-efficiency/unused-css-rules.js | description":["audits[unused-css-rules].description"],"lighthouse-core/audits/byte-efficiency/unused-javascript.js | title":["audits[unused-javascript].title"],"lighthouse-core/audits/byte-efficiency/unused-javascript.js | description":["audits[unused-javascript].description"],"lighthouse-core/audits/byte-efficiency/uses-webp-images.js | title":["audits[uses-webp-images].title"],"lighthouse-core/audits/byte-efficiency/uses-webp-images.js | description":["audits[uses-webp-images].description"],"lighthouse-core/audits/byte-efficiency/uses-optimized-images.js | title":["audits[uses-optimized-images].title"],"lighthouse-core/audits/byte-efficiency/uses-optimized-images.js | description":["audits[uses-optimized-images].description"],"lighthouse-core/audits/byte-efficiency/uses-text-compression.js | title":["audits[uses-text-compression].title"],"lighthouse-core/audits/byte-efficiency/uses-text-compression.js | description":["audits[uses-text-compression].description"],"lighthouse-core/audits/byte-efficiency/uses-responsive-images.js | title":["audits[uses-responsive-images].title"],"lighthouse-core/audits/byte-efficiency/uses-responsive-images.js | description":["audits[uses-responsive-images].description"],"lighthouse-core/audits/byte-efficiency/efficient-animated-content.js | title":["audits[efficient-animated-content].title"],"lighthouse-core/audits/byte-efficiency/efficient-animated-content.js | description":["audits[efficient-animated-content].description"],"lighthouse-core/audits/byte-efficiency/duplicated-javascript.js | title":["audits[duplicated-javascript].title"],"lighthouse-core/audits/byte-efficiency/duplicated-javascript.js | description":["audits[duplicated-javascript].description"],"lighthouse-core/audits/byte-efficiency/legacy-javascript.js | title":["audits[legacy-javascript].title"],"lighthouse-core/audits/byte-efficiency/legacy-javascript.js | description":["audits[legacy-javascript].description"],"lighthouse-core/audits/dobetterweb/appcache-manifest.js | title":["audits[appcache-manifest].title"],"lighthouse-core/audits/dobetterweb/appcache-manifest.js | description":["audits[appcache-manifest].description"],"lighthouse-core/audits/dobetterweb/doctype.js | failureTitle":["audits.doctype.title"],"lighthouse-core/audits/dobetterweb/doctype.js | description":["audits.doctype.description"],"lighthouse-core/audits/dobetterweb/doctype.js | explanationPublicId":["audits.doctype.explanation"],"lighthouse-core/audits/dobetterweb/charset.js | title":["audits.charset.title"],"lighthouse-core/audits/dobetterweb/charset.js | description":["audits.charset.description"],"lighthouse-core/audits/dobetterweb/dom-size.js | title":["audits[dom-size].title"],"lighthouse-core/audits/dobetterweb/dom-size.js | description":["audits[dom-size].description"],"lighthouse-core/audits/dobetterweb/dom-size.js | displayValue":[{"values":{"itemCount":309},"path":"audits[dom-size].displayValue"}],"lighthouse-core/audits/dobetterweb/dom-size.js | columnStatistic":["audits[dom-size].details.headings[0].text"],"lighthouse-core/audits/dobetterweb/dom-size.js | columnValue":["audits[dom-size].details.headings[2].text"],"lighthouse-core/audits/dobetterweb/dom-size.js | statisticDOMElements":["audits[dom-size].details.items[0].statistic"],"lighthouse-core/audits/dobetterweb/dom-size.js | statisticDOMDepth":["audits[dom-size].details.items[1].statistic"],"lighthouse-core/audits/dobetterweb/dom-size.js | statisticDOMWidth":["audits[dom-size].details.items[2].statistic"],"lighthouse-core/audits/dobetterweb/external-anchors-use-rel-noopener.js | title":["audits[external-anchors-use-rel-noopener].title"],"lighthouse-core/audits/dobetterweb/external-anchors-use-rel-noopener.js | description":["audits[external-anchors-use-rel-noopener].description"],"lighthouse-core/audits/dobetterweb/geolocation-on-start.js | title":["audits[geolocation-on-start].title"],"lighthouse-core/audits/dobetterweb/geolocation-on-start.js | description":["audits[geolocation-on-start].description"],"lighthouse-core/audits/dobetterweb/no-document-write.js | title":["audits[no-document-write].title"],"lighthouse-core/audits/dobetterweb/no-document-write.js | description":["audits[no-document-write].description"],"lighthouse-core/audits/dobetterweb/no-vulnerable-libraries.js | failureTitle":["audits[no-vulnerable-libraries].title"],"lighthouse-core/audits/dobetterweb/no-vulnerable-libraries.js | description":["audits[no-vulnerable-libraries].description"],"lighthouse-core/audits/dobetterweb/no-vulnerable-libraries.js | displayValue":[{"values":{"itemCount":4},"path":"audits[no-vulnerable-libraries].displayValue"}],"lighthouse-core/audits/dobetterweb/no-vulnerable-libraries.js | columnVersion":["audits[no-vulnerable-libraries].details.headings[0].text"],"lighthouse-core/audits/dobetterweb/no-vulnerable-libraries.js | columnVuln":["audits[no-vulnerable-libraries].details.headings[1].text"],"lighthouse-core/audits/dobetterweb/no-vulnerable-libraries.js | columnSeverity":["audits[no-vulnerable-libraries].details.headings[2].text"],"lighthouse-core/audits/dobetterweb/no-vulnerable-libraries.js | rowSeverityMedium":["audits[no-vulnerable-libraries].details.items[0].highestSeverity"],"lighthouse-core/audits/dobetterweb/js-libraries.js | title":["audits[js-libraries].title"],"lighthouse-core/audits/dobetterweb/js-libraries.js | description":["audits[js-libraries].description"],"lighthouse-core/lib/i18n/i18n.js | columnName":["audits[js-libraries].details.headings[0].text"],"lighthouse-core/audits/dobetterweb/js-libraries.js | columnVersion":["audits[js-libraries].details.headings[1].text"],"lighthouse-core/audits/dobetterweb/notification-on-start.js | title":["audits[notification-on-start].title"],"lighthouse-core/audits/dobetterweb/notification-on-start.js | description":["audits[notification-on-start].description"],"lighthouse-core/audits/dobetterweb/password-inputs-can-be-pasted-into.js | title":["audits[password-inputs-can-be-pasted-into].title"],"lighthouse-core/audits/dobetterweb/password-inputs-can-be-pasted-into.js | description":["audits[password-inputs-can-be-pasted-into].description"],"lighthouse-core/audits/dobetterweb/uses-http2.js | title":["audits[uses-http2].title"],"lighthouse-core/audits/dobetterweb/uses-http2.js | description":["audits[uses-http2].description"],"lighthouse-core/audits/dobetterweb/uses-passive-event-listeners.js | title":["audits[uses-passive-event-listeners].title"],"lighthouse-core/audits/dobetterweb/uses-passive-event-listeners.js | description":["audits[uses-passive-event-listeners].description"],"lighthouse-core/audits/seo/meta-description.js | title":["audits[meta-description].title"],"lighthouse-core/audits/seo/meta-description.js | description":["audits[meta-description].description"],"lighthouse-core/audits/seo/http-status-code.js | title":["audits[http-status-code].title"],"lighthouse-core/audits/seo/http-status-code.js | description":["audits[http-status-code].description"],"lighthouse-core/audits/seo/font-size.js | title":["audits[font-size].title"],"lighthouse-core/audits/seo/font-size.js | description":["audits[font-size].description"],"lighthouse-core/audits/seo/font-size.js | displayValue":[{"values":{"decimalProportion":1},"path":"audits[font-size].displayValue"}],"lighthouse-core/lib/i18n/i18n.js | columnSource":["audits[font-size].details.headings[0].text"],"lighthouse-core/audits/seo/font-size.js | columnSelector":["audits[font-size].details.headings[1].text"],"lighthouse-core/audits/seo/font-size.js | columnPercentPageText":["audits[font-size].details.headings[2].text"],"lighthouse-core/audits/seo/font-size.js | columnFontSize":["audits[font-size].details.headings[3].text"],"lighthouse-core/audits/seo/font-size.js | legibleText":["audits[font-size].details.items[0].source.value"],"lighthouse-core/audits/seo/link-text.js | title":["audits[link-text].title"],"lighthouse-core/audits/seo/link-text.js | description":["audits[link-text].description"],"lighthouse-core/audits/seo/crawlable-anchors.js | title":["audits[crawlable-anchors].title"],"lighthouse-core/audits/seo/crawlable-anchors.js | description":["audits[crawlable-anchors].description"],"lighthouse-core/audits/seo/is-crawlable.js | title":["audits[is-crawlable].title"],"lighthouse-core/audits/seo/is-crawlable.js | description":["audits[is-crawlable].description"],"lighthouse-core/audits/seo/robots-txt.js | title":["audits[robots-txt].title"],"lighthouse-core/audits/seo/robots-txt.js | description":["audits[robots-txt].description"],"lighthouse-core/audits/seo/tap-targets.js | failureTitle":["audits[tap-targets].title"],"lighthouse-core/audits/seo/tap-targets.js | description":["audits[tap-targets].description"],"lighthouse-core/audits/seo/tap-targets.js | displayValue":[{"values":{"decimalProportion":0.6666666666666666},"path":"audits[tap-targets].displayValue"}],"lighthouse-core/audits/seo/tap-targets.js | tapTargetHeader":["audits[tap-targets].details.headings[0].text"],"lighthouse-core/lib/i18n/i18n.js | columnSize":["audits[tap-targets].details.headings[1].text"],"lighthouse-core/audits/seo/tap-targets.js | overlappingTargetHeader":["audits[tap-targets].details.headings[2].text"],"lighthouse-core/audits/seo/hreflang.js | title":["audits.hreflang.title"],"lighthouse-core/audits/seo/hreflang.js | description":["audits.hreflang.description"],"lighthouse-core/audits/seo/plugins.js | title":["audits.plugins.title"],"lighthouse-core/audits/seo/plugins.js | description":["audits.plugins.description"],"lighthouse-core/audits/seo/canonical.js | title":["audits.canonical.title"],"lighthouse-core/audits/seo/canonical.js | description":["audits.canonical.description"],"lighthouse-core/audits/seo/manual/structured-data.js | title":["audits[structured-data].title"],"lighthouse-core/audits/seo/manual/structured-data.js | description":["audits[structured-data].description"],"lighthouse-core/config/default-config.js | performanceCategoryTitle":["categories.performance.title"],"lighthouse-core/config/default-config.js | a11yCategoryTitle":["categories.accessibility.title"],"lighthouse-core/config/default-config.js | a11yCategoryDescription":["categories.accessibility.description"],"lighthouse-core/config/default-config.js | a11yCategoryManualDescription":["categories.accessibility.manualDescription"],"lighthouse-core/config/default-config.js | bestPracticesCategoryTitle":["categories[best-practices].title"],"lighthouse-core/config/default-config.js | seoCategoryTitle":["categories.seo.title"],"lighthouse-core/config/default-config.js | seoCategoryDescription":["categories.seo.description"],"lighthouse-core/config/default-config.js | seoCategoryManualDescription":["categories.seo.manualDescription"],"lighthouse-core/config/default-config.js | pwaCategoryTitle":["categories.pwa.title"],"lighthouse-core/config/default-config.js | pwaCategoryDescription":["categories.pwa.description"],"lighthouse-core/config/default-config.js | pwaCategoryManualDescription":["categories.pwa.manualDescription"],"lighthouse-core/config/default-config.js | metricGroupTitle":["categoryGroups.metrics.title"],"lighthouse-core/config/default-config.js | loadOpportunitiesGroupTitle":["categoryGroups[load-opportunities].title"],"lighthouse-core/config/default-config.js | loadOpportunitiesGroupDescription":["categoryGroups[load-opportunities].description"],"lighthouse-core/config/default-config.js | budgetsGroupTitle":["categoryGroups.budgets.title"],"lighthouse-core/config/default-config.js | budgetsGroupDescription":["categoryGroups.budgets.description"],"lighthouse-core/config/default-config.js | diagnosticsGroupTitle":["categoryGroups.diagnostics.title"],"lighthouse-core/config/default-config.js | diagnosticsGroupDescription":["categoryGroups.diagnostics.description"],"lighthouse-core/config/default-config.js | pwaFastReliableGroupTitle":["categoryGroups[pwa-fast-reliable].title"],"lighthouse-core/config/default-config.js | pwaInstallableGroupTitle":["categoryGroups[pwa-installable].title"],"lighthouse-core/config/default-config.js | pwaOptimizedGroupTitle":["categoryGroups[pwa-optimized].title"],"lighthouse-core/config/default-config.js | a11yBestPracticesGroupTitle":["categoryGroups[a11y-best-practices].title"],"lighthouse-core/config/default-config.js | a11yBestPracticesGroupDescription":["categoryGroups[a11y-best-practices].description"],"lighthouse-core/config/default-config.js | a11yColorContrastGroupTitle":["categoryGroups[a11y-color-contrast].title"],"lighthouse-core/config/default-config.js | a11yColorContrastGroupDescription":["categoryGroups[a11y-color-contrast].description"],"lighthouse-core/config/default-config.js | a11yNamesLabelsGroupTitle":["categoryGroups[a11y-names-labels].title"],"lighthouse-core/config/default-config.js | a11yNamesLabelsGroupDescription":["categoryGroups[a11y-names-labels].description"],"lighthouse-core/config/default-config.js | a11yNavigationGroupTitle":["categoryGroups[a11y-navigation].title"],"lighthouse-core/config/default-config.js | a11yNavigationGroupDescription":["categoryGroups[a11y-navigation].description"],"lighthouse-core/config/default-config.js | a11yAriaGroupTitle":["categoryGroups[a11y-aria].title"],"lighthouse-core/config/default-config.js | a11yAriaGroupDescription":["categoryGroups[a11y-aria].description"],"lighthouse-core/config/default-config.js | a11yLanguageGroupTitle":["categoryGroups[a11y-language].title"],"lighthouse-core/config/default-config.js | a11yLanguageGroupDescription":["categoryGroups[a11y-language].description"],"lighthouse-core/config/default-config.js | a11yAudioVideoGroupTitle":["categoryGroups[a11y-audio-video].title"],"lighthouse-core/config/default-config.js | a11yAudioVideoGroupDescription":["categoryGroups[a11y-audio-video].description"],"lighthouse-core/config/default-config.js | a11yTablesListsVideoGroupTitle":["categoryGroups[a11y-tables-lists].title"],"lighthouse-core/config/default-config.js | a11yTablesListsVideoGroupDescription":["categoryGroups[a11y-tables-lists].description"],"lighthouse-core/config/default-config.js | seoMobileGroupTitle":["categoryGroups[seo-mobile].title"],"lighthouse-core/config/default-config.js | seoMobileGroupDescription":["categoryGroups[seo-mobile].description"],"lighthouse-core/config/default-config.js | seoContentGroupTitle":["categoryGroups[seo-content].title"],"lighthouse-core/config/default-config.js | seoContentGroupDescription":["categoryGroups[seo-content].description"],"lighthouse-core/config/default-config.js | seoCrawlingGroupTitle":["categoryGroups[seo-crawl].title"],"lighthouse-core/config/default-config.js | seoCrawlingGroupDescription":["categoryGroups[seo-crawl].description"],"lighthouse-core/config/default-config.js | bestPracticesTrustSafetyGroupTitle":["categoryGroups[best-practices-trust-safety].title"],"lighthouse-core/config/default-config.js | bestPracticesUXGroupTitle":["categoryGroups[best-practices-ux].title"],"lighthouse-core/config/default-config.js | bestPracticesBrowserCompatGroupTitle":["categoryGroups[best-practices-browser-compat].title"],"lighthouse-core/config/default-config.js | bestPracticesGeneralGroupTitle":["categoryGroups[best-practices-general].title"]}},"stackPacks":[]};</script>
  <script>console.log('window.__LIGHTHOUSE_JSON__', __LIGHTHOUSE_JSON__);</script>
  <script>
    function __initLighthouseReport__() {
      const dom = new DOM(document);
      const renderer = new ReportRenderer(dom);

      const container = document.querySelector('main');
      renderer.renderReport(window.__LIGHTHOUSE_JSON__, container);

      // Hook in JS features and page-level event listeners after the report
      // is in the document.
      const features = new ReportUIFeatures(dom);
      features.initFeatures(window.__LIGHTHOUSE_JSON__);
    }
    window.addEventListener('DOMContentLoaded', __initLighthouseReport__);

    document.addEventListener('lh-analytics', e => {
      if (window.ga) {
        ga(e.detail.cmd, e.detail.fields);
      }
    });

    document.addEventListener('lh-log', e => {
      const logger = new Logger(document.querySelector('#lh-log'));

      switch (e.detail.cmd) {
        case 'log':
          logger.log(e.detail.msg);
          break;
        case 'warn':
          logger.warn(e.detail.msg);
          break;
        case 'error':
          logger.error(e.detail.msg);
          break;
        case 'hide':
          logger.hide();
          break;
      }
    });
  </script>
</body>
</html>
