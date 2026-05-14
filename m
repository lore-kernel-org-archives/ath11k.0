Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3114FCD37AC
	for <ath11k@archiver.kernel.org>; Thu, 14 May 2026 04:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nB6K0IeFd+1uw5rf1Ps0y3aueGBh2t5B3OagXPsvXVQ=; b=y4xfz1B4RejhCi+gUMUkJG5BIS
	JLdJGcvR/QhJmoB0Ds4iXEr5J1ZkMhfjKIex9zwZlVwi5ItK6DuwVm+q4UIxvAO/saJepv0IYIC9g
	KnNA311pQH3h1nJAXoxaAhBRiF+mgybqSA3/cTyVfeTsXIpmSWYQ+51PzEB4Q7pTiUqIqjBDakGlW
	vCVAdKz5nySyzlKYemw16ydUvFzOv3q6hkH682GBYuhVoult6yU4FwhZ8CVor4WWygc2mzK4FCew8
	4e0VKlsvz/Eu35WtiJ3+9ATRMNRo1JaGzIuYMx9tby3FqDGwFkp6l+xMOdIsREuOHDVMC8cVNTMAo
	abwgIC/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNO3u-00000004ZJL-1BUE;
	Thu, 14 May 2026 04:52:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNO3s-00000004ZJ3-3h6Y
	for ath11k@lists.infradead.org;
	Thu, 14 May 2026 04:52:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F0F3160121;
	Thu, 14 May 2026 04:52:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F549C2BCC6;
	Thu, 14 May 2026 04:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778734359;
	bh=1/zpOikpu7K01PFdOF+RYE+bOzqD7AJ/p59qRdvBRdY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=d2uVGaxQpijiXiMuKBTxIv86TxKo55rB2XvRqVmT3BL3DnHpmD0j33fGJP0PZXrF2
	 dZK3DVAgFlZesU0W4RVI7VaX6JQj1Zo5RBW0pcs6ySEYezLBy4atLj3xeBeCPSAyQp
	 2hw1grMUwU0O6LUF/2ioo5FWXuKIiMP66lZnrDmziswxS8lI7rYflOXlD5BEcEOy+x
	 K9ixJg955NfYbdsoOkL7ZMiPeczwzBDDgc6sRfp7JIPSe7tT3w8g1M+bP8G3azreth
	 0XB9B/SIOTcC2QcDVGRs5OZwQgS3pc18ZPmwwLMltqbftu30QfJ0voxVX4IW+wwmpN
	 FhRzLPmbFb3oQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89428CD4F39;
	Thu, 14 May 2026 04:52:39 +0000 (UTC)
From: Kyle Farnung via B4 Relay <devnull+kfarnung.gmail.com@kernel.org>
Date: Wed, 13 May 2026 21:52:12 -0700
Subject: [PATCH] wifi: ath11k: clear shared SRNG pointer state on restart
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-kfarnung-ath11k-srng-clear-pointer-state-v1-1-bc700dd8b333@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NywrCQAwAf6XkbGCzUl+/Ih5im7ahkpZkFaH03
 128zVxmNghxlYBbs4HLR0MXq0KHBrqJbRTUvjrklE+ppSPOA7u9bUQuE9GM4ZW7l7DjuqgVcYz
 CRfBK/YWf6SytZKi51WXQ7391f+z7D53Sk4N6AAAA
X-Change-ID: 20260513-kfarnung-ath11k-srng-clear-pointer-state-91d8ab07e5e2
To: Jeff Johnson <jjohnson@kernel.org>, 
 Muhammad Usama Anjum <usama.anjum@arm.com>, 
 Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, santiagorr@riseup.net, stable@vger.kernel.org, 
 Kyle Farnung <kfarnung@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778734359; l=3434;
 i=kfarnung@gmail.com; s=20260330; h=from:subject:message-id;
 bh=XJuJhNZPkZzqwmUgFybWgxjzGDftVSfNEsebbvGwSDA=;
 b=uj7RAdlKe6Dq/MwIimfTIXag4PerG+bL1bff/qD6gwXGRjbtWzbh36slDaJOSLak3IznIwRpm
 ar/zYfA0NsxAGXHHHBc4Xm9CJt9sATCa6ej8etG2xVD+0f9x5qdbc0l
