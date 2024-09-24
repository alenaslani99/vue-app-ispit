<?php

namespace Database\Seeders;

use App\Models\Role;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class RoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    private $role = ['Artist','User'];
    public function run(): void
    {
        foreach ($this->role as $r) {
            $roleobj = new Role();
            $roleobj->role_name = $r;
            $roleobj->save();
        }
    }
}
