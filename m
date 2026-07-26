Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0BDAC53219
	for <ath11k@archiver.kernel.org>; Sun, 26 Jul 2026 22:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ge+jXIVUKhk6GV/kwzJHJ1+CtR1D1neebkAxki5LZgA=; b=hq2CTQPVc6NTDj0poWvO4PTvRZ
	SLVVmhakXlo0dMclSOkInLqkNrvEgvVeCh1Z9P/FCehAKUxZrNNHUnt63AgwDuAQ42iOp43BVMgNx
	ohEJpWT42GMjsDnIK4oH+zjKdhpL6qr8tuvWkZr0wJwEB/N7FLSUSDHbZIdP2WBQZ12fd2V7d8ftQ
	RAZWw3fPcDD5gP4Z1qW96p8s0yRI43d+jV+Pdqg0AHqgffs8G6Rq9EB0OV17/brHmtGOyoL+kPCJO
	sVoAV1jqJ6+7TOj513qC0NOrQbgfA6xNMbkiybsJbHeTrBWOep9kbXwyNWNtFvh4ZzpMRBDExSJIi
	AJ8fdA1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo7CF-00000001ggY-3uYL;
	Sun, 26 Jul 2026 22:19:47 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo7CD-00000001gfO-0dmo
	for ath11k@lists.infradead.org;
	Sun, 26 Jul 2026 22:19:46 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c15cf78d1a2so229943066b.1
        for <ath11k@lists.infradead.org>; Sun, 26 Jul 2026 15:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1785104383; x=1785709183; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ge+jXIVUKhk6GV/kwzJHJ1+CtR1D1neebkAxki5LZgA=;
        b=fDMzZtdcOFnwn/A13mOsO+vxdtKWaXCQa8IEibQDSbFQMoPExxDvOkHqkO/bB3YjIs
         Ohy58VM77sAg0cYYazEIPqQOq4IC6v2QWW/3ZSzoQacYdOtIL9L1FKJFgUv/dge24Wsz
         MGb/B1xX1APDKUk15g8uS6ISOvgOpU+pzlq4PCXr1Qwz8xhVDQeDph82HvpVlx/b6ad5
         6SgHNN1T4x4ya29vWhvCWOxDKpcV/YCQ4cu0ZV7DRriCLcMjRI7/8fqochGPeLZ4hnz2
         tJE3hYQVmSZp4Bezo9XMxSs6Sgj9yaAU2E4Q8kUVakHPFyik660Wdkg2dGZ3luWt/wl9
         AMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785104383; x=1785709183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ge+jXIVUKhk6GV/kwzJHJ1+CtR1D1neebkAxki5LZgA=;
        b=X2ZJ1y5YN5Iwn+s2U0yY21ypJdABbm+x4yL80fNqIhLH0S9N/yUqCHJdsf7Ahsaqgp
         sxIcwuUghZqL8RIkIzKG6HgPu/35j8OAYOwKItlHwSvh6SuENreoYpbphxuctpml8i77
         9vTAUA/wPipHBly4HA+dr87WXuTDKAM1E2AG4omLJ31pB3eGwrIkRs7IICrb13Me5BpJ
         6TjNTrLqpLUENfqk8npECpFpXXyKmOnlQm1OsrUveUKw3Q8+eC6wWCxIK/gFPI0K/oiy
         QAscoVOZsH30s7+kqmnSrUtFGRcHIV3JL8I3Ws4NqUZjy/DygWvjziz939t/rsqqfp8O
         9U8w==
X-Gm-Message-State: AOJu0Yz0O3MYs5NpME41/ia2L4PB1dezlAeYalmTYruTdFaLE9yCYN4+
	IK04YCrjkF+VvLIL23vKk99I9j/E+7QULk4F2v3VIJ9vg1j4YbWjdG8tOW9tpizreA==
