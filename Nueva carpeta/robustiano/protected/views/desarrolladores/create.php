<?php
/* @var $this DesarrolladoresController */
/* @var $model Desarrolladores */

$this->breadcrumbs=array(
	'Desarrolladores'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Desarrolladores', 'url'=>array('index')),
	array('label'=>'Manage Desarrolladores', 'url'=>array('admin')),
);
?>

<h1>Create Desarrolladores</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>