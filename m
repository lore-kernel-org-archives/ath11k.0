Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-delivery-195.mimecast.com ([216.205.24.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAwT2-0007qs-Ox
 for ath11k@lists.infradead.org; Thu, 19 Sep 2019 13:27:31 +0000
Received: by mail-qk1-f199.google.com with SMTP id s28so3961810qkm.5
 for <ath11k@lists.infradead.org>; Thu, 19 Sep 2019 06:27:20 -0700 (PDT)
Received: from bentobox.localnet
 (p200300C59716D0F0000000000000070D.dip0.t-ipconnect.de.
 [2003:c5:9716:d0f0::70d])
 by smtp.gmail.com with ESMTPSA id q44sm5378408qtk.16.2019.09.19.06.27.18
 for <ath11k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 06:27:19 -0700 (PDT)
From: Sven Eckelmann <seckelmann@datto.com>
Subject: Re: [RFC PATCH v6 2/2] ath11k: Disable SU support in meshpoint mode
Date: Thu, 19 Sep 2019 15:27:10 +0200
Message-ID: <4859810.gV9nB57MYN@bentobox>
In-Reply-To: <20190813092726.28074-3-sven@narfation.org>
References: <20190813092726.28074-1-sven@narfation.org>
 <20190813092726.28074-3-sven@narfation.org>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1138440674165230474=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org

--===============1138440674165230474==
Content-Type: multipart/signed; boundary="nextPart4829919.vcmuWc1Hyj"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart4829919.vcmuWc1Hyj
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 13 August 2019 11:27:26 CEST Sven Eckelmann wrote:
> From: Sven Eckelmann <seckelmann@datto.com>
> 
> The firmware WLAN.HK.2.1.0.1-00629-QCAHKSWPL_SILICONZ-1 often stops sending
> data on 5GHz when SU support is advertised. A simple throughput benchmark
> will end up at only a couple hundred kilobytes per second (when finishing
> at all).
> 
> Disabling SU related flags works around this problem and allowed a maximum
> throughput of ~450 MBit/s in a simple test setup with an HK01 over air.
> 
> Signed-off-by: Sven Eckelmann <seckelmann@datto.com>

I've just checked with WLAN.HK.2.0.0.1-00043-QCAHKSWPL_SILICONZ-1 (which is a 
newer version than WLAN.HK.2.1.0.1-00629-QCAHKSWPL_SILICONZ-1) and wasn't able 
anymore to reproduce the SU related problems on 5GHz.

Kind regards,
	Sven
--nextPart4829919.vcmuWc1Hyj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAl2Dgi4ACgkQXYcKB8Em
e0afGg//bBrpa8yUHxhfujZ9Nsch/vXLRWyISpsMSBh/jvt8pEhrq1l3ZZ07rfvN
dzpn7FvAOZtxYsBSsDMpHEJeD/SNkyQiRBgoObO32pDKaUh3DhZotPfw3F6Gd7NK
21gA1+K2MY9X6B8aHZOc1rLamqMCdgRPEKUDdaCm+8VXX1EF/YzgJNrf1A36e86n
2i6fU3SkiXP8h9NRelLyZl/xg4xwAjSEwSoM84xz7RtZdztGIFmr/KH+XksDnZ2v
sx6Ihze3GucRQgutt1tOi3hznhZ28lEWzIeq1hu172qnJUhttkOK3pMD0Y/3UM4u
OD2+On9L0q/WG0TQ2pztVHOIN0maU8J9uqjgeE45VLCVxFPgo2vLZaxxCH+NVODu
aSPRISzgG/ThyZorhhqvSgRaqPl0caI36hPHzvcvBtaEssLfz4yPMpqK0D3wQNl3
MwLDMcOJd3OFWfiFgIQ2K26lE36FA3AX8gI/Cnmoquwuqv4SWoCbfBB6B0risVEV
+XV83TjNZ9/2cBE5huzYDa6F2w10QrVLT96m66x4xEXHnLfusI78mxwHxwmkqdca
LkKT4IG0aUQvgH416mfLTDBFOb35SDiuyzOeY1EtAI1VgHBYOxXIprHqYLCCqSZf
8edPI5KvUAw4oVD+ChxRIDS9E6m7ZkvwNI61qRcHNZZW5/LAzB8=
=T5wb
-----END PGP SIGNATURE-----

--nextPart4829919.vcmuWc1Hyj--





--===============1138440674165230474==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============1138440674165230474==--
