<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use App\Model\ApplicationMessages;
use App\Model\UniversityRepresentative;

class SendUnirepMailWhenStudentRespond extends Mailable
{
    use Queueable, SerializesModels;
    public $messagecreate;
    public $unirep;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct(ApplicationMessages $messagecreate,UniversityRepresentative $unirep)
    {
        $this->messagecreate=$messagecreate;
        $this->unirep=$unirep;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->markdown('front.emails.send_unirep_mail_when_student_respond')->subject(config('app.name') . ' Student Responded to your message.' );
    }
}
