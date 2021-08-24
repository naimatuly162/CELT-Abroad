<?php

namespace App\Mail;

use App\Model\User;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class SendOtpMail extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public $user,$otp;
    public function __construct( $user,$otp)
    {
        $this->user = $user;
        $this->otp = $otp;

    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->markdown('emails.forget_password.otp')->from('salman.auvi@gmail.com')->to($this->user->email)
            ->with(['user'=>$this->user,'otp'=>$this->otp]);
    }
}
