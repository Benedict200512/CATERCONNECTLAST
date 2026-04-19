@extends('layouts.app')

@section('content')
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@700;800;900&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<div class="admin-wrap">

    {{-- ── Sidebar ── --}}
    <aside class="admin-sidebar">
        <div class="sidebar-inner">

            {{-- Brand --}}
            <div class="sidebar-brand">
                <div class="brand-icon">CC</div>
                <div>
                    <div class="brand-name">Cater<span>Connect</span></div>
                    <div class="brand-role">Admin panel</div>
                </div>
            </div>

            {{-- Nav --}}
            <div class="nav-section-label">Main</div>
            <nav class="sidebar-nav">
                <a class="sidebar-link active" href="#overview">
                    <i class="bi bi-grid-fill"></i><span>Dashboard</span>
                </a>
                <a class="sidebar-link" href="#users">
                    <i class="bi bi-people-fill"></i><span>Users</span>
                </a>
                <a class="sidebar-link" href="#verification">
                    <i class="bi bi-patch-check-fill"></i>
                    <span>Verification Queue</span>
                    @if($pendingCaterers->count() > 0)
                        <span class="sidebar-badge">{{ $pendingCaterers->count() }}</span>
                    @endif
                </a>
                <a class="sidebar-link" href="#activity">
                    <i class="bi bi-activity"></i><span>Activity logs</span>
                </a>
            </nav>

            <div class="nav-section-label" style="margin-top:1.25rem;">System</div>
            <nav class="sidebar-nav">
                <a class="sidebar-link" href="#verification">
                    <i class="bi bi-bell-fill"></i>
                    <span>Notifications</span>
                    @if($pendingCaterers->count() > 0)
                        <span class="sidebar-badge">{{ $pendingCaterers->count() }}</span>
                    @endif
                </a>
            </nav>

            {{-- View Site Button --}}
            <a href="{{ url('/') }}" class="view-site-btn">
                <i class="bi bi-house-door-fill"></i>
                <span>View Homepage</span>
                <i class="bi bi-arrow-up-right ms-auto" style="font-size:0.7rem;opacity:0.6;"></i>
            </a>

            {{-- User Footer --}}
            <div class="sidebar-user">
                <div class="sidebar-user-avatar">
                    {{ strtoupper(substr(Auth::user()->name, 0, 1)) }}
                </div>
                <div class="sidebar-user-info">
                    <span class="sidebar-user-name">{{ Auth::user()->name }}</span>
                    <span class="sidebar-user-email">{{ Auth::user()->email }}</span>
                </div>
            </div>

        </div>
    </aside>

    {{-- ── Main ── --}}
    <div class="admin-main">

        {{-- Topbar --}}
        <div class="admin-topbar">
            <h1 class="topbar-title">Dashboard</h1>
            <div class="topbar-right">
                <a href="{{ url('/') }}" class="refresh-btn">
                    <i class="bi bi-house-door"></i> Home
                </a>
                <button class="refresh-btn" onclick="window.location.reload()">
                    <i class="bi bi-arrow-clockwise"></i> Refresh
                </button>
                <span class="topbar-time" id="live-time"></span>
            </div>
        </div>

        {{-- ── Stat Cards ── --}}
        <div id="overview" class="stats-grid">
            <div class="stat-card">
                <p class="stat-label">Total users</p>
                <h2 class="stat-num">{{ number_format($customerCount + $catererCount) }}</h2>
                <span class="stat-sub"><i class="bi bi-arrow-up-short" style="color:#22c55e;"></i> Active platform members</span>
            </div>
            <div class="stat-card">
                <p class="stat-label">Pending Caterers</p>
                <h2 class="stat-num">{{ number_format($pendingCaterers->count()) }}</h2>
                <span class="stat-sub">{{ $pendingCaterers->count() }} pending review</span>
            </div>
            <div class="stat-card">
                <p class="stat-label">Revenue (month)</p>
                <h2 class="stat-num">₱{{ number_format($totalRevenue, 0) }}</h2>
                <span class="stat-sub" style="color:#22c55e;">+8.3% vs last month</span>
            </div>
            <div class="stat-card">
                <p class="stat-label">Verified caterers</p>
                <h2 class="stat-num">{{ number_format($catererCount) }}</h2>
                <span class="stat-sub">{{ $pendingCaterers->count() }} pending approval</span>
            </div>
        </div>

        {{-- ── Two-col row: Chart + Top Performer ── --}}
        <div class="two-col-row">

            {{-- Monthly Bookings Chart --}}
            <div class="dark-card flex-2">
                <div class="dark-card-header">
                    <span class="dark-card-title">Monthly bookings</span>
                    <span class="dark-card-meta">Last 6 months</span>
                </div>
                <div class="chart-bars">
                    @php
                        $months = ['Jan','Feb','Mar','Apr','May','Jun'];
                        $heights = [0, 0, 0, 10, 0, 0];
                    @endphp
                    @foreach($months as $i => $month)
                        <div class="chart-col">
                            <div class="chart-bar" style="height:{{ $heights[$i] }}%;"></div>
                            <span class="chart-label">{{ $month }}</span>
                        </div>
                    @endforeach
                </div>
            </div>

            {{-- Top Performer --}}
            <div class="dark-card flex-1">
                <div class="dark-card-header">
                    <span class="dark-card-title">Top performer</span>
                </div>
                @if($topCaterers && $topCaterers->isNotEmpty())
                    @php $top = $topCaterers->first(); @endphp
                    <div class="top-performer-card">
                        <div class="performer-avatar-wrap">
                            <div class="pulse-ring"></div>
                            <img src="{{ $top->profile_picture ? asset('storage/' . $top->profile_picture) : asset('images/default-profile.png') }}"
                                 class="performer-img" width="56" height="56">
                        </div>
                        <p class="performer-name">{{ $top->business_name }}</p>
                        <div class="performer-stats">
                            <div class="perf-stat">
                                <span class="perf-val">{{ number_format($top->reviews_avg_rating ?? 0, 1) }}</span>
                                <span class="perf-lbl">Rating</span>
                            </div>
                            <div class="perf-divider"></div>
                            <div class="perf-stat">
                                <span class="perf-val">{{ $top->confirmed_count }}</span>
                                <span class="perf-lbl">Orders</span>
                            </div>
                        </div>
                        <div class="booking-status-legend">
                            <span class="legend-dot" style="background:#22c55e;"></span> Completed
                            <span class="legend-dot" style="background:#ef4444;margin-left:10px;"></span> Cancelled
                        </div>
                    </div>
                @else
                    <p class="no-data">No data available.</p>
                @endif
            </div>
        </div>

        {{-- ── Verification Queue ── --}}
        <div id="verification" class="dark-card mb-4">
            <div class="dark-card-header">
                <span class="dark-card-title">Verification Queue</span>
                <span class="orange-badge">{{ $pendingCaterers->count() }} Pending</span>
            </div>
            <div class="table-responsive">
                <table class="admin-table">
                    <thead>
                        <tr>
                            <th class="ps-4">Business Details</th>
                            <th>Specialty</th>
                            <th>Documents</th>
                            <th class="text-end pe-4">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($pendingCaterers as $caterer)
                            <tr>
                                <td class="ps-4">
                                    <div class="user-cell">
                                        <img src="{{ asset('storage/' . $caterer->profile_picture) }}"
                                             class="table-avatar" width="38" height="38">
                                        <div>
                                            <p class="cell-name">{{ $caterer->business_name }}</p>
                                            <p class="cell-sub">{{ $caterer->user->email }}</p>
                                        </div>
                                    </div>
                                </td>
                                <td><span class="table-pill">{{ $caterer->specialty }}</span></td>
                                <td>
                                    <div style="display:flex;gap:5px;flex-wrap:wrap;">
                                        @if($caterer->business_permit)
                                            <a href="{{ asset('storage/' . $caterer->business_permit) }}" target="_blank" class="doc-pill">
                                                <i class="bi bi-file-earmark-text"></i> Business
                                            </a>
                                        @endif
                                        @if($caterer->sanitary_permit)
                                            <a href="{{ asset('storage/' . $caterer->sanitary_permit) }}" target="_blank" class="doc-pill">
                                                <i class="bi bi-file-earmark-medical"></i> Sanitary
                                            </a>
                                        @endif
                                        @if($caterer->government_id)
                                            <a href="{{ asset('storage/' . $caterer->government_id) }}" target="_blank" class="doc-pill">
                                                <i class="bi bi-person-vcard"></i> Gov ID
                                            </a>
                                        @endif
                                    </div>
                                </td>
                               <td class="text-end pe-4">
    <div style="display:flex;gap:6px;justify-content:flex-end;align-items:center;">
        <form action="{{ route('admin.approve', $caterer->id) }}" method="POST">
            @csrf
            <button type="submit" class="approve-btn">
                <i class="bi bi-check-lg"></i> Approve
            </button>
        </form>
        <button type="button" class="decline-btn"
            onclick="openDeclineModal({{ $caterer->id }}, '{{ addslashes($caterer->business_name) }}')">
            <i class="bi bi-x-lg"></i> Decline
        </button>
    </div>
