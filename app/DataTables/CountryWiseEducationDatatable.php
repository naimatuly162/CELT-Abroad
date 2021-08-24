<?php

namespace App\DataTables;

use App\Model\CountryWiseEducation;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Html\Column;
use Yajra\DataTables\Html\Editor\Editor;
use Yajra\DataTables\Html\Editor\Fields;
use Yajra\DataTables\Services\DataTable;

class CountryWiseEducationDatatable extends DataTable
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
                return '<button id="country_wise_education_delete" type="button" class="btn btn-sm btn-danger round" education-id="'.$data->id.'"><i class="fa fa-trash"></i></button>';
            })
            ->editColumn('residential_country_id',function($data) {
                return $data->residentialCountry->title ?? '-';
            })
            ->editColumn('destination_country_id',function($data) {
                return $data->destinationCountry->title ?? '-';
            })
            ->editColumn('residential_degree_id',function($data) {
                return $data->residentialDegree->title ?? '-';
            })
            ->editColumn('destination_degree_id',function($data) {
                return $data->destinationDegree->title ?? '-';
            });
    }

    /**
     * Get query source of dataTable.
     *
     * @param \App\CountryWiseEducationDatatable $model
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query(CountryWiseEducation $model)
    {
        $query = CountryWiseEducation::get();
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
                    ->setTableId('countrywiseeducationdatatable-table')
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
            Column::make('residential_country_id'),
            Column::make('destination_country_id'),
            Column::make('residential_degree_id'),
            Column::make('destination_degree_id'),
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
        return 'CountryWiseEducation_' . date('YmdHis');
    }
}
