<?php

/**
 * This is the model class for table "{{usuarios}}".
 *
 * The followings are the available columns in table '{{usuarios}}':
 * @property string $nombre
 * @property string $contrase単a
 * @property string $email
 * @property integer $saldo
 * @property string $fecha_inicio
 *
 * The followings are the available model relations:
 * @property Amigos[] $amigoses
 * @property Amigos[] $amigoses1
 * @property Comentarios[] $comentarioses
 * @property Desarrolladores $desarrolladores
 * @property Videojuegos[] $tblVideojuegoses
 * @property Mensajes[] $mensajes
 * @property Mensajes[] $mensajes1
 * @property Valoracion[] $valoracions
 */
class Usuarios extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return '{{usuarios}}';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('nombre, contrase単a, email', 'required'),
			array('saldo', 'numerical', 'integerOnly'=>true),
			array('nombre', 'length', 'max'=>20),
			array('contrase単a', 'length', 'max'=>50),
			array('email', 'length', 'max'=>100),
			array('fecha_inicio', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('nombre, contrase単a, email, saldo, fecha_inicio', 'safe', 'on'=>'search'),
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
			'amigoses' => array(self::HAS_MANY, 'Amigos', 'usuario'),
			'amigoses1' => array(self::HAS_MANY, 'Amigos', 'amigo'),
			'comentarioses' => array(self::HAS_MANY, 'Comentarios', 'usuario'),
			'desarrolladores' => array(self::HAS_ONE, 'Desarrolladores', 'nombre'),
			'tblVideojuegoses' => array(self::MANY_MANY, 'Videojuegos', '{{juegos_usuario}}(usuario, videojuego)'),
			'mensajes' => array(self::HAS_MANY, 'Mensajes', 'emisor'),
			'mensajes1' => array(self::HAS_MANY, 'Mensajes', 'receptor'),
			'valoracions' => array(self::HAS_MANY, 'Valoracion', 'usuario'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'nombre' => 'Nombre',
			'contrase単a' => 'Contrase祓a',
			'email' => 'Email',
			'saldo' => 'Saldo',
			'fecha_inicio' => 'Fecha Inicio',
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
		$criteria->compare('contrase単a',$this->contrase単a,true);
		$criteria->compare('email',$this->email,true);
		$criteria->compare('saldo',$this->saldo);
		$criteria->compare('fecha_inicio',$this->fecha_inicio,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Usuarios the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
