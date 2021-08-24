<?php

namespace App\Mail;

use App\Model\User;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class sendProgramSuggetion extends Mailable
{
    use Queueable, SerializesModels;
    public $user;
    public $program;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct(User $user,$program)
    {
        $this->user = $user;
        $this->program = $program;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->markdown('front.emails.send_program_suggetion')->subject(' Recommended programs for you' );
    }
}
