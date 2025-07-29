const express = require('express')
const router = express.Router();
const bodyParser = require('body-parser');
const mongoose = require('mongoose');
const otpGenerator = require('otp-generator')
const nodemailer = require('nodemailer')
const Bycrpt = require('bcrypt');
const { Authmodel } = require('../model/authmodel');

router.use(bodyParser.json());
const otpStore = {};
const verifiedotps = {};
const transporter = nodemailer.createTransport({
    service: 'vijaykrishnanpr2002@gmail.com',
    auth: {
        user: 'vijaykrishnanpr2002@gmail.com',
        pass: 'facq vjwp hvgb tunu'
    }
});

// send email otp
router.post('/send-email-otp', async (req, res) => {
    const { sEmail } = req.body;

    if (!sEmail) {
        return res.status(400).json({ msg: "Email is required." });
    }

    try {
        const otp = otpGenerator.generate(6, {
            upperCaseAlphabets: false,
            lowerCaseAlphabets: false,
            specialChars: false
        });

        otpStore[sEmail] = { otp, verified: false };

        console.log(`Sending OTP ${otp} to ${sEmail}`);

        await transporter.sendMail({
            from: 'vijaykrishnanpr2002@gmail.com',
            to: sEmail,
            subject: 'Your OTP Code',
            text: `Your OTP code is ${otp}.`
        });

        return res.status(200).json({ status: "success", msg: "OTP sent to email." });

    } catch (e) {
        console.error(e);
        return res.status(500).json({ msg: "Server error", error: e.message });
    }
});


// Signin
router.post('/signin', async (req, res) => {
    console.log(req.body)
    const { sEmail } = req.body
    try {
        let data = await Authmodel.findOne({ Email: sEmail })
        if (!data) {
            return res.status(404).json({ msg: "Enter a valid email" })
        }
        return res.status(200).json({ status: "success"})
    } catch (e) {
        console.error(e);
        res.status(500).json({ message: 'Server error', e });
    }
})


// verify email otp
router.post('/email-verify-otp', async (req, res) => {
    const { otp, sEmail } = req.body;
    try {
        if (!sEmail || !otp) {
            return res.status(400).json({ msg: "Email and OTP are required." });
        }
        const storedData = otpStore[sEmail];
        if (!storedData) {
            return res.status(400).json({ msg: "No OTP found for this email. Please request a new one." });
        }
        if (storedData.otp.trim() === otp.trim()) {
            let user = await Authmodel.findOne({ Email: sEmail });
            if (!user) {
                user = new Authmodel({
                    Email: sEmail,
                    isEmailVerified: true
                });
                await user.save();
                console.log(`New user entry created for verified email: ${sEmail}`);
            }
            else {
                if (!user.isEmailVerified) {
                    user.isEmailVerified = true;
                    await user.save();
                    console.log(`Existing user email verified: ${sEmail}`);
                } else {
                    console.log(`Email ${sEmail} was already verified.`);
                }
            }
            delete otpStore[sEmail];
            return res.status(200).json({ status: "success", msg: "OTP verified." });
        }
        else {
            return res.status(400).json({ msg: "Invalid OTP." });
        }
    } catch (e) {
        return res.status(500).json({ msg: "Server error", error: e.message });
    }
});


// signup

router.post('/signup', async (req, res) => {
    console.log(req.body);

    const { sFirstName, sSurname, sPassword, sDay, sMonth, sYear, Email } = req.body;

    if (!Email) {
        return res.status(400).json({ status: 'error', msg: 'Email is required for signup.' });
    }

    try {
        const hashedPassword = await Bycrpt.hash(sPassword, 10);
        const updatedUser = await Authmodel.findOneAndUpdate(
            { Email: Email },
            {
                Firstname: sFirstName,
                Lastname: sSurname,
                Password: hashedPassword,
                Day: sDay,
                Month: sMonth,
                Year: sYear,
            },
            { new: true }
        );

        if (!updatedUser) {
            return res.status(404).json({ status: 'error', msg: 'User not found for the given email' });
        }

        return res.status(200).json({ status: 'success' });

    } catch (err) {
        console.error(err.message);
        return res.status(500).json({
            status: 'error',
            msg: 'Signup not successful',
            error: err.message,
        });

    }
});




module.exports = router;