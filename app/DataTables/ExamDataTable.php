<?php

namespace App\DataTables;

use App\Model\Exam;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Html\Column;
use Yajra\DataTables\Html\Editor\Editor;
use Yajra\DataTables\Html\Editor\Fields;
use Yajra\DataTables\Services\DataTable;
use DB;

class ExamDataTable extends DataTable
{
    /**
     * Build DataTable class.
     *
     * @param mixed $query Results from query() method.
     * @return \Yajra\DataTables\DataTableAbstract
     */
    public function dataTable($query)
    {
        $default_lang = defaultLanguage();

        return datatables($query)
            ->addColumn('action', function($data){
                return '<a href="'.route('admin.exam.edit', $data->id).'" class="btn btn-success btn-sm" title="Edit Country"><i class="fa fa-edit"></i></a>&nbsp;<a href="'.route('admin.exam-subsection.index', $data->id).'" class="btn btn-success btn-sm" title="Exam Subsection"><i class="fa fa-universal-access"></i></a>
                <button id="exam_delete" type="button" class="btn btn-sm btn-danger round" exam-id="'.$data->id.'"><i class="fa fa-trash"></i></button>';
            })
            ->editColumn('locale',function($data) use ($default_lang) {
                return $data->translate($default_lang)->locale ?? '-';
            })
            ->editColumn('parent_id',function($data) use ($default_lang) {
                return $data->exam ? $data->exam->translate($default_lang)->title :  '';
            })
            ->editColumn('title',function($data) use ($default_lang) {
                return $data->translate($default_lang)->title ?? '-';
            });
    }

    /**
     * Get query source of dataTable.
     *
     * @param \App\ExamDataTable $model
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query(Exam $model)
    {
        $default_lang = defaultLanguage();

        $query = Exam::with('exam')
                // // ->leftJoin('exam_translations as et', 'et.exam_id', '=', 'exams.id')
                // // ->leftJoin('exam_translations as ets', 'ets.exam_id', '=', 'e.parent_id')
                // ->where('et.locale', $default_lang)
                // // ->where('ets.locale', $default_lang)
                // ->where('exams.deleted_at', NULL)
                // ->select(['exams.id as id','exams.parent_id as parent_id','exams.min','exams.max' ,'et.title as title', 'et.locale as locale'])
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
                    ->setTableId('examdatatable-table')
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
            Column::make('parent_id')->title('Parent'),
            Column::make('locale'),
            Column::make('title'),
            Column::make('min')->title('Min Score'),
            Column::make('max')->title('Max Score'),
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
        return 'Exam_' . date('YmdHis');
    }
}
