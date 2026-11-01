Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DED3606A325
	for <ath11k@archiver.kernel.org>; Sun,  1 Nov 2026 16:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uWRcssrm;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=u5bKh0Td
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+QmBRgJFhtFLO88pUA9+jvHOb9ztG8eZY/mf5WUdXt4=; b=uWRcssrmoZNSDu
	2pHT31WPVd5yAcZPVurS2fQ5gwk8IYNX1eZE5lQFysBLG7zkJaWcxc4ikjztgzAr/YxKfIVJCx291
	lxV07sQWqLcswUAevGriJLxTJg1HFramqF/VNy8wIZyUCxCMDI2bocyf93drZApXKhq+jGGfzE34Q
	TixCWiFEIrCSlQ68jvDs2OCa9A2xGwufmcuZOq5+x91fkjohtenJV5aRoNBlibcyXJjJnA8zZTCtT
	bQSUUROR/+g9dXNHYnLO5TvaI/CTr30ObKdRkyMcVz0td96DWEfN1zKpo3wfWFwh2BUynzhOXgAOG
	aHvJXGz88tCta2W3oMgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNYiH-0000000EgbG-3gby;
	Sun, 01 Nov 2026 16:47:21 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNYiF-0000000Egax-3qR2
	for ath11k@lists.infradead.org;
	Sun, 01 Nov 2026 16:47:21 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6ae14eecc64so2875387a12.1
        for <ath11k@lists.infradead.org>; Sun, 01 Nov 2026 08:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1793551638; x=1794156438; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+QmBRgJFhtFLO88pUA9+jvHOb9ztG8eZY/mf5WUdXt4=;
        b=u5bKh0Td9sC3prr2kD4xl6sNpF5wiNf5DDBCAjemGlBi4nNk+u5kAFOOTtSTnr7gM/
         R7Nk9TE8nP+JhS0iBSiPzxfSB9c6hpfjEK5v94FodQXUBtgINaWe2K033EalMPkEGv25
         mp77H4CUOBimPy0ntkEnUqvpi+5lMeTKvaRb/iTfDvO9PxUt4TJVhQgqZ0M2Oy75FXIS
         x8Cq2QbH4BKaDG8FpsV/IYfx6nbR+Oz5OjywouzPU/TmvU8m8E7uGV6JLaCtIbtuTvyx
         NE3vlP30DqBaUHduVcJ5gRj6Y56zlovLjgwMjtPjjAtq0NhwhKokCBI6oyq43SprsGOV
         788A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793551638; x=1794156438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+QmBRgJFhtFLO88pUA9+jvHOb9ztG8eZY/mf5WUdXt4=;
        b=aWRfHvhibBw22tx/bip21oilL852noHmyvSnP2Wi/2SaRCkG76WXueAsTRdzZGBKck
         YjLDitfVW19CoAVCi58s6Nf3PoSE2zxNttX4cytyRe+/NaXAzKyByUuk9ebEGBbkgwxQ
         8GhhqwM+RDZRBLKD3n0g2av6O85iMr3VwaFgqiCHx1SPx10reP1CgJesDxCPplawGPEt
         U94VRvG+2FlCC+BKTSoENlA7ey4jP0WY5W9EQFTuajG5iL9V6pL2+NGRQbKuJ4Vyt0fb
         QGXC67VHxcLvIqLa25CUxdL+WgmBTsxrxviqJbwofQlsEosgpXlotRl8dC5Z5qxnJo3c
         ZA6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxOekQ05pmjANu1mmtdu+OTXqCg0N7eox68Ul245VnqR7iEvg+XIQzplUNUhdvypt6CeUSue7w=@lists.infradead.org
X-Gm-Message-State: APuU4Z9YeA1jNpmJm7EDHTQisuNGf6KqwGotSMa5uAhSBFIhXQyL7i7z
	DvaYpBd9dEqRG5jbxWGZ5gzOGfN8skJ1rk9ZXyWvUbxR17Hrwyvzk2RGlaNFHaQSZA==
