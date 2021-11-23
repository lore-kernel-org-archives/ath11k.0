Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBD8C433F5
	for <ath11k@archiver.kernel.org>; Wed, 24 Nov 2021 07:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5/3FZBsp1PeEa8kMPB+IsM8FsAL1Tt6fZt1UEVDuODs=; b=PAv7Xj7HDFk5m3ydpV2/ep/yF+
	BLxlEUTLXb0ec0NC/UAhToIKfS9EY6jUomK7hbxS/+S2koGxyzUIMJhCm1d6WdtxnQ/nklfZuOepG
	FTKXzF2N0kMbu+FSBNTTP4gl21Ujggn1GxB4WwOvX66mBYueMz1d2wAojRG/0hRugw6utGWwMD2EK
	zGG+9f+LKVZP4meQ129KIdS1yt/C+fTztJMyj/i99d6vgT0QpTgVqH0Fv6u7huo3UeoPlYAem8pdR
	PExKDP6p//s6/tE0BrrWz78vI1l63FhRpGFUkVHq7VHI5UOgrRdgodkyJ5PvsmuviMR8tQZpdoX82
	EswIHN2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpmnY-0045Uh-9L; Wed, 24 Nov 2021 07:34:32 +0000
Received: from dvalin.narfation.org ([213.160.73.56])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpVQh-002FL2-Ip
 for ath11k@lists.infradead.org; Tue, 23 Nov 2021 13:01:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1637672502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3bXSoijhcsdVseGfeNV9VthAVOTN6+8WFm2JTxPImEc=;
 b=t1qGzy6dQIGokgeXiy83J6z7zvdnHyXgIoP0i7C4RuTPoZcxErUDBOo2UDhMhgjdf5YvUP
 /eOiAILGUpk1GW03KVRklb2BJXKsiOMOR8ODS1jcoWu0mhihlHETsqMjbIA5K8mAopGEAu
 lEZ12cwDpXQuWp9vXXKzOS5YKEJ3n/s=
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 Anilkumar Kolli <akolli@codeaurora.org>
Subject: Re: [PATCH v5 2/2] ath11k: Use reserved host DDR addresses from DT
 for PCI devices
Date: Tue, 23 Nov 2021 14:01:34 +0100
Message-ID: <74442923.uYUSDj6SXF@ripper>
In-Reply-To: <1637666940-30548-2-git-send-email-akolli@codeaurora.org>
References: <1637666940-30548-1-git-send-email-akolli@codeaurora.org>
 <1637666940-30548-2-git-send-email-akolli@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_050147_913691_E8D66D69 
X-CRM114-Status: UNSURE (   9.03  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Tue, 23 Nov 2021 23:34:31 -0800
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
Content-Type: multipart/mixed; boundary="===============7863824016012359069=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

--===============7863824016012359069==
Content-Type: multipart/signed; boundary="nextPart8316323.Rvb1ZgBP0e"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart8316323.Rvb1ZgBP0e
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Anilkumar Kolli <akolli@codeaurora.org>
Subject: Re: [PATCH v5 2/2] ath11k: Use reserved host DDR addresses from DT for PCI devices
Date: Tue, 23 Nov 2021 14:01:34 +0100
Message-ID: <74442923.uYUSDj6SXF@ripper>
In-Reply-To: <1637666940-30548-2-git-send-email-akolli@codeaurora.org>
References: <1637666940-30548-1-git-send-email-akolli@codeaurora.org> <1637666940-30548-2-git-send-email-akolli@codeaurora.org>

On Tuesday, 23 November 2021 12:29:00 CET Anilkumar Kolli wrote:
> +                       ret = of_property_read_u32(dev->of_node, "memory-region",
> +                                                  &hremote_phandle);
> +                       if (ret) {
> +                               ath11k_dbg(ab, ATH11K_DBG_QMI,
> +                                          "qmi fail to get hremote phandle\n");
> +                               return ret;
> +                       }
> +
> +                       hremote_node = of_find_node_by_phandle(hremote_phandle);
> +                       if (!hremote_node) {
> +                               ath11k_dbg(ab, ATH11K_DBG_QMI,
> +                                          "qmi fail to get hremote_node\n");
> +                               return ret;
> +                       }

Afaik, this can be combined via

    hremote_node = of_parse_phandle(dev->of_node, "memory-region", 0);

Kind regards,
	Sven
--nextPart8316323.Rvb1ZgBP0e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmGc5i4ACgkQXYcKB8Em
e0ZyPQ/8CbZDas4jD05U2eurivg669Wkd8ldicZqVa9YAcUJWEYYE2zMgWFuVnfJ
4z3fPpQd1Mtp8KRrayLCfOi5HOpK8uOGH+JLodjwX0aBewI8EZiHL/8onrpuqtNe
tKEiWZG5WTA0ltntf6SqeV5TF2L5R+ySknNPk4LKYsP6/E7iZ4EM2TM6FTxzbc+h
z2xeFWViRbGTw23qJBb0DKtagzQVScoGvEktpDy79HdAEntUbDlQSerS8kiXd7Ll
yh+dgg+piQ9VS3E+KZ6NhR/2CnWYFI0xBFggxGIX5/VVJxD8GK+zlkkYTbtXUGPE
vu1NoJtQNqfJsdzvVVxWMY5t6VFa8uBreo3C7PSUK+gR9Cg7vL1A13BYn8npdloH
V4DcB/USCX8yyhozQMwfEojvCRfG5uvAM0untitGwYqNRAMrHsQgL57rJ/gdemhX
SROOFG2wZI4VW5DQru/BRf5HEj2fTRNAqnctJX6mYZVjg9Kt5vdMij1AXQrvUl8A
qrGuu634XlfqCHBld3CxTu08lxaK6tOlD34vRAZL3cC1MT7FMYY5zOd/9tcvpph8
GgEk5fxrr6wXpw+S722w2Y4KCw+3tMAzl1mpKJ/V7+y/SdqZBBCPE720e9zf4w+L
TYTN7y18wTfMVqF1n/WvhBc2ZYeBpxRnt7If7EIssZiB0RGJiPU=
=LV2O
-----END PGP SIGNATURE-----

--nextPart8316323.Rvb1ZgBP0e--





--===============7863824016012359069==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============7863824016012359069==--




