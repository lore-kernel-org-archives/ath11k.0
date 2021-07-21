Return-Path: <SRS0=H079=MN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 074A5C6377A
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 21:21:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C998561208
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 21:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C998561208
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e4uTO3WI+LhwaRjIygmf5CRlxqgWaOgvSJvEFo52nao=; b=KNikQ2dVOv6jz5
	vpR+aQ/4j74AozgWwS+Jm8pM5F1S5Ep/oGAiIK9cUpmcP+x93XDcZneTgJF5am0BpX2cU91p15KNt
	WIluNFUyld+Eyrpo/SkJe+MvHmPrQMdCAJcoHd9tSRGNknBc/SWz2EJhIF09EoQ9uIiWKYzqLtvcu
	DTuXqB7/P9aQRMJOgArLFKI1ju2wB87B2Eltja3Ofze4qpfS/BEk4CC+WJi2+rb1hQQSLKufvn0yE
	E+fSkFQoW0aMqQPwi7hta/50b5knXsjWscTr1FWdPOFzOI5exHu+zq8uceiKwkz858AZ1EDDRIDcp
	oEi0svKPWJWdFR6xPx+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6JeF-00HIOx-Io; Wed, 21 Jul 2021 21:20:59 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6JeA-00HIMz-1S
 for ath11k@lists.infradead.org; Wed, 21 Jul 2021 21:20:57 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1626902453; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=44i3k7KRseO7fQDHNOGdIgY16pq+Cv4pDFEAm8njjF8=;
 b=H+dlpjaqRqNJ6fwMMUExskp2wrkUsUOjKHlbf9GNMY8GbX3lsgWI9atFxVFN8g8UI0caDBT1
 SDJyoNXLnBBOnjunTVH54gWeIPtuOQTxSxGtV17/VPmAwifOpmAgVINzHFKQD0BE3SBvPo1V
 Bqut5d2qXJVsDBBL22cun8nmInM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60f88fb438fa9bfe9c2e1bbb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Jul 2021 21:20:52
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A2171C4338A; Wed, 21 Jul 2021 21:20:51 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-67-217-nat.elisa-mobile.fi
 [85.76.67.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3C195C433D3;
 Wed, 21 Jul 2021 21:20:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3C195C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Sriram R <srirrama@codeaurora.org>, Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 04/12] ath11k: Avoid race during regd updates
Date: Thu, 22 Jul 2021 00:20:21 +0300
Message-Id: <20210721212029.142388-4-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721212029.142388-1-jouni@codeaurora.org>
References: <20210721212029.142388-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_142054_219468_F613DA7B 
X-CRM114-Status: GOOD (  25.79  )
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

From: Sriram R <srirrama@codeaurora.org>

Whenever ath11k is bootup with a user country already set, cfg80211
notifies this country info to ath11k soon after registration, where the
notification is sent to the firmware for fetching the rules of this user
country input.

Multiple race conditions could be seen in this scenario where a new
request is either lost as pointed in [1] or a new regd overwrites the
default regd provided by the firmware during bootup. Note that, the
default regd is used for intersection purpose and hence it should not be
overwritten.

The main reason as pointed by [1] is the usage of ATH11K_FLAG_REGISTERED
flag which is updated after completion of core registration, whereas the
reg notification from cfg80211 and wmi events for the corresponding
request can happen much before that. Since the ATH11K_FLAG_REGISTERED is
currently used to determine if the event containing reg rules belong to
default regd or for user request, there is a possibility of the default
regd getting overwritten.

Since the default reg rules will be received only once per pdev on
firmware load, the above flag based check can be replaced with a check
to see if default_regd is already set, so that we can now always update
the new_regd. Also if the new_regd is set, this will be always used to
update the reg rules for the registered phy.

[1] https://patchwork.kernel.org/project/linux-wireless/patch/1829665.1PRlr7bOQj@ripper/

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01460-QCAHKSWPL_SILICONZ-1
Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")

Signed-off-by: Sriram R <srirrama@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c |  2 +-
 drivers/net/wireless/ath/ath11k/reg.c | 11 ++++++-----
 drivers/net/wireless/ath/ath11k/reg.h |  2 +-
 drivers/net/wireless/ath/ath11k/wmi.c | 16 ++++++----------
 4 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 55bc45f8fe92..7751ecb2ad81 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -7558,7 +7558,7 @@ static int __ath11k_mac_register(struct ath11k *ar)
 		ar->hw->wiphy->interface_modes &= ~BIT(NL80211_IFTYPE_MONITOR);
 
 	/* Apply the regd received during initialization */
