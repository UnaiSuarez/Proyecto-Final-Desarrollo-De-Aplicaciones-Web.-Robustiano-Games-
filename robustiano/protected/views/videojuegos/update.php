<?php
/* @var $this VideojuegosController */
/* @var $model Videojuegos */

$this->breadcrumbs=array(
	'Videojuegoses'=>array('index'),
	$model->codigo=>array('view','id'=>$model->codigo),
	'Update',
);

$this->menu=array(
	array('label'=>'List Videojuegos', 'url'=>array('index')),
	array('label'=>'Create Videojuegos', 'url'=>array('create')),
	array('label'=>'View Videojuegos', 'url'=>array('view', 'id'=>$model->codigo)),
	array('label'=>'Manage Videojuegos', 'url'=>array('admin')),
);
?>

<h1>Update Videojuegos <?php echo $model->codigo; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>