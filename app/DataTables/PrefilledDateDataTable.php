<?php

namespace App\DataTables;

use App\Model\PrefilledDate;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Html\Column;
use Yajra\DataTables\Html\Editor\Editor;
use Yajra\DataTables\Html\Editor\Fields;
use Yajra\DataTables\Services\DataTable;

class PrefilledDateDataTable extends DataTable
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
                return '<a href="'.route('admin.prefilled.date.edit', $data->id).'" class="btn btn-success btn-sm" title="Edit label"><i class="fa fa-edit"></i></a>
                <button id="prefilled_date_delete" type="button" class="btn btn-sm btn-danger round" prefilled-date-id="'.$data->id.'"><i class="fa fa-trash"></i></button>';
            })
            ->editColumn('type',function($data) {
                return $data->type == 1  ? 'Start period' : 'End period';
            })
            ->rawColumns(['action', 'type']);
    }

    /**
     * Get query source of dataTable.
     *
     * @param \App\PrefilledDateDataTable $model
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query(PrefilledDate $model)
    {
        return $model->newQuery();
    }

    /**
     * Optional method if you want to use html builder.
     *
     * @return \Yajra\DataTables\Html\Builder
     */
    public function html()
    {
        return $this->builder()
                    ->setTableId('prefilleddatedatatable-table')
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
            Column::make('type'),
            Column::make('period'),
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
        return 'PrefilledDate_' . date('YmdHis');
    }
}
