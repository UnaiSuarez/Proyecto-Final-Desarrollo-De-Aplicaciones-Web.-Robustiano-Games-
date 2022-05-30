<?php

/**
 * This is the model class for table "{{mensajes}}".
 *
 * The followings are the available columns in table '{{mensajes}}':
 * @property string $codigo
 * @property integer $visto
 * @property string $fecha
 * @property string $emisor
 * @property string $receptor
 *
 * The followings are the available model relations:
 * @property Usuarios $emisor0
 * @property Usuarios $receptor0
 */
class Mensajes extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return '{{mensajes}}';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('codigo, emisor, receptor', 'required'),
			array('visto', 'numerical', 'integerOnly'=>true),
			array('emisor, receptor', 'length', 'max'=>20),
			array('fecha', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('codigo, visto, fecha, emisor, receptor', 'safe', 'on'=>'search'),
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
			'emisor0' => array(self::BELONGS_TO, 'Usuarios', 'emisor'),
			'receptor0' => array(self::BELONGS_TO, 'Usuarios', 'receptor'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'codigo' => 'Codigo',
			'visto' => 'Visto',
			'fecha' => 'Fecha',
			'emisor' => 'Emisor',
			'receptor' => 'Receptor',
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

		$criteria->compare('codigo',$this->codigo,true);
		$criteria->compare('visto',$this->visto);
		$criteria->compare('fecha',$this->fecha,true);
		$criteria->compare('emisor',$this->emisor,true);
		$criteria->compare('receptor',$this->receptor,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Mensajes the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
