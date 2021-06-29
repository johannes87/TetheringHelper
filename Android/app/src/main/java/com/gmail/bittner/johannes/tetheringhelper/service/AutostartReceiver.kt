package com.gmail.bittner.johannes.tetheringhelper.service

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.util.Log
import androidx.preference.PreferenceManager
import com.gmail.bittner.johannes.tetheringhelper.utils.SharedPreferencesKeys

private const val TAG = "AutostartReceiver"

class AutostartReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context?, intent: Intent?) {
        val sharedPreferences = PreferenceManager.getDefaultSharedPreferences(context)
        val tetheringHelperEnabled = sharedPreferences.getBoolean(SharedPreferencesKeys.tetheringHelperEnabled, false)
        if (!tetheringHelperEnabled) {
            Log.i(TAG, "Not starting because disabled in preferences")
            return
        }

        Intent(context, SignalSenderService::class.java).also { intent ->
            context?.startForegroundService(intent)
        }
        Log.i(TAG, "Starting SignalSenderService on boot")
    }
}