-	ret = ath11k_regd_update(ar, true);
+	ret = ath11k_regd_update(ar);
 	if (ret) {
 		ath11k_err(ar->ab, "ath11k regd update failed: %d\n", ret);
 		goto err_unregister_hw;
diff --git a/drivers/net/wireless/ath/ath11k/reg.c b/drivers/net/wireless/ath/ath11k/reg.c
index e1a1df169034..92c59009a8ac 100644
--- a/drivers/net/wireless/ath/ath11k/reg.c
+++ b/drivers/net/wireless/ath/ath11k/reg.c
@@ -198,7 +198,7 @@ static void ath11k_copy_regd(struct ieee80211_regdomain *regd_orig,
 		       sizeof(struct ieee80211_reg_rule));
 }
 
-int ath11k_regd_update(struct ath11k *ar, bool init)
+int ath11k_regd_update(struct ath11k *ar)
 {
 	struct ieee80211_regdomain *regd, *regd_copy = NULL;
 	int ret, regd_len, pdev_id;
@@ -209,7 +209,10 @@ int ath11k_regd_update(struct ath11k *ar, bool init)
 
 	spin_lock_bh(&ab->base_lock);
 
-	if (init) {
+	/* Prefer the latest regd update over default if it's available */
+	if (ab->new_regd[pdev_id]) {
+		regd = ab->new_regd[pdev_id];
+	} else {
 		/* Apply the regd received during init through
 		 * WMI_REG_CHAN_LIST_CC event. In case of failure to
 		 * receive the regd, initialize with a default world
@@ -222,8 +225,6 @@ int ath11k_regd_update(struct ath11k *ar, bool init)
 				    "failed to receive default regd during init\n");
 			regd = (struct ieee80211_regdomain *)&ath11k_world_regd;
 		}
-	} else {
-		regd = ab->new_regd[pdev_id];
 	}
 
 	if (!regd) {
@@ -683,7 +684,7 @@ void ath11k_regd_update_work(struct work_struct *work)
 					 regd_update_work);
 	int ret;
 
-	ret = ath11k_regd_update(ar, false);
+	ret = ath11k_regd_update(ar);
 	if (ret) {
 		/* Firmware has already moved to the new regd. We need
 		 * to maintain channel consistency across FW, Host driver
diff --git a/drivers/net/wireless/ath/ath11k/reg.h b/drivers/net/wireless/ath/ath11k/reg.h
index 65d56d44796f..5fb9dc03a74e 100644
--- a/drivers/net/wireless/ath/ath11k/reg.h
+++ b/drivers/net/wireless/ath/ath11k/reg.h
@@ -31,6 +31,6 @@ void ath11k_regd_update_work(struct work_struct *work);
 struct ieee80211_regdomain *
 ath11k_reg_build_regd(struct ath11k_base *ab,
 		      struct cur_regulatory_info *reg_info, bool intersect);
-int ath11k_regd_update(struct ath11k *ar, bool init);
+int ath11k_regd_update(struct ath11k *ar);
 int ath11k_reg_update_chan_list(struct ath11k *ar);
 #endif
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 6880c7527df8..43344e774a31 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -5896,10 +5896,10 @@ static int ath11k_reg_chan_list_event(struct ath11k_base *ab, struct sk_buff *sk
 	}
 
 	spin_lock(&ab->base_lock);
-	if (test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags)) {
-		/* Once mac is registered, ar is valid and all CC events from
-		 * fw is considered to be received due to user requests
-		 * currently.
+	if (ab->default_regd[pdev_idx]) {
+		/* The initial rules from FW after WMI Init is to build
+		 * the default regd. From then on, any rules updated for
+		 * the pdev could be due to user reg changes.
 		 * Free previously built regd before assigning the newly
 		 * generated regd to ar. NULL pointer handling will be
 		 * taken care by kfree itself.
@@ -5909,13 +5909,9 @@ static int ath11k_reg_chan_list_event(struct ath11k_base *ab, struct sk_buff *sk
 		ab->new_regd[pdev_idx] = regd;
 		ieee80211_queue_work(ar->hw, &ar->regd_update_work);
 	} else {
-		/* Multiple events for the same *ar is not expected. But we
-		 * can still clear any previously stored default_regd if we
-		 * are receiving this event for the same radio by mistake.
-		 * NULL pointer handling will be taken care by kfree itself.
+		/* This regd would be applied during mac registration and is
+		 * held constant throughout for regd intersection purpose
 		 */
-		kfree(ab->default_regd[pdev_idx]);
-		/* This regd would be applied during mac registration */
 		ab->default_regd[pdev_idx] = regd;
 	}
 	ab->dfs_region = reg_info->dfs_region;
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
