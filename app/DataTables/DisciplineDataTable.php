<?php

namespace App\DataTables;

use App\Model\Discipline;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Html\Column;
use Yajra\DataTables\Services\DataTable;

class DisciplineDataTable extends DataTable
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
                return '<a href="'.route('admin.discipline.edit', $data->id).'" class="btn btn-success btn-sm" title="Edit Discipline"><i class="fa fa-edit"></i></a>
                <a href="'.route('admin.discipline.show', $data->id).'" class="btn btn-info btn-sm" title="View Discipline"><i class="fa fa-eye"></i></a>
                <button id="discipline_delete" type="button" class="btn btn-sm btn-danger round" discipline-id="'.$data->id.'"><i class="fa fa-trash"></i></button>';
            })
            ->editColumn('locale',function($data) {
                return $data->translation->locale ?? '';
            })
            ->editColumn('title',function($data) {
                return $data->translation->title ?? '';
            })
            ->editColumn('image',function($data) {
                return '<img height="60" width="60" src="'.$data->cover_photo.'">';
            })
            ->rawColumns(['action', 'image']);
    }

    /**
     * Get query source of dataTable.
     *
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query(Discipline $model)
    {
        return $model->with('translation')->get();
    }

    /**
     * Optional method if you want to use html builder.
     *
     * @return \Yajra\DataTables\Html\Builder
     */
    public function html()
    {
        return $this->builder()
                    ->setTableId('discipline_datatables')
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
            Column::make('image'),
            Column::make('locale'),
            Column::make('title'),
            Column::computed('action')
                  ->exportable(false)
                  ->printable(false)
                  ->width(120)
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
        return 'Discipline' . date('YmdHis');
    }
}
