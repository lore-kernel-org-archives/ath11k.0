Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AEA606A690
	for <ath11k@archiver.kernel.org>; Sun, 22 Nov 2026 15:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZttyFhkE;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=StWHijhm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=L5taQCA3yvh5AYAVe1wnOgk1TFyHKnQu9Ei6LAyOPC8=; b=ZttyFhkEu4zkTplShxv5Sqv0b/
	T/fIgfG/Il6LVRG/ICF0Wg0UksZaYDvG7LPW9mzZNjHZnf04Hzgh/IsO41WtQefrHBk3vpTBJ7fKc
	Kr36lP8LcP2OLejTNR5Nk5ZjkWdcPFML4gUSNtYRy1xdZCbgGR1dq1zeg800h6DqCNc2+EVAk5kte
	crchlPgHVlYQWXqLdsJRXmVqtlrkshIedpfj5kIGqPHbxNDhJEBtuOVEivwHAdmba8cNyDeteA9s5
	Th7Tx5Dh7zLlrzpi/ayRVZ+mnn+3FCO+LniFDHbRuhfeH8+5RZjI3X3D4jLmK1i5RV6vGHbMRqCo/
	uU96AYyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9As-00000001Ear-2tLr;
	Sun, 22 Nov 2026 15:08:14 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9Aq-00000001Ea9-3CRx
	for ath11k@lists.infradead.org;
	Sun, 22 Nov 2026 15:08:14 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6bab10844b5so282067a12.1
        for <ath11k@lists.infradead.org>; Sun, 22 Nov 2026 07:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795360091; x=1795964891; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L5taQCA3yvh5AYAVe1wnOgk1TFyHKnQu9Ei6LAyOPC8=;
        b=StWHijhmfGc5XLQYuy8ROXTYHKqCodNyav387PPoZ2l84vly3sKKHmY9G60fI2kZDu
         56bO8t0Uy6VJIfIzX+KLgPvcRn+ikTloKds8VUHqhXhON4yLCz+fYrVNyFOVKIRKXMiZ
         9GtJFnsXgGrmuoLqUgqN5s0Czcb74I5sXG4Q4qSxRCzkfySiLqlLTO0XOm5pUW+9aQzx
         L5xoMR1h71GAKWQt/GfXDyWUC9z46PBwLAEPL8JUfTcmqFdH8Wa7gZ/suRhY8cYaKswS
         izyTZOnZIsncZPPMRKon9IsdyWNKe5Sj4qQP7pSEcFKBqk78M/ApWItqFW/ep/L77gXA
         GgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795360091; x=1795964891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L5taQCA3yvh5AYAVe1wnOgk1TFyHKnQu9Ei6LAyOPC8=;
        b=gzKclvYx5heSSbcE4+A0FEGS5BW/spToz14hH7ulTHFIqgGXzjadopzU8nu0HJiNol
         AdO+Htyp85/vojh7fdJY3Lcl6KMyU9gzgiesWLLU4keNybPqh3JbWGoWjoPpa31+9Jj2
         8WUKFzOBr+C0pI+sfOXeg0SqDwdZZoo3fpgLzqEMzkt14K1EAjyF4gJy8qoJ1JQC7ZQb
         zChGMCSdR9IOZ+AkgPlo/rk1x/0VX+naaZ1LU6fxHSTiIsZbU8H0IUjPZ0FPKYmi+kDP
         HZQhEgVvPNESr+xSSUhOHEXKdyM2XYg/iuvu7WKVx2zaJx0crEjL8e7lcuveHtRR5H9d
         NwlQ==
X-Gm-Message-State: APuU4Z8nJ5xhB9HHSRtBUntHJHlz/2wbwPM1vQPq7+plKiMag9YWLeQZ
	kDXCSDpDDscAakI9gvXRiZ49E2clWFPXwOmxWcwDppqLCvJxOkiwBHpHV4/NpeSuMA==
