Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F06606A330
	for <ath11k@archiver.kernel.org>; Sun,  8 Nov 2026 22:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NzySy2RH;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ThFvBj8O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=tYKORgexMp98ESSW/UdTb6q8ju2i5dIJv3ka+amXAdA=; b=NzySy2RHK32kvJSgE5HMhdjLrm
	vCiqd7w8op74N2yuKzcVPTwDKjT7aVYtir1u7wUFnsb11J4lTAfumtZZ3+dMVl0JEeQ4xvltrv24H
	OAsepehpMdLT4Cp456DAZWSsjtIRsm+hjZLfpX4h66OdLSpPKPrNIX9+u0Ian5wNvJMxMR32Exo4Y
	VwlntV8dgy6hr9qQm3m+p82P3la9Di8SCADnf6WxzO+i+3Kfmm4MSani6kZRl2WrJ4rPB0dySsr4O
	JsE4M7Rvfyzaqe1RSI1JlfateFwQeiPLTF0MCbL/OjD4/PmJKQUjUeQbZLuTF0Sw+1PXBxjauTfGI
	AMW4cv/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBdn-0000000GrOG-2PTO;
	Sun, 08 Nov 2026 22:45:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBdj-0000000GrNu-2G7o
	for ath11k@lists.infradead.org;
	Sun, 08 Nov 2026 22:45:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EF54E4467F;
	Sun,  8 Nov 2026 22:45:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794177930;
	b=rF+mg5SPbXry8j+WVb0KUg7kXeVRm+FE0aYSd3NxUEafNpMm9vMdAyFeYJz7BnnW4Z6L
	 gUKrCZBUnHgXenT1eXuQtNymiCY8/E99iyHt0pPLazIpizi3rCoOIXuKqmzCdRSpRRHPo
	 U6nthPWXU5yxHz1G2FEZAYwaqgzFM9yPunYcJBWgJ7f+3pL+ZQ1AHAmbI0l4b5wBWU0yl
	 QeHKk4JQ+Gq5ttHtoWEq6JyDVkB+oqfX557sE5tro9neuUOvFX/s0QnjKwmuuMlU0+/hN
	 0XMM4T/1wRuHzwlhz4S7VngwQkpFd0KEHwH4DxiDrJ50qoNQD4A+A7y1xMVrPYBPTAA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794177930;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=tYKORgexMp98ESSW/UdTb6q8ju2i5dIJv3ka+amXAdA=;
	b=xh27UYNWoDR/DnsL8cTQnvGq6t5EkeX9wlizCAm4LvKz8khqRnmILxBAD9QDLnqqyUDS
	 fYiGIpQBFK+e3ahrQiau0Pex1zkCwcaVqUnsUbSpvXDZGUKOO07mNEKCcOiyji145FNat
	 JOA4kkmrxWiD+B/Po/W1P5EfCa/HynvrF0oNUZa5323qoCuXwHIC7n/4P7m+DzIxUpb6u
	 qxC1dvUuTKJuNVdnPzeEM1PjhGgpn6QA0UB5eEfU6hv9fhAoVANxNWVORiOuRNyzqI8yb
	 NXAn8YGaC24EGXpKe/H2gsP0x4CdZiRX6rn8dJleteCH6ehqGDRap9wcZnCvyVMBltw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DB1601F008A3;
	Sun,  8 Nov 2026 22:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794177930;
	bh=tYKORgexMp98ESSW/UdTb6q8ju2i5dIJv3ka+amXAdA=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=ThFvBj8O0jLH+AiRnoH42KbKIdKORiF//4WuedDYLyOoAyEgNw0tpqaoA2eFlV66k
	 B7VM1oKSTapDrTeLKaf0uThAFSRI4A3i1c/jRaqZ8CbC8OQU+NaflDZ0gt7PMTgA5U
	 pHMJPzbC8P8BqMWG9n76eLvvBu0jFwXw72QNAN981tyyOjuw9KTxasmEkC9f4jGasw
	 GTS49QvAqyaDJGa0M1flaP6aXStGL4RoyhJ1CrHS1mPageOUlg/ZcWo9RvW8DCD8u6
	 7GcdpX2ZCljTcJDR+k1SPpGqgIJ8/Y3RwgynKQeZvg4vSuQEKkJ9ZdlDkenapRsJ9t
	 OEG323vMn8BXA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3994148145;
	Sun,  8 Nov 2026 22:45:29 +0000 (UTC)
