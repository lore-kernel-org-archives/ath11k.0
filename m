Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B05C4332F
	for <ath11k@archiver.kernel.org>; Tue, 27 Dec 2022 03:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:From:To:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=FxwsrP50lJExJnBLBZEtwbDdhW0K2uyi+U1xwzAMdiA=; b=OSv
	a1aV/rt0TemRKuGBW4EjLqau/WQvxCMIxeSbEE9n0DuUqwhBKFh2ybaQD/9rl6xt/p0VFSoanqJzP
	qso+dJoDXeDq2gVD8vOvi2NROZ1ho8/z0adbf47cFkh+SN8O3zqL+LmRPaXlPsDkOkNwIzMwRWwW2
	iQuQtoIlX28OXmCnGJYo0vW9/cMGcDQJDXw5kxG0jztn9hvNIofFqcAYgJ3Vpzevl7BfblQMS4uOU
	gjaqpreDq3Snygj8WWSrVd4vIGf4FfA4V6AQ2/5jpX4riaqojj+DA+lEDHB8IQug5yWmZb00t9iUF
	mek9y48yzHdVN3LrcqvxrjvVXR7KU9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA0RH-009ZFY-OJ; Tue, 27 Dec 2022 03:15:39 +0000
Received: from ionic.de ([2001:41d0:700:3394:1::2] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA0RE-009ZCj-9t
	for ath11k@lists.infradead.org; Tue, 27 Dec 2022 03:15:38 +0000
Authentication-Results: root24.eu; spf=softfail (domain owner 
   discourages use of this host) smtp.mailfrom=ionic.de 
   (client-ip=2003:6:2395:d105:3ad5:7aff:fe00:5d1; 
   helo=p200300062395d1053ad57afffe0005d1.dip0.t-ipconnect.de; 
   envelope-from=ionic@ionic.de; receiver=<UNKNOWN>)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1672110923; bh=JjKPB24SftP4MGUUDYGk9YmMoMHHoTWlIFc1w0fWvYE=;
	h=Date:To:From:Subject:From;
	b=JY7vLti+N/fbmL5xsRSPVVgJOdWwCto1M8YiLwfquz0BJoOaPi6o3XuuK+2+vJ5IL
	 Bkt4kDNN/Abi1tjLmjuaBkoDftw143mPjCyr/RxmQmotI7JJCOgxSPBQA/g5eZAWHQ
	 nlVWWllGIaGR9h60g1On9hThT0YGGrsdmzSANwhA=
Received: from [IPV6:2003:cc:3f0f:fc05:3ad5:7aff:fe00:5d1] (p200300062395d1053ad57afffe0005d1.dip0.t-ipconnect.de [IPv6:2003:6:2395:d105:3ad5:7aff:fe00:5d1])
	by mail.ionic.de (Postfix) with ESMTPSA id 4FB8C1480E74
	for <ath11k@lists.infradead.org>; Tue, 27 Dec 2022 04:15:23 +0100 (CET)
Message-ID: <55f8ab9a-a767-6ab9-10cb-ec56644a9776@ionic.de>
Date: Tue, 27 Dec 2022 04:15:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: ath11k@lists.infradead.org
From: Mihai Moldovan <ionic@ionic.de>
Subject: Suspend/resume regression?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221226_191536_864674_2FAFAC86 
X-CRM114-Status: GOOD (  11.01  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7137301491698599128=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============7137301491698599128==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qhqQ61dkuuhLFC1LCq0wuxAO"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------qhqQ61dkuuhLFC1LCq0wuxAO
Content-Type: multipart/mixed; boundary="------------zF5y9D0TbpcmIZLHBcEiLw9T";
 protected-headers="v1"
From: Mihai Moldovan <ionic@ionic.de>
To: ath11k@lists.infradead.org
Message-ID: <55f8ab9a-a767-6ab9-10cb-ec56644a9776@ionic.de>
Subject: Suspend/resume regression?

--------------zF5y9D0TbpcmIZLHBcEiLw9T
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi


I am very sorry to bring that up again, after
https://bugzilla.kernel.org/show_bug.cgi?id=3D214179 and
https://bugzilla.kernel.org/show_bug.cgi?id=3D215103 , which supposedly f=
ixed
issues like this, but I am still seeing crashes on suspend and resume ope=
rations
(although I've only ever tested with 6.1.1 and the newest firmware).

I am using a Clevo P7xxDM2-G laptop.

Kernel log ring buffer excerpt (modified to leave out unnecessary details=
, but
can also provide the full one):

[...]
[  +0.000628] ath11k_pci 0000:70:00.0: BAR 0: assigned [mem
0xdc200000-0xdc3fffff 64bit]
[  +0.000017] ath11k_pci 0000:70:00.0: enabling device (0000 -> 0002)
[  +0.000265] ath11k_pci 0000:70:00.0: MSI vectors: 32
[  +0.000007] ath11k_pci 0000:70:00.0: wcn6855 hw2.0
[...]
[  +0.144510] ath11k_pci 0000:70:00.0: chip_id 0x2 chip_family 0xb board_=
id 0xff
soc_id 0x400c0200
[  +0.000004] ath11k_pci 0000:70:00.0: fw_version 0x11090c35 fw_build_tim=
estamp
2022-04-18 20:23 fw_build_id
WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.
[...]
[Dec26 05:15] PM: suspend entry (deep)
[  +0.069544] Filesystems sync: 0.069 seconds
[  +1.054311] Freezing user space processes ... (elapsed 0.002 seconds) d=
one.
[  +0.002716] OOM killer disabled.
[  +0.000001] Freezing remaining freezable tasks ... (elapsed 0.001 secon=
ds) done.
[  +0.001426] printk: Suspending console(s) (use no_console_suspend to de=
bug)
[  +0.000396] wifi: deauthenticating from <MAC> by local choice (Reason:
3=3DDEAUTH_LEAVING)
[...]
[  +0.009235] ACPI: PM: Low-level resume complete
[  +0.000040] ACPI: EC: EC started
[  +0.000001] ACPI: PM: Restoring platform NVS memory
[...]
[  +0.000490] mhi mhi0: Resuming from non M3 state (RESET)
[...]
[Dec26 05:16] mhi mhi0: Did not enter M0 state, MHI state: M3, PM state: =
M3->M0
[  +0.000005] ath11k_pci 0000:70:00.0: failed to resume mhi: -5
[  +0.000002] ath11k_pci 0000:70:00.0: failed to resume hif during resume=
: -5
[  +0.000001] ath11k_pci 0000:70:00.0: failed to resume core: -5
[  +0.000001] ath11k_pci 0000:70:00.0: PM: dpm_run_callback():
pci_pm_resume+0x0/0xf0 returns -5
[  +0.000006] ath11k_pci 0000:70:00.0: PM: failed to resume async: error =
-5
[  +3.007971] ath11k_pci 0000:70:00.0: wmi command 16387 timeout
[  +0.000004] ath11k_pci 0000:70:00.0: failed to send WMI_PDEV_SET_PARAM =
cmd
[  +0.000002] ath11k_pci 0000:70:00.0: failed to enable dynamic bw: -11
[  +0.000002] ------------[ cut here ]------------
[  +0.000000] Hardware became unavailable upon resume. This could be a so=
ftware
issue prior to suspend or a hardware issue.
[  +0.000013] WARNING: CPU: 7 PID: 10163 at net/mac80211/util.c:2440
ieee80211_reconfig+0x8a/0x10c0
[... stacktrace ...]
[  +0.000000] wifi: Failed check-sdata-in-driver check, flags: 0x0
[  +0.000010] WARNING: CPU: 7 PID: 10163 at net/mac80211/driver-ops.c:98
drv_remove_interface+0x11c/0x130
[... stacktrace ...]
[  +0.000000] WARNING: CPU: 7 PID: 10163 at net/mac80211/driver-ops.c:37
drv_stop+0xfa/0x110
[... stacktrace ...]
[  +0.000672] ieee80211 phy1: PM: dpm_run_callback(): wiphy_resume+0x0/0x=
180
returns -11
[  +0.000007] ieee80211 phy1: PM: failed to resume async: error -11
[  +0.000347] PM: resume devices took 96.975 seconds
[  +0.000002] ------------[ cut here ]------------
[  +0.000000] Component: resume devices, time: 96975
[  +0.000004] WARNING: CPU: 1 PID: 2954 at kernel/power/suspend_test.c:53=

suspend_test_finish+0x82/0xa0
[... stacktrace ...]
[  +0.001661] Bluetooth: hci0: using rampatch file: qca/rampatch_usb_0013=
0200.bin
[  +0.000003] Bluetooth: hci0: QCA: patch rome 0x130200 build 0x4610, fir=
mware
rome 0x130200 build 0x17f3
[  +0.649816] Bluetooth: hci0: using NVM file: qca/nvm_usb_00130200.bin
[  +0.026520] Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection =
command
is advertised, but not supported.
[  +0.133551] Bluetooth: hci0: unexpected cc 0x2060 length: 1 < 7
[  +0.000009] Bluetooth: hci0: Opcode 0x2060 failed: -38
[  +1.939173] ath11k_pci 0000:70:00.0: wmi command 16387 timeout
[  +0.000004] ath11k_pci 0000:70:00.0: failed to send WMI_PDEV_SET_PARAM =
cmd
[  +0.000003] ath11k_pci 0000:70:00.0: failed to enable PMF QOS: (-11
[  +0.063968] Bluetooth: hci0: command tx timeout
[Dec26 05:23] ath11k_pci 0000:70:00.0: wmi command 16387 timeout
[  +0.000004] ath11k_pci 0000:70:00.0: failed to send WMI_PDEV_SET_PARAM =
cmd
[  +0.000002] ath11k_pci 0000:70:00.0: failed to enable PMF QOS: (-11
[Dec26 05:25] ath11k_pci 0000:70:00.0: failed to wait wlan mode request (=
mode
4): -110
[  +0.000006] ath11k_pci 0000:70:00.0: qmi failed to send wlan mode off: =
-110
[Dec26 05:28] mhi mhi0: Device failed to clear MHI Reset
[...]

At this point, I tried the usual workaround and rmmod ath11k_pci, which
naturally hang. I'm not sure if it recovered eventually after quite some
minutes, or whether I persuaded it into working by resetting the PCI link=
 via
/sys/bus/pci/devices/0000:70:00.0/reset.

Either way, it eventually worked, I could re-load the module and it has b=
een
working ever since.

I can also provide an ACPI dump of my system if needed.


Best regards,




Mihai

--------------zF5y9D0TbpcmIZLHBcEiLw9T--

--------------qhqQ61dkuuhLFC1LCq0wuxAO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEbhHQj3UzgcdE8cg8H9Yu2W4lOocFAmOqY0oFAwAAAAAACgkQH9Yu2W4lOocW
TxAApgYFFE24/2wh41cufoYtfNJSB9e9NkXwjTC8mQx66whS/ikPo2lodjUQyIpm4fWSMNX1wGUH
p5xHpikYehch48JNJnTiCnZ0W3Loq1y236/5m+owP1yfg2d8+/KEeqPw5s384ZfgA/du0q6EQH8h
Nsod8tnqAAukAa0YDeGKxg2krDv1shCZillsUd7bb6gBwvvmIW1RhG6gSbTqKuL2S1DTTUORcej0
RSnpsCgqkZxI/9XPLcXWxOifeYMVYs7t/8XLultoR9fvFcCTWg1HnVHG6pc5nSRPwbe0tqI7w1Ph
i0v8nXwwbB5IxaImDW/G4+Ga9ozzV6/+z8+EDQFo/KdRPzH0rmsafmJXdbUJY0X/kKgOJkQni3kJ
aod+jIKS8YdDdrZd5qit/9DF+VZwMRobk5u+mENJetyBc+mIpwdcTGiSkJMf9w6zMbvPisZ3QGMA
C3XUVZ8oR+1u61/sFpP/jacH50snW+GaL8l2FAiqhFnFAE0hNJNH3EUQFxP4Bfis8Yz33fgzyBJu
ey2/bvX1BH9QGcJ6N1zm21MCiyYG2USeHId/7nna2mjArhRAScbJ/Dqrq+9zM5xvDV5pOXWsdESf
bO7xY2Gp9s6IiDP3y6LG5SguEdWFXbXr0j5yqv99yMADwNXATL8QuffyAZo+FGq+1iYbqyr66/j0
EGs=
=Z66n
-----END PGP SIGNATURE-----

--------------qhqQ61dkuuhLFC1LCq0wuxAO--


--===============7137301491698599128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============7137301491698599128==--

