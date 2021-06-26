<?php

namespace App\Widgets;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use TCG\Voyager\Facades\Voyager;
use Arrilot\Widgets\AbstractWidget;
use Illuminate\Support\Facades\DB;

class CompanyReportDimmer extends AbstractWidget
{
    /**
     * The configuration array.
     *
     * @var array
     */
    protected $config = [];

    /**
     * Treat this method as a controller action.
     * Return view() or other content to display.
     */
    public function run()
    {
        $count = DB::table('company_reports')->where('status', '0')->count();
        $string = trans_choice('Company Reports', $count);

        return view('voyager::dimmer', array_merge($this->config, [
            'icon'   => 'voyager-warning',
            'title'  => "{$count} {$string}",
            'text'   => 'We have ' . "{$count} {$string}" .' pending in our database. Click on button bellow to view all company reports',
            'button' => [
                'text' => 'View all company reports',
                'link' => route('voyager.company-reports.index'),
            ],
            'image' => '/storage/widgets/08.jpg',
        ]));
    }

    /**
     * Determine if the widget should be displayed.
     *
     * @return bool
     */
    public function shouldBeDisplayed()
    {
        return Auth::user()->hasPermission('browse_company_reports');
    }
}
