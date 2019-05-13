Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from narfation.org ([2001:4d88:2000:7::2] helo=v3-1039.vlinux.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQBY9-0008M6-U4
 for ath11k@lists.infradead.org; Mon, 13 May 2019 14:03:34 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: Re: [PATCH] ath11k/qmi: Use memcpy_toio() function on I/O memory
Date: Mon, 13 May 2019 16:03:21 +0200
Message-ID: <4870444.cGrKAzTIII@bentobox>
In-Reply-To: <1557316483-18397-1-git-send-email-vthiagar@codeaurora.org>
References: <1557316483-18397-1-git-send-email-vthiagar@codeaurora.org>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3288289407694029496=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org
Cc: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>

--===============3288289407694029496==
Content-Type: multipart/signed; boundary="nextPart1596884.gVSrhHRrkp"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart1596884.gVSrhHRrkp
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, 8 May 2019 13:54:43 CEST Vasanthakumar Thiagarajan wrote:
> The usage of memcpy() function on I/O memory is not recommended
> when doing a bulk data copy. Instead use memcpy_toio() function
> while copying bulk data to I/O memory. Using the right function
> takes care of platform specific alignment requirement as well
> in arm64. This fixes the below kernel crash due to unaligned
> memory access in 64-bit arm during memory copy of board data to I/O
> memory.
> 
> [   15.672513] ath11k c000000.wifi1: Downloading BDF: IPQ8074/board-2.bin, size: 917972
> [   15.672635] Unhandled fault: alignment fault (0x96000061) at 0xffffff8007200004
> [   15.680449] Internal error: : 96000061 [#1] PREEMPT SMP
> [   15.946227] CPU: 0 PID: 890 Comm: kworker/u8:5 Tainted: P
> [   15.968272] task: ffffffc03cae9f80 ti: ffffffc03cae9f80 task.ti: ffffffc03cae9f80
> [   15.968552] PC is at __efistub_memcpy+0x48/0x180
> [   15.976011] LR is at ath11k_ce_get_attr_flags+0xc14/0x1594 [ath11k]
> 
> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
> ---

Tested-by: Sven Eckelmann <sven@narfation.org>

I was able to load WLAN.HK.2.1.0.1-00056-QCAHKSWPL_SILICONZ-1.

But the newest firmware still crashes directly after it got loaded:

    [    9.943342] ath11k c000000.wifi: Target: chip_id: 0x0, chip_family: 0x0, board_id: 0x211, soc_id: 0xffffffff, fw_version: 0x30e84a5
    [    9.944161] ath11k c000000.wifi: Downloading BDF: IPQ8074/board-2.bin, size: 917972
    [    9.955302] ath11k c000000.wifi: Direct firmware load for IPQ8074/caldata.bin failed with error -2
    [    9.961605] ath11k c000000.wifi: Falling back to user helper
    [   10.217235] ath11k c000000.wifi: Downloading BDF: IPQ8074/caldata.bin, size: 131072
    [   10.218209] Fatal error received from wcss software!:
    [   10.218209] QC Image Version: QC_IMAGE_VERSION_STRING=WLAN.HK.2.1.0.1-00410-QCAHKSWPL_SILICONZ-2
    [   10.218209] Image Variant : IMAGE_VARIANT_STRING=8074.wlanfw.eval_v2Q
    [   10.218209]
    [   10.218209]     :Excep  :0 Exception detectedparam0 :zero, param1 :zero, param2 :zero.
    [   10.218209] Thread ID      : 0x00000071  Thread name    : wlan_platform  Process ID     : 0
    [   10.218209] Register:
    [   10.218209] SP : 0x4b658a00
    [   10.218209] FP : 0x4b658a18
    [   10.218209] PC : 0x4b38a0d4
    [   10.218209] SSR : 0x00000003
    [   10.218209] BADVA : 0x4b0c0009
    [   10.218209] LR : 0x4b2ba2e4
    [   10.218209]
    [   10.218209] Stack Dump
    [   10.218209] from : 0x4b658a00
    [   10.218209] to   : 0x4b658d20

Kind regards,
	Sven
--nextPart1596884.gVSrhHRrkp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlzZeSkACgkQXYcKB8Em
e0btcxAAzmIJvpWRUCPoO69yhyNQcy2IJEAHaloMVkzGIqvzU3a9F+mkb0WC7Vke
FWApInoKShVRjdNSgPTF7W+tMp9kLdt9M8fSides1Fn1xafe7O4qQ8qx1jwwlEiM
1WU/Q61JVBlwYzmHhMZb8f3NnztMSRGmzpgK+rHGybtdOcxu2VFGE2AtqyJYiVCM
RMVKCnv9GKzotxmuTnOAoQW+m+Csx38qvkLs6OF/vIIQ1yGZjm1zBWuD2Tbx0bxB
6P84fTQmL/rfEdYdiOYyMUwtYYsm3Q2bu2+tH/iReVx6781jw7jvfsTp905Qw9qg
bzZEmzj1bi6KLUgrXSBE2+3T6s7XqCw5pzTcCHfvGcv4aJwq/KUW2jbD+/8NY2Jn
lgvbLvvziKd+9tSNcqvlJMB7Zsil8FhKE6V1OCbxBxBVGSG2atGcUkjzr9d3Ve7W
wzvOnV+EU+xwF9exbNSqJcIVmY77GUk5lBVorFpPzgdFsXrKunz7sRe98toeeZVw
otE+eyQ1AJx+KADAaSCaUO3/1HC+PFidb/5l14+B6iS0vflWtzby0j94Kq+8QquF
4cZwvTAqmL42md7YmhxNyYxUyEObi+fe5yoIEaYlnSosKMTcrVXhdMmZ9Kw+7vUo
oGYQuNITGMbFzkzsXrHYEQpBi56QTZ9v7chD+a98UH76aJvZOU0=
=xqK6
-----END PGP SIGNATURE-----

--nextPart1596884.gVSrhHRrkp--





--===============3288289407694029496==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============3288289407694029496==--
