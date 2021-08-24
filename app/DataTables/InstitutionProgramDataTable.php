<?php

namespace App\DataTables;

use App\Model\InstitutionProgram;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Html\Column;
use Yajra\DataTables\Html\Editor\Editor;
use Yajra\DataTables\Html\Editor\Fields;
use Yajra\DataTables\Services\DataTable;

class InstitutionProgramDataTable extends DataTable
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
                return '<a href="'.route('admin.programs.edit', $data->id).'" class="btn btn-success btn-sm" title="Edit program"><i class="fa fa-edit"></i></a>
                <a href="'.route('admin.programs.show', $data->id).'" class="btn btn-info btn-sm" title="view"><i class="fa fa-eye"></i></a>
                <button id="institution_delete" type="button" class="btn btn-sm btn-danger round" institution-id="'.$data->id.'"><i class="fa fa-trash"></i></button>';
            })
            ->editColumn('institution_id',function($data) {
                return $data->institution ? $data->institution->title : '';
            })
            ->addColumn('title',function($data) {
                return $data->title ?? '-';
            })
            ->editColumn('country_id',function($data) {
                return $data->country ? $data->country->title : '';
            })
             ->editColumn('is_featured',function($data) {
                if ($data->is_featured == 1) {
                    return '<button id="is_featured" type="button" class="btn btn-sm btn-success round" institution-data="'.$data->id.'">Yes</button>';
                }else {
                     return '<button id="is_featured" type="button" class="btn btn-sm btn-danger round" institution-data="'.$data->id.'">No</button>';
                }
            })
            ->editColumn('is_active',function($data) {
                if ($data->is_active == 1) {
                    return '<button id="is_active" type="button" class="btn btn-sm btn-success round" institution-data="'.$data->id.'">Yes</button>';
                }else {
                     return '<button id="is_active" type="button" class="btn btn-sm btn-danger round" institution-data="'.$data->id.'">No</button>';
                }
            })
            ->rawColumns(['action', 'title' ,'is_active' ,'is_featured' ,'country_id']);
    }

    /**
     * Get query source of dataTable.
     *
     * @param \App\InstitutionProgram $model
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query(InstitutionProgram $model)
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
                    ->setTableId('institutionprogram-table')
                    ->columns($this->getColumns())
                    ->minifiedAjax()
                    ->dom('Bfrtip')
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
            Column::make('title'),
            Column::make('institution_id')->title('Institution'),
            Column::make('country_id')->title('Country'),
            Column::make('is_featured')->title('Is Featured'),
            Column::make('is_active')->title('Is Active'),
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
        return 'InstitutionProgram_' . date('YmdHis');
    }
}
