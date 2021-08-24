<?php

namespace App\DataTables;

use App\Model\TutionfeesPeriod;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Html\Column;
use Yajra\DataTables\Html\Editor\Editor;
use Yajra\DataTables\Html\Editor\Fields;
use Yajra\DataTables\Services\DataTable;
use DB;

class TutionfeesPeriodDataTable extends DataTable
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
                return '<a href="'.route('admin.tution.fees.period.edit', $data->id).'" class="btn btn-success btn-sm" title="Edit Fees Period"><i class="fa fa-edit"></i></a>
                <button id="fees_period_delete" type="button" class="btn btn-sm btn-danger round" fees_period_id="'.$data->id.'"><i class="fa fa-trash"></i></button>';
            })
            ->editColumn('locale',function($data) {
                return $data->locale ?? '-';
            })
            ->editColumn('title',function($data) {
                return $data->title ?? '-';
            });
    }

    /**
     * Get query source of dataTable.
     *
     * @param \App\TutionfeesPeriod $model
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query(TutionfeesPeriod $model)
    {
        $default_lang = defaultLanguage();

        $query = DB::table('tution_fees_periods as t')
                ->leftJoin('tution_fees_period_translations as tf', 'tf.tution_fees_period_id', '=', 't.id')
                ->where('tf.locale', $default_lang)
                ->where('t.deleted_at', NULL)
                ->select('t.id as id', 'tf.title as title', 'tf.locale as locale')
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
                    ->setTableId('tutionfeesperiod-table')
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
            // Column::make('created_at'),
            // Column::make('updated_at'),
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
        return 'TutionfeesPeriod_' . date('YmdHis');
    }
}
