<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
use Restserver\Libraries\REST_Controller;

class Barang extends REST_Controller {

    function __construct($config = 'rest') {
        parent::__construct($config);
        $this->load->database();
    }

    //Menampilkan data barang
    function index_get() {
        $kode = $this->get('kode');
        if ($kode == '') {
            $kontak = $this->db->get('barang')->result();
        } else {
            $this->db->where('kode', $kode);
            $kontak = $this->db->get('barang')->result();
        }
        $this->response($kontak, 200);
    }

    // mengirimkan data barang
    function index_post() {
        $data = array(
                    'kode' => $this->post('kode'),
                    'nama_barang' => $this->post('nama_barang'),
                    'jenis' => $this->post('jenis'),
                    'harga' => $this->post('harga'),
                    'stok' => $this->post('stok'));
        $insert = $this->db->insert('barang', $data);
        if ($insert) {
            $this->response($data, 200);
        } else {
            $this->response(array('status' => 'fail', 502));
        }
    }

    // mengubah isi data barang
    function index_put() {
        $kode = $this->put('kode');
        $data = array(
            'kode' => $this->put('kode'),
            'nama_barang' => $this->put('nama_barang'),
            'jenis' => $this->put('jenis'),
            'harga' => $this->put('harga'),
            'stok' => $this->put('stok'));
        $this->db->where('kode', $kode);
        $update = $this->db->update('barang', $data);
        if ($update) {
            $this->response($data, 200);
        } else {
            $this->response(array('status' => 'fail', 502));
        }
    }

    // menghapus isi data
    function index_delete() {
        $kode = $this->delete('kode');
        $this->db->where('kode', $kode);
        $delete = $this->db->delete('barang');
        if ($delete) {
            $this->response(array('status' => 'success'), 201);
        } else {
            $this->response(array('status' => 'fail', 502));
        }
    }
}
?>
