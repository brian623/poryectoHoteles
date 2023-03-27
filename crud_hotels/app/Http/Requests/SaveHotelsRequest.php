<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class SaveHotelsRequest extends FormRequest
{
    public function rules()
    {
        return [
            'nombre' => [
                'required',
                Rule::unique('info_hotels')->ignore($this->route('id'))
            ]
        ];
    }

    public function messages()
    {
        return [
            'nombre' => 'Este Hotel ya ha sido registrado'
        ];
    }
}
