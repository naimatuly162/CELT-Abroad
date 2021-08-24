<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use App\Model\InstitutionProgram;

class ProgramEligibleStudentMail extends Mailable
{
    use Queueable, SerializesModels;

    public $program, $student;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct(InstitutionProgram $program, $student)
    {
        $this->program = $program;
        $this->student = $student->first_name;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->markdown('front.emails.program')
                    ->subject('This Scholarship is for you. Apply Now');
    }
}
