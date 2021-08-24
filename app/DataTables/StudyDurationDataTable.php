<?php

namespace App\DataTables;

use App\Model\StudyDuration;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Html\Column;
use Yajra\DataTables\Html\Editor\Editor;
use Yajra\DataTables\Html\Editor\Fields;
use Yajra\DataTables\Services\DataTable;
use DB;

class StudyDurationDataTable extends DataTable
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
                return '<a href="'.route('admin.study.duration.edit', $data->id).'" class="btn btn-success btn-sm" title="Edit Study Duration"><i class="fa fa-edit"></i></a>
                <!--<a href="'.route('admin.study.duration.show', $data->id).'" class="btn btn-info btn-sm" title="View Study Duration"><i class="fa fa-eye"></i></a>-->
                <button id="study_duration_delete" type="button" class="btn btn-sm btn-danger round" study-duration-id="'.$data->id.'"><i class="fa fa-trash"></i></button>';
            })
            ->editColumn('locale',function($data) {
                return $data->locale ?? '';
            })
            ->editColumn('title',function($data) {
                return $data->title ?? '';
            })
            ->rawColumns(['action', 'locale', 'title']);
    }

    /**
     * Get query source of dataTable.
     *
     * @param \App\StudyDuration $model
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query(StudyDuration $model)
    {
        $default_lang = defaultLanguage();

        $query = DB::table('study_durations as s')
                ->leftJoin('study_duration_translations as st', 'st.study_duration_id', '=', 's.id')
                ->where('st.locale', $default_lang)
                ->where('s.deleted_at', NULL)
                ->select('s.id as id', 'st.title as title', 'st.locale as locale')
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
                    ->setTableId('studyduration-table')
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
        return 'StudyDuration_' . date('YmdHis');
    }
}
