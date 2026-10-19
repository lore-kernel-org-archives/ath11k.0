Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6E5CCF2D6
	for <ath11k@archiver.kernel.org>; Mon, 19 Oct 2026 07:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fFviAY7RiS+Pu91f0DrvvXmCcQam18iVZl23zB2xTik=; b=rX+6h/khU8vfFsJVfccmljM/y9
	T2fKxKnj41eapJ+0JijTkeFO3ipfruxYrowPpMO+Nkr/Qbu6IZwvDU6aNvFHv3VKUkBfXfJhOwlxm
	SldrZcHBZJgbD+L7bClw0WREadxsyU8Lq3I3HK5lzGKiyDvbNHf+CxcunU9lCdE8CJH/wK0rmuBrI
	y4pL4uYMC6t/dbB04po6InHnuMZanqUoCqVelS1e4kntAaHbpymGo3W6KT5/DRYKEQ9Jwjg1AujUo
	gn8Ax8RqHZHZ8fbzf62th0EY4FhltmgErZcBQe6wHgkCzMnUReeoMTJCPqlZN3ja5bxqt6NSePxt5
	ykyZOTkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIhc8-00000006kqb-0px7;
	Mon, 19 Oct 2026 07:16:56 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIhc6-00000006kqF-0PC7
	for ath11k@lists.infradead.org;
	Mon, 19 Oct 2026 07:16:55 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso15093295e9.3
        for <ath11k@lists.infradead.org>; Mon, 19 Oct 2026 00:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792394212; x=1792999012; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fFviAY7RiS+Pu91f0DrvvXmCcQam18iVZl23zB2xTik=;
        b=dNto115/tSVqisKJkFKekG0PAY4rR0H+6nY9bZP8u2enLNS1mv3upDwaV5CfjgsY0n
         y7Tbam+Sg4l9bR4sZSt4UKUEZjKw1dZkDrAN9tCsbkaXZQM+nwnluHMJm62mIBBdo/T4
         1Ir2FGP4yRwGmCdsMqx+ZF1sOgo7afAibZH66HVuidKIbpBuEjRbhqFQhxB6DgVgJQ24
         KiVnS7GlHWuNPl2d8CpzmtdynAwSEcKjp/LNWuvdE53UlkTLl589OrgDV89s4deAZ8KS
         AhydkDRXmvMmTn58iXhMGl/zBIi65rsq3qvqRknKr1zqqUwqxXrtDgqGbEo33TD5PLyS
         PDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792394212; x=1792999012;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fFviAY7RiS+Pu91f0DrvvXmCcQam18iVZl23zB2xTik=;
        b=iLWdutgSk1DlKFD/rjFG13SuN5VnT+I886VDyAkFsqeehu8WFdYULh87BZoCbty8D1
         KMun1Y6IoyVt7QoHv9AloPcwT5w/l6q/lORcoM55X0u7GTa1FoL/JCWmYzlKJBaVtnZi
         Tnelw5++GIWn2gEAZMRAE5WByRvevEM3mabPdpa/lDFzO3TizsatsJe/0qP7hzMSUnIS
         icab/s8ePzwxW6R5bQQOZYYOEDderb+5ekEp8ChMs0iUNRJUIy0/pWfOwOySH9yChqWW
         tI5tpbeEtxIqECT7LxEvxlx/k+dfFeppSYr9HyZBwVybgRrD3+6LbpJkHiCNDLa9gIW2
         oW2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzV4CxJjl38s4n57sohwxIvYXSYbV4KTbOaZsDb9hpzaw06huTQ94yTI+WZ6lhNLePYQFBUQlQ=@lists.infradead.org
X-Gm-Message-State: AFq9FYKALSwRlTegbbo1+zlOkqUYaQniDaxZJjUuNXQlHUKGNVP5Uyt2
	Vcv3EAjwZ4P3FFY5YeQmuAqAskhrOxkY2BtnGBGdca1KUNTuY56k0OHb
