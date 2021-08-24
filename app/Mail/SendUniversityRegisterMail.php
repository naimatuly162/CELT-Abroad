<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use App\Model\UniversityRepresentative;

class SendUniversityRegisterMail extends Mailable
{
    use Queueable, SerializesModels;

    public $password;
    public $university;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct(UniversityRepresentative $university, $password)
    {
        $this->university = $university;
        $this->password = $password;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->markdown('admin.emails.university_register')
            ->subject(config('app.name') . ' University credentials.' );
    }
}
