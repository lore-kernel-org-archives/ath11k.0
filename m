Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B38C433EF
	for <ath11k@archiver.kernel.org>; Tue, 14 Dec 2021 13:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FI64U8gHQ8wvcbBZS6cCJAlM4cLbdSVQvxNyktF8hxc=; b=zICLHWDULI4ONO8Mgua01LM3+q
	culTKNvbf2tNv/t/c8h/ZTfa6CsTEfMIG9UFfZ6DnU61MJHR5hX48bS93YF3pEZXlBsLtUqV5QFiA
	qT5l/Jkm7srSAGfQ7USJttGWWSerUJymQ9l3wfM6jYfOGhV95n2LvG6fjL2qcmne2VygT+hD0QUC1
	TXk6DA7jeTTunf4pmCHD/IgqeYAh6/oLRYDpr1sW8OjxwqXx0CAoWPcvURoc29R6uL+twL0SyHqeA
	0LuKlPd1lutFPT/AiXSx+B+Po8uSESz8KrqSPYqo3rxiGShqXx1HXLHl0b2qiVGlJSAkhzwb2UFvu
	92rAMzpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx7ty-00EAo6-8u; Tue, 14 Dec 2021 13:31:30 +0000
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx7tv-00EAmt-8M
 for ath11k@lists.infradead.org; Tue, 14 Dec 2021 13:31:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1639488682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TMLtdrXuEMDgtiwDQbInWCz8+7wR0Juy2ApsqnQbzJk=;
 b=gwqjnFdcJWPoD2KscoDHyte87NXJd2NC1eZ6bhNZJJZYiPoowmm+IpmgkPGSQLvXWXyd5I
 WFHiBjGQT7dyeVqp4zTSYPNisuTQCZveRy67vT33Hr42I0dAt1FwYtZC93/MUvap2Y1yp4
 XIagcfVUGQWQcNZ5m4NSdCqSPbMthTM=
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org, Wen Gong <quic_wgong@quicinc.com>
Cc: Sven Eckelmann <sven@narfation.org>
Subject: Re: ath11k: incorrect board_id retrieval
Date: Tue, 14 Dec 2021 14:31:17 +0100
Message-ID: <1880746.bFOEV04gjF@ripper>
In-Reply-To: <3014977.PoT5AKhg5k@ripper>
References: <1734146.k9CKHTOI9D@ripper> <3014977.PoT5AKhg5k@ripper>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_053127_490545_EE571D03 
X-CRM114-Status: GOOD (  11.19  )
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
Content-Type: multipart/mixed; boundary="===============1397107394129909442=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

--===============1397107394129909442==
Content-Type: multipart/signed; boundary="nextPart6560707.uD5aKzNDrY"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart6560707.uD5aKzNDrY
Content-Type: multipart/mixed; boundary="nextPart1834583.WAxbKdLVha"; protected-headers="v1"
Content-Transfer-Encoding: 7Bit
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org, Wen Gong <quic_wgong@quicinc.com>
Cc: Sven Eckelmann <sven@narfation.org>
Subject: Re: ath11k: incorrect board_id retrieval
Date: Tue, 14 Dec 2021 14:31:17 +0100
Message-ID: <1880746.bFOEV04gjF@ripper>
In-Reply-To: <3014977.PoT5AKhg5k@ripper>
References: <1734146.k9CKHTOI9D@ripper> <3014977.PoT5AKhg5k@ripper>

This is a multi-part message in MIME format.

--nextPart1834583.WAxbKdLVha
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, 2 December 2021 15:43:03 CET Sven Eckelmann wrote:
[...]
> Just retrieved the next card (EmWicon WMX7205 - could be the same as jjPlus 
> WMX7205) and it has exactly the same problem:
> 
>     ath11k_pci 0000:05:00.0: failed to fetch board data for bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=255 from ath11k/WCN6855/hw2.0/board-2.bin
>     ath11k_pci 0000:05:00.0: failed to fetch board-2.bin or board.bin from WCN6855/hw2.
> 
> Of course, the only provided keys (all with board_id != 255) are:
> 
> * bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=3374,qmi-chip-id=2,qmi-board-id=262
> * bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=3374,qmi-chip-id=2,qmi-board-id=266
> * bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=3374,qmi-chip-id=18,qmi-board-id=266
> 
> So until now, I could not find a single card for which ath11k returned a 
> board-id != 255 (unless it was overwritten via the devicetree).