X-Developer-Key: i=kfarnung@gmail.com; a=ed25519;
 pk=47jis5OdLKFgZynNQVqkx1mTGiEgFTUX+MecmG9rbmE=
X-Endpoint-Received: by B4 Relay for kfarnung@gmail.com/20260330 with
 auth_id=706
X-Original-From: Kyle Farnung <kfarnung@gmail.com>
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
Reply-To: kfarnung@gmail.com
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: Kyle Farnung <kfarnung@gmail.com>

LMAC rings reuse the shared rdp/wrp pointer buffers without going
through the normal SRNG hw-init path that zeros non-LMAC ring
pointers. After restart, ath11k_hal_srng_clear() can therefore hand
stale hp/tp state from the previous firmware instance back to the new
one.

Clear the shared pointer buffers while keeping the allocations in
place so restart still avoids reallocating SRNG DMA memory, but starts
with fresh ring-pointer state.

Fixes: 32be3ca4cf78b ("wifi: ath11k: HAL SRNG: don't deinitialize and re-initialize again")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/all/CAOPSVF04q6uvVdq8GTRLHBrVMdpt9=o9wVcFMc6f-yhmSBcZqQ@mail.gmail.com/
Signed-off-by: Kyle Farnung <kfarnung@gmail.com>
---
This patch is the result of investigating suspend/resume failures on a
Lenovo ThinkPad P14s Gen 5 AMD with ath11k.

I originally proposed extending the existing ath11k PM quirk for this
platform, but after discussion in [1] and bisection the issue appears to
be a regression introduced by [2]. There is also a parallel report in [3]
that appears consistent with the same root cause. This patch keeps the
intended no-reallocation behavior from that change, but clears the
preserved shared SRNG pointer state so restart begins from a clean state.

Testing so far has been limited to local suspend/resume cycling on the
affected system. The issue was originally reproduced on v7.0.4, and the
patch was also built and tested on top of ath-current with repeated
suspend/resume cycles on a Lenovo ThinkPad P14s Gen 5 AMD.

[1] https://lore.kernel.org/all/CAOPSVF04q6uvVdq8GTRLHBrVMdpt9=o9wVcFMc6f-yhmSBcZqQ@mail.gmail.com/
[2] 32be3ca4cf78b ("wifi: ath11k: HAL SRNG: don't deinitialize and re-initialize again")
[3] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1132343
---
 drivers/net/wireless/ath/ath11k/hal.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index e821e5a62c1c0..0c0aeb803018e 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -1387,14 +1387,21 @@ EXPORT_SYMBOL(ath11k_hal_srng_deinit);
 
 void ath11k_hal_srng_clear(struct ath11k_base *ab)
 {
-	/* No need to memset rdp and wrp memory since each individual
-	 * segment would get cleared in ath11k_hal_srng_src_hw_init()
-	 * and ath11k_hal_srng_dst_hw_init().
+	/* Preserve the shared pointer buffers, but clear the previous
+	 * firmware instance's hp/tp state before handing them back to FW.
+	 * LMAC rings reuse this shared memory without going through the
+	 * normal SRNG hw-init path that zeros non-LMAC ring pointers.
 	 */
 	memset(ab->hal.srng_list, 0,
 	       sizeof(ab->hal.srng_list));
 	memset(ab->hal.shadow_reg_addr, 0,
 	       sizeof(ab->hal.shadow_reg_addr));
+	if (ab->hal.rdp.vaddr)
+		memset(ab->hal.rdp.vaddr, 0,
+		       sizeof(*ab->hal.rdp.vaddr) * HAL_SRNG_RING_ID_MAX);
+	if (ab->hal.wrp.vaddr)
+		memset(ab->hal.wrp.vaddr, 0,
+		       sizeof(*ab->hal.wrp.vaddr) * HAL_SRNG_NUM_LMAC_RINGS);
 	ab->hal.avail_blk_resource = 0;
 	ab->hal.current_blk_index = 0;
 	ab->hal.num_shadow_reg_configured = 0;

---
base-commit: 54a5b38e4396530e5b2f12b54d3844e860ab6784
change-id: 20260513-kfarnung-ath11k-srng-clear-pointer-state-91d8ab07e5e2

Best regards,
-- 
Kyle Farnung <kfarnung@gmail.com>



