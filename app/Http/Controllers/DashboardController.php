<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Booking;
use App\Models\CatererProfile;
use App\Models\User;
use App\Models\Menu;
use App\Models\Package;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class DashboardController extends Controller
{
    public function index()
    {
        $user = Auth::user();

        if ($user->role === 'admin') {
            return $this->adminIndex($user);
        }

        if ($user->role === 'caterer') {
            
            $catererProfile = CatererProfile::where('user_id', $user->id)
                ->withAvg('reviews', 'rating')
                ->withCount('reviews')
                ->first();

            $bookings = $catererProfile
                ? Booking::where('caterer_profile_id', $catererProfile->id)
                    ->with(['user', 'review'])
                    ->latest()
                    ->get()
                : collect();

            $menus = $catererProfile
                ? Menu::where('caterer_profile_id', $catererProfile->id)
                    ->orderBy('category')
                    ->orderBy('name')
                    ->get()
                : collect();

            $packages = $catererProfile
                ? Package::where('caterer_profile_id', $catererProfile->id)
                    ->orderBy('price_per_guest')
                    ->get()
                : collect();

            return view('caterer.dashboard-caterer', compact(
                'user', 'bookings', 'catererProfile', 'menus', 'packages'
            ));
        }

        
        $bookings = Booking::where('user_id', $user->id)
            ->with(['catererProfile', 'review'])
            ->latest()
            ->get();

        
        $topPerformer = CatererProfile::where('status', 'verified')
            ->withAvg('reviews', 'rating')
            ->withCount('reviews')
            ->having('reviews_count', '>', 0)
            ->orderByDesc('reviews_avg_rating')
            ->first();

        
        $recommendedCaterers = CatererProfile::where('status', 'verified')
            ->when($topPerformer, fn($q) => $q->where('id', '!=', $topPerformer->id))
            ->withAvg('reviews', 'rating')
            ->withCount('reviews')
            ->orderByDesc('reviews_avg_rating')
            ->take(3)
            ->get();

        return view('dashboard', compact(
            'user', 'bookings', 'topPerformer', 'recommendedCaterers'
        ));
    }

    private function adminIndex($user)
    {
        $users = User::with('catererProfile')->latest()->get();

        // Added: Fetch all bookings for the Admin Booking Monitor
        $bookings = Booking::with(['user', 'catererProfile'])->latest()->get();

        $pendingCaterers = CatererProfile::where('status', 'pending')
            ->with('user')
            ->latest()
            ->get();

        $totalRevenue = Booking::whereIn('bookings.status', ['paid', 'completed'])
            ->whereNotNull('estimated_total')
            ->sum('estimated_total');

        $customerCount = User::whereHas('bookings', function ($query) {
            $query->whereMonth('created_at', Carbon::now()->month)
                  ->whereYear('created_at', Carbon::now()->year);
        })->count();

        $catererCount = User::where('role', 'caterer')->count();

        
        $topCaterers = CatererProfile::with('user')
            ->withCount(['bookings as confirmed_count' => function ($query) {
                $query->whereIn('status', ['paid', 'completed']);
            }])
            ->withAvg('reviews', 'rating')
            ->withCount('reviews')
            ->orderByDesc('confirmed_count')
            ->orderByDesc('reviews_avg_rating')
            ->take(5)
            ->get();

        return view('admin.dashboard', compact(
            'user', 'pendingCaterers', 'users', 'totalRevenue',
            'customerCount', 'catererCount', 'topCaterers', 'bookings'
        ));
    }

    public function updateUser(Request $request, User $user)
    {
        if (Auth::user()->role !== 'admin') {
            abort(403);
        }

        if ($user->role === 'caterer' && $user->catererProfile) {
            $newStatus = $request->has('suspend') ? 'suspended' : 'verified';
            $user->catererProfile->update(['status' => $newStatus]);
            return back()->with('success', 'Caterer account status updated to ' . ucfirst($newStatus) . '.');
        }

        return back()->with('error', 'Only caterer accounts can be moderated.');
    }
}