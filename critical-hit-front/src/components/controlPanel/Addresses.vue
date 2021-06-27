<template>
    <div class="container">
        <h3 class="p-3 text-center">Mis Direcciones</h3>
        <table class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Direccion</th>
                    <th>Casa/Dpto</th>
                    <th>Comuna</th>
                    <th>Ciudad</th>
                    <th>Region</th>
                    <th>Editar</th>
                    <th>Borrar</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="address in addresses" v-bind:key="address.id">
                    <td>{{address.name}}</td>
                    <td>{{address.address1}}</td>
                    <td>{{address.address2}}</td>
                    <td>{{address.state}}</td>
                    <td>{{address.city}}</td>
                    <td>{{address.region}}</td>
                    <td>
                      <button>
                        <font-awesome-icon icon="edit" />
                      </button>
                    </td>
                    <td>
                      <button>
                        <font-awesome-icon icon="trash" />
                      </button>
                    </td>
                </tr>
            </tbody>
        </table>
      <div class="text-right">
        <button class="btn btn-primary" >Agregar Direccion</button>
      </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            addresses: [
                { name: 'Mi Casa', address1: 'los solcitos 117', address2: 'condominio 1, casa 5', state: 'Las Condes', city: 'Santiago', region: 'RM' },
                { name: 'Trabajo', address1: 'Washinton Carrasco 21', address2: 'oficina 203', state: 'Providencia', city: 'Santiago', region: 'RM' },
                { name: 'Depa Waifu', address1: 'Frank Pueblano 0982', address2: 'torre 2, 1301', state: 'Vitacura',  city: 'Santiago', region: 'RM' },
                { name: 'Casa de mis viejos', address1: 'Mar Rojo 9032', address2: '', state: 'Cerro Los Placeres', city: 'Valparaiso', region: 'Valparaiso' },
                { name: 'Dpto Peter', address1: 'Abedules Rancios 10', address2: 'torre 1, 344', state: 'San Bernardo', city: 'San Bernardo', region: 'RM' }
            ]
        };
    }
};
</script>
