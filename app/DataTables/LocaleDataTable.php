<?php

namespace App\DataTables;

use App\Model\Locale;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Html\Column;
use Yajra\DataTables\Html\Editor\Editor;
use Yajra\DataTables\Html\Editor\Fields;
use Yajra\DataTables\Services\DataTable;

class LocaleDataTable extends DataTable
{
    /**
     * Build DataTable class.
     *
     * @param mixed $query Results from query() method.
     * @return \Yajra\DataTables\DataTableAbstract
     */
    public function dataTable($query)
    {
        return datatables()
            ->eloquent($query)
            ->addColumn('action', function($data){
                return '<button id="default_lang" type="button" class="btn btn-sm btn-primary round" locale-data="'.$data->locale.'"><i class="fa fa-check-square"></i></button>
                <a href="'.route('admin.locale.edit', $data->locale).'" class="btn btn-success btn-sm" title="edit"><i class="fa fa-edit"></i></a>
                <button id="locale_delete" type="submit" class="btn btn-sm btn-danger round" locale-data="'.$data->locale.'"><i class="fa fa-trash"></i></button>';
            })
            ->editColumn('is_default', function($data){
                if($data->is_default == 1) {
                    return '<button type="button" class="btn btn-sm btn-success round" ><i class="fa fa-check-square"></i></button>';
                } else {

                }
            })
           ->rawColumns(['action', 'is_default']);
    }

    /**
     * Get query source of dataTable.
     *
     * @param \App\LocaleDatatable $model
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query(Locale $model)
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
                    ->setTableId('localedatatable-table')
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
            Column::make('locale'),
            Column::make('title'),
            Column::make('is_default'),
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
        return 'Locale_' . date('YmdHis');
    }
}
