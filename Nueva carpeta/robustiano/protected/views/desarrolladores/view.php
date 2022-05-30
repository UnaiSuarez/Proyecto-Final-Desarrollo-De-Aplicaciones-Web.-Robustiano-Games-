<?php
/* @var $this DesarrolladoresController */
/* @var $model Desarrolladores */

$this->breadcrumbs=array(
	'Desarrolladores'=>array('index'),
	$model->nombre,
);

$this->menu=array(
	array('label'=>'List Desarrolladores', 'url'=>array('index')),
	array('label'=>'Create Desarrolladores', 'url'=>array('create')),
	array('label'=>'Update Desarrolladores', 'url'=>array('update', 'id'=>$model->nombre)),
	array('label'=>'Delete Desarrolladores', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->nombre),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Desarrolladores', 'url'=>array('admin')),
);
?>

<h1>View Desarrolladores #<?php echo $model->nombre; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'nombre',
		'tipo',
		'contacto',
	),
)); ?>
