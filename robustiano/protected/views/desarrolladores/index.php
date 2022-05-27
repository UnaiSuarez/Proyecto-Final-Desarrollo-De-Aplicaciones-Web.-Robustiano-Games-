<?php
/* @var $this DesarrolladoresController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Desarrolladores',
);

$this->menu=array(
	array('label'=>'Create Desarrolladores', 'url'=>array('create')),
	array('label'=>'Manage Desarrolladores', 'url'=>array('admin')),
);
?>

<h1>Desarrolladores</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
