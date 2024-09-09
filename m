Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E809ECE579
	for <ath11k@archiver.kernel.org>; Mon,  9 Sep 2024 15:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qSyQ4pSfZEnrTREXFvnropqxg0UKjf2Lm16mH1Y1mlc=; b=Jx3BeV9DJc2c99VZ79DQgBPRNc
	Newz3lAwKXmyFf00TC64HsKWtGOVUOtNPsBKHR4R+SABSKt4ttGEz4VWck9ELaQUciPg8NFCxa+pR
	YmXMuX8a5nAOW+U537AieAFfYhuWIQ8Ja9zsYXa7AyfGao0gBo/3rUGIIY59hw3uIW7KHxaN2fjfa
	Uf+pGS284C8RtiUk9M4TMogbbrwqA9krobBWhgNpB8Rj6NgQMd8VbspkZT22khkYz9Is/wlpnBRA6
	9ySSkTIFlUCfIFmzdvGyH6Wudcaco19APgPnZfjNchH+hytru6zMIX9skIon1ymZQGSl7rxh67LG7
	N6od+QjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sng2J-00000002P5K-2R1X;
	Mon, 09 Sep 2024 15:10:39 +0000
Received: from mail.rosalinux.ru ([195.19.76.54])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sng1a-00000002OsL-1Odg
	for ath11k@lists.infradead.org;
	Mon, 09 Sep 2024 15:09:56 +0000
Received: from localhost (localhost [127.0.0.1])
	by mail.rosalinux.ru (Postfix) with ESMTP id DE719F96D6A8A;
	Mon,  9 Sep 2024 18:09:41 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
	by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id UotMJwDW5c-o; Mon,  9 Sep 2024 18:09:41 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
	by mail.rosalinux.ru (Postfix) with ESMTP id B1366F96D6A8E;
	Mon,  9 Sep 2024 18:09:41 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru B1366F96D6A8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
	s=1D4BB666-A0F1-11EB-A1A2-F53579C7F503; t=1725894581;
	bh=qSyQ4pSfZEnrTREXFvnropqxg0UKjf2Lm16mH1Y1mlc=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=kVoQM5LIZeuKaFX+8V0CIgPFP8tp6Xzg+KdSRB5Ws0aZAx7HkpIX6ksZMyyM3sQ0N
	 FaXsOHy+WWpe+pK7oNnI9IT2qF2wmX13bRQL9my6D5QuosNnuo2X/Xyh7k9XYwfEbS
	 6+7HTgEX/G8A7e1QR3WpI8zE8MtMjFX37puTP7TSCrhKK93PMK0Nhsdy2SPCPF11i+
	 ZM3r67zof3Md0EoqlXvVVCO0HaujJ9gKcjx8EP3qwkWr5/b3SPIxWcVNyLdpUaBynh
	 ItlN9woC0zk9vr4WvyauXBPOumvz0Cm0pz9tUlvo8QWaX8z+AS8so5AgWJ1ZrGsEqT
	 YuWjoJe2lW5iQ==
X-Virus-Scanned: amavisd-new at rosalinux.ru
Received: from mail.rosalinux.ru ([127.0.0.1])
	by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id IhIZLQJ360Z7; Mon,  9 Sep 2024 18:09:41 +0300 (MSK)
Received: from localhost.localdomain (unknown [213.87.137.230])
	by mail.rosalinux.ru (Postfix) with ESMTPSA id D52C1F96D6A8A;
	Mon,  9 Sep 2024 18:09:40 +0300 (MSK)
From: Mikhail Lobanov <m.lobanov@rosalinux.ru>
To: Kalle Valo <kvalo@kernel.org>
Cc: Mikhail Lobanov <m.lobanov@rosalinux.ru>,
	Jeff Johnson <jjohnson@kernel.org>,
	Govindaraj Saminathan <quic_gsamin@quicinc.com>,
	Miles Hu <milehu@codeaurora.org>,
	Sven Eckelmann <seckelmann@datto.com>,
	Rajkumar Manoharan <rmanohar@codeaurora.org>,
	John Crispin <john@phrozen.org>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] ath11k: modify null check logic in ath11k_ce_rx_post_pipe()
Date: Mon,  9 Sep 2024 11:08:20 -0400
Message-ID: <20240909150824.28195-1-m.lobanov@rosalinux.ru>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_080954_893968_BD1D89E2 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
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

The previous logic in ath11k_ce_rx_post_pipe() incorrectly required both=20
dest_ring and status_ring to be NULL in order to exit the function.=20
This caused the function to continue even if only one of the pointers=20
was NULL, potentially leading to null pointer dereferences in=20
ath11k_ce_rx_buf_enqueue_pipe().

Fix the condition by modifying the logic so that the function returns=20
early if either dest_ring or status_ring is NULL.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
---
 drivers/net/wireless/ath/ath11k/ce.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/=
ath/ath11k/ce.c
index e66e86bdec20..9d4246d65d68 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -324,7 +324,7 @@ static int ath11k_ce_rx_post_pipe(struct ath11k_ce_pi=
pe *pipe)
 	dma_addr_t paddr;
 	int ret =3D 0;
=20
-	if (!(pipe->dest_ring || pipe->status_ring))
+	if (!pipe->dest_ring || !pipe->status_ring)
 		return 0;
=20
 	spin_lock_bh(&ab->ce.ce_lock);
--=20
2.43.0