</td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="4" class="empty-row">
                                    <i class="bi bi-inbox" style="font-size:1.4rem;display:block;margin-bottom:6px;opacity:0.3;"></i>
                                    No applications awaiting review.
                                </td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
        </div>

        {{-- ── Activity Log + User Monitoring ── --}}
        <div class="two-col-row" id="activity">

            {{-- Recent Activity --}}
            <div class="dark-card flex-1">
                <div class="dark-card-header">
                    <span class="dark-card-title">Recent activity</span>
                </div>
                <table class="admin-table">
                    <thead>
                        <tr>
                            <th>User</th>
                            <th>Action</th>
                            <th>Time</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($pendingCaterers->take(5) as $caterer)
                            <tr>
                                <td>
                                    <div class="user-cell">
                                        <div class="activity-avatar" style="background:{{ ['#6366f1','#f59e0b','#ec4899','#22c55e'][($loop->index % 4)] }};">
                                            {{ strtoupper(substr($caterer->business_name, 0, 2)) }}
                                        </div>
                                        <span class="cell-name">{{ $caterer->business_name }}</span>
                                    </div>
                                </td>
                                <td><span class="cell-sub">Caterer registration</span></td>
                                <td><span class="cell-sub">{{ $caterer->created_at->diffForHumans() }}</span></td>
                                <td><span class="status-pill status-pending">Pending</span></td>
                            </tr>
                        @empty
                            <tr><td colspan="4" class="empty-row">No recent activity.</td></tr>
                        @endforelse
                    </tbody>
                </table>
            </div>

            {{-- User Monitoring --}}
            <div class="dark-card flex-1" id="users">
                <div class="dark-card-header">
                    <span class="dark-card-title">User monitoring</span>
                </div>
                <table class="admin-table">
                    <thead>
                        <tr>
                            <th>User</th>
                            <th>Role</th>
                            <th>Status</th>
                            <th class="text-end">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($users as $u)
                            <tr>
                                <td>
                                    <div class="user-cell">
                                        <div class="initial-avatar">{{ strtoupper(substr($u->name, 0, 1)) }}</div>
                                        <div>
                                            <p class="cell-name">{{ $u->name }}</p>
                                            <p class="cell-sub">{{ $u->email }}</p>
                                        </div>
                                    </div>
                                </td>
                                <td><span class="table-pill">{{ ucfirst($u->role) }}</span></td>
                                <td>
                                    @if($u->role === 'caterer' && $u->catererProfile)
                                        @php
                                            $status = $u->catererProfile->status;
                                            $cls = match($status) {
                                                'verified'  => 'status-verified',
                                                'suspended' => 'status-suspended',
                                                default     => 'status-pending',
                                            };
                                        @endphp
                                        <span class="status-pill {{ $cls }}">{{ ucfirst($status) }}</span>
                                    @else
                                        <span class="status-pill status-active">Active</span>
                                    @endif
                                </td>
                                <td class="text-end">
                                    @if($u->role === 'caterer' && $u->catererProfile)
                                        <form action="{{ route('admin.users.update', $u->id) }}" method="POST" class="d-inline">
                                            @csrf @method('PATCH')
                                            @if($u->catererProfile->status == 'verified')
                                                <button type="submit" name="suspend" value="1" class="mod-btn mod-danger">
                                                    <i class="bi bi-slash-circle"></i> Suspend
                                                </button>
                                            @else
                                                <button type="submit" name="activate" value="1" class="mod-btn mod-success">
                                                    <i class="bi bi-check-circle"></i> Reactivate
                                                </button>
                                            @endif
                                        </form>
                                    @else
                                        <span class="protected-label">Protected</span>
                                    @endif
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>

        {{-- Decline Modal --}}
