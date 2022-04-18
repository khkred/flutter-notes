package com.example.bluetoothtesting

import android.app.Activity
import android.bluetooth.BluetoothAdapter
import android.bluetooth.BluetoothManager
import android.content.Intent
import android.os.Build
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import androidx.annotation.RequiresApi
import com.example.bluetoothtesting.databinding.ActivityMainBinding


class MainActivity : AppCompatActivity() {

    //To enable Bluetooth we need to send a value that is greater than 0
    private val REQUEST_ENABLE_BT: Int = 1

    //Binding to get the ids
    private lateinit var binding: ActivityMainBinding


    //Get Bluetooth adapter
    lateinit var btAdapter: BluetoothAdapter

    @RequiresApi(Build.VERSION_CODES.M)
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        //Initialise the Adapter
        btAdapter = BluetoothAdapter.getDefaultAdapter()

        //Get the availability of the Adapter

        if (btAdapter == null) {
            binding.btAvailabilityTv.text = "Bluetooth Not Available"
        } else {
            binding.btAvailabilityTv.text = "Bluetooth Available"
        }

        // Status of Bluetooth
        if (btAdapter.isEnabled) {
            binding.statusTv.text = "BT Turned On"
        } else
        {
            binding.statusTv.text = "BT Turned Off"
        }

        // Turn on Bluetooth
        binding.btOnBtn.setOnClickListener{

            if (btAdapter.isEnabled) {
                Toast.makeText(this,"Bluetooth Already On",Toast.LENGTH_SHORT).show()
            }
            else {
                //Enable Bluetooth
                val enableBtIntent = Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE)
                startActivityForResult(enableBtIntent,REQUEST_ENABLE_BT)

//             Toast.makeText(this,"Bluetooth turned On",Toast.LENGTH_SHORT).show()
            }

        }

        //Turn off bluetooth
        binding.btOffBtn.setOnClickListener {  }

        //Discoverable bluetooth
        binding.discoverableBtn.setOnClickListener {  }


    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {

        when (requestCode) {
            REQUEST_ENABLE_BT -> if (requestCode == Activity.RESULT_OK) {
                binding.statusTv.text =  "Bluetooth On"
                Toast.makeText(this,"Bluetooth Turned On",Toast.LENGTH_SHORT).show()
            } else {
                Toast.makeText(this,"Couldn't turn on Bluetooth",Toast.LENGTH_SHORT).show()
            }
        }
        super.onActivityResult(requestCode, resultCode, data)
    }
}