Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9934C531D0
	for <ath11k@archiver.kernel.org>; Sat, 25 Jul 2026 14:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ge+jXIVUKhk6GV/kwzJHJ1+CtR1D1neebkAxki5LZgA=; b=QS8gY29a1AlJUioHnpYX2qRzFr
	Ih2C3K0OW1ASIB4vpTCebqA0HDnftLCTEr42hyN1UABYg6KzupSYA81nVryzXEuBycVtsny/nCp6t
	k6LovMSAqfh5vbwVQ0Gy4Q7TK6Akq5uFhA44CASoz0uCCaJ9cKTbxT+9PrClO+8Pi9Hw7LURI6SWE
	zkgRA9T5FiQQv0LbZLlO1QquXNKp3wi/XG4NINaO/LdR3h4jmm+YdQTYkwIpnH228eeQWmz9TEN9Q
	PV0QThJJIrES6yd25RYlwT5haXTZkjLX79EKoMZ0Sg1reNXWUzM+pMJHWrpsHIMmoezqWZ3rWC51O
	Hm8V4C8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wndD1-00000000QqF-0k94;
	Sat, 25 Jul 2026 14:18:35 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wndCy-00000000Qp9-0caq
	for ath11k@lists.infradead.org;
	Sat, 25 Jul 2026 14:18:33 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-69e08ad526cso1384442a12.1
        for <ath11k@lists.infradead.org>; Sat, 25 Jul 2026 07:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1784989110; x=1785593910; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ge+jXIVUKhk6GV/kwzJHJ1+CtR1D1neebkAxki5LZgA=;
        b=wEnOL38maN7LZ/IUjGfgbKWJufzZ1CSxyy1c5cNv6tO+b/XcBbqUckC368Ck/3WVI2
         y86iNixnYrJWhWZfcD40yH5dbQTajw0HAs2JXALlNk0tXonSWdDf38lyo2ReQenNeeu9
         4UTTIUPf3cVwRu3Rlsb7lTM3EOUUHRzSZwVSOX8rwe5sXadzF2h8nLPvCLVp9y5uHpJY
         Tf8M0R62JMyHTyBX8yKsVmkBVnggnk5+tpGz8C9Zg9iRUuxJfnRFDBsBf1x8mATh/ddE
         MIrpgus7M54CnclJAwl6y7ontY6WVyk3ntnFTJi+h0yDM2OTYB7CuTn1zgj5/QUMVKMf
         K1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784989110; x=1785593910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ge+jXIVUKhk6GV/kwzJHJ1+CtR1D1neebkAxki5LZgA=;
        b=ThDY1Bn3QiihVeS281Nj43dwVtR9PrVaaB+wc2A/6NkhDB4UadV3N7f24ESIBPmneA
         F6bCvnCakVhBJBtheRm+yhTvJ5CbiZAtMSd3ZUoDQH3AHEm7PND8Rm/howu7J/5AWFLf
         WhGXlhehrN9WDLqwebpG8QKeWQaLGLRlsZUS6srMgWK762WkByCyiROECCjw6HrbsHxu
         LhQRRQefmqXWEauDuBm5/7k0kXx9newqPUVwzro73/Q0crwA/q849kI0UQHcKozgmcva
         Nj2xaemdNMZ4now/e1lVPt+ZQuHJzQ8MyEDrrh3qYyhmxWVk5Qu9Dg95U0FI8U7d85UQ
         TRCQ==
X-Gm-Message-State: AOJu0YyFXA6StWgBkcM6pupOAcbATdUvgqJKl9vQq/LsMsCTcxWMz5KC
	dN0chuMOr9Ysba3S/YY6NTxu5ROfJNqMB0p+++yXOZ33xO8egNlak2xHiHXQM+XhgQ==
X-Gm-Gg: AR+sD12OIScvAdn1Z8LXwahLsS9Q1/LjxUw6Fhu/n3wBKL5o6vD3trnYjS+tx6YTuxo
	Y85cpqX+hwwESa0j3NArM7BjkWTW8Q8XabOUFR31gfc7fxSePbL1CXtoSkhNOPNhMa/lprZKCqP
	W8G5FWcvHgs/hS4CKlU+abZ4w7SJom0mxbi+rrr+zIMZayWFWPjV4nZ49NJX6IjuxmP1YGqmkai
	pxRUTw+mRBtItAQlStpSYolAAWoRb4enXaw3RtgaMXr40yXKDOSam4foGud2vIDNRoMf8MaozTp
	yPEY+zefMU77Ds67ruHh/173n9vHnoLUHlLMusC2zmr2KJFg+NEOZJ+QKmKVA32nXe675AS8cln
	h7yUEkG0ioM69N6Jv0A0o3FzDPo8EB8VSWblegM8PR68yB2E0EGvO0u+AkpN3yltlf7HcbzKciA
	dDVzVqBJCdxpKGYhVMd++j4kpeSFYj5zsMayncyPEAoTuLunoYVWsNOp6iWnhQ57or0Uhn2QmS4
	a6/BCOzeXnK2V7qJDvQONEkPSoS1GCW6V19C7BeL9XNZqC0H0pS0bMMU5Ni08P/kad4VOgtPylL
	+nUXxXaUInb2UHV2fusrjEQP8dJrI3aELs5Umz6v4JfsWpU9o18pRWBPyHcISAJy2DwjBEu5aQp
	tqhylOaC0HByz+inJ5lecoB8dX2uryfg=
X-Received: by 2002:a05:6402:1f4d:b0:697:564c:9095 with SMTP id 4fb4d7f45d1cf-69fc115f3a7mr1011176a12.21.1784989110217;
        Sat, 25 Jul 2026 07:18:30 -0700 (PDT)
Received: from Desktop (p54aff063.dip0.t-ipconnect.de. [84.175.240.99])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb594622asm894010a12.26.2026.07.25.07.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 07:18:29 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: [PATCH ath-next 1/2] wifi: ath11k: implement CE interrupt enable/disable for AHB
Date: Sat, 25 Jul 2026 16:17:56 +0200
Message-ID: <20260725141757.1316877-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260725141757.1316877-1-julius@bairaktaris.de>
References: <20260725141757.1316877-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_071832_203162_BF9B380B 
X-CRM114-Status: GOOD (  11.24  )
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


