<?php
/* @var $this VideojuegosController */
/* @var $model Videojuegos */

$this->breadcrumbs=array(
	'Videojuegoses'=>array('index'),
	$model->codigo,
);

$this->menu=array(
	array('label'=>'List Videojuegos', 'url'=>array('index')),
	array('label'=>'Create Videojuegos', 'url'=>array('create')),
	array('label'=>'Update Videojuegos', 'url'=>array('update', 'id'=>$model->codigo)),
	array('label'=>'Delete Videojuegos', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->codigo),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Videojuegos', 'url'=>array('admin')),
);
?>

<h1>View Videojuegos #<?php echo $model->codigo; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'codigo',
		'rating',
		'nombre',
		'descripcion',
		'precio',
		'desarrollador',
	),
)); ?>
