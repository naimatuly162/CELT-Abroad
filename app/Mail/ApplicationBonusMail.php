<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use App\Model\UniversityRepresentative;

class ApplicationBonusMail extends Mailable
{
    use Queueable, SerializesModels;

     public $program;
     public $unirep;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($program,UniversityRepresentative $unirep)
    {
        $this->program = $program;
        $this->unirep = $unirep;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->markdown('front.emails.bonus_apply')->subject(config('app.name') . ' Application' );
    }
}
