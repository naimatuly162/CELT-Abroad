<?php

namespace App\Exceptions;

use Exception;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Illuminate\Auth\AuthenticationException;

class Handler extends ExceptionHandler
{
    /**
     * A list of the exception types that are not reported.
     *
     * @var array
     */
    protected $dontReport = [
        //
    ];

    /**
     * A list of the inputs that are never flashed for validation exceptions.
     *
     * @var array
     */
    protected $dontFlash = [
        'password',
        'password_confirmation',
    ];

    /**
     * Report or log an exception.
     *
     * @param  \Exception  $exception
     * @return void
     *
     * @throws \Exception
     */
    public function report(Exception $exception)
    {
        // dd($exception);
        parent::report($exception);
    }

    /**
     * Render an exception into an HTTP response.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Exception  $exception
     * @return \Symfony\Component\HttpFoundation\Response
     *
     * @throws \Exception
     */
    public function render($request, Exception $exception)
    {
//        // 404 page when a model is not found
//        if ($exception instanceof ModelNotFoundException) {
//            $title = '404';
//            return response()->view('front.404', compact('title' ), 404);
//        }
//
//        // custom error message
//        if ($exception instanceof \ErrorException) {
//            $title = '404';
//            return response()->view('front.404', compact('title' ), 404);
//        } else {
//            return parent::render($request, $exception);
//        }

        return parent::render($request, $exception);
    }

      /**
     * Redirect user on perticulur guard if unauthenticated
     *
     * @param \Illuminate\Http\Request $request;
     * @param AuthenticationException $exception
     *
     * @return \Illuminate\Http\Response
     */
    protected function unauthenticated($request, AuthenticationException $exception)
    {
        if ($request->expectsJson()) {
            return response()->json(['error' => 'Unauthenticated.'], 401);
        }

        $guard = $exception->guards()[0];

        switch ($guard) {
            case 'admin':
                $login = 'admin.login';
                break;
            case 'unirep':
                $login = 'index';
                break;
            default:
                $login = 'index';
                break;
        }

        return redirect()->guest(route($login));
    }
}
