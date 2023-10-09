Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED71E95A8E
	for <ath11k@archiver.kernel.org>; Mon,  9 Oct 2023 09:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e8PwuUMvhfjoX73gYYL4Uq7EY85YRjsq3bKpCsRag80=; b=hMcIx22pZwvwrC3NoZXImevgs6
	cuv4XMiFwDE5BobYrbO3vloVBt47eGJnWBKjK7uYCyf3dlFqcgS2k48PSfIyhZNc9TV3SwpYQClq/
	gMTBUEkI7qrgk6OboFuFKjQibnofkXPo/HUP5IVD6Om22sQZFh76daE7D9W2eMlc2Qn9IEmMuQ9WP
	KEQbBT5QAQ1/5O73d+bZAxIESAVTGT++cAl25k2yMwDmBRdDROK9QFGZTTP2+HVLyT9jTkTU8d+q6
	bS0Zn7Jxdccj8gh3ihWktDsFYbmnaPEz6IfoEk2t1IfDSwV7yxry9YavXuJlWN15d19RHVYPMfZB+
	SZ7iIDMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpmEY-00A3Xh-0e;
	Mon, 09 Oct 2023 09:07:26 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpmEV-00A3Wd-0L
	for ath11k@lists.infradead.org;
	Mon, 09 Oct 2023 09:07:24 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-692c70bc440so3187049b3a.3
        for <ath11k@lists.infradead.org>; Mon, 09 Oct 2023 02:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696842442; x=1697447242; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=111oRTH/EVzkglzmw1nqEAQZvZ9xBM6fPYQXVycY0n4=;
        b=T0RXzaKXnFpvo8dLpC6MES+90cZd4LvFj2UUb/ONER1C+XAnWdnrFGmFw5KU2KkrNi
         3HJh7fOmeLZHV1mhdu/Eb8SvTo3wQkmKrPKpPhfOaapjWLWqGEihrjU3aeAwN2C7tjgq
         +J2FCGhChDIzrctbrcuwyGaNI6hxdG36Cab3H/fXVrOcrHCJccQksGB9PfgGby1I4EMY
         lAwL1NJZtsBoWHXFunyTjednutTvSp4/Pxz8dP/ySNdl3YpCBWgtvETNfeZ7Jo/jCHNT
         RyhOOrBmpnWnfpfGNyS3DGjYp9XVWHAnEDDfGdoiheiHxb4jFMdYIobz0zDpYYCyi4lh
         B4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696842442; x=1697447242;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=111oRTH/EVzkglzmw1nqEAQZvZ9xBM6fPYQXVycY0n4=;
        b=qIL1ezI3LoaD0M+ojoqJsE79Jiquc/b+r6JALvka20Om5tUlOwyjJhllRT7CUNrQqY
         WkPr+hGkIFLnr3Q20o+UadGtyee81ket/hzuyZ6LqVAoyavGva+xmqitYMME1dqO3hOg
         qs+qolmy2X/I11kmXNOELLP49XHYxPYus5Ll4yc0VHnHKEbx2eEqp2w4lLjVxu3VBZFV
         zSscFiTwSEFYGC3OnLKH+CDYHn6AMT0psFTIC5D+5ZccTyqBvefb7/avxOkj29U7vLR4
         NAY2FTG3MBsyVvFSEv5ozWuLBr3dyHDZuo3czupTPBy84JWLjgyO7R+VC9T6O3pDf8H9
         5jtg==
X-Gm-Message-State: AOJu0Yx0GKnmiXWt2vWFmlHDqACULqWRI7y9qTb05i4HWYLdjRPgyEwG
	p6OmNG9EDjvtLG37FdIY0SE=
X-Google-Smtp-Source: AGHT+IECOCEYQcmOLzUiUCj0z+HePP50mNpRUPKN7ODesFDs2Jr3xfQ0/Zgjuq0cdKp9GYZDpQKT8w==
X-Received: by 2002:a05:6a00:cc4:b0:68f:d6db:5d66 with SMTP id b4-20020a056a000cc400b0068fd6db5d66mr15264066pfv.16.1696842442123;
        Mon, 09 Oct 2023 02:07:22 -0700 (PDT)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id p25-20020a62ab19000000b006936d053677sm5840143pff.133.2023.10.09.02.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 02:07:21 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 1BC888CB5482; Mon,  9 Oct 2023 16:07:18 +0700 (WIB)
