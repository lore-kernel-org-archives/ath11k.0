Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC08BC4332F
	for <ath11k@archiver.kernel.org>; Sat, 17 Dec 2022 10:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9TjcYx1NiYdydBqeLFpTRmlUz2U+26cgixEk7+cCvz8=; b=ukHfPAa8BKU+h5RLQYRv7JZ8uk
	d72vGAYXksmVRGBKNONsBXOGwvVZXTOqa2mZj4KU77rZf8bvD0U/nBpJZ3leRvB7ZyIoy2SthcFlW
	BZMl9VnH+v9w+y5k0J19EIQUSGhlpcOE4BD10png0uTGLkCm2/rLjOaS+lrgJSe/8mmrtKnMcEECB
	Ea0b/zV+Qdcc0HWXe6XezppYz/FIZrXh8n6RtZJxO4+bS3z+VVaglkDTWW3mTmyHIK6wI6sftIqM/
	RaByO7QdxbIvfZU1zBUCVR/02QF8NrCEm/vd0fT0XTzMVa0RlkxOtCGRzxgWeZW9Yu+aKRodrWkHh
	/odqhT/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6UTR-007v2v-Nh; Sat, 17 Dec 2022 10:31:21 +0000
Received: from dvalin.narfation.org ([213.160.73.56])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6UTN-007uzj-WF
	for ath11k@lists.infradead.org; Sat, 17 Dec 2022 10:31:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1671273072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gKdHycSIi9zPE3QonPka/2HJIciwfemgBm9czkL2KSo=;
	b=fWTbriYJ8JxhDxA29327WRrxqdDCKuf0jvuCVXG5xR+vgr/44+eHAiuRqXWEldoJfXZLDt
	6j3mxFp+zw7NSe5mVcqoLdBuME+H890j1NbVBcCRV8TZI361/ElmSaeQYEnNO9pmH2z/aX
	q+2agqIkHBG3tXKn+a9G0CjLumNTr+g=
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org
Subject: Re: Wallys DR9074-6E(PN02.7) QCN9074 refuses to work on 6GHz band
Date: Sat, 17 Dec 2022 11:31:03 +0100
Message-ID: <3206623.aeNJFYEL58@sven-l14>
In-Reply-To: <CAJrE-q6NVEF4sNW1s4Zz7Pb2ryzCi69e+_vLQswBWm747DHYDw@mail.gmail.com>
References: <CAJrE-q6NVEF4sNW1s4Zz7Pb2ryzCi69e+_vLQswBWm747DHYDw@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221217_023118_540978_08D24E7D 
X-CRM114-Status: GOOD (  13.68  )
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
Content-Type: multipart/mixed; boundary="===============1968656276813262911=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

--===============1968656276813262911==
Content-Type: multipart/signed; boundary="nextPart3212768.44csPzL39Z"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3212768.44csPzL39Z
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org
Date: Sat, 17 Dec 2022 11:31:03 +0100
Message-ID: <3206623.aeNJFYEL58@sven-l14>
MIME-Version: 1.0

On Saturday, 5 November 2022 12:23:02 CET Mariusz wrote:
> My issue is that I cannot get it working on 6GHz bands but it works
> fine on 5GHz. I bought 6E version  and since this is a single band
> module it cannot be both 5G & 6G and linux driver does not agree with
> it being 6E version:
> 
> [71914.038562] ath11k_pci 0000:03:00.0: BAR 0: assigned [mem
> 0xdf800000-0xdf9fffff 64bit]
> [71914.038840] ath11k_pci 0000:03:00.0: MSI vectors: 16
> [71914.038852] ath11k_pci 0000:03:00.0: qcn9074 hw1.0
> [71914.194459] mhi mhi0: Requested to power ON
> [71914.194712] mhi mhi0: Power on setup success
> [71914.297749] mhi mhi0: Wait for device to enter SBL or Mission mode
> [71914.647118] ath11k_pci 0000:03:00.0: chip_id 0x0 chip_family 0x0
> board_id 0xff soc_id 0xffffffff
> [71914.647134] ath11k_pci 0000:03:00.0: fw_version 0x250a04b8
> fw_build_timestamp 2021-12-20 06:41 fw_build_id
> [71916.310787] ath11k_pci 0000:03:00.0 wlp3s0: renamed from wlan0

Just to have this documented publicly: I was in contact with the Wallys 
support and used this opportunity to point out this problem. I've provided 
references to interesting QCA documents and they were able to fix the problem 
on their end (via QDART).

The current status is:

* there will be most likely no tool by them to allow the customer to fix this 
  problem ("missing boards_id which is shown as 0xff") directly
* they will replace these cards. But they have to be send back to the 
  reseller. My understanding is, that the reseller must then also send back
  his stock to get properly configured cards which can then be given to the 
  customers as replacements. But I am not involved in this process and can
  therefore only guess the interactions between reseller and Wallys.

So it is basically the same process as with 8devices. And Mariusz is for 
example already in contact with an EU based reseller.

Kind regards,
	Sven
--nextPart3212768.44csPzL39Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmOdmmgACgkQXYcKB8Em
e0bQ5hAAlvU2cu/8uRmphEa+5enNXjEbu385h9+nhDRCK7lvtSW4nW0C/yqTnbeK
scv/x+6dZbEP+ytq7uU5wpuwyaEMv94afevGFn/yE4+fikOOpclxWYhonJVPQIvZ
xcVCaVZs8YfOlt1Cgu+5hQEX9Wvtu5n1WdSHfkxu9GtMce5sT+8MKCzUxbP9MT8K
CrJeVzq7vD9tidxCoAwP0VQBXipSR1inIv2rZew+sjzePnD7CotB8q6shRT5YObi
Ju+IqzZ4Ge0THT5QcpeTlXoO+VL5OpKSRDB552ID17brCTFvQU1EFtjAtJcllpL8
VFO/tghyPAB6E9pGTCMxjyck0HRLdzpTzFlniWUWpoJRTMHeMQHnG7vkpaF5le3m
rvmTD1pVdwMPSokj38KVtRaXWAKQD4E483eDsyDD3Rs9npZeQTFQZU+A0vOrFc8X
u4kg8vqRs2JHc7pqgNSHnGDT+n5mngFzgnLWGXTTQ3SSYEfEpKoWyQG0trihr8RP
SwbzRwrneXoMJNepLQP+B0f6JOR6QzN/HRhf+6ggdciNIhjK/hLcLr3PI02pkKvV
3aV8wqkZrrSY4J9f8DykWgtvM8lSgD2nLiC2vhg808ywm1Z243nIue7/7mjbBtKa
o8kI7xf47zGgWt7E/EvblUw+/NI1zh9j4UPmGG0hNsJvy46QVQc=
=N9ZS
-----END PGP SIGNATURE-----

--nextPart3212768.44csPzL39Z--





--===============1968656276813262911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============1968656276813262911==--




