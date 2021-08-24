<?php

namespace App\DataTables;

use App\Model\Application;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Html\Column;
use Yajra\DataTables\Html\Editor\Editor;
use Yajra\DataTables\Html\Editor\Fields;
use Yajra\DataTables\Services\DataTable;

class ApplicationDataTable extends DataTable
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
            ->addColumn('status',function($data) {
                $status = '-';
                if ($data->status == 1) {
                    $status = '<button  class="btn btn-success">Applied</div>';
                } elseif($data->status == 2) {
                    $status =  '<button  class="btn btn-info">Accepted</div>';
                } elseif($data->status == 3) {
                    $status = '<button  class="btn btn-danger">Rejected</div>';
                }
                return $status;
            })
            ->addColumn('student_id' ,function($data){
               return $data->student ? $data->student->first_name.' '.$data->student->last_name : '';
            })
            ->addColumn('program_id' ,function($data){
                return  $data->program ?  $data->program->title : '';  
            })
            ->addColumn('bonus_id' ,function($data){
                return  $data->bonus ? $data->bonus->title : '-';  
            })
             ->rawColumns(['action', 'status']); 
    }

    /**
     * Get query source of dataTable.
     *
     * @param \App\ApplicationDataTable $model
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query(Application $model)
    {
        return $model->orderBy('id');
    }

    /**
     * Optional method if you want to use html builder.
     *
     * @return \Yajra\DataTables\Html\Builder
     */
    public function html()
    {
        return $this->builder()
                    ->setTableId('applicationdatatable-table')
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
            Column::make('student_id')->title('Student'),
            Column::make('program_id')->title('Program'),
            Column::make('bonus_id')->title('Bonus'),
            Column::make('amount'),
            Column::make('status'),
            // Column::computed('action')
            //       ->exportable(false)
            //       ->printable(false)
            //       ->width(60)
            //       ->addClass('text-center'),
        ];
    }

    /**
     * Get filename for export.
     *
     * @return string
     */
    protected function filename()
    {
        return 'Application_' . date('YmdHis');
    }
}
