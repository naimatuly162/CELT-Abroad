<?php

namespace App\DataTables;

use App\Model\Label;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Html\Column;
use Yajra\DataTables\Html\Editor\Editor;
use Yajra\DataTables\Html\Editor\Fields;
use Yajra\DataTables\Services\DataTable;
use DB;

class LabelDataTable extends DataTable
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
                return '<a href="'.route('admin.label.edit', $data->id).'" class="btn btn-success btn-sm" title="Edit label"><i class="fa fa-edit"></i></a>
                <!--<a href="'.route('admin.label.show', $data->id).'" class="btn btn-info btn-sm" title="View label"><i class="fa fa-eye"></i></a>-->
                <button id="label_delete" type="button" class="btn btn-sm btn-danger round" label-id="'.$data->id.'"><i class="fa fa-trash"></i></button>';
            })
            ->editColumn('color',function($data) {
                return '<p style="background-color:'.$data->color.'">&nbsp</p>';
            })
            ->editColumn('locale',function($data) {
                return $data->locale ?? '';
            })
            ->editColumn('title',function($data) {
                return $data->title ?? '';
            })
            ->rawColumns(['action', 'locale', 'title', 'color']);
    }

    /**
     * Get query source of dataTable.
     *
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query()
    {
        $default_lang = defaultLanguage();

        $query = DB::table('labels as l')
                ->leftJoin('label_translations as lt', 'lt.label_id', '=', 'l.id')
                ->where('lt.locale', $default_lang)
                ->where('l.deleted_at', NULL)
                ->select('l.id as id', 'l.color as color', 'lt.title as title', 'lt.locale as locale')
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
                    ->setTableId('labeldatatable-table')
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
            Column::make('color'),
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
        return 'Label_' . date('YmdHis');
    }
}