<div id="decline-modal" style="display:none;position:fixed;inset:0;background:rgba(0,0,0,0.65);z-index:9999;align-items:center;justify-content:center;">
    <div style="background:#1a1a1a;border:1px solid #2a2a2a;border-radius:16px;padding:1.75rem;width:100%;max-width:420px;margin:1rem;">
        <h3 style="font-family:'Montserrat',sans-serif;font-weight:900;font-size:1.1rem;color:#f9fafb;margin:0 0 4px;">Decline application</h3>
        <p id="decline-modal-sub" style="font-size:0.82rem;color:#6b7280;margin:0 0 1.25rem;"></p>
        <form id="decline-form" method="POST">
            @csrf
            <label style="display:block;font-size:0.78rem;font-weight:600;color:#9ca3af;margin-bottom:6px;">Reason <span style="color:#f87171;">*</span></label>
            <textarea name="rejection_reason" rows="3" required maxlength="500"
                placeholder="e.g. Documents incomplete or unreadable..."
                style="width:100%;background:#111;border:1px solid #2a2a2a;border-radius:8px;padding:10px 12px;color:#f9fafb;font-size:0.83rem;resize:vertical;outline:none;box-sizing:border-box;font-family:'Inter',sans-serif;"></textarea>
            <div style="display:flex;gap:8px;margin-top:1rem;justify-content:flex-end;">
                <button type="button" onclick="closeDeclineModal()"
                    style="padding:7px 18px;border-radius:999px;background:#242424;border:1px solid #2a2a2a;color:#9ca3af;font-size:0.8rem;font-weight:600;cursor:pointer;">
                    Cancel
                </button>
                <button type="submit" class="decline-btn" style="border-radius:999px;padding:7px 18px;">
                    <i class="bi bi-x-lg"></i> Confirm Decline
                </button>
            </div>
        </form>
    </div>
