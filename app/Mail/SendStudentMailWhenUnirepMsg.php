<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use App\Model\ApplicationMessages;
use App\Model\User;

class SendStudentMailWhenUnirepMsg extends Mailable
{
    use Queueable, SerializesModels;
    public $messagecreate;
    public $student;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct(ApplicationMessages $messagecreate,User $student)
    {
        $this->messagecreate=$messagecreate;
        $this->student=$student;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->markdown('front.emails.send_student_mail_when_unirep_respond')->subject(config('app.name') . ' UniRep replied to your message.');
    }
}
