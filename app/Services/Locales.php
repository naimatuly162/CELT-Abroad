<?php

namespace App\Services;

use App\Model\Locale;

class Locales extends \Astrotomic\Translatable\Locales
{
    public function load(): void
    {
        $languages = Locale::query()->get();

        $this->locales = [];
        foreach ($languages as $language) {
            $this->locales[$language->locale] = $language->locale;
        }
    }
}