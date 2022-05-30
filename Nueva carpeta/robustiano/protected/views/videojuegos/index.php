<?php
/* @var $this VideojuegosController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Videojuegoses',
);

$this->menu=array(
	array('label'=>'Create Videojuegos', 'url'=>array('create')),
	array('label'=>'Manage Videojuegos', 'url'=>array('admin')),
);
?>

<h1>Videojuegoses</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
