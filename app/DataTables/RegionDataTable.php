<?php

namespace App\DataTables;

use App\Model\Region;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Html\Column;
use Yajra\DataTables\Html\Editor\Editor;
use Yajra\DataTables\Html\Editor\Fields;
use Yajra\DataTables\Services\DataTable;
use DB;

class RegionDataTable extends DataTable
{
    /**
     * Build DataTable class.
     *
     * @param mixed $query Results from query() method.
     * @return \Yajra\DataTables\DataTableAbstract
     */
    public function dataTable($query)
    {
        return datatables($query)
            ->addColumn('action', function($data){
                return '<a href="'.route('admin.region.edit', $data->id).'" class="btn btn-success btn-sm" title="Edit Country"><i class="fa fa-edit"></i></a>
                <button id="region_program_delete" type="button" class="btn btn-sm btn-danger round" region-type-id="'.$data->id.'"><i class="fa fa-trash"></i></button>';
            })
            ->editColumn('locale',function($data) {
                return $data->locale ?? '-';
            })
            ->editColumn('title',function($data) {
                return ucfirst($data->title) ?? '-';
            });
    }

    /**
     * Get query source of dataTable.
     *
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query()
    {
        $default_lang = defaultLanguage();

        $query = DB::table('regions as re')
                ->leftJoin('region_translations as rt', 'rt.region_id', '=', 're.id')
                ->where('rt.locale', $default_lang)
                ->where('re.deleted_at', NULL)
                ->select('re.id as id', 'rt.title as title', 'rt.locale as locale')
                ->get();

        return $query;
    }

    /**
     * Optional method if you want to use html builder.
     *
     * @return \Yajra\DataTables\Html\Builder
     */
    public function html()
    {
        return $this->builder()
                    ->setTableId('region_datatable-table')
                    ->columns($this->getColumns())
                    ->minifiedAjax()
                    ->dom('Blfrtip')
                    ->orderBy(1)
                    ->buttons(
                        Button::make('create'),
                        Button::make('export'),
                        Button::make('print'),
                        Button::make('reset'),
                        Button::make('reload')
                    );
    }

    /**
     * Get columns.
     *
     * @return array
     */
    protected function getColumns()
    {
        return [
            Column::make('id'),
            Column::make('locale'),
            Column::make('title'),
            Column::computed('action')
                  ->exportable(false)
                  ->printable(false)
                  ->width(60)
                  ->addClass('text-center'),
        ];
    }

    /**
     * Get filename for export.
     *
     * @return string
     */
    protected function filename()
    {
        return 'Region_' . date('YmdHis');
    }
}
