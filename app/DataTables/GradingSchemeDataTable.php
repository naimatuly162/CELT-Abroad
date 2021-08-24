<?php

namespace App\DataTables;

use App\Model\GradingScheme;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Html\Column;
use Yajra\DataTables\Html\Editor\Editor;
use Yajra\DataTables\Html\Editor\Fields;
use Yajra\DataTables\Services\DataTable;
use DB;

class GradingSchemeDataTable extends DataTable
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
                return '<a href="'.route('admin.grading-scheme.edit', $data->id).'" class="btn btn-success btn-sm" title="Edit Country"><i class="fa fa-edit"></i></a>
                <a href="'.route('admin.grading-scheme.show', $data->id).'" class="btn btn-info btn-sm" title="View grading"><i class="fa fa-eye"></i></a>
                <button id="grade_delete" type="button" class="btn btn-sm btn-danger round" grade-id="'.$data->id.'"><i class="fa fa-trash"></i></button>';
            })
            ->addColumn('related_to',function($data) {
                $grades = [];
                foreach($data->grade_country_edu as $grade) {
                   $grades[] = ($grade->country ? $grade->country->title : '').' - ' .($grade->education ? $grade->education->title : '');
                }
                return $grades;
            })
            ->addColumn('data',function($data) {
                if($data->is_custom == 1)
                {
                    $scheme = "";
                    foreach ($data->gradeSchemaData as $key => $value) {
                        $scheme.= '<ul>
                            <li>'.$value->title.' : <b>'.$value->max.'</b></li>
                        </ul>';
                    }
                    return $scheme;
                }else{
                   return '<ul>
                            <li>Min : <b>'.$data->min.'</b></li>
                            <li>Max : <b>'.$data->max.'</b></li>
                        </ul>'; 
                }
                
            })
            ->rawColumns(['action', 'data']); 
    }

    /**
     * Get query source of dataTable.
     *
     * @param \App\GradingScheme $model
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query(GradingScheme $model)
    {
        return $model->with('grade_country_edu.country.country_translate')->newQuery();
        
        // $default_lang = defaultLanguage();
        
        // $query = DB::table('grading_schemes as g')
        //         ->leftJoin('grading_scheme_counrty_education_levels as g_ce', 'g_ce.grading_scheme_id', '=', 'g.id')
        //         ->leftJoin('country_translations as ct', 'ct.country_id', '=', 'g_ce.country_id')
        //         ->where('ct.locale', $default_lang)
        //         ->leftJoin('education_level_translations as et', 'et.education_level_id', '=', 'g_ce.education_level_id')
        //         ->where('et.locale', $default_lang)
        //         ->leftJoin('grading_scheme_data as gd', 'gd.grading_scheme_id', '=', 'g.id')
        //         ->leftJoin('grading_scheme_data_translations as gdt', 'gdt.grading_scheme_data_id', '=', 'gd.id')
        //         ->select('g.id', 'g.min', 'g.max', 'ct.title as country', 'et.title as education', 'gdt.title as title', 'gd.max as rate')
        //         ->get();
    
        // return $query;
    }

    /**
     * Optional method if you want to use html builder.
     *
     * @return \Yajra\DataTables\Html\Builder
     */
    public function html()
    {
        return $this->builder()
                    ->setTableId('gradingscheme-table')
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
            Column::make('related_to'),
            Column::make('data'),
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
        return 'GradingScheme_' . date('YmdHis');
    }
}