X-Gm-Gg: AZFdTZff9Xn6eY7O36/s7dx9QBYJV8y4HyCTACoLAs4qwnEqOxSZKcngfPKEXcwFgZ1
	wEHh75G0Qoo4s0HVXu9djf+LgE+NAcDSQiEfhnk+3+7NUyhfkvq3avV9houAA/wcxGr4FAvaFAq
	Su/HMo/OCxkDnWyS1aVDgX725j6dYhkTVoM+NOxP0P4raPVKK7i401c/Wn39AnCHYmdAMtF28m8
	nXsGBSdlX4RPmM7TJ48lSoXE6+pwAgt5ijCcj6p/rcRKW6i2qQU6yZcNMAVQaldt6G2Yp90NWLj
	FDVoljSmmIPY4EKcMLR1BqQXh7jrWl6LST4i70t62CsuIMUI8zChbotuwbEgrvcw0LlQHKc+9yk
	CWIOgZnR5raMBXxQzUlVlPRBcufRmnqM+kBN+xmlYTQ3eglD4FOjfAiHpzkw7Oj2kg08xGhho+3
	Xq1HejkZhj6QEl9KqJGZemkbokjiymMtd67VX2PEqJYMCzUV1RzPRgXC43389Z7UeUQ6GnW4145
	wKKImnBw5zDxz4bBk67aF/zq7wRuKSVM/E5ydycSSXaxRzizpsBtQwcCu95miM6U0jo0UBNT3kE
	DUd8l7ca749xEPkg6V4fPFHdwwTfWX0ILN5MhZG52aBUK+A21ikAZkN9P2t3gBvYYoN8Eb+KXqu
	dtVuHW9pkdwXFCeDz/11skiNxiXbLlYkiQMk6XD0LNQDWjRMTLdX/kk+VfimUkU4AJJE4G8X+Xv
	acDIVujjeMaliLMp1iQ9c0HelB9+tTBsO8Yirqq6nV24DenWrR/VJjKuntynTKyMmvvT5WBxNs6
	Y4A3NkP/x/hwjcZbbQ4wyN5nfum6C9cKCNTVRFu8k34dgCggZq26WXyts1OMRIb37fhzYNSTNlC
	YPDRRiFD3Gtx
X-Received: by 2002:a17:906:1651:b0:c50:6222:7b1c with SMTP id a640c23a62f3a-c513aaada4cmr594204766b.23.1795360090707;
        Sun, 22 Nov 2026 07:08:10 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.181.130.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae68887sm324618466b.20.2026.11.22.07.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:08:10 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sven Eckelmann <sven@narfation.org>,
	John Crispin <john@phrozen.org>,
	Julia Lawall <julia.lawall@lip6.fr>
Subject: [PATCH ath-next v3 0/2] wifi: ath11k: do not fail down transitions of the station state
Date: Sun, 22 Nov 2026 16:08:09 +0100
Message-ID: <20261122150811.3135445-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_070812_840598_AD58B162 
X-CRM114-Status: UNSURE (   9.78  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mac80211 warns when a driver fails a down transition of the station
state, and ath11k does so while the firmware is down. Patch 2 fixes that.
Patch 1: with the firmware down, a key whose removal failed stayed in
peer->keys[] although mac80211 had freed it.

I used Claude (Anthropic) to help write these patches.

Tested on an IPQ8074 AP (hw2.0 AHB, WLAN.HK.2.12-01460): the firmware was
crashed through debugfs and the station deleted at once. In 6 of 6 runs
with this series station del returned 0 with no mac80211 warning and no
key removal error, and the station re-associated. With the v1 patch alone,
one run logged "failed to remove peer key 0: -108" and "failed to clear all
peer keys for vdev 0: -108".

Changes in v3:
- Rebased onto ath-next 1983b40acfcb.
- Patch 1: return the ath11k_install_key() error for DISABLE_KEY instead
  of the PN replay result that overwrote it (Sashiko review of v2).

Changes in v2:
- New patch 1.
- Patch 2: continue the host cleanup after a failed early vdev stop and
  a failed RTS/CTS update instead of returning from them (Sashiko review
  of v1).

v2: https://lore.kernel.org/linux-wireless/20261114225643.962015-1-julius@bairaktaris.de/
v1: https://lore.kernel.org/all/20261101174422.1275413-1-julius@bairaktaris.de/

Julius Bairaktaris (2):
  wifi: ath11k: forget a key the firmware failed to remove
  wifi: ath11k: do not fail down transitions of the station state

 drivers/net/wireless/ath/ath11k/mac.c | 31 +++++++++++++++++----------
 1 file changed, 20 insertions(+), 11 deletions(-)


base-commit: 1983b40acfcb3c3464b291c85977290a785bcfdc
-- 
2.53.0

