Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8275CC7EE43
	for <ath11k@archiver.kernel.org>; Thu, 24 Aug 2023 07:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zjDYTfADHFwIYteYepgA/39wsY6vT5MeCWNVOmAfNI0=; b=LMUJ/sWzKdFPt2
	ajS4R1QiLDE8xbQ6Wc7dT7f+BCLcNEaCwRMTQXAN/9qjFqrpQRC6qNjnSm5Q8GseHpc4maHQqIjrJ
	8vypuYP5XG349fpx3SFLmBLA7QcZENvOZzpS3Tm9F8YWgzxSIBi3W3/JYMXMbDYEx8GJ577SINnSJ
	A1kkP+XYCkL8mw4El6xb/Nkkl/Cx1gHJtTnJB/KZitiXDLDqZbzMeT8IwAw3nuLUPf4DcqVifqy+N
	gV/pGzQzlHRbcrUNx9s4/jw6mRt8fsAU2jyd05yVsae9nu+I7wOzq6MUGSKcD9s6KS4ZnyXQ7RQtz
	fl144IxO7HzkFMYTCb7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5BI-002TS2-0o;
	Thu, 24 Aug 2023 07:55:04 +0000
Received: from forward103b.mail.yandex.net ([2a02:6b8:c02:900:1:45:d181:d103])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5BB-002TPh-1K
	for ath11k@lists.infradead.org;
	Thu, 24 Aug 2023 07:55:02 +0000
Received: from mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:1e2b:0:640:94b5:0])
	by forward103b.mail.yandex.net (Yandex) with ESMTP id B236360021;
	Thu, 24 Aug 2023 10:54:53 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id nsFdET9WwmI0-vGuxbnum;
	Thu, 24 Aug 2023 10:54:53 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1692863693;
	bh=t8sVbi/v2uwfYixKvm61hfDLATHIxHUnHyobe5AgHLw=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=K1LAwCOjdjvrzVCuEoLpzlWiN0bVe/9cyzWGSfeCC99J0pOeoMdjWXAa1bMoqvrPc
	 8mqPTroRt4HyekdyXGDwMoqqvr1tvId3aGe8anQioOOMt5S1DFa31jO3QbnvnUzkAc
	 ZAzUvlxHxnj3Ha0VS5ltQEjkYQId4XenM5TC2jkw=
Authentication-Results: mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>,
	Tom Rix <trix@redhat.com>,
	linux-wireless@vger.kernel.org,
	lvc-project@linuxtesting.org,
	ath11k@lists.infradead.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH 5/5] wifi: ath11k: fix stack usage of ath11k_mac_op_remain_on_channel()
Date: Thu, 24 Aug 2023 10:50:48 +0300
Message-ID: <20230824075121.121144-5-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230824075121.121144-1-dmantipov@yandex.ru>
References: <20230824075121.121144-1-dmantipov@yandex.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_005458_566810_752A9715 
X-CRM114-Status: GOOD (  11.02  )
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

When compiling with clang 16.0.6, I've noticed the following:

drivers/net/wireless/ath/ath11k/mac.c:8900:12: warning: stack frame
size (1032) exceeds limit (1024) in 'ath11k_mac_op_remain_on_channel'
[-Wframe-larger-than]
static int ath11k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
           ^
68/1032 (6.59%) spills, 964/1032 (93.41%) variables

So switch to kzalloc()'ed instance of 'struct scan_req_params' and
adjust the function in subject accordingly.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/net/wireless/ath/ath11k/mac.c | 44 +++++++++++++++------------
 1 file changed, 25 insertions(+), 19 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 2aadf2c387b6..3e2983d30a5a 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -8905,7 +8905,7 @@ static int ath11k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
 {
 	struct ath11k *ar = hw->priv;
 	struct ath11k_vif *arvif = (void *)vif->drv_priv;
-	struct scan_req_params arg;
+	struct scan_req_params *arg;
 	int ret;
 	u32 scan_time_msec;
 
@@ -8937,27 +8937,31 @@ static int ath11k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
 
 	scan_time_msec = ar->hw->wiphy->max_remain_on_channel_duration * 2;
 
-	memset(&arg, 0, sizeof(arg));
-	ath11k_wmi_start_scan_init(ar, &arg);
-	arg.num_chan = 1;
-	arg.chan_list = kcalloc(arg.num_chan, sizeof(*arg.chan_list),
-				GFP_KERNEL);
-	if (!arg.chan_list) {
+	arg = kzalloc(sizeof(*arg), GFP_KERNEL);
+	if (!arg) {
 		ret = -ENOMEM;
 		goto exit;
 	}
+	ath11k_wmi_start_scan_init(ar, arg);
+	arg->num_chan = 1;
+	arg->chan_list = kcalloc(arg->num_chan, sizeof(*arg->chan_list),
+				 GFP_KERNEL);
+	if (!arg->chan_list) {
+		ret = -ENOMEM;
+		goto free_arg;
+	}
 
-	arg.vdev_id = arvif->vdev_id;
-	arg.scan_id = ATH11K_SCAN_ID;
-	arg.chan_list[0] = chan->center_freq;
-	arg.dwell_time_active = scan_time_msec;
-	arg.dwell_time_passive = scan_time_msec;
-	arg.max_scan_time = scan_time_msec;
-	arg.scan_flags |= WMI_SCAN_FLAG_PASSIVE;
-	arg.scan_flags |= WMI_SCAN_FILTER_PROBE_REQ;
-	arg.burst_duration = duration;
-
-	ret = ath11k_start_scan(ar, &arg);
+	arg->vdev_id = arvif->vdev_id;
+	arg->scan_id = ATH11K_SCAN_ID;
+	arg->chan_list[0] = chan->center_freq;
+	arg->dwell_time_active = scan_time_msec;
+	arg->dwell_time_passive = scan_time_msec;
+	arg->max_scan_time = scan_time_msec;
+	arg->scan_flags |= WMI_SCAN_FLAG_PASSIVE;
+	arg->scan_flags |= WMI_SCAN_FILTER_PROBE_REQ;
+	arg->burst_duration = duration;
+
+	ret = ath11k_start_scan(ar, arg);
 	if (ret) {
 		ath11k_warn(ar->ab, "failed to start roc scan: %d\n", ret);
 
@@ -8983,7 +8987,9 @@ static int ath11k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
 	ret = 0;
 
 free_chan_list:
-	kfree(arg.chan_list);
+	kfree(arg->chan_list);
+free_arg:
+	kfree(arg);
 exit:
 	mutex_unlock(&ar->conf_mutex);
 	return ret;
-- 
2.41.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
