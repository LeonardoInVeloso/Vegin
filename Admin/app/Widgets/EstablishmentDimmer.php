<?php

namespace App\Widgets;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use TCG\Voyager\Facades\Voyager;
use Arrilot\Widgets\AbstractWidget;
use Illuminate\Support\Facades\DB;

class EstablishmentDimmer extends AbstractWidget
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
        $count = DB::table('establishments')->where('status', '0')->count();
        $string = trans_choice('Establishments', $count);

        return view('voyager::dimmer', array_merge($this->config, [
            'icon'   => 'voyager-shop',
            'title'  => "{$count} {$string}",
            'text'   => 'We have ' . "{$count} {$string}" .' pending in our database. Click on button bellow to view all establishment',
            'button' => [
                'text' => 'View all establishment',
                'link' => route('voyager.establishments.index'),
            ],
            'image' => '/storage/widgets/06.jpg',
        ]));
    }

    /**
     * Determine if the widget should be displayed.
     *
     * @return bool
     */
    public function shouldBeDisplayed()
    {
        return Auth::user()->hasPermission('browse_establishments');
    }
}
