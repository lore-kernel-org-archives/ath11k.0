Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6632606A32C
	for <ath11k@archiver.kernel.org>; Tue, 17 Nov 2026 08:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rAru5R21;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fT3+sKgy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OEz0oomxzwceKTZdD3ONuk5L7dJU/L1SCWIJ/2NpyuA=; b=rAru5R21gCg5SQ
	UsREre2+2TtBm5bC0JarpOnEXwjF4BhU34CkWrwQoUd2RQuw3an+7mATY/iFgeLNs65VablCAUYkq
	QZHTL+WHpu2kHK7/YZyIVp/uG7OqZpBfr0zm95ETlujnoPcnWKl+lujM2tvoy7cwQTPqr4O6P3PUu
	j2qrK+JlW4ofjjrXuSonzeoydI/30nDLz/mU/LiAwReABczya3ZyvyAr16v42SCxW0SCrF+ixGbjt
	4LfAzFpqY8GFULOPMvfkZmkr+ieJ6G8r1GuVBGnuo4RorI0TErM9Px76cKsEvFPRByjHTuaT+fw6w
	lhoMxPXJwE37sUym5hYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEuf-00000004xul-27lV;
	Tue, 17 Nov 2026 08:51:37 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEud-00000004xuL-1dgP
	for ath11k@lists.infradead.org;
	Tue, 17 Nov 2026 08:51:36 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-4a358881793so387653f8f.0
        for <ath11k@lists.infradead.org>; Tue, 17 Nov 2026 00:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794905493; x=1795510293; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OEz0oomxzwceKTZdD3ONuk5L7dJU/L1SCWIJ/2NpyuA=;
        b=fT3+sKgyysqdnTCsYBxMEnFCUv2l+Yx2u4R7z27qefEVKregTOvFgljYk4F0vWVsaO
         NgN8mNJ1WTSIHUNgjEdiXqK+Zu0WcUOxtRYumdIsnUaNQ19JysdRyLXa3jg3VXbnPE6p
         +NO14IWfNkGvcUtixLzH/DUySkai9tu+VjLNBIH67MjhoTywbBTnX8FAxhvWJDPgkQIN
         TVWH7nIuEWYyFQDs8dQMlTKWb4k02rSPWqefcb9FX/qvYua+IgihlSx3QIk6kcxxp6/x
         pQ8kJhfm/DWSzO71TZ3ODKTt+yvZTd4RD1Y+5bPSLl5aelE3g8hlDUNHDe6hwC64RfaZ
         3mKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905493; x=1795510293;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OEz0oomxzwceKTZdD3ONuk5L7dJU/L1SCWIJ/2NpyuA=;
        b=ryuzLjCzyetncCayg8nWmkHoyGHgM9h0Po2Dk6vuUUrE8BFJvw21erYVHhK17/KO5r
         5fnYCF16i4aXbOD7rHgr9oc7F7NwrSL+YREbHq1WeLQiqT+I9sR56WMFlVw6FbHTniVj
         XVGIZY1C5QcCtxm3tdDHCdQQY1jlC5QaD4EsHO23XNeIPLWCu+BuqVLwMT54tW2fU9aP
         pjcwtEOqnsRLJxuoMmxqVVXwSJY+bNiQyBZkPLb+LsWPuzLUCgF4m8IWkXgkT+ImhFA5
         CTxmQYKS4bWAxVSOARqeCLE6mr0ufr4eUnum8Ye+Am7B1NaaQ0/9p4fv+Moo+e/CNyPm
         UJdw==
X-Forwarded-Encrypted: i=1; AL+hErGXXWhvY677i6hxFOt7VNYKe4v1yZieK3c+T/QAxuTfCq5adsErEGtSgw1E73NhHPwzWRKWnSw=@lists.infradead.org
X-Gm-Message-State: APuU4Z8MYLIQQtcBZleimypi+JHqNmdsgLGSHv/QF9Q8rgWNtd+M5OH1
	wwhST4OrOcDex6FAUQpwWHuJUA3trW+TgL4umpoRkilzwW5sBdkH2R9M8TE8Lg==
