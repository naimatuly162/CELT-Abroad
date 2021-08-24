export function trans(string) {
    const locale = localStorage["celt_locale"]
        ? localStorage["celt_locale"]
        : window.default_locale;

    return _.get(window.i18n[locale], string);
}