X-Gm-Gg: AYBFou2OJ3WT9FOQhaSNPN+x44DOYLBj9+TUb3+jWnDy//rxJT9sYaiB3ic3kplhwW1
	qS5yyFEFQTZcM5sp5KGECF7gqoRC799Gz4jl4CMSmbBpQJ9Kpqn3p5tTyG/BGr/OW/fiD0oxDiV
	ZfjSD7Hy0SUnk7237cR33H8Ly2Up7d1Y/jwKaUXIn+g2X1tJjZ6KClTsouEQLmTEYbNt0NRq8MC
	1vx9hOELHhxFyqAOHUiaxCSnjoWlVKaF2iAPKgvg0OkBrZDfPZfJRDNa29zT6+4LC2GPfivwqo3
	ixSlfOs+G4mzJywfdTt7lnXgpXqi5vbgo3MopqbqoX6Q0PZi3tFw3OsauutvOZG5LeJuiU5LyFd
	5sG5NyLWzwkdPzft2QdUrqvj9XbI299NPV7G3P63lSw6z/VoTH+/ZOQ+qNTHUDcBirNlMQdNuSV
	mV8tGQchaDdEvOYIsCTQgWuseeqlR+ECw5U6sBvdfTVRpKnZpaRRwABy7ilcDZQZp4m4orKzeOw
	sAlJ4G4/Rh7fxbtNvmFLiLxBLRVJ2CQ2wJma6xuql/qxLVVQN2//VST/KInmPhWmuuvHSNtKoy7
	nUBzFVQjz2TmZOhK+XGPYPC0ycBtFzeWxxBFfBQYhAcou0LqoTgYFOENfTN/62MCjhugOqLzzNc
	/ylR3JDdsrtE9cJxIUUQ4JVad7BHKOY8ukazxG3kxkPMitNzZEybeRnm5HB9UVdH3Bax2vg0U3J
	aN0tC+HN9X2ouzpA8SCkRzG3Bsd4ws2TkMr5kIxBuHe7ODPHNhLR5xhtbbqIX2LXqhLA96L7KJ9
	zfW4PF/i0xnJWSRVoSTtGQ5L0ZB/teSVje7NN5/1o47ayzSHfvhYmO9BtJWu0Al1ehvcdHRu4Ka
	XgxLV6Nu0rsp1dSBQ3H5
X-Received: by 2002:aa7:d387:0:b0:6b1:ce74:2913 with SMTP id 4fb4d7f45d1cf-6b4d467561bmr3616851a12.8.1793551637969;
        Sun, 01 Nov 2026 08:47:17 -0800 (PST)
Received: from Desktop (p54aff790.dip0.t-ipconnect.de. [84.175.247.144])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca0f376sm2371248a12.26.2026.11.01.08.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:47:16 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Florian Maurer <fmaurer@disroot.org>
Cc: Jeff Johnson <jjohnson@kernel.org>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	John Crispin <john@phrozen.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2 0/5] wifi: ath11k: firmware crash recovery fixes
Date: Sun,  1 Nov 2026 17:47:16 +0100
Message-ID: <20261101164716.302826-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101131550.1890062-1-fmaurer@disroot.org>
References: <20261018210153.1925962-1-julius@bairaktaris.de> <20261101131550.1890062-1-fmaurer@disroot.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_084719_980490_B30CDE80 
X-CRM114-Status: UNSURE (   8.24  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Florian,

Thanks for the testing and for your three patches.

> That recovery fails after ath11k_hal_srng_clear() but before
> ath11k_ce_init_pipes(). The next recovery then tears down the CE pipes
> on the cleared rings and hits a NULL pointer with BHs disabled (under
> ce_lock):

My v3 covers this case in 3/5 and 4/5. In 3/5,
ath11k_ce_completed_send_next() returns -EIO for a ring without a tail
pointer before it takes srng->lock, since ath11k_hal_srng_clear()
zeroes the lock with the ring, and ath11k_ce_send() tests CRASH_FLUSH
before it reaps. In 4/5, ath11k_core_qmi_firmware_ready() clears
CRASH_FLUSH once the rings are rebuilt and sets it again on its error
path before ath11k_dp_free().

> I can try that if you don't plan to cover it in a v3.

I will run your crash 10-20 ms after "is now up" against v3 on my
AX3600 and post it with your three patches on top as one series, with
your From: and Signed-off-by kept and your Tested-by on my five. Is
that fine with you?

Thanks,
Julius

