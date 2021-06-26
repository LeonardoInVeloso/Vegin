<?php

namespace App\Widgets;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use TCG\Voyager\Facades\Voyager;
use Arrilot\Widgets\AbstractWidget;
use Illuminate\Support\Facades\DB;

class EstablishmentReportDimmer extends AbstractWidget
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
        $count = DB::table('establishment_reports')->where('status', '0')->count();
        $string = trans_choice('Establishment Reports', $count);

        return view('voyager::dimmer', array_merge($this->config, [
            'icon'   => 'voyager-warning',
            'title'  => "{$count} {$string}",
            'text'   => 'We have ' . "{$count} {$string}" .' pending in our database. Click on button bellow to view all establishments reports',
            'button' => [
                'text' => 'View all establishment reports',
                'link' => route('voyager.establishment-reports.index'),
            ],
            'image' => '/storage/widgets/07.jpg',
        ]));
    }

    /**
     * Determine if the widget should be displayed.
     *
     * @return bool
     */
    public function shouldBeDisplayed()
    {
        return Auth::user()->hasPermission('browse_establishment_reports');
    }
}
