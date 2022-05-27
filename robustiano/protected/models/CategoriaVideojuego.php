<?php

/**
 * This is the model class for table "{{categoria_videojuego}}".
 *
 * The followings are the available columns in table '{{categoria_videojuego}}':
 * @property string $categoria
 * @property string $videojuego
 *
 * The followings are the available model relations:
 * @property Videojuegos $videojuego0
 * @property Categorias $categorias
 */
class CategoriaVideojuego extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return '{{categoria_videojuego}}';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('categoria, videojuego', 'required'),
			array('categoria', 'length', 'max'=>50),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('categoria, videojuego', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'videojuego0' => array(self::BELONGS_TO, 'Videojuegos', 'videojuego'),
			'categorias' => array(self::HAS_ONE, 'Categorias', 'nombre'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'categoria' => 'Categoria',
			'videojuego' => 'Videojuego',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('categoria',$this->categoria,true);
		$criteria->compare('videojuego',$this->videojuego,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return CategoriaVideojuego the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
