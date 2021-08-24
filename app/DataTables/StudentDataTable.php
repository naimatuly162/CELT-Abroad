<?php

namespace App\DataTables;

use App\Model\User;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Html\Column;
use Yajra\DataTables\Html\Editor\Editor;
use Yajra\DataTables\Html\Editor\Fields;
use Yajra\DataTables\Services\DataTable;

class StudentDataTable extends DataTable
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
            ->editColumn('image', function($data){
                return '<img src="'.$data->image.'" width="60px" height="60px" alt="Student Profile">';
            })
            ->addColumn('full_name', function($data){
                return $data->full_name;
            })
            ->editColumn('country', function($data){
                return $data->countries->title ?? '';
            })
            ->editColumn('status', function($data){
                if($data->status == 1) {
                    return "<button type='submit' class='btn btn-success status' status='0' user_id='".$data->id."' title='click to deactive'>Active</button>";
                } else {
                    return "<button type='submit' class='btn btn-danger status' status='1' user_id='".$data->id."' title='click to active'>Inactive</button>";
                }
            })
            ->editColumn('profile_progress', function($data){
                return ($data->profile_progress ?? 0).' %';
            })
            ->addColumn('action', function($data){
                $action = '';
                if($data->studentEducation) {

                    $action = '<a href="'.route('admin.student.grade',$data->id).'" class="btn btn-sm btn-warning round"><i class="fa fa-graduation-cap"></i></a>';

                }
                $action .= '<button id="student_delete" type="button" class="btn btn-sm btn-danger round" user-id="'.$data->id.'"><i class="fa fa-trash"></i></button>';
                return $action; 
            })
            ->rawColumns(['action', 'image', 'status']);
    }

    /**
     * Get query source of dataTable.
     *
     * @param \App\Student $model
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query(User $model)
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
                    ->setTableId('student-table')
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
            Column::make('image')->title('profile'),
            Column::make('full_name')->title('name'),
            Column::make('email'),
            Column::make('phone'),
            Column::make('country'),
            Column::make('profile_progress'),
            Column::make('status'),
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
        return 'Student_' . date('YmdHis');
    }
}
