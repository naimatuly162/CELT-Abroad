<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use App\Model\UniversityRepresentative;

class ApplicationStatusEmail extends Mailable
{
    use Queueable, SerializesModels;

     public $program;
     public $unirep;
     public $status;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($program,UniversityRepresentative $unirep,$status)
    {
        $this->program = $program;
        $this->unirep = $unirep;
        $this->status = $status;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->markdown('front.emails.application_status')->subject(config('app.name') . ' Application' );
    }
}
