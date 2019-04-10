Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-delivery-195.mimecast.com ([63.128.21.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hE7kJ-0002pt-R6
 for ath11k@lists.infradead.org; Wed, 10 Apr 2019 07:34:13 +0000
Received: by mail-pl1-f197.google.com with SMTP id j1so1062578pll.13
 for <ath11k@lists.infradead.org>; Wed, 10 Apr 2019 00:34:05 -0700 (PDT)
From: Sven Eckelmann <seckelmann@datto.com>
Subject: Re: [PATCH] ath11k: add driver [q6_rproc DTS property)
Date: Wed, 10 Apr 2019 09:33:56 +0200
Message-ID: <2317190.UUFvc8mrDS@bentobox>
In-Reply-To: <1698032.ruk2XY5Ikj@bentobox>
References: <1698032.ruk2XY5Ikj@bentobox>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6650671306367214070=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Anilkumar Kolli <akolli@codeaurora.org>, Sricharan R <sricharan@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>

--===============6650671306367214070==
Content-Type: multipart/signed; boundary="nextPart2621024.39Gz7WDiFO"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2621024.39Gz7WDiFO
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, 8 April 2019 19:42:24 CEST Sven Eckelmann wrote:
[...]
> What is this q6_rproc DTS property (and why doesn't have it a qcom, prefix and 
> not just called qcom,rproc)? I cannot find a public use of this and there also 
> doesn't seem to be documentation for it. Still it is required to bring up the 
> device without IPQ_SUBSYSTEM_RESTART (which is not available in the upstream 
> kernel) but with remoteproc.
> 
> The first reference I could find this in your internal linux-msm [1] was also 
> in this driver. There were also some function named similar in the q6v6 adsp/
> q6v5 wcss driver [2] but no actual use in a dts or documentation. A wcss pil 
> driver for remoteproc seems to be upstream now [3] but it isn't used 
> anywhere.

I just saw the commit 

    Subject: ath11k: add qmi API support and rproc_boot for Q6
    
    rproc_boot() is used to power up the Q6 remote processor.
    Q6 has the QMI server running. on Q6 power up 'qrtr-cfg'
    and 'qrtr-ns' applications will send the .new_server()
    notification to ath11k driver.
      - qrtr source 'https://github.com/andersson/qrtr'
    
    Load the BDF/cal-data and share the CE config to Q6 target
    using the below list of QMI messages.
    
    QMI Client [ATH11K]             QMI server [Q6 FW]
            <-----  ATH11K_QMI_EVENT_SERVER_ARRIVE  ----
            ---- QMI_WLANFW_IND_REGISTER_REQ_V01 ----->
            <---- QMI_WLANFW_IND_REGISTER_RESP_V01 ----
            ---- QMI_WLANFW_HOST_CAP_REQ_V01 ---->
            <---- QMI_WLFW_HOST_CAP_RESP_V01 ----
            <---- ATH11K_QMI_EVENT_REQUEST_MEM ----
            ---- QMI_WLANFW_RESPOND_MEM_REQ_V01 ---->
            <---- QMI_WLANFW_RESPOND_MEM_RESP_V01 ----
            <---- ATH11K_QMI_EVENT_FW_MEM_READY ----
            ---- QMI_WLANFW_CAP_REQ_V01 ---->
            <---- QMI_WLANFW_CAP_RESP_V01 ----
            ---- QMI_WLANFW_BDF_DOWNLOAD_REQ_V01 ---->
            <---- QMI_WLANFW_BDF_DOWNLOAD_RESP_V01 ----
            ---- QMI_WLANFW_BDF_DOWNLOAD_REQ_V01 ---->
            <---- QMI_WLANFW_BDF_DOWNLOAD_RESP_V01 ----
            ---- QMI_WLANFW_M3_INFO_REQ_V01 ---->
            <---- QMI_WLANFW_M3_INFO_RESP_V01 ----
            <---- ATH11K_QMI_EVENT_FW_READY ----
            ---- QMI_WLANFW_WLAN_CFG_REQ_V01 ---->
            <---- QMI_WLANFW_WLAN_CFG_RESP_V01 ----
            ---- QMI_WLANFW_WLAN_MODE_REQ_V01 ---->
            <---- QMI_WLANFW_WLAN_MODE_RESP_V01 ----

This one basically removes the support for the QCA 4.4 kernel with 
IPQ_SUBSYSTEM_RESTART - which is the one we tried to use in the past. What is 
now the correct one to use and where can I find the info what qcom,rproc 
refers to in the DTS?

Kind regards,
	Sven
--nextPart2621024.39Gz7WDiFO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlytnGQACgkQXYcKB8Em
e0bIYw//cVt6B3EZkbCLK/Q5Bg07relLmRJYnjFuWZjIeB3gDiMs1AhQ9n6bIwnJ
s6M9SbvVRdlfkA5QqrDSt2HbQeYY37OJHkf0q1VdbJJroHmigU/Wtmdd4d3nqFRr
016sDsg52tWGlX43gdMX+UyQFHalV4dZqKv997dhyUUyOMSYi8p0Pe6sNk558MIG
EGHCRn4cdEQ0XSMsu5m536fhMEAXZfx2Pv+8+41wup6yF0H5uH04G4eTgY6hbed8
hgd8J+9R+61WIKgcl2fgBRtCZaCWjEXwQxW0uKYTKcgAkptrRdfoy9WWDOZV2Mqy
ncF/d2S5lV/wYLul9O7u/zbCXztzEpX9ZZEnXZ2kaYhn0u+VZr/BRq2y3p5JSYNm
GznGV2e0SoiroAtK7dx4PxMBYUWatCSp5aoDmnvUnYgxtmYXLnNGjN3WSlN+tmTd
jgO3KTxCNl/DYtUZ0KqSzSqYrgn7B1RCSfTzvjtuKHiI8BhuGw82sNiDyVe5c4Ly
V6YNCGxkSKgMoEzoSBFevPSwp0lhXfA6pRcMVcvoQRePLWDQ/zunexpUF2dbSz5y
dxSXioy1TdOwMNdVr1uKoX02OpZ4XbfyET1Hksy98PcTmTgW6OTY84jpAXrWfRRM
JJag/qU505KF50wiSaSaudhQ7+/xACqneyWAg+m6ypAE5+A0/bA=
=Cner
-----END PGP SIGNATURE-----

--nextPart2621024.39Gz7WDiFO--





--===============6650671306367214070==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============6650671306367214070==--