According to the manufacturer, the board itself should identify itself as 

    chip_id: 0x2, chip_family: 0xb,   board_id: 0x301, soc_id: 0x400c0200

I have therefore dumped the memory region with the qmi response via kgdb. You 
can easily see that the response has following sections:


* 0x02 (len  4) - resp
* 0x02 (len  4) - resp
* 0x10 (len  8) - chip_info
* 0x12 (len  4) - soc_info_valid
* 0x13 (len 21) - fw_version_info
* 0x14 (len 77) - fw_build_id
* 0x15 (len  1) - num_macs
* 0x16 (len  4) - voltage_mv
* 0x17 (len  4) - time_freq_hz
* 0x1A (len  8) - ????

So the section 0x11 with the board_id is completely missing. For some reason.

> > So my question would be: Is the ath11k based board_id retrieval just broken? 
> > Or are these cards broken?

Kind regards,
	Sven

--nextPart1834583.WAxbKdLVha
Content-Disposition: attachment; filename="qmi_wlanfw_cap_resp_msg_v01_ei.bin"
Content-Transfer-Encoding: base64
Content-Type: application/octet-stream; name="qmi_wlanfw_cap_resp_msg_v01_ei.bin"

AgQAJACeAAIEAAAAAAAQCAACAAAACwAAABIEAAACDEATFQBMCwwREDIwMjEtMTEtMjQgMDQ6MjQU
TQBRQ19JTUFHRV9WRVJTSU9OX1NUUklORz1XTEFOLkhTUC4xLjEtMDI4OTIuMS1RQ0FIU1BTV1BM
X1YxX1YyX1NJTElDT05aX0xJVEUtMRUBAAIWBAC1AwAAFwQAAPgkARoIAAEAAAAAAAAA


--nextPart1834583.WAxbKdLVha--

--nextPart6560707.uD5aKzNDrY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmG4nKUACgkQXYcKB8Em
e0Z0WxAAzYaAU/vbI+mVTEZR6yNC3p/beisE9iFxSrgocilj3gZrb6fSwvE6BSMq
Bi+28YIemTcuBfPMqYumTAdTssTEfP1HtpBxIiWDHYLwEC7axdcF+zQWFCEQ5ANa
E0fbQK8sxKqjdT6OFAyHT+BRboUzTmdDOMM0/Hs0RYcMT9rKkfyRzfxcs5jDy1KF
oyBfR8xhtYW+asboA8KWuhDJq4v4AjTLokiBg/fGqqQDz1WTn4KJjnUIGk1+6REF
fdWf9xs0VXFHfSp6cdmBvGSuFC7f6xBI+jTHrYPRDsKHTo/m6gEGe8sCKOorNA/L
6WR5rgj+FV9rwzNidfnjAyGJmRcsV1eX1uFQp8GFYGucBIaK+PRA3/q4QSm1xQY4
Iaa8u7wNOuXkYRmZlgXm1kW3PJkBDE34m1HekNUpj1zyJ17MtmsRNpWSZQS7MG81
ybJywfYYoQjZGkL4O3ChbLIFVtxTjEFfXUkJhIIrhJ5GeFqP3k+4mvqDilynDuEe
KRCVRQutdtWkedetvIozMFDkm5h3IJqZd2j4XgoI1F1tEra5E0W+9OpzeCilF1S1
nT9061pq68lewpJdGqe8MZ+6yI+OvEx6EV5MZ70Mrc/ir4fKIj+YTwBLw3uvzEzL
vMKy+7dZAxgIjdB7NelmsJRImZFQw1tBwuneXepbu2N24UjffyQ=
=7LS/
-----END PGP SIGNATURE-----

--nextPart6560707.uD5aKzNDrY--





--===============1397107394129909442==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============1397107394129909442==--




