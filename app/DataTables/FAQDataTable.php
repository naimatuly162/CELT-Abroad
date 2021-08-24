<?php

namespace App\DataTables;

use App\Model\FAQ\Faq;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Html\Column;
use Yajra\DataTables\Services\DataTable;

class FAQDataTable extends DataTable
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
                return '<a href="'.route('admin.faq.edit', $data->id).'" class="btn btn-success btn-sm" title="Edit FAQ"><i class="fa fa-edit"></i></a>
                <button id="faq_delete" type="button" class="btn btn-sm btn-danger round" faq-id="'.$data->id.'"><i class="fa fa-trash"></i></button>';
            })
            ->editColumn('locale',function($data) {
                return $data->translation->locale ?? '-';
            })
            ->addColumn('question',function($data) {
                return $data->translation->question ?? '-';
            })
            ->addColumn('program_id',function($data){
                return $data->program ? $data->program->title : '-'; 
            })
            ->addColumn('institution_id',function($data){
                return $data->institution ? $data->institution->title : '-'; 
            })
            ->addColumn('answer',function($data) {
               return '<div class="word-wrap" style="white-space: normal;">'.$data->translation->answer.'</div>';
            })
            ->addColumn('type',function($data) {
                return $data->type == 0 ? "University" : "Program";
            })
            ->rawColumns(['action', 'answer']);
    }

    /**
     * Get query source of dataTable.
     *
     * @param \App\FAQ\FAQ $model
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query(Faq $model)
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
                    ->setTableId('faq-table')
                    ->columns($this->getColumns())
                    ->minifiedAjax()
                    ->dom('Blfrtip')
                    ->orderBy([0, 'ASC'])
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
            Column::make('question'),
            Column::make('institution_id')->title('University'),
            Column::make('program_id')->title('Program'),
            Column::computed('action')
                  ->exportable(false)
                  ->printable(false)
                  ->width(100)
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
        return 'FAQ_' . date('YmdHis');
    }
}
