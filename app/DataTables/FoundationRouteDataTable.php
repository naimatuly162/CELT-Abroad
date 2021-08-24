<?php

namespace App\DataTables;

use App\Model\FoundationRoute;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Html\Column;
use Yajra\DataTables\Html\Editor\Editor;
use Yajra\DataTables\Html\Editor\Fields;
use Yajra\DataTables\Services\DataTable;
use DB;

class FoundationRouteDataTable extends DataTable
{
    /**
     * Build DataTable class.
     *
     * @param mixed $query Results from query() method.
     * @return \Yajra\DataTables\DataTableAbstract
     */
    public function dataTable($query)
    {
        $default_lang = defaultLanguage();

        return datatables($query)
            ->addColumn('action', function($data){
                return '<a href="'.route('admin.foundation.route.edit', $data->id).'" class="btn btn-success btn-sm" title="Edit"><i class="fa fa-edit"></i></a>
                <button id="exam_delete" type="button" class="btn btn-sm btn-danger round" exam-id="'.$data->id.'"><i class="fa fa-trash"></i></button>';
            })
            ->editColumn('country',function($data) {
                return $data->country->title ?? '-';
            }); 
    }

    /**
     * Get query source of dataTable.
     *
     * @param \App\FoundationRouteDataTable $model
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query(FoundationRoute $model)
    {
        $query = FoundationRoute::get();
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
                    ->setTableId('examdatatable-table')
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
            Column::make('country'),
            Column::make('apply_to'),
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
        return 'FoundationRoute_' . date('YmdHis');
    }
}