X-Gm-Gg: AR+sD13XK5WwGmOuyEE9cbNWaYq+/wt7bvPPFj+U/l+xPn7S691fD8yjFzaiHIkvLaU
	KvvQPdxB+uOfXG3Z+yMY5K0cdTkqpv9uWZL/s9n8TZWqxg0vP6HPSj1WRTGbubirmIjdh1+0aGS
	CpppRa/9Tz9BREzeBMGCmZavoT6fcSz5miTdUprWRJ8jblnXTfvfAavLv5Ea8P1oyfOIm9xT4kj
	bcFUM7mM6by46czd/NLG2qYrcEYaXWW3UiahKYSW/tzmU2ucDBkQiIWRH/RivUUmfK8d81GNze0
	ZpyJeLQ1YHYBmQPXGCq1vq2LqL6QOWk4U+7+AC3aQcdrnRyhKFkC8AiOb+kPqtPQYO/rhB//0Ih
	bFCO9surR5Pj1a8HddYvyWqMgqpFiDlXrLYZrsDe/wmrHp0wq6ZCXm1t6g6i1iZpq6e1+l/yg1s
	MYPGDZ0t3iMpser5r037AsBXJ73ThcbhDw6WOud3fZK11FqJEdUkri9y4tBcQO4EEdqdc1mypi3
	7mtwtbKwbQdB3hvLHJPWhhAlDtU944dxPqc0pCyiokdtQjmW+smjlPzpa7j+WUJqPPUOm3Ecdet
	boXvF6vi0I6Si6gfGM/ezVinHlryDsGYqZzdBZl6IPM5ErgsmLQxoh7yY/Cf0A2HpplyA3ru89w
	OEvpxS9L01+SX6QUAeQQZy6l+i2j6RFE=
X-Received: by 2002:a17:907:6094:b0:c12:9eb4:48bc with SMTP id a640c23a62f3a-c1f1f087285mr244592866b.51.1785104383116;
        Sun, 26 Jul 2026 15:19:43 -0700 (PDT)
Received: from Desktop (p54affe4b.dip0.t-ipconnect.de. [84.175.254.75])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32a76fecsm561599466b.8.2026.07.26.15.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 15:19:42 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baochen.qiang@oss.qualcomm.com,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	rameshkumar.sundaram@oss.qualcomm.com
Subject: [PATCH ath-next v2 1/2] wifi: ath11k: implement CE interrupt enable/disable for AHB
Date: Mon, 27 Jul 2026 00:19:07 +0200
Message-ID: <20260726221908.104873-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260726221908.104873-1-julius@bairaktaris.de>
References: <20260726221908.104873-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_151945_201502_7920A0FD 
X-CRM114-Status: GOOD (  11.56  )
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

ath11k_core_reset() calls ath11k_hif_ce_irq_disable() right before it
powers the target down, but ath11k_ahb_hif_ops_ipq8074 never set the
ce_irq_enable/ce_irq_disable pair, and ath11k_hif_ce_irq_disable() does
nothing when the op is NULL. On AHB the copy engine interrupts and their
tasklets therefore stay live across rproc_shutdown(), where the register
space they touch is no longer accessible.

Wire the ops up. The sequence is the one ath11k_ahb_stop() already runs,
factored into a helper and reused, so behaviour on the stop path is
unchanged. wcn6750 is not affected: it uses the pcic ops, which
implement the pair already.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index f566d699d074..72da6919c277 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -391,12 +391,17 @@ static void ath11k_ahb_ext_irq_disable(struct ath11k_base *ab)
 	ath11k_ahb_sync_ext_irqs(ab);
 }
 
-static void ath11k_ahb_stop(struct ath11k_base *ab)
+static void ath11k_ahb_ce_irq_disable_sync(struct ath11k_base *ab)
 {
 	if (!test_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags))
 		ath11k_ahb_ce_irqs_disable(ab);
 	ath11k_ahb_sync_ce_irqs(ab);
 	ath11k_ahb_kill_tasklets(ab);
+}
+
+static void ath11k_ahb_stop(struct ath11k_base *ab)
+{
+	ath11k_ahb_ce_irq_disable_sync(ab);
 	timer_delete_sync(&ab->rx_replenish_retry);
 	ath11k_ce_cleanup_pipes(ab);
 }
@@ -773,6 +778,8 @@ static const struct ath11k_hif_ops ath11k_ahb_hif_ops_ipq8074 = {
 	.map_service_to_pipe = ath11k_ahb_map_service_to_pipe,
 	.power_down = ath11k_ahb_power_down,
 	.power_up = ath11k_ahb_power_up,
+	.ce_irq_enable = ath11k_ahb_ce_irqs_enable,
+	.ce_irq_disable = ath11k_ahb_ce_irq_disable_sync,
 };
 
 static const struct ath11k_hif_ops ath11k_ahb_hif_ops_wcn6750 = {
-- 
2.53.0


