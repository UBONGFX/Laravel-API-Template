<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return 'Hello, world!';
});

Route::get('/php', function () {
    return phpinfo();
});

Route::get('/healthcheck', function (Request $request) {
    return response()->json([
        'status' => 'ok',
        'message' => 'Health check passed',
        'timestamp' => now(),
    ]);
});
