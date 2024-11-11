Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3C3D12D7C
	for <ath11k@archiver.kernel.org>; Mon, 11 Nov 2024 07:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hnc4rXZBLyzhprBfCHAiUnNWF9Eu9HutM4xBiFwPAI8=; b=RaZb2H7okSH3nvviP5efXE8Cn5
	tS0u6JhkJp4ehB78jk8UUtjynldQOFEjvSDlLXDXfo03fLnIxZ7KGw3JXG5HsZQcMiSNY6yKC+kdc
	B7JuxLeN+6ltfSQyXkF/a/dlfgk3sZilG9TZUHCdNY1z4J80dnFsYwY8QX+vUpwn6CZhLJ+1rY/Vk
	YbrhG5E5Mt+0xAKqCZ2qCX4ux5cWc0NdXCAu4kxAN5Gfh1EBERVXttuAVHwLZzIEWTWzyQ1uf6Qcm
	IiX1Scp5nWhUMtLD8f4ZwUqmTsehr96TAGAlJdQsbEco5/HvMiyDX/BnIXH4S/vjT5BO8QWcQp61N
	cF7otDZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOTm-0000000GYtW-1utw;
	Mon, 11 Nov 2024 07:04:54 +0000
Received: from forward103a.mail.yandex.net ([178.154.239.86])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAORA-0000000GYRy-1mJR
	for ath11k@lists.infradead.org;
	Mon, 11 Nov 2024 07:02:16 +0000
Received: from mail-nwsmtp-smtp-production-main-31.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-31.vla.yp-c.yandex.net [IPv6:2a02:6b8:c0f:26bf:0:640:efa0:0])
	by forward103a.mail.yandex.net (Yandex) with ESMTPS id C2E2660EF0;
	Mon, 11 Nov 2024 10:02:04 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-31.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 22g22h1xFKo0-govi4NYx;
	Mon, 11 Nov 2024 10:02:04 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1731308524; bh=Hnc4rXZBLyzhprBfCHAiUnNWF9Eu9HutM4xBiFwPAI8=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=JMshykj2z7wKGhgi99RUU8xHKyDQfHQA0w8MuCpSXgCmgUHzB1k85O6E/ETwbI6nv
	 fqOZdu5BLlS8TPCgZhllYRH9bp48TYCdhz2UnRtr3whsFT7OcsI7Yl9mj1Tj9ussmy
	 NMf1m23mU9RvtD8krcDEWFtE21c7uZ7yXqSfCcJM=
Authentication-Results: mail-nwsmtp-smtp-production-main-31.vla.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH v2 3/4] wifi: ath11k: cleanup struct ath11k_mon_data
Date: Mon, 11 Nov 2024 10:01:51 +0300
Message-ID: <20241111070152.85140-3-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241111070152.85140-1-dmantipov@yandex.ru>
References: <20241111070152.85140-1-dmantipov@yandex.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_230213_007496_37FF6F4A 
X-CRM114-Status: UNSURE (   8.91  )
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

Remove initialized but otherwise unused 'rx_status_q' member of
'struct ath11k_mon_data' and adjust 'ath11k_dp_rx_pdev_mon_status_attach'
accordingly. Compile tested only.

Fixes: 67a9d399fcb0 ("ath11k: enable RX PPDU stats in monitor co-exist mode")
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
v2: join the series
---
 drivers/net/wireless/ath/ath11k/dp.h    | 1 -
 drivers/net/wireless/ath/ath11k/dp_rx.c | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 65d2bc0687c8..f777314db8b3 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -165,7 +165,6 @@ struct ath11k_mon_data {
 	struct ath11k_pdev_mon_stats rx_mon_stats;
 	/* lock for monitor data */
 	spinlock_t mon_lock;
-	struct sk_buff_head rx_status_q;
 };
 
 struct ath11k_pdev_dp {
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 40088e62572e..81bc93e2d05c 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -5705,8 +5705,6 @@ static int ath11k_dp_rx_pdev_mon_status_attach(struct ath11k *ar)
 	struct ath11k_pdev_dp *dp = &ar->dp;
 	struct ath11k_mon_data *pmon = (struct ath11k_mon_data *)&dp->mon_data;
 
-	skb_queue_head_init(&pmon->rx_status_q);
-
 	pmon->mon_ppdu_status = DP_PPDU_STATUS_START;
 
 	memset(&pmon->rx_mon_stats, 0,
-- 
2.47.0


