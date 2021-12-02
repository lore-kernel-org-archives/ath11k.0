Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBC2C433F5
	for <ath11k@archiver.kernel.org>; Fri,  3 Dec 2021 09:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OUIuC/IGvgqzEdNlOZewghICOczWFDaSkmgmz9MsSZ0=; b=F4kTm/vReFvvcTvD1IlInCKfiA
	igVht7aDuK513/9siHQPnNUJusa/GE7gbgqYDwQBDyKUJcNvOFNU/QcZ5JScGCrO76rKhZ3309s+l
	RWQ2nIQaquoFzrFhXdSkT6d6oYsujCBSLcx6pi43CPlPNe/j9lg+UBBK7TbUiPd0C52trVoKtv05m
	br0U9lSjSt/yD040E4+HuiNoDOgsoUi7fdxrGz5u6AKgDSvozbstPTx9IUwX8WDmw7XulC+x9Jpzh
	uTwWlbarXo0aPTPbFaKgVToITja/DCgZfqiwouyyzRoQCvZIlwRW8O5LgIMAR5RgzIGmjHmqNdU6v
	nQ5Z2mlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt5H5-00F3Ka-AN; Fri, 03 Dec 2021 09:54:39 +0000
Received: from dvalin.narfation.org ([213.160.73.56])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msqwm-00DHjq-NE
 for ath11k@lists.infradead.org; Thu, 02 Dec 2021 18:36:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1638470201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DsfXl6MBF6KX+nZQodF+Dv4umxwnNv+y0c9FeuMN/eQ=;
 b=o/vMj0ZVANRSiKaeHHlHrDlNDQm+J4Mxow5SuyTjG2dKQqNj0Y+cj8Up0wruZqRm+LRV4t
 AkH8Aupus9Q4nbrln0f+2QYXYBmuEmr2ht0lNvTH8aPJMyppV8MXO6t52xDQISJfXY8gMF
 sBgnYoDZKavTtcoIBDKA6zj+hwNcp6o=
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org, Wen Gong <quic_wgong@quicinc.com>
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH] ath11k: add regdb.bin download for regdb offload
Date: Thu, 02 Dec 2021 19:36:35 +0100
Message-ID: <2715590.fzSe1J7v7S@sven-l14>
In-Reply-To: <20211202083616.15406-1-quic_wgong@quicinc.com>
References: <20211202083616.15406-1-quic_wgong@quicinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_103644_968411_0D0E89C5 
X-CRM114-Status: GOOD (  12.75  )
X-Mailman-Approved-At: Fri, 03 Dec 2021 01:54:38 -0800
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
Content-Type: multipart/mixed; boundary="===============5457623424593642494=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

--===============5457623424593642494==
Content-Type: multipart/signed; boundary="nextPart3557057.OuUsEEyBDt"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3557057.OuUsEEyBDt
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org, Wen Gong <quic_wgong@quicinc.com>
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH] ath11k: add regdb.bin download for regdb offload
Date: Thu, 02 Dec 2021 19:36:35 +0100
Message-ID: <2715590.fzSe1J7v7S@sven-l14>
In-Reply-To: <20211202083616.15406-1-quic_wgong@quicinc.com>
References: <20211202083616.15406-1-quic_wgong@quicinc.com>

On Thursday, 2 December 2021 09:36:16 CET Wen Gong wrote:
> The regdomain is self-managed type for ath11k, the regdomain info is
> reported from firmware, it is not from wireless regdb. Firmware fetch
> the regdomain info from board data file before. Currently most of the
> regdomain info has moved to another file regdb.bin from board data
> file for some chips such as QCA6390 and WCN6855, so the regdomain info
> left in board data file is not enough to support the feature which need
> more reg rules such as 6 GHz LPI, SP and VLP.

But for the latter, you are also missing the patch to support the 
WMI_REG_CHAN_LIST_CC_EXT_EVENTID (with the 6GHz specific fields in the struct 
wmi_reg_chan_list_cc_ext_event)? Otherwise it should not be possible to
get the 6GHz reg rules (which you showed in your commit message).

struct wmi_reg_chan_list_cc_event (for WMI_REG_CHAN_LIST_CC_EVENTID) supports 
only 2.4GHz and 5GHz.

Kind regards,
	Sven

[1] https://source.codeaurora.org/quic/qsdk/oss/system/feeds/wlan-open/tree/mac80211/patches/302-ath11k-Add-support-to-parse-new-wmi-event-for-6G-reg.patch?h=NHSS.QSDK.11.4.0.5
--nextPart3557057.OuUsEEyBDt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmGpEjMACgkQXYcKB8Em
e0ZwAxAAiQgfVTeTTa4jXtUlnpfrWl3imAtXNa514tyOYbr/whXDehewzLd3ykQE
EomUEHQGfiYSDSkmaKdyJsRxyTzKOC5IbymWlrojv61V8AAi00bADbhsh2OR/HeD
VHU40hBBcQTHpm3Ps5GTU4RAS+FTIoSmCUlJxG5o7NeQtndLkH/ghW+8MwLtfrL5
2mIYfMRZ9+sfqCwcCd7vlFys/M8pnJmqnzpYXtVWQAJ1K9vQPdGz3eDAa37W8VmU
m0URf+Ek8qO9PNiqOC0xzftgpm7qhkkAmUJBO5UcuObj1DERbL52+9ozYN5MQtLk
NYMDEhWQLRhZ6CXcfOSqxQFZFH8WwJ1jV2FE1iop6ZBZo+isOALQnUHNMMvtovve
VZwHOMpJitQtTJyv12hkjrwi7VHOcq2OloMBDybWAeMAAJxbsYPPaw5cD5syOn7f
ygGYuce5TyP+9pOML5+AkS5zzpWW5iMG+1t8DFxKTjSxy5ocKot9ArxkRi8O+yKY
HoTdMg7ItmlaB6TFZXDQLjmwycCiRBftFbdW4Ni4UYUR8Pvyt+LbQK5SCpSDTOoy
MEOvxAWniT4mnwQUtzzQwxWIIrCBZs4jW62HCtaKurmcYLPmZdK3eOiZt72NWGa4
barn7ECpFaA5yFZMWB0aTO2Pwjo4ddmXHupfY3OemltZ3v8pdlU=
=n60A
-----END PGP SIGNATURE-----

--nextPart3557057.OuUsEEyBDt--





--===============5457623424593642494==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============5457623424593642494==--