X-Gm-Gg: AYBFou1iBZXoUWA/+Z5ugnqNbsI8ybksLuzwrw8qFp2uktYPvYa4zLj/9BZljFLujxs
	DT+VcOAbznXzRvIFqIu4M+bAwhIaKvpixH3TTgyEmVmhVRZuFxGLGtRMAAX2eHnOpqHJHVm0xYF
	VBGijw5VPU6bY1p5PqEaQoqXphpiWxzEEA9qhaAy76e4juWs0wZslSDyCPUCEVRNyeS8Li+JxWC
	Qui+Rb21c58rwAh9ZWI2ED6Ibn4pQ6x/gIO7WoW2UYNf7HRVsXQP5KmeVQ3npx/Py3BlOjKW5pm
	Zy/Hig2TCQNlxK5xMt6vxAhtTZHhivEOHCe90g+8uE4bfMEndqbTxTawunUP/BM7mTyygtMhwky
	MV0ixe0t+YxgVrCpKL6At4uVlifSI6Y2WNI2NKc7npC8BNGqjKoyB/f4/aw4901sW09ovFURjQA
	E/lFA0+opaHZDfZVFWNgPEpDGeHy+T+ShL47XcLCRPSHt8bZVwEzBoS11l3naMoGLcCpcRo2PxZ
	SJwHh1lEbxDjCoE7dMq1rtiPouqrg1yjBOboECDj+h6f9AicaRaUdE6XY5mBlFSePk2nJKd5VzE
	NggjXgnmkZp2ALJ3
X-Received: by 2002:a05:600c:3b13:b0:4a0:2150:55fb with SMTP id 5b1f17b1804b1-4a1d75ad08amr171537945e9.4.1792394211456;
        Mon, 19 Oct 2026 00:16:51 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cf05009csm224628845e9.10.2026.10.19.00.16.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 00:16:50 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 09:16:50 +0200
Message-Id: <DM8MPWZ7TFEE.11W2Q780HK4FT@gmail.com>
Cc: <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>
Subject: Re: [PATCH ath-next] wifi: ath11k: report TX retries in station
 statistics
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Julius Bairaktaris" <julius@bairaktaris.de>, <jjohnson@kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261018171803.1545946-1-julius@bairaktaris.de>
In-Reply-To: <20261018171803.1545946-1-julius@bairaktaris.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_001654_153932_8E99013C 
X-CRM114-Status: GOOD (  10.28  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Sun Oct 18, 2026 at 7:18 PM CEST, Julius Bairaktaris wrote:
> ath11k does not fill NL80211_STA_INFO_TX_RETRIES, and mac80211's TX
> status accounting leaves it at zero because the driver reports no
> per-rate try counts. The HTT PPDU statistics carry the MPDUs tried and
> acknowledged per user. Report the unacknowledged MPDUs per station as TX
> retries and leave TX failures to mac80211. Over 6 runs of 30 s the
> station's TX retries track the firmware's pdev mpdu_requeued counter to
> within 57 MPDUs.
>
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> ---
>  drivers/net/wireless/ath/ath11k/core.h  | 1 +
>  drivers/net/wireless/ath/ath11k/dp_rx.c | 5 +++++
>  drivers/net/wireless/ath/ath11k/mac.c   | 3 +++
>  3 files changed, 9 insertions(+)
There seems to be a way to retrieve this info directly per tx completion:=
=20

https://git.codelinaro.org/clo/qsdk/oss/system/feeds/wlan-open/-/raw/win.wl=
an_host_opensource.4.0.r39/patches/ath11k/0149-ath11k-fix-tx-bitrate-retry-=
signal-in-station-dump.patch
and the try_cnt comes from
https://git.codelinaro.org/clo/qsdk/oss/system/feeds/wlan-open/-/raw/win.wl=
an_host_opensource.4.0.r39/patches/ath11k/0117-001-ath11k-optimize-tx-compl=
etions.patch

