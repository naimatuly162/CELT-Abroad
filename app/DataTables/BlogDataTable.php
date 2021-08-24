<?php

namespace App\DataTables;

use App\Model\Blog\Blog;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Html\Column;
use Yajra\DataTables\Services\DataTable;
use Illuminate\Support\Facades\DB;

class BlogDataTable extends DataTable
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
                return '<a href="'.route('admin.blog.edit', $data->id).'" class="btn btn-success btn-sm" title="Edit Blog"><i class="fa fa-edit"></i></a>
                <a href="'.route('admin.blog.show', $data->id).'" class="btn btn-primary btn-sm" title="Show Blog"><i class="fa fa-eye"></i></a>
                <button id="blog_delete" type="button" class="btn btn-sm btn-danger round" blog-id="'.$data->id.'"><i class="fa fa-trash"></i></button>';
            })
            ->editColumn('locale',function($data) {
                return $data->translation->locale ?? '-';
            })
            ->editColumn('title',function($data) {
                return $data->translation->title ?? '-';
            })
            ->addColumn('category',function($data) {
                return $data->translation->category->title ?? '-';
            })
            ->editColumn('image',function($data) {
                return '<img height="60" width="60" src="'.$data->image.'">';
            })
            ->rawColumns(['action', 'image']);
    }

    /**
     * Get query source of dataTable.
     *
     * @param App\Model\Blog\Blog
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query(Blog $model)
    {
        return $model->with('translation.category')->get();
    }

    /**
     * Optional method if you want to use html builder.
     *
     * @return \Yajra\DataTables\Html\Builder
     */
    public function html()
    {
        return $this->builder()
                    ->setTableId('blog-table')
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
            Column::make('image'),
            Column::make('locale'),
            Column::make('category'),
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
        return 'Blog_' . date('YmdHis');
    }
}
