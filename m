Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E52C433F5
	for <ath11k@archiver.kernel.org>; Tue, 14 Dec 2021 13:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=nvjCPW+XjiHr9d+4gBNG0k8xWfMTVDzb/4zec6hScGQ=; b=KYJ
	U20fwPsLTVI33GwGxSeY+2SxbBMHvEMW0A/vL2rmtaR7HHNcAfng+mgW3uk7S0pd/00cQG4bHRQIG
	/GLbisQBaAgXD6AKSHyZ+D4PLGpQ/xTGg6o180n4DVPF6JbTfVdcvLGv7MuKVlFA+HIWNfUIUAQ2M
	CwJJmwKr+8mCQUL0ClNt8GixhWHo/yOZEDFGC2E7LBcEL68Vo9f3hmUc3tOY6BgGRzciksp7GMz8N
	szDOuBzuVXyZ+grZt6CvpLa2J/rIrsaI9gNJ45Oh20hFh/3vIkTTeVNZpmsNCsdoB2IYFgisuA9l8
	Dhw1EHKMYPCQ4/rouJl0ESD3ltUiGTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx7zj-00EBmZ-Kh; Tue, 14 Dec 2021 13:37:27 +0000
Received: from dvalin.narfation.org ([213.160.73.56])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx7zg-00EBlY-O7
 for ath11k@lists.infradead.org; Tue, 14 Dec 2021 13:37:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1639489042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=yNjil783WKWDq5oV2jf7nP4yvYcaLD5Fdv9ydzEkXKs=;
 b=qmlXDIKtHoQPCpp8LuV1pI+ADpsO6RWzbGI1ExPI5K7gFCt4HSUaSHQkR4vn905dIBCAlS
 Q5Y8L4/enK5l9wuOKF1fsVf0gYevyrOBc9EGkUIFHy0WBuCkdC9jFrsGOFfCPIAVd6gjXA
 oIcYLheL6mB8w65OphWcgaUuoEjCHv4=
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org
Cc: Wen Gong <quic_wgong@quicinc.com>
Subject: ath11k: firmware variants for WCN6855 v2
Date: Tue, 14 Dec 2021 14:37:20 +0100
Message-ID: <3348649.btbF5x2DtX@ripper>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_053724_972188_42D51563 
X-CRM114-Status: UNSURE (   8.87  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============6251643769091837723=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

--===============6251643769091837723==
Content-Type: multipart/signed; boundary="nextPart4673661.a5PMvuEqNB"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart4673661.a5PMvuEqNB
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org
Cc: Wen Gong <quic_wgong@quicinc.com>
Subject: ath11k: firmware variants for WCN6855 v2
Date: Tue, 14 Dec 2021 14:37:20 +0100
Message-ID: <3348649.btbF5x2DtX@ripper>

Hi,

the EmWicon WMX7205 (Milan) seems to have a special board.bin from the 
manufacturer. But when using it, the firmware seems to crash:

    [   10.710206] ath11k_pci 0000:01:00.0: BAR 0: assigned [mem 0xd0000000-0xd01fffff 64bit]
    [   10.819230] ath11k_pci 0000:01:00.0: MSI vectors: 1
    [   10.840305] ath11k_pci 0000:01:00.0: wcn6855 hw2.0
    [   12.234095] ath11k_pci 0000:01:00.0: chip_id 0x2 chip_family 0xb board_id 0xff soc_id 0x400c0200
    [   12.242991] ath11k_pci 0000:01:00.0: fw_version 0x110c0b4c fw_build_timestamp 2021-11-24 04:24 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HSP.1.1-02892.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
    [   12.271180] ath11k_pci 0000:01:00.0: qmi failed to load CAL data file:cal-pci-0000:01:00.0.bin
    [   12.520852] ath11k_pci 0000:01:00.0: firmware crashed: MHI_CB_SYS_ERROR
    [   22.333795] ath11k_pci 0000:01:00.0: failed to wait board file download request: -110
    [   22.341751] ath11k_pci 0000:01:00.0: qmi failed to load bdf file
    [   22.347921] ath11k_pci 0000:01:00.0: failed to load board data file: -110

But they also provided a firmware which doesn't end with 
QCAHSPSWPL_V1_V2_SILICONZ_LITE-1 but with QCAHSPSWPL_V2_SILICONZ_CE-1. This 
firmware doesn't seem to crash with their board.bin.

Does anybody know whether the firmware QCAHSPSWPL_V2_SILICONZ_CE-1 (which 
cannot be found in Kalle's repository) is actually meant to work with ath11k? 
At least from past experience (with HK01), I know that the firmware for the 
proprietary driver is not meant to be used for ath11k and caused interesting 
crashes.

Kind regards,
	Sven
--nextPart4673661.a5PMvuEqNB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmG4nhAACgkQXYcKB8Em
e0ZPKRAAwDIvv+jYrzgv/+1rUREvx9CYiWtpdf48kPXAQUddDT2Io6IP/QY40a3F
72Ge22n/AV71gHsJcjyhhle0G/iB1nCYbFkr59k5iAtxKMBFE4loOi2Drzi+cZGV
uD3BDIryMzS3wCYsvgfmxafZlLkIZTM/v3k1f9APaZU/k6q8SaQi6IPFXSWb4wC6
Fw/LtV81isyD2S1+ZYDkfW3u/tsjBqXd2qJQyOI6KkfGHm2kM/ze+jovQo1m7/RK
9jnVuFGXFFiDH7ANW5NwUMavDjh0FauDsYCAO36gV3cYKNOO2WL3HLypzb9inkcQ
q8Nx3+wkTPA58jJMsjATlvI+SzZmyipGtbLklepSg1Unvug9bJ7H4kSqU9+Ud3wO
SxYeaG3pN7PT/HuVs7p09bRpuV/c2ZBh89CZtIVkiogB6xxZ6E4kvkp/Iz5Kk+nx
ADcLxrP+V787Htl+Mqd2JVHlCPpW5RKvfdGzdqdArEHTuTnT/RKecKURLAhfgZRF
m1ejcZkJiYyaTAl5E8Vlgw6IhsxcYk/kfJUJECru+wQMTFdzpamTlScLDpZzrivV
5gwaoQEuWvB3UXyCcuqzlJKvYEotZ23jQS+OolRZnoz2RcmtWZfFsXRA2dNNi9cS
/O0VV1XPxlVB+L0QlZNOkQN5Rhz4JgrMGkdjM4oM6Bt58JUy9+Q=
=UQMi
-----END PGP SIGNATURE-----

--nextPart4673661.a5PMvuEqNB--





--===============6251643769091837723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============6251643769091837723==--




