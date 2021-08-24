<?php

namespace App\DataTables;

use App\Model\Institution;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Html\Column;
use Yajra\DataTables\Html\Editor\Editor;
use Yajra\DataTables\Html\Editor\Fields;
use Yajra\DataTables\Services\DataTable;

class InstitutionDataTable extends DataTable
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
                return '<a href="'.route('admin.institution.edit', $data->id).'" class="btn btn-success btn-sm" title="Edit Country"><i class="fa fa-edit"></i></a>
                <a href="'.route('admin.institution.show', $data->id).'" class="btn btn-info btn-sm" title="view"><i class="fa fa-eye"></i></a>
                <a href="'.route('admin.varsity-about.edit', $data->id).'" class="btn btn-info btn-sm" title="view">about</a>
                <button id="institution_delete" type="button" class="btn btn-sm btn-danger round" institution-id="'.$data->id.'"><i class="fa fa-trash"></i></button>';
            })
            ->editColumn('city_id',function($data) {
                return  $data->city ? $data->city->title : '';
            })
             ->addColumn('title',function($data) {
                return $data->title ?? '-';
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
            ->editColumn('type_id',function($data) {
                return $data->type ? $data->type->title : '';
            })
            ->rawColumns(['action', 'is_featured', 'address' ,'type_id' ,'is_active']);
    }

    /**
     * Get query source of dataTable.
     *
     * @param \App\UniversityController $model
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query(Institution $model)
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
                    ->setTableId('institution-table')
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
            Column::make('type_id')->title('Type'),
            Column::make('city_id')->title('City'),
            Column::make('is_featured')->title('Is Featured'),
            Column::make('is_active')->title('Is Active'),
            Column::computed('action')
                ->exportable(false)
                ->printable(false)
                ->width(30)
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
        return 'InstitutionController_' . date('YmdHis');
    }
}
