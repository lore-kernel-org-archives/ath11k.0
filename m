Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F886C76188
	for <ath11k@archiver.kernel.org>; Wed,  5 Apr 2023 09:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tYkeSLGDrnyeUo//jp+JMCoM+MpNAAr0gwIADaF4mDE=; b=yenP046UQEMmGC
	Glc6f56NMhs8IXg1nquWzFc1qcLtWjp1MnMEeObYKiiE2cufAgZ9UgoW0Qtoj1PEBKcuBRkJWKtcW
	drKww2HCtSELPO99kKwSsm2OE/6jcl1Q64VzWPHzC24wP9vM3Dvlr34tbt425/HwjRjrU8S7z9F8C
	FCjB0BG0Vm5DSw4+DKGA9Sos3XDOkehr1vVKOvjtO0xm/JJNoq90mCehu/hjU5uVR4DTrgpt8COIr
	nSd+HTWGtOk5JTZRGnwtYduqQuFL0lT0fTtT9P/0mGbBA1F24cU2ca28ZrxL8U6TlugQIZQxHx1RK
	rlQuYz2bGGInDfCL+0PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjz4D-003tDb-08;
	Wed, 05 Apr 2023 09:04:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjz49-003tCQ-2y
	for ath11k@lists.infradead.org;
	Wed, 05 Apr 2023 09:04:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4A8236253C
	for <ath11k@lists.infradead.org>; Wed,  5 Apr 2023 09:04:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 118FDC4339C;
	Wed,  5 Apr 2023 09:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680685468;
	bh=dXbpBAkd76lyuS9ClysGa5XOzVAb4r9ONCYrH5D+Juc=;
	h=From:To:Cc:Subject:Date:From;
	b=UOR8+hhoML7+N4bu+AC9mx9nSD2a5ppMkZSBuEjV3ivgysVQynBdAeh33FMdmlwCh
	 ZiNxjwNom7W0mHmKRJ+EAlRcvQAJGz+qj3ZzaEnLFSL1mIcveArluS0G+qRum4GUrm
	 7BSecbQe0oqFD2NugI+nSLcLc+HkfBOokMCvoJ4vr2zi+/6G9VafX/ImOr20/38IOg
	 ZAveDuXBNh11AoKMWTS/KWjHFMmSYPmADIMv1Y9wPymPytoNH17/4cN8wSjF11njrg
	 VmYJD0uQnacnFPqgtUBVBcaX9JbZnp/1t3mjSOXcvkawKTwqf77/KbpC4kXGtipACK
	 iZ2MyiqJWsa5w==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH] wifi: ath11k: print a warning when crypto_alloc_shash() fails
Date: Wed,  5 Apr 2023 12:04:25 +0300
Message-Id: <20230405090425.1351-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_020430_017940_5B0932B5 
X-CRM114-Status: GOOD (  10.77  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: Kalle Valo <quic_kvalo@quicinc.com>

Christoph reported that ath11k failed to initialise when michael_mic.ko
module was not installed. To make it easier to notice that case print a
warning when crypto_alloc_shash() fails.

Compile tested only.

Reported-by: Christoph Hellwig <hch@lst.de>
Link: https://lore.kernel.org/all/20221130133016.GC3055@lst.de/
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 99859b59138e..d22e5349c551 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -3106,8 +3106,11 @@ int ath11k_peer_rx_frag_setup(struct ath11k *ar, const u8 *peer_mac, int vdev_id
 	int i;
 
 	tfm = crypto_alloc_shash("michael_mic", 0, 0);
-	if (IS_ERR(tfm))
+	if (IS_ERR(tfm)) {
+		ath11k_warn(ab, "failed to allocate michael_mic shash: %ld\n",
+			    PTR_ERR(tfm));
 		return PTR_ERR(tfm);
+	}
 
 	spin_lock_bh(&ab->base_lock);
 

base-commit: bea046575a2e6d7d1cf63cc7ab032647a3585de5
-- 
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
