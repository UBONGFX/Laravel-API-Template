<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class HealthController extends Controller
{
    public function index() {

        $response = [
            'status' => 'ok',
            'timestamp' => now()->toIso8601String()
        ];
  
        return response()->json($response);
    }

    public function dbCheck() {

        $startTime = microtime(true);

        // Check database connection
        $dbConnection = 'ok';
        try {
            DB::connection()->getPdo();
        } catch (\Exception $e) {
            $dbConnection = 'error: ' . $e->getMessage();
        }
    
        $endTime = microtime(true);
        $executionTime = ($endTime - $startTime) * 1000;

        $response = [
            'status' => $dbConnection === 'ok' ? 'ok' : 'failed',
            'message' => $dbConnection === 'ok' ? 'Database connection is healthy' : 'Database connection failed',
            'timestamp' => now()->toIso8601String(),
            'database' => $dbConnection,
            'db_connection_time_ms' => $executionTime,
        ];
            
        return response()->json($response);
    }

}