<?php
/* @var $this VideojuegosController */
/* @var $model Videojuegos */

$this->breadcrumbs=array(
	'Videojuegoses'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Videojuegos', 'url'=>array('index')),
	array('label'=>'Manage Videojuegos', 'url'=>array('admin')),
);
?>

<h1>Create Videojuegos</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>