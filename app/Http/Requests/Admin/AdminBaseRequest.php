<?php

namespace App\Http\Requests\Admin;

use App\Model\Locale;
use Illuminate\Contracts\Validation\Factory;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Lang;

class AdminBaseRequest extends FormRequest
{
    /**
     * Set the translation key prefix for attributes.
     *
     * @var string
     */
    protected $translationsAttributesKey = 'validation.attributes.';

    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return auth('admin')->check();
    }

    /**
     * Return an array of rules for translatable fields.
     *
     * @return array
     */
    public function translatableRules()
    {
        return [];
    }

    /**
     * Return an array of messages for translatable fields.
     *
     * @return array
     */
    public function translatableMessages()
    {
        return [];
    }

    /**
     * Create validator instance.
     *
     * @param  \Illuminate\Contracts\Validation\Factory  $factory
     *
     * @return \Illuminate\Contracts\Validation\Validator
     */
    public function validator(Factory $factory)
    {
        $rules = $this->container->call([$this, 'rules']);
        $messages = $this->messages();
        $attributes = $this->attributes();

        $translationRules = $this->container->call([$this, 'translatableRules']);
        $translationMessages = $this->container->call([$this, 'translatableMessages']);
        $translationsAttributesKey = $this->getTranslationsAttributesKey();

        foreach ($this->requiredLocales() as $locale) {
            foreach ($translationRules as $attribute => $rule) {
                $key = $locale->locale . '.' . $attribute;
                $rules[$key] = $locale->is_default ? $rule : 'sometimes|' . $rule;
                $attributes[$key] = Lang::has($translationsAttributesKey . $attribute)
                    ? trans($translationsAttributesKey . $attribute)
                    : $attribute . " (" . $locale->locale . ")";
            }

            foreach ($translationMessages as $attributeAndRule => $message) {
                $messages[$locale->locale . '.' . $attributeAndRule] = $message;
            }
        }

        return $factory->make(
            $this->validationData(), $rules,
            $messages, $attributes
        );
    }

    /**
     * @return \Illuminate\Support\Collection
     */
    public function requiredLocales()
    {
        return Locale::where('is_default', 1)->get();
    }

    /**
     * Get the validation for attributes key from the implementing class
     * or use a sensible default
     *
     * @return string
     */
    private function getTranslationsAttributesKey()
    {
        return rtrim($this->translationsAttributesKey, '.') . '.';
    }
}
