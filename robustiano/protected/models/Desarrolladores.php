<?php

/**
 * This is the model class for table "{{desarrolladores}}".
 *
 * The followings are the available columns in table '{{desarrolladores}}':
 * @property string $nombre
 * @property string $tipo
 * @property string $contacto
 *
 * The followings are the available model relations:
 * @property Usuarios $nombre0
 * @property Videojuegos[] $videojuegoses
 */
class Desarrolladores extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return '{{desarrolladores}}';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('nombre, tipo, contacto', 'required'),
			array('nombre', 'length', 'max'=>20),
			array('tipo', 'length', 'max'=>7),
			array('contacto', 'length', 'max'=>200),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('nombre, tipo, contacto', 'safe', 'on'=>'search'),
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
			'nombre0' => array(self::BELONGS_TO, 'Usuarios', 'nombre'),
			'videojuegoses' => array(self::HAS_MANY, 'Videojuegos', 'desarrollador'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'nombre' => 'Nombre',
			'tipo' => 'Tipo',
			'contacto' => 'Contacto',
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

		$criteria->compare('nombre',$this->nombre,true);
		$criteria->compare('tipo',$this->tipo,true);
		$criteria->compare('contacto',$this->contacto,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Desarrolladores the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
