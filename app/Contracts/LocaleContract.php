<?php
namespace App\Contracts;

/**
 * @method \App\Model\Locale store(array $data) save new Locale
 * @method \App\Model\Locale update(array $data, string $locale) update Locale
 * @method \App\Model\Locale delete(string $locale) delete Locale
 */

interface LocaleContract
{
    public function save(array $data);
    public function update(array $data, string $locale);
    public function delete(string $locale);
}
?>