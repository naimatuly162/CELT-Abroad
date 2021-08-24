<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use App\Model\UniversityRepresentative;
use App\Model\User;

class ApplyApplicationProgram extends Mailable
{
    use Queueable, SerializesModels;

    public $unirep;
    public $program;
    public $student;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct(UniversityRepresentative $unirep,$program,User $student)
    {
        $this->unirep = $unirep;
        $this->program = $program;
        $this->student = $student;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->markdown('front.emails.application_apply')->subject('CELT Abroad New Applications
' );
    }
}