From: Christopher Griffin via B4 Relay <devnull+christophergriffin05.gmail.com@kernel.org>
Subject: [PATCH 0/2] wifi: ath11k: feed mac80211's airtime fairness
Date: Sun, 08 Nov 2026 16:45:28 -0600
Message-Id: <20261108-ath11k-tx-airtime-v1-0-f1a02b2372d4@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIj78GoC/yXMTQqEMAxA4atI1hMw9Q+8iswi1qhxGJW2Mwji3
 a26/Bbv7eDFqXiokx2c/NXrMkfQKwE78jwIahcNJjUlUVohh5Hog2FDVhf0K1hYyUrDbc9ZDrF
 bnfS63c/m/dj/2klsuEZwHCdhC9f+dQAAAA==
X-Change-ID: 20261107-ath11k-tx-airtime-5ce362abfa34
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Christopher Griffin <christophergriffin05@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794177928; l=1972;
 i=christophergriffin05@gmail.com; s=20261024; h=from:subject:message-id;
 bh=XIN8sZMXV6vtgjXMXA1MUFV8xymBm0XeIvXZSKIKisk=;
 b=m7xCdn3PX3XqZpB0fAoMoUJBb/tw02ZLgvB3bgHJoGwwhx2wcm03/bQ3z90IEyKZEBeWCcNyP
 7jrop2ClLl5AHwK3chMLcL4c17O/MnYOAtBdVkkJ4vBi6OOO9AIB07w
X-Developer-Key: i=christophergriffin05@gmail.com; a=ed25519;
 pk=oa9tkTNpiGoFWdGvpDHXLSobApmsh9BfrJRJrRJAvWA=
X-Endpoint-Received: by B4 Relay for
 christophergriffin05@gmail.com/20261024 with auth_id=1309
X-Original-From: Christopher Griffin <christophergriffin05@gmail.com>
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Reply-To: christophergriffin05@gmail.com
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath11k never reports airtime to mac80211, so airtime fairness does
nothing on any ath11k radio: every station's deficit stays where it
started and the TX queues are served round robin. Patch 1 registers
each PPDU's TX airtime from the HTT PPDU stats, the way ath10k and
mt76 already do. Patch 2 fixes two paths that free TX frames behind
mac80211's back (REINJ/INSPECT completions, and the datapath teardown
during firmware crash recovery), so that mac80211's per-frame state,
including any TX status a frame asked for, is reported.

Both were tested on an IPQ8074 AP (Arista C-360) with a QCN9074 radio
at 6 GHz, 160 MHz, against the same AP without them, with one and two
clients (TCP download, 30 s runs; for one client 6 runs with the
patches and 12 without): one client 1777 vs 1672 Mbit/s, two clients
1540/1524 vs 1569/1566,
95th percentile ping under the two-client load 42-50 vs 61 ms and
31-44 vs 56-77 ms.

This series does not advertise NL80211_EXT_FEATURE_AQL. With AQL on
as well, the same radio lost 22-44% of its throughput whatever the AQL
limits (5/12 to 20/48 ms), and lost more over minutes of load, while
pending airtime rarely reached the limits; turning off aql_enable or
airtime_flags at run time did not bring it back. That needs its own
look and is not part of this series.

The changes, the messages and the tests were written with Claude, an
AI coding assistant.

---
Christopher Griffin (2):
      wifi: ath11k: report TX airtime to mac80211
      wifi: ath11k: hand freed TX frames back to mac80211

 drivers/net/wireless/ath/ath11k/dp.c    | 12 +++++++++---
 drivers/net/wireless/ath/ath11k/dp_rx.c |  9 ++++++++-
 drivers/net/wireless/ath/ath11k/dp_tx.c |  4 ++--
 3 files changed, 19 insertions(+), 6 deletions(-)
---
base-commit: ad6bdd5f9030dbcf29a67f40ccdb3fa57afecff5
change-id: 20261107-ath11k-tx-airtime-5ce362abfa34

Best regards,
--  
Christopher Griffin <christophergriffin05@gmail.com>



