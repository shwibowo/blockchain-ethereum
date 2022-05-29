// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.7.0;
pragma experimental ABIEncoderV2;

import "./Doctors.sol";
import "./Hospitals.sol";

contract Process is Doctors, Hospitals {

    // Data structure ********************************************************
    struct processPatient {
        string thePatient;
        string complaint;
        address addrPatient;
    }

    struct Hospital {
        string hospitalHame;
        string address_;
        address hospitalAddr;
    }

    struct processDoctor {
        string doctorname;
        string specialize;
        string diagnosis;
        string prescription;
        address doctorAddress;
    }

    //initializing *************************************************************
    processPatient[] patients;

    function A_Patient(string calldata PatientName, string calldata Complaint, address PatientAddr) public {
        patients.push(processPatient(PatientName, Complaint, PatientAddr));
    }

    Hospital[] hospital;

    function B_Hospital(string calldata HospitalName, string calldata HospitalAddress, address HospitalAddr) public {
        hospital.push(Hospital(HospitalName, HospitalAddress, HospitalAddr));
    }

    processDoctor[] processdoctor;

    function C_Doctor(string calldata DoctorName, string calldata Specialization, string calldata Diagnosis, string calldata Prescription, address DoctorAddr) public {
        processdoctor.push(processDoctor(DoctorName, Specialization, Diagnosis, Prescription, DoctorAddr));
    }

    //Recording *******************************************************************
    function G_MedicalRec() public view returns (processPatient[] memory, Hospital[] memory, processDoctor[] memory) {
        return (patients, hospital, processdoctor);
    }

    //Payment ********************************************************************
    function PayHospitalService(address _hospitalAddr) payable external returns (bool result) {
        uint pays = msg.value;
        _doctors.transfer(pays);
    }

    function PayTheDoctor(address _doctorAddr) payable external returns (bool result) {
        uint pays = msg.value;
        _hospitals.transfer(pays);
    }
}