Date: Mon, 9 Oct 2023 16:07:18 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Kalle Valo <kvalo@kernel.org>,
	Linux Wireless <linux-wireless@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>,
	Linux Broadcom Wireless Development <brcm80211-dev-list.pdl@broadcom.com>,
	SHA-cyfmac-dev-list@infineon.com,
	Linux ath11k <ath11k@lists.infradead.org>
Cc: Stanislav Yakovlev <stas.yakovlev@gmail.com>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Arend van Spriel <aspriel@gmail.com>,
	Franky Lin <franky.lin@broadcom.com>,
	Hante Meuleman <hante.meuleman@broadcom.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	Richard Cochran <richardcochran@gmail.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	Avraham Stern <avraham.stern@intel.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	Mordechay Goodstein <mordechay.goodstein@intel.com>,
	Minsuk Kang <linuxlovemin@yonsei.ac.kr>,
	Ruan Jinjie <ruanjinjie@huawei.com>
Subject: Re: [RFH] wireless-next: fix new W=1 warnings
Message-ID: <ZSPCxkBvFhP17Vhi@debian.me>
References: <87fs2k5l1a.fsf@kernel.org>
MIME-Version: 1.0
In-Reply-To: <87fs2k5l1a.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_020723_162563_BAFCADEE 
X-CRM114-Status: GOOD (  18.80  )
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
Content-Type: multipart/mixed; boundary="===============8066005388084183627=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org


--===============8066005388084183627==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1p7opZ+xi4xHbBQU"
Content-Disposition: inline


--1p7opZ+xi4xHbBQU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 09, 2023 at 10:09:53AM +0300, Kalle Valo wrote:
> Hi,
>=20
> During the weekend we updated wireless-next tree from v6.5 to v6.6-rc4+.
> It looks like a new warning was enabled for v6.6 as I see with GCC 13.2
> and W=3D1 several warnings (list below). In v6.5 wireless code was still
> W=3D1 warning free with GCC.

Can you pin-point the exact commit that introduces the warnings?

>=20
> For wireless we get lots of questionable cleanup patches. But actually
> these kind of warnings are what we would prefer to be fixed instead of
> the random churn we always see. Hence I'm sending this Request For Help
> (RFH) in case the cleanup people would fix these. Is there a mailing
> list I should send this to?

[also Cc: maintainers and lists for files below]

>=20
> The sooner these are fixed the better, it makes it difficult for us to
> see any new warnings from this noise.
>=20
> Kalle
>=20
> drivers/net/wireless/intel/ipw2x00/ipw2100.c:5905:63: warning: '%s' direc=
tive output may be truncated writing up to 63 bytes into a region of size 3=
2 [-Wformat-truncation=3D]
> drivers/net/wireless/intel/ipw2x00/ipw2100.c:5905:9: note: 'snprintf' out=
put between 4 and 140 bytes into a destination of size 32
> drivers/net/wireless/intel/ipw2x00/ipw2200.c:10392:63: warning: '%s' dire=
ctive output may be truncated writing up to 63 bytes into a region of size =
32 [-Wformat-truncation=3D]
> drivers/net/wireless/intel/ipw2x00/ipw2200.c:10392:9: note: 'snprintf' ou=
tput between 4 and 98 bytes into a destination of size 32
> drivers/net/wireless/intel/iwlwifi/dvm/main.c:1467:19: warning: '%s' dire=
ctive output may be truncated writing up to 63 bytes into a region of size =
32 [-Wformat-truncation=3D]
> drivers/net/wireless/intel/iwlwifi/dvm/main.c:1465:9: note: 'snprintf' ou=
tput between 1 and 64 bytes into a destination of size 32
> drivers/net/wireless/intel/iwlwifi/mvm/ops.c:1307:19: warning: '%s' direc=
tive output may be truncated writing up to 63 bytes into a region of size 3=
2 [-Wformat-truncation=3D]
> drivers/net/wireless/intel/iwlwifi/mvm/ops.c:1305:9: note: 'snprintf' out=
put between 1 and 64 bytes into a destination of size 32
> drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:262:52: warni=
ng: '%d' directive output may be truncated writing between 1 and 5 bytes in=
to a region of size 4 [-Wformat-truncation=3D]
> drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:262:46: note:=
 directive argument in the range [0, 65535]
> drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:262:46: note:=
 directive argument in the range [0, 65535]
> drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:262:9: note: =
'snprintf' output between 9 and 17 bytes into a destination of size 9
> drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:265:55: warni=
ng: '%d' directive output may be truncated writing between 1 and 5 bytes in=
to a region of size 4 [-Wformat-truncation=3D]
> drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:265:48: note:=
 directive argument in the range [0, 65535]
> drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:265:48: note:=
 directive argument in the range [0, 65535]
> drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:265:9: note: =
'snprintf' output between 10 and 18 bytes into a destination of size 10
> drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:342:50: warni=
ng: '/' directive output may be truncated writing 1 byte into a region of s=
ize between 0 and 4 [-Wformat-truncation=3D]
> drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:342:42: note:=
 directive argument in the range [0, 65535]
> drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:342:9: note: =
'snprintf' output between 10 and 18 bytes into a destination of size 10
> drivers/net/wireless/intel/iwlwifi/iwl-drv.c:549:33: warning: '%s' direct=
ive output may be truncated writing up to 63 bytes into a region of size be=
tween 48 and 56 [-Wformat-truncation=3D]
> drivers/net/wireless/intel/iwlwifi/iwl-drv.c:547:9: note: 'snprintf' outp=
ut 9 or more bytes (assuming 80) into a destination of size 64
> drivers/net/wireless/intel/iwlwifi/iwl-drv.c:729:33: warning: '%s' direct=
ive output may be truncated writing up to 63 bytes into a region of size be=
tween 48 and 56 [-Wformat-truncation=3D]
> drivers/net/wireless/intel/iwlwifi/iwl-drv.c:727:9: note: 'snprintf' outp=
ut 9 or more bytes (assuming 80) into a destination of size 64
> drivers/net/wireless/intel/iwlwifi/iwl-drv.c:989:51: warning: '%s' direct=
ive output may be truncated writing up to 63 bytes into a region of size be=
tween 46 and 58 [-Wformat-truncation=3D]
> drivers/net/wireless/intel/iwlwifi/iwl-drv.c:987:33: note: 'snprintf' out=
put between 7 and 82 bytes into a destination of size 64
> drivers/net/wireless/intel/iwlwifi/iwl-drv.c:984:53: warning: '%s' direct=
ive output may be truncated writing up to 63 bytes into a region of size be=
tween 40 and 50 [-Wformat-truncation=3D]
> drivers/net/wireless/intel/iwlwifi/iwl-drv.c:982:33: note: 'snprintf' out=
put between 15 and 88 bytes into a destination of size 64
> drivers/net/wireless/ath/ath11k/debugfs.c:1597:51: warning: '%d' directiv=
e output may be truncated writing between 1 and 3 bytes into a region of si=
ze 2 [-Wformat-truncation=3D]
> drivers/net/wireless/ath/ath11k/debugfs.c:1597:48: note: directive argume=
nt in the range [0, 255]
> drivers/net/wireless/ath/ath11k/debugfs.c:1597:9: note: 'snprintf' output=
 between 5 and 7 bytes into a destination of size 5
> drivers/net/wireless/ath/ath9k/hif_usb.c:1223:42: warning: '.0.fw' direct=
ive output may be truncated writing 5 bytes into a region of size between 4=
 and 11 [-Wformat-truncation=3D]
> drivers/net/wireless/ath/ath9k/hif_usb.c:1222:17: note: 'snprintf' output=
 between 27 and 34 bytes into a destination of size 32

There is only one commit touching above files in current cycle, that is b2f=
d72aafb1311 ("wifi: ath9k: Remove unnecessary ternary operators").

That's what I know.

--=20
An old man doll... just what I always wanted! - Clara

--1p7opZ+xi4xHbBQU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZSPCwgAKCRD2uYlJVVFO
o8ymAP9LMTtr8chruIr3qE2uP9kaN+rd6CgxbH302q7bheYt4AEA9zEHmUbTdBFW
CobVmnhLh1HJoVKvdsCEaezhwRnETQM=
=IWi4
-----END PGP SIGNATURE-----

--1p7opZ+xi4xHbBQU--


--===============8066005388084183627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============8066005388084183627==--

