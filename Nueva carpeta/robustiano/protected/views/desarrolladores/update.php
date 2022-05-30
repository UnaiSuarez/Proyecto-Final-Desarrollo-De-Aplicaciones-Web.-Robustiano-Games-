<?php
/* @var $this DesarrolladoresController */
/* @var $model Desarrolladores */

$this->breadcrumbs=array(
	'Desarrolladores'=>array('index'),
	$model->nombre=>array('view','id'=>$model->nombre),
	'Update',
);

$this->menu=array(
	array('label'=>'List Desarrolladores', 'url'=>array('index')),
	array('label'=>'Create Desarrolladores', 'url'=>array('create')),
	array('label'=>'View Desarrolladores', 'url'=>array('view', 'id'=>$model->nombre)),
	array('label'=>'Manage Desarrolladores', 'url'=>array('admin')),
);
?>

<h1>Update Desarrolladores <?php echo $model->nombre; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>