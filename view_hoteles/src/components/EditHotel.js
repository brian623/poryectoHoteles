import React, {useState, useEffect} from 'react'
import axios from 'axios'
import { Link, useNavigate, useParams } from 'react-router-dom'

const endpoint = 'http://127.0.0.1:8000/api/hotel'
const endpointAll = 'http://127.0.0.1:8000/api/hotelHabs/'
const endpoinHabs = 'http://127.0.0.1:8000/api/habsUpdate/'

const EditHotel = () => {
    const {id} = useParams()
    const [nombre, setNombre] = useState('')
    const [cuidad, setCuidad] = useState('')
    const [direccion, setDirecion] = useState('')
    const [nit, setNit] = useState(0)
    const [numHabitaciones, setNumHabs] = useState(0)
    const [id_hotel, setIdHotel] = useState(id)
    const [id_hab, setId_hab] = useState(0)
    const [cantidad, setCantidad] = useState(0)
    const [tipoHab, setTipoHab] = useState('')
    const [acomodacion, setAcomodacion] = useState('')
    const [ready, setReady] = useState(false)
    const [habs, setHabs] = useState( [] )
    const navigate = useNavigate()


    const update = async (e) => {
        e.preventDefault()
        await axios.put(`${endpoint}Update/${id}`, {
            nombre: nombre,
            cuidad: cuidad,
            direccion: direccion,
            nit: nit,
            numHabitaciones: numHabitaciones})
    }

    const updateHabs = async (e) => {
        let id = id_hab
        e.preventDefault()
        await axios.put(`${endpoinHabs}${id}`,{
            id_hotel: id_hotel,
            cantidad: cantidad,
            tipoHab: tipoHab,
            acomodacion: acomodacion
        })

        getAllHabs()
    }

    const tipoAcomodacion = () => {        
        if (tipoHab==='Estandar') {
            return <select className="form-select" aria-label="Default select example" onChange={(e) => {setAcomodacion(e.target.value)}}>
                        <option defaultValue disabled>{acomodacion}</option>
                        <option value='Sencilla'>Sencilla</option>
                        <option value='Doble'>Doble</option>
                    </select>
        } else if (tipoHab==='Junior') {
            return  <select className="form-select" aria-label="Default select example" onChange={(e) => {setAcomodacion(e.target.value)}}>
                        <option defaultValue disabled>{acomodacion}</option>
                        <option value='Triple'>Triple</option>
                        <option value='Cuádruple'>Cuádruple</option>
                    </select>
        } else if(tipoHab==='Suite') {
            return  <select className="form-select" aria-label="Default select example" onChange={(e) => {setAcomodacion(e.target.value)}}>
                        <option defaultValue disabled>{acomodacion}</option>
                        <option value='Sencilla'>Sencilla</option>
                        <option value='Doble'>Doble</option>
                        <option value='Triple'>Triple</option>
                    </select>
        }else {
            return  <select class="form-select" aria-label="Default select example">
                        <option defaultValue>seleccione...</option>
                    </select>
           
        }       
    }

    useEffect(() => {
      const getHotelById = async () => {
        const response = await axios.get(`${endpoint}/${id}`)
        setNombre(response.data.nombre)
        setCuidad(response.data.cuidad)
        setDirecion(response.data.direccion)
        setNit(response.data.nit)
        setNumHabs(response.data.numHabitaciones)
      }
      getHotelById()
    }, [])

    const getAllHabs = async () => {
        const response = await axios.get(`${endpointAll}${id_hotel}`)
        setHabs(response.data)
        setReady(true)
        console.log(response.data)

    }
    useEffect(() => {
        getAllHabs()
        if (habs.length>0) {
            setReady(true)
        }else {
            getAllHabs()
        }
        console.log(habs,ready);
      }, [])
    
  return (
    <div className='container'>
        <h3 className='display-3 my-5'>Editar Hotel</h3>
        <form onSubmit={update}>
            <div className='container col-12 row my-4'>
                <div className='mb-3 col-md-4'>
                    <label>Nombre</label>
                    <input className='form-control' value={nombre} onChange={(e) =>setNombre(e.target.value)} type='text' />
                </div>
                <div className='mb-3 col-md-4'>
                    <label>Cuidad</label>
                    <input className='form-control' value={cuidad} onChange={(e) =>setCuidad(e.target.value)} type='text' />
                </div>
                <div className='mb-3 col-md-4'>
                    <label>Direccion</label>
                    <input className='form-control' value={direccion} onChange={(e) =>setDirecion(e.target.value)} type='text' />
                </div>
                <div className='mb-3 col-md-4'>
                    <label>NIT</label>
                    <input className='form-control' value={nit} onChange={(e) =>setNit(e.target.value)} type='number' />
                </div>
                <div className='mb-3 col-md-4'>
                    <label>Número de Habs</label>
                    <input className='form-control' value={numHabitaciones} onChange={(e) => setNumHabs(e.target.value)} type='number' />
                </div>
            </div>  
            <button type='submit' className='btn btn-primary'>Editar información</button>
        </form>
        <div className='container row my-5'>            
            <div className='col-8'>
                <table className='table table-striped'>
                    <thead>
                        <tr>
                            <th>Cantidad</th>
                            <th>Tipo de Habitación</th>
                            <th>Acomodación</th>
                            <th>Aciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        {ready &&
                            habs.map((hab) => (
                                <tr key={hab.id}>
                                    <td>{hab.cantidad}</td>
                                    <td>{hab.tipoHab}</td>
                                    <td>{hab.acomodacion}</td>
                                    <td>
                                        <button 
                                        onClick={() =>{
                                            setId_hab(hab.id)
                                            setCantidad(hab.cantidad)
                                            setTipoHab(hab.tipoHab)
                                            setAcomodacion(hab.acomodacion)
                                        }} 
                                        className='btn btn-warning'>
                                            Editar
                                        </button>
                                    </td>
                                </tr>
                            ))                            
                        }
                    </tbody>
                </table>
            </div>
            <div className='col-4'>
                <form onSubmit={updateHabs}  className='row g-3'>
                    <div className='container col-12 row'>
                        <div className='mb-3'>
                            <label>Cantidad</label>
                            <input className='form-control' value={cantidad} onChange={(e) =>setCantidad(e.target.value)} type='text' />
                        </div>
                        <div className='mb-3'>
                            <label>Tipo Habitacion</label>
                            <select className="form-select" aria-label="Default select example" onChange={(e) => {setTipoHab(e.target.value)}}>
                                <option defaultValue disabled>{tipoHab}</option>
                                <option value="Estandar">Estandar</option>
                                <option value="Junior">Junior</option>
                                <option value="Suite">Suite</option>
                            </select>
                        </div>
                        <div className='mb-3'>
                        <label>Acomodación</label>
                            { tipoAcomodacion() }
                        </div>
                    </div>
                    <button type='submit' className='btn btn-primary'>Editar habitaciones</button>
                </form>
            </div>
        </div>
        <div className='container my-4'>
            <Link to={`/`} className='btn btn-success'>Finalizar</Link>
        </div>
    </div>
  )
}

export default EditHotel