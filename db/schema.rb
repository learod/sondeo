# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120601140807) do

  create_table "anteproyectos", :force => true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.integer  "periodo_electoral_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "barrios", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "municipio_id"
  end

  create_table "ciudadanos", :force => true do |t|
    t.string   "dni"
    t.string   "nombre"
    t.string   "apellido"
    t.string   "clave"
    t.string   "email"
    t.string   "telefono"
    t.string   "direccion"
    t.integer  "barrio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "password"
  end

  create_table "municipios", :force => true do |t|
    t.string   "nombre"
    t.integer  "provincia_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "paises", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "periodo_consensos", :force => true do |t|
    t.string   "descripcion"
    t.date     "fecha_inicio"
    t.date     "fecha_fin"
    t.integer  "barrio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "periodo_electorales", :force => true do |t|
    t.string   "descripcion"
    t.date     "fecha_inicio"
    t.date     "fecha_fin"
    t.integer  "barrio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "periodo_propuestas", :force => true do |t|
    t.string   "descripcion"
    t.date     "fecha_inicio"
    t.date     "fecha_fin"
    t.integer  "barrio_id"
    t.integer  "municipio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "propuestas", :force => true do |t|
    t.text     "descripcion"
    t.integer  "user_id"
    t.integer  "periodo_propuesta_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "provincias", :force => true do |t|
    t.string   "nombre"
    t.integer  "pais_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proyectos", :force => true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.integer  "periodo_consenso_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.integer  "pais_id"
    t.integer  "provincia_id"
    t.integer  "municipio_id"
    t.string   "tipo"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