</div>

    </div>{{-- end admin-main --}}
</div>{{-- end admin-wrap --}}

<style>
    body { padding-top: 0 !important; margin: 0; }

    /* ── Layout ── */
    .admin-wrap {
        display: flex;
        min-height: 100vh;
        background: #0f0f0f;
        font-family: 'Inter', sans-serif;
        color: #e5e7eb;
    }

    /* ── Sidebar ── */
    .admin-sidebar {
        width: 210px;
        min-width: 210px;
        background: #161616;
        border-right: 1px solid #1f1f1f;
        position: sticky;
        top: 0;
        height: 100vh;
        overflow-y: auto;
        display: flex;
        flex-direction: column;
    }
    .sidebar-inner {
        padding: 1.25rem 0.9rem;
        display: flex;
        flex-direction: column;
        height: 100%;
        gap: 2px;
    }
    .sidebar-brand {
        display: flex; align-items: center; gap: 10px;
        padding: 0.5rem 0.5rem 1.25rem;
        border-bottom: 1px solid #1f1f1f;
        margin-bottom: 1rem;
    }
    .brand-icon {
        width: 38px; height: 38px;
        background: linear-gradient(135deg, #FF7A00, #ff9d42);
        border-radius: 10px;
        display: flex; align-items: center; justify-content: center;
        font-family: 'Montserrat', sans-serif;
        font-weight: 900; font-size: 0.75rem; color: white;
        flex-shrink: 0;
        box-shadow: 0 4px 14px rgba(255,122,0,0.3);
    }
    .brand-name {
        font-family: 'Montserrat', sans-serif;
        font-weight: 900; font-size: 0.95rem;
        color: #f9fafb; display: block; line-height: 1.2;
    }
    .brand-name span { color: #FF7A00; }
    .brand-role { font-size: 0.7rem; color: #4b5563; font-weight: 500; }

    .nav-section-label {
        font-size: 0.65rem; font-weight: 700;
        text-transform: uppercase; letter-spacing: 0.1em;
        color: #4b5563; padding: 0 0.5rem;
        margin: 0.5rem 0 0.35rem;
    }
    .sidebar-nav { display: flex; flex-direction: column; gap: 1px; }
    .sidebar-link {
        display: flex; align-items: center; gap: 9px;
        padding: 8px 10px; border-radius: 8px;
        color: #6b7280; text-decoration: none;
        font-size: 0.85rem; font-weight: 500;
        transition: all 0.15s ease;
    }
    .sidebar-link i { font-size: 0.95rem; flex-shrink: 0; }
    .sidebar-link span { flex: 1; }
    .sidebar-link:hover { background: #1f1f1f; color: #f9fafb; }
    .sidebar-link.active { background: #1f1f1f; color: #f9fafb; }
    .sidebar-link.active i { color: #FF7A00; }
    .sidebar-badge {
        background: #FF7A00; color: white;
        font-size: 0.65rem; font-weight: 700;
        padding: 1px 6px; border-radius: 999px; min-width: 18px; text-align: center;
    }

    .view-site-btn {
        display: flex; align-items: center; gap: 8px;
        margin: 1rem 0 0;
        padding: 8px 10px; border-radius: 8px;
        background: rgba(255,122,0,0.08);
        border: 1px solid rgba(255,122,0,0.18);
        color: #FF7A00; text-decoration: none;
        font-size: 0.82rem; font-weight: 600;
        transition: all 0.15s ease;
    }
    .view-site-btn:hover { background: rgba(255,122,0,0.15); color: #ff9d42; }

    .sidebar-user {
        margin-top: auto; padding-top: 1rem;
        border-top: 1px solid #1f1f1f;
        display: flex; align-items: center; gap: 9px;
    }
    .sidebar-user-avatar {
        width: 32px; height: 32px; border-radius: 50%;
        background: linear-gradient(135deg, #FF7A00, #ff9d42);
        display: flex; align-items: center; justify-content: center;
        font-weight: 800; font-size: 0.8rem; color: white; flex-shrink: 0;
    }
    .sidebar-user-name {
        font-size: 0.8rem; font-weight: 600; color: #f9fafb; display: block;
    }
    .sidebar-user-email { font-size: 0.68rem; color: #4b5563; }

    /* ── Main ── */
    .admin-main {
        flex: 1; padding: 1.5rem 1.75rem 3rem;
        overflow-x: hidden;
    }

    /* Topbar */
    .admin-topbar {
        display: flex; justify-content: space-between; align-items: center;
        margin-bottom: 1.5rem; flex-wrap: wrap; gap: 10px;
    }
    .topbar-title {
        font-family: 'Montserrat', sans-serif;
        font-weight: 900; font-size: 1.4rem;
        color: #f9fafb; margin: 0;
    }
    .topbar-right { display: flex; align-items: center; gap: 8px; }
    .refresh-btn {
        display: inline-flex; align-items: center; gap: 6px;
        padding: 6px 14px; border-radius: 8px;
        border: 1px solid #2a2a2a; background: #1a1a1a;
        color: #d1d5db; font-size: 0.8rem; font-weight: 500;
        cursor: pointer; text-decoration: none;
        transition: all 0.15s ease;
    }
    .refresh-btn:hover { border-color: #FF7A00; color: #FF7A00; }
    .topbar-time {
        font-size: 0.8rem; color: #6b7280; font-weight: 500;
        padding: 6px 12px; background: #1a1a1a;
        border: 1px solid #2a2a2a; border-radius: 8px;
        font-variant-numeric: tabular-nums;
    }

    /* ── Stats Grid ── */
    .stats-grid {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 12px; margin-bottom: 16px;
    }
    .stat-card {
        background: #1a1a1a; border: 1px solid #2a2a2a;
        border-radius: 12px; padding: 1.1rem 1.25rem;
    }
    .stat-label {
        font-size: 0.75rem; color: #6b7280; font-weight: 500; margin: 0 0 6px;
    }
    .stat-num {
        font-family: 'Montserrat', sans-serif;
        font-weight: 900; font-size: 1.65rem;
        color: #f9fafb; margin: 0 0 5px;
    }
    .stat-sub { font-size: 0.73rem; color: #4b5563; }

    /* ── Two-col row ── */
    .two-col-row {
        display: flex; gap: 14px; margin-bottom: 16px; flex-wrap: wrap;
    }
    .flex-1 { flex: 1; min-width: 280px; }
    .flex-2 { flex: 2; min-width: 320px; }

    /* ── Dark Cards ── */
    .dark-card {
        background: #1a1a1a; border: 1px solid #2a2a2a;
        border-radius: 14px; overflow: hidden;
    }
    .dark-card-header {
        display: flex; justify-content: space-between; align-items: center;
        padding: 1rem 1.25rem;
        border-bottom: 1px solid #242424;
    }
    .dark-card-title {
        font-weight: 700; font-size: 0.95rem; color: #f9fafb;
    }
    .dark-card-meta { font-size: 0.75rem; color: #4b5563; }
    .orange-badge {
        background: rgba(255,122,0,0.12); border: 1px solid rgba(255,122,0,0.25);
        color: #FF7A00; font-size: 0.75rem; font-weight: 700;
        padding: 3px 10px; border-radius: 999px;
    }

    /* ── Chart ── */
    .chart-bars {
        display: flex; align-items: flex-end; gap: 10px;
        padding: 1rem 1.25rem 0.75rem;
        height: 160px;
    }
    .chart-col {
        flex: 1; display: flex; flex-direction: column;
        align-items: center; gap: 6px; height: 100%;
        justify-content: flex-end;
    }
    .chart-bar {
        width: 100%; border-radius: 4px 4px 0 0;
        background: #FF7A00;
        transition: height 0.3s ease;
        min-height: 4px;
    }
    .chart-label { font-size: 0.7rem; color: #4b5563; font-weight: 500; }

    /* ── Top Performer ── */
    .top-performer-card {
        padding: 1rem 1.25rem;
        display: flex; flex-direction: column; align-items: center; gap: 10px;
        text-align: center;
    }
    .performer-avatar-wrap { position: relative; }
    .performer-img {
        border-radius: 50%; object-fit: cover;
        border: 2px solid rgba(251,191,36,0.4);
    }
    .pulse-ring {
        position: absolute; top: 50%; left: 50%;
        transform: translate(-50%, -50%);
        width: 64px; height: 64px; border-radius: 50%;
        background: rgba(251,191,36,0.15);
        animation: pulse-anim 2s infinite;
    }
    @keyframes pulse-anim {
        0%   { transform: translate(-50%,-50%) scale(1); opacity: 0.8; }
        100% { transform: translate(-50%,-50%) scale(1.6); opacity: 0; }
    }
    .performer-name { font-weight: 700; font-size: 0.9rem; color: #f9fafb; margin: 0; }
    .performer-stats { display: flex; align-items: center; gap: 16px; }
    .perf-stat { display: flex; flex-direction: column; align-items: center; }
    .perf-val { font-family: 'Montserrat', sans-serif; font-weight: 800; font-size: 1.1rem; color: #f9fafb; }
    .perf-lbl { font-size: 0.7rem; color: #4b5563; }
    .perf-divider { width: 1px; height: 28px; background: #2a2a2a; }
    .booking-status-legend {
        font-size: 0.73rem; color: #4b5563;
        display: flex; align-items: center; gap: 4px;
    }
    .legend-dot { width: 8px; height: 8px; border-radius: 50%; display: inline-block; }

    /* ── Tables ── */
    .admin-table {
        width: 100%; border-collapse: collapse; font-size: 0.83rem;
    }
    .admin-table thead th {
        font-size: 0.68rem; font-weight: 700;
        text-transform: uppercase; letter-spacing: 0.07em;
        color: #4b5563; padding: 9px 12px;
        border-bottom: 1px solid #242424;
        background: #161616;
    }
    .admin-table tbody td {
        padding: 11px 12px;
        border-bottom: 1px solid #1f1f1f;
        vertical-align: middle;
    }
    .admin-table tbody tr:last-child td { border-bottom: none; }
    .admin-table tbody tr:hover td { background: #1f1f1f; }

    .user-cell { display: flex; align-items: center; gap: 9px; }
    .table-avatar { border-radius: 50%; object-fit: cover; border: 1px solid #2a2a2a; flex-shrink: 0; }
    .activity-avatar {
        width: 32px; height: 32px; border-radius: 50%;
        display: flex; align-items: center; justify-content: center;
        font-size: 0.68rem; font-weight: 700; color: white; flex-shrink: 0;
    }
    .initial-avatar {
        width: 32px; height: 32px; border-radius: 8px;
        background: rgba(255,122,0,0.12);
        display: flex; align-items: center; justify-content: center;
        font-weight: 700; font-size: 0.85rem; color: #FF7A00; flex-shrink: 0;
    }
    .cell-name { font-weight: 600; font-size: 0.83rem; color: #f9fafb; margin: 0 0 1px; }
    .cell-sub  { font-size: 0.72rem; color: #4b5563; margin: 0; }
    .no-data   { color: #4b5563; font-size: 0.83rem; font-style: italic; padding: 1rem 1.25rem; }

    /* Pills */
    .table-pill {
        background: #242424; color: #9ca3af;
        border: 1px solid #2a2a2a;
        font-size: 0.73rem; font-weight: 500;
        padding: 3px 10px; border-radius: 999px;
    }
    .doc-pill {
        display: inline-flex; align-items: center; gap: 4px;
        padding: 3px 10px; border-radius: 999px;
        border: 1px solid #2a2a2a; background: #242424;
        color: #9ca3af; font-size: 0.73rem; font-weight: 500;
        text-decoration: none; white-space: nowrap;
        transition: all 0.15s ease;
    }
    .doc-pill:hover { border-color: #FF7A00; color: #FF7A00; }

    .status-pill {
        font-size: 0.73rem; font-weight: 600;
        padding: 3px 10px; border-radius: 999px;
        border: 1px solid transparent;
    }
    .status-active    { background: rgba(59,130,246,0.1);  color: #60a5fa; border-color: rgba(59,130,246,0.2); }
    .status-pending   { background: rgba(234,179,8,0.1);   color: #fbbf24; border-color: rgba(234,179,8,0.2); }
    .status-suspended { background: rgba(239,68,68,0.1);   color: #f87171; border-color: rgba(239,68,68,0.2); }
    .status-verified  { background: rgba(34,197,94,0.1);   color: #4ade80; border-color: rgba(34,197,94,0.2); }

    /* Buttons */
    .approve-btn {
        display: inline-flex; align-items: center; gap: 5px;
        padding: 5px 14px; border-radius: 999px;
        background: rgba(34,197,94,0.1); color: #4ade80;
        border: 1px solid rgba(34,197,94,0.25);
        font-size: 0.78rem; font-weight: 600; cursor: pointer;
        transition: all 0.15s ease;
    }
    .approve-btn:hover { background: #16a34a; color: white; border-color: #16a34a; }

    .decline-btn {
    display: inline-flex; align-items: center; gap: 5px;
    padding: 5px 14px; border-radius: 999px;
    background: rgba(239,68,68,0.1); color: #f87171;
    border: 1px solid rgba(239,68,68,0.25);
    font-size: 0.78rem; font-weight: 600; cursor: pointer;
    transition: all 0.15s ease;
}
.decline-btn:hover { background: #dc2626; color: white; border-color: #dc2626; }

    .mod-btn {
        display: inline-flex; align-items: center; gap: 5px;
        padding: 4px 12px; border-radius: 999px;
        font-size: 0.75rem; font-weight: 600;
        cursor: pointer; border: 1px solid transparent;
        transition: all 0.15s ease;
    }
    .mod-danger  { background: rgba(239,68,68,0.1);  color: #f87171; border-color: rgba(239,68,68,0.2); }
    .mod-success { background: rgba(34,197,94,0.1);  color: #4ade80; border-color: rgba(34,197,94,0.2); }
    .mod-danger:hover  { background: #dc2626; color: white; border-color: #dc2626; }
    .mod-success:hover { background: #16a34a; color: white; border-color: #16a34a; }

    .protected-label { font-size: 0.75rem; color: #374151; font-style: italic; }
    .empty-row { text-align: center; padding: 2.5rem 1rem; color: #4b5563; font-weight: 500; }

    html { scroll-behavior: smooth; }

    @media (max-width: 768px) {
        .admin-sidebar { display: none; }
        .stats-grid { grid-template-columns: repeat(2, 1fr); }
        .admin-main { padding: 1rem; }
    }
    @media (max-width: 480px) {
        .stats-grid { grid-template-columns: 1fr; }
    }
</style>

<script>
    function updateTime() {
        const now = new Date();
        const h = String(now.getHours()).padStart(2,'0');
        const m = String(now.getMinutes()).padStart(2,'0');
        const s = String(now.getSeconds()).padStart(2,'0');
        const el = document.getElementById('live-time');
        if (el) el.textContent = `${h}:${m}:${s}`;
    }
    updateTime();
    setInterval(updateTime, 1000);

    // Sidebar active link on scroll
    const links = document.querySelectorAll('.sidebar-link');
    links.forEach(link => {
        link.addEventListener('click', function() {
            links.forEach(l => l.classList.remove('active'));
            this.classList.add('active');
        });
    });

    function openDeclineModal(id, name) {
    document.getElementById('decline-modal-sub').textContent = 'Declining: ' + name;
    document.getElementById('decline-form').action = '/admin/caterers/' + id + '/reject';
    const modal = document.getElementById('decline-modal');
    modal.style.display = 'flex';
}
function closeDeclineModal() {
    document.getElementById('decline-modal').style.display = 'none';
}
document.getElementById('decline-modal').addEventListener('click', function(e) {
    if (e.target === this) closeDeclineModal();
});
</script>
@endsection