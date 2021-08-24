<?php

namespace App\DataTables;

use App\Model\City;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Html\Column;
use Yajra\DataTables\Services\DataTable;

class CityDataTable extends DataTable
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
            ->addColumn('action', function($city){
                return '<a href="'.route('admin.city.edit', $city->id).'" class="btn btn-success btn-sm" title="edit"><i class="fa fa-edit"></i></a>
                 <a href="'.route('admin.city.show', $city->id).'" class="btn btn-info btn-sm" title="View City"><i class="fa fa-eye"></i></a>
                <button id="city_delete" type="button" class="btn btn-sm btn-danger round" city-id="'.$city->id.'"><i class="fa fa-trash"></i></button>';
            })
            ->addColumn('country',function($data) {
                return $data->country ? $data->country->translation->title : '';
            })
            ->addColumn('state',function($data) {
                return $data->state ? $data->state->translation->title : '';
            })
            ->editColumn('locale',function($data) {
                return $data->translation->locale ?? '';
            })
            ->editColumn('title',function($data) {
                return $data->translation->title ?? '';
            })
            ->editColumn('image',function($data) {
                return '<img height="60" width="60" src="'.$data->image.'">';
            })
            ->rawColumns(['action', 'country_id' ,'locale', 'title', 'image']);
    }

    /**
     * Get query source of dataTable.
     *
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query(City $model)
    {
        return $model->with(['translation', 'country.translation', 'state.translation'])->get();
    }

    /**
     * Optional method if you want to use html builder.
     *
     * @return \Yajra\DataTables\Html\Builder
     */
    public function html()
    {
        return $this->builder()
                    ->setTableId('city_datatables')
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
            Column::make('country'),
            Column::make('state'),
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
        return 'StateDatatables_' . date('YmdHis');
    }
}