X-Gm-Gg: AZFdTZcvtzz6K2Kw0enpOfi133WwYvhgGCS7xY4DDWqCcMF8kjUrUT9lTQgtm47LG0z
	fpmfcXVx883mTzomopppaiEHxGwo4iEhXjheNj+SELqCFcdtniswCVhc/ELYynxrLjBiPMyybb1
	aHjp6477X8zINlyNHFu8JHSylMTs+WczXJBJaT6IaTq+n7OIrBo2WYsqkaKbXmetIVbbMxoAcgR
	c7xXvg9q8Y0rPznK6p45DJ3CypNWK/sTneASJ3F7+VR+PaYblZtMOnXSKvAhhQ1JBigyNIp4L0D
	cCRFJbR/PYiuK3s0tgA6RMJXpAhs9ONsva+x47R5vqnWNx0XBM41KkgLGjvkfMhkoa6B6qtFMOp
	ovKjMVhkczAK81TC05ThhTw4TlG2JrmqDddSt9Nlp04iqHSJcbym9vpdEwPx7+oE+LFyB13lUJu
	0Rmkrwt2AtkFU9t7Q6RJnBj8EWZTjtpfktqIMlVX3L+pyGJzaX42fJiY2vC5zHOpOK4SclGbdKS
	ccJWLQlGCs6PkIEN1nmbt0PmCFkjb2UOk8TvBziI7nh2AjqqDxp4t6xS4wJOgZllMQuq9EF7fr0
	FyZiVCMziwJzGBZx3g3oL8b1X2c7gLw5yHgGKdI7OYR5aws1s2oSc7A578NBKaihde4/hdmBKX2
	kobez9R4ChiXsP1fOf0tR/iqhNFLM97x7EBO14f1OShl1Dyw=
X-Received: by 2002:a05:6000:1886:b0:4a4:973c:352a with SMTP id ffacd0b85a97d-4a4973c3697mr1788407f8f.47.1794905493247;
        Tue, 17 Nov 2026 00:51:33 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c888b90d4sm26881579f8f.9.2026.11.17.00.51.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 00:51:32 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Nov 2026 09:51:32 +0100
Message-Id: <DMXCW8192G9S.19BCMYODX8KSK@gmail.com>
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Fernando Tapia" <fernan.tapia@fernandotapia.eu>,
 <ath11k@lists.infradead.org>
Cc: <jjohnson@kernel.org>, <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH ath-next] wifi: ath11k: don't create a duplicate peer on
 the same pdev
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261113120325.2913-1-fernan.tapia@fernandotapia.eu>
In-Reply-To: <20261113120325.2913-1-fernan.tapia@fernandotapia.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_005135_446552_79DED10A 
X-CRM114-Status: GOOD (  19.66  )
X-Spam-Score: -2.1 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri Nov 13, 2026 at 1:03 PM CET, Fernando Tapia wrote:
> ath11k_peer_create() accepts an address that is already a peer on
> another vdev, assuming the station is moving to another band. That holds
> when the old vdev is on another pdev. When both vdevs are on the same
> pdev, for example two AP interfaces on one 2.4 GHz radio, a station that
> moves between the two BSSes is authenticated on the new one while hostapd
> still has it on the old one. The WMI_PEER_CREATE for the second vdev then
> makes the IPQ8074 firmware (WLAN.HK.2.9.0.1-02146) assert:
>
>   wal_peer_control.c:2904 Assertion is_graceful_to_handle failed
>
> followed by "failed to find peer ... after creation" on the host, and on
> AHB the whole SoC reboots. Tuya devices in pairing mode, which try both
> BSSes of a radio within a second, cause a reboot loop.
>
> Refuse the peer with -EBUSY while the address is still a peer on another
> vdev of the same pdev, without sending the command to the firmware. The
> station add fails as it already does after the assert, hostapd rejects
> that authentication, and the client succeeds on a retry once its old
> station is removed.
>
> Tested on a Xiaomi AX3600 (OpenWrt 25.12.5, kernel 6.12.94 with ath11k
> backported from 6.18.26) for 8 days. A smart plug moved between the two
> SSIDs of the 2.4 GHz radio in both directions, the sequence that had
> rebooted the router 8 times before: the new warning appears, the client
> connects on the retry about 4 s later, no firmware assert, no reboot.
>
> Assisted-by: LLM
> Signed-off-by: John Macias <dencity7@gmail.com>
> ---

Guys, I'm all for fixing bugs, but at some point you need to start reading
and searching the mailing list before pointing your LLM to any crashing
target. This is the third time someone posted a fix for this issue:

https://lore.kernel.org/linux-wireless/1316ed692b84f1d956e4854d9e974569a396=
1795.1784792420.git.repk@triplefau.lt/
https://lore.kernel.org/linux-wireless/20261001164139.370144-1-patricktlawl=
er@gmail.com/

