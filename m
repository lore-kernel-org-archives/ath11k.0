Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E20EE14D3
	for <ath11k@archiver.kernel.org>; Thu,  7 Sep 2023 08:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FDHwxqAk/5ZEqmgpB2+u6Cl6J6zfP8QZsS80c8RjHxs=; b=REB505osVpf8Mg
	sTDllsDzaRbSdFX10ZhUS2H4Dk2ififxg9d5rzmx/gsHyVmj/su+m3xo9EqpScGoJTm7nX2VJlr05
	hho0DCqLzrot7ogYhRmzTVSP6TKXl0MTEggzP+vkiPTfX0+Diwjrr+nyK5+47vugMmsZZgzNLQaFJ
	tqIW9I5FmR9tyi2uF7HGRqS7+7F52vh4W/j2LAYwhMBPz8V4vKySmjWoKOBwVmh+d9XWBK/8T5dKs
	LB2XTICPsHfize5ePjs/YUl4kyva2IhgkcP4JyHEiOEyvczT/Uj+DoTrCvQhUb1bgEGm3JHdNQw6k
	Iw0zvsAphxTZiScG7cfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeAXh-00BbYh-2H;
	Thu, 07 Sep 2023 08:39:13 +0000
Received: from forward100b.mail.yandex.net ([2a02:6b8:c02:900:1:45:d181:d100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeAXe-00BbXf-1D
	for ath11k@lists.infradead.org;
	Thu, 07 Sep 2023 08:39:12 +0000
Received: from mail-nwsmtp-smtp-production-main-44.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-44.sas.yp-c.yandex.net [IPv6:2a02:6b8:c14:440b:0:640:fa3a:0])
	by forward100b.mail.yandex.net (Yandex) with ESMTP id 49EDF600F1;
	Thu,  7 Sep 2023 11:39:01 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-44.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id xcUAm5CDg0U0-FaGNTqKz;
	Thu, 07 Sep 2023 11:39:00 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1694075940; bh=9FbNb2hLEj+l+n3nB2/nkJfvnnk4vB2t5rmfg+pfk6A=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=k6xHiEX5h6bpjINRmBzThT6OJ828aE4kgDuAm1lz4Ow29UEZT82ei8lDX/mARY1lS
	 huw4YYovRAeaWm0lZjghFGeZhRshS9sxoQReigP1ixPRpOb13y+D1ixqvnAlGicpnX
	 MigZ4fSKidTOXQ183PpikA8Y+WFFo+JY8UdS0tkg=
Authentication-Results: mail-nwsmtp-smtp-production-main-44.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org,
	lvc-project@linuxtesting.org,
	ath11k@lists.infradead.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] wifi: ath11k: drop NULL pointer check in ath11k_dp_rx_mon_dest_process()
Date: Thu,  7 Sep 2023 11:38:38 +0300
Message-ID: <20230907083852.10775-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_013910_903500_9920CDF5 
X-CRM114-Status: UNSURE (   6.15  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Since 'srng_list' is a fixed-size array of 'struct hal_srng'
in 'struct ath11_hal', any of its member can't be NULL and
so relevant check may be dropped.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 146201d8dba2..4463e308968c 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -5094,13 +5094,6 @@ static void ath11k_dp_rx_mon_dest_process(struct ath11k *ar, int mac_id,
 
 	mon_dst_srng = &ar->ab->hal.srng_list[ring_id];
 
-	if (!mon_dst_srng) {
-		ath11k_warn(ar->ab,
-			    "HAL Monitor Destination Ring Init Failed -- %p",
-			    mon_dst_srng);
-		return;
-	}
-
 	spin_lock_bh(&pmon->mon_lock);
 
 	ath11k_hal_srng_access_begin(ar->ab, mon_dst_srng);
-- 
2.41.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
