<?php

/**
 * This is the model class for table "{{videojuegos}}".
 *
 * The followings are the available columns in table '{{videojuegos}}':
 * @property string $codigo
 * @property integer $rating
 * @property string $nombre
 * @property string $descripcion
 * @property integer $precio
 * @property string $desarrollador
 *
 * The followings are the available model relations:
 * @property CategoriaVideojuego[] $categoriaVideojuegos
 * @property Comentarios[] $comentarioses
 * @property Usuarios[] $tblUsuarioses
 * @property Multimedia $multimedia
 * @property Valoracion[] $valoracions
 * @property Desarrolladores $desarrollador0
 */
class Videojuegos extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return '{{videojuegos}}';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('rating, nombre, descripcion, precio, desarrollador', 'required'),
			array('rating, precio', 'numerical', 'integerOnly'=>true),
			array('nombre', 'length', 'max'=>100),
			array('desarrollador', 'length', 'max'=>20),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('codigo, rating, nombre, descripcion, precio, desarrollador', 'safe', 'on'=>'search'),
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
			'categoriaVideojuegos' => array(self::HAS_MANY, 'CategoriaVideojuego', 'videojuego'),
			'comentarioses' => array(self::HAS_MANY, 'Comentarios', 'videojuego'),
			'tblUsuarioses' => array(self::MANY_MANY, 'Usuarios', '{{juegos_usuario}}(videojuego, usuario)'),
			'multimedia' => array(self::HAS_ONE, 'Multimedia', 'codigo'),
			'valoracions' => array(self::HAS_MANY, 'Valoracion', 'videojuego'),
			'desarrollador0' => array(self::BELONGS_TO, 'Desarrolladores', 'desarrollador'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'codigo' => 'Codigo',
			'rating' => 'Rating',
			'nombre' => 'Nombre',
			'descripcion' => 'Descripcion',
			'precio' => 'Precio',
			'desarrollador' => 'Desarrollador',
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
		$criteria->compare('rating',$this->rating);
		$criteria->compare('nombre',$this->nombre,true);
		$criteria->compare('descripcion',$this->descripcion,true);
		$criteria->compare('precio',$this->precio);
		$criteria->compare('desarrollador',$this->desarrollador,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Videojuegos the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
