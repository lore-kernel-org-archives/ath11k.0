Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from narfation.org ([2001:4d88:2000:7::2] helo=v3-1039.vlinux.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVcT4-0005e9-Ti
 for ath11k@lists.infradead.org; Tue, 28 May 2019 13:48:44 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: Re: [PATCH v2 0/3] ath11k: Add Mesh mode support
Date: Tue, 28 May 2019 15:48:25 +0200
Message-ID: <1931905.PyyBc1jC1X@bentobox>
In-Reply-To: <1555697498-27472-1-git-send-email-rmanohar@codeaurora.org>
References: <1555697498-27472-1-git-send-email-rmanohar@codeaurora.org>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4696819731065340770=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org
Cc: Rajkumar Manoharan <rmanohar@codeaurora.org>

--===============4696819731065340770==
Content-Type: multipart/signed; boundary="nextPart2014066.YrSI8CiBcN"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2014066.YrSI8CiBcN
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, 19 April 2019 20:11:35 CEST Rajkumar Manoharan wrote:
> Hi,
> 
> Posting initial patches to bring Mesh support to ath11k. There are known
> issues which is also captured in first patch.

What else is required to get this working? I used ath11k-bringup (which 
included these patches) and wanted to implement the HE registration part for 
it. But it turns out that it doesn't event work here with VHT. This is what I 
did on two HK01 rev B:

    iw phy phy2 interface add mesh2 type mp
    ip link set up dev mesh2
    iw dev mesh2 mesh join testmesh freq 5180 80MHz

But the firmware just crashes somewhere around the association phase:

    [   59.458342] ath11k c000000.wifi1: Added peer: 00:03:7f:12:82:a3 for VDEV: 0
    [   59.566646] qcom-q6v5-wcss-pil cd00000.qcom_q6v5_wcss: fatal error received:
    [   59.566646] QC Image Version: QC_IMAGE_VERSION_STRING=WLAN.HK.2.1.0.1-00410-QCAHKSWPL_SILICONZ-2
    [   59.566646] Image Variant : IMAGE_VARIANT_STRING=8074.wlanfw.eval_v2Q
    [   59.566646]
    [   59.566646] wlan_peer.c:2486 Assertion (vdev->bss->ni_chan.phy_mode >= peer_ratectrl_params.phymode) failedparam0 :zero, param1 :zero, param2 :zero.
    [   59.566646] Thread ID      : 0x0000005d  Thread name    : WLAN RT2  Process ID     : 0
    [   59.566646] Register:
    [   59.566646] SP : 0x4c1921f0
    [   59.566646] FP : 0x4c1921f8
    [   59.566646] PC : 0x4b1c8850
    [   59.566646] SSR : 0x00000008
    [   59.566646] BADVA : 0x00020000
    [   59.566646] LR : 0x4b1c7c68
    [   59.566646]
    [   59.566646] Stack Dump
    [   59.566646] from : 0x4c1921f0
    [   59.566646] to   : 0x4c192860
    [   59.566646]
    [   59.618939] remoteproc remoteproc0: crash detected in cd00000.qcom_q6v5_wcss: type fatal error
    [   59.641203] remoteproc remoteproc0: handling crash #1 in cd00000.qcom_q6v5_wcss
    [   59.649605] Kernel panic - not syncing: remoteproc remoteproc0: Resetting the SoC - cd00000.qcom_q6v5_wcss crashed

The whole device goes down after that.

Kind regards,
	Sven
--nextPart2014066.YrSI8CiBcN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlztPCkACgkQXYcKB8Em
e0ZsyBAA12VhDoKycuOxEEGoeQnigUvmxI7UksxuHJhNQwGLpUGdtB6cbYollYOr
idJ/qRpk8ctE8ASqUEKoZYDyq557bJLLbgSHkK48ZbJehaIUWL39CmYirPuqo1E4
98wVqif+cPeFthxEFjVsTDFzaee9Fcfa+/iEUGGBVQ6r0Z6/SD0i4ccm6mBRZwsr
RA6EN4SAgCcZKwdchz6TbBS5O4tBRiP4rd8hDmlBuowBToH1zpQLc+A9w2WGhhq4
LFYYXQUmXxAZWiprpMs4eKgUgd87ZPteFmGKpd77ICksIZCZMDwgN7XdU0Lqj2eX
zSno/wiY54TcZHB98HY7ZN7qSQQDYdEWvhgJop5MdW3w9ei5YYXWDsC+MfjirDhf
VPo5jc3UZlOQHQMIKPiq7/Y9Q8bH0SULWp/rlTLJPjcAnrZRfr79tbVfZoXBw313
/0Ohf6kwt5IlFVqbVWKR8NgPizsFt2sJXwj6qjq/wvcklzOYlpuN5P0LpMJzHyMh
n5ym86obtpf6siJ3eWOvaGb++VxgRPE/9eKwCbFZW6q5C+tu+ysEl4rCFn6FcoHJ
pb23NGyXw7NBIiyJwoDrkfJQFlluuz8oBrX3MaWJwUEuluopI8pWdipZk5hI3PX0
EUqDO2emAHnnQ6ee7Cp3xGgXFy2WV+eBofiR/biHRSwJopV1MaE=
=uqn4
-----END PGP SIGNATURE-----

--nextPart2014066.YrSI8CiBcN--





--===============4696819731065340770==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============4696819731065340770==--
