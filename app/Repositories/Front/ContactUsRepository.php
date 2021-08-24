<?php
namespace App\Repositories\Front;

use App\Contracts\Front\ContactUsContract;
use App\Model\ContactUs;
use Illuminate\Support\Facades\Mail;
use App\Mail\SendContactUsAdminMail;
use App\Model\Admin;

class ContactUsRepository implements ContactUsContract
{
    public function store(array $data)
    {
        $contact = new ContactUs;
        $admin_mail = Admin::first()->email;

        $contact->full_name = $data['full_name'];
        $contact->email = $data['email'];
        $contact->phone = $data['phone'];
        $contact->institution = $data['institution'];
        $contact->country = $data['country'];
        $contact->message = $data['message'];

        $contact->save();
        Mail::to('hi@celtabroad.com')->send(new SendContactUsAdminMail($contact));

        return $contact;
    }


}

?>
