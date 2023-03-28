import React, {useState, useEffect} from 'react'
import axios from 'axios'
import { Link } from "react-router-dom";

const endpoint = 'http://127.0.0.1:8000/api'

const ShowHotels = () => {

    const [hotels, setHotels] = useState( [] )

    useEffect(() => {
      getAllHotels()    
    }, [])
    

    const getAllHotels = async () => {
        const response = await axios.get(`${endpoint}/infoHotels`)
        setHotels(response.data)
    }

  return (
    <div className='container'>
        <div className='d-grid gap-2'>
            <h3 className='display-3 my-5'>Lista de Hoteles</h3>
        </div>

        <div className='overflow-scroll' style={{height: 400}}>
        <table className='table table-striped'>
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>cuidad</th>
                    <th>dirección</th>
                    <th>NIT</th>
                    <th>Número de Hab</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                {
                    hotels.map((hotel) => (
                        <tr key={hotel.id}>
                            <td>{hotel.nombre}</td>
                            <td>{hotel.cuidad}</td>
                            <td>{hotel.direccion}</td>
                            <td>{hotel.nit}</td>
                            <td>{hotel.numHabitaciones}</td>
                            <td>
                                <Link to={`/edit/${hotel.id}`} className='btn btn-warning'>Ver/Editar</Link>
                            </td>
                        </tr>
                    ))
                }
            </tbody>
        </table>
        </div>
        <div className=''>
            <Link to='/create' className='btn btn-success btn-lg mt-2 mb-2 text-white'>Crear Hotel</Link>
        </div>
    </div>
  )
}

export default ShowHotels