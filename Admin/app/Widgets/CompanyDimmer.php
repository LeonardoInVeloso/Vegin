<?php

namespace App\Widgets;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use TCG\Voyager\Facades\Voyager;
use Arrilot\Widgets\AbstractWidget;
use Illuminate\Support\Facades\DB;

class CompanyDimmer extends AbstractWidget
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
        $count = DB::table('companies')->where('status', '0')->count();
        $string = trans_choice('Companies', $count);

        return view('voyager::dimmer', array_merge($this->config, [
            'icon'   => 'voyager-lighthouse',
            'title'  => "{$count} {$string}",
            'text'   => 'We have ' . "{$count} {$string}" .' pending companies in our database. Click on button bellow to view all companies',
            'button' => [
                'text' => 'View all companies',
                'link' => route('voyager.companies.index'),
            ],
            'image' => '/storage/widgets/05.jpg',
        ]));
    }

    /**
     * Determine if the widget should be displayed.
     *
     * @return bool
     */
    public function shouldBeDisplayed()
    {
        return Auth::user()->hasPermission('browse_companies');
    }
}
