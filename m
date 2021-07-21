Return-Path: <SRS0=H079=MN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1573EC12002
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 16:21:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C866960FF3
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 16:21:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C866960FF3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uZvULuffGuOCS0HwFTMy1vvZMCXfeHWrzMfm5vdi8xQ=; b=wZuPBpuXNOh1fO
	K7DGSVLl6ZOTzsAR/6Hus0va2IIePKSvGKBEqPSpamqq9iR9UB1mtwREKWtvyTONLatlc9dXapLA0
	1BoypllN/jMyvD7D58FjDzd7YYXY8cFIWfK3DJvRkT8/VbwdH7T/czuMaXdpmqNOAv3btvyOXJ8MH
	buLDAr3HhrOCa9sGNFgZ1hF3KJPaZnQU9BctJp5vx3Ix7hdGX/658DH2FOtLZedOuUH2cPvr3XB6m
	W1rYMzT70aNdxzha8py7xC1y3S4CTtojVz/Gx0wk7T3olmla8tvqtHkHEjX/G3zQ4jINl6qWcXLct
	IzBs//U2cIDSYuI9a3vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6EyX-00GWvz-91; Wed, 21 Jul 2021 16:21:37 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6EyQ-00GWte-5C
 for ath11k@lists.infradead.org; Wed, 21 Jul 2021 16:21:33 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1626884492; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=A6BZ3p6EYEjd7TuwKM8E0XBm/Q5zNJxBvboS6vabeFI=;
 b=l8Fwo2dMcrslq34ND7g7RNiALaXqhHoBN9CmwKA0nKBfW/hDWNpdPNRxUEan2jrAxQvkLmyC
 VVyw4wHDx0IEvae3otVwec/O89Vls0pOhx+eZBJawd4xrnZMqN8IGkgK7lul8uIKAwAhd8UQ
 x5zZUmsVHmso+oPB37ElINQKNG0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60f8497de31d882d18d61054 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Jul 2021 16:21:17
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id CB4A1C43460; Wed, 21 Jul 2021 16:21:16 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-67-217-nat.elisa-mobile.fi
 [85.76.67.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8ECBCC433F1;
 Wed, 21 Jul 2021 16:21:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8ECBCC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Seevalamuthu Mariappan <seevalam@codeaurora.org>,
 Miles Hu <milehu@codeaurora.org>,
 Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 1/3] ath11k: move static function ath11k_mac_vdev_setup_sync
 to top
Date: Wed, 21 Jul 2021 19:20:51 +0300
Message-Id: <20210721162053.46290-2-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721162053.46290-1-jouni@codeaurora.org>
References: <20210721162053.46290-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_092132_236115_CC4B4F96 
X-CRM114-Status: GOOD (  12.43  )
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

From: Seevalamuthu Mariappan <seevalam@codeaurora.org>

This is to prepare for monitor mode clean up.
No functional changes are done.

Co-developed-by: Miles Hu <milehu@codeaurora.org>
Signed-off-by: Miles Hu <milehu@codeaurora.org>
Co-developed-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Signed-off-by: Seevalamuthu Mariappan <seevalam@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 28 +++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index e8da4af82221..3fd9a79801cb 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -731,6 +731,20 @@ static int ath11k_monitor_vdev_up(struct ath11k *ar, int vdev_id)
 	return 0;
 }
 
+static inline int ath11k_mac_vdev_setup_sync(struct ath11k *ar)
+{
+	lockdep_assert_held(&ar->conf_mutex);
+
+	if (test_bit(ATH11K_FLAG_CRASH_FLUSH, &ar->ab->dev_flags))
+		return -ESHUTDOWN;
+
+	if (!wait_for_completion_timeout(&ar->vdev_setup_done,
+					 ATH11K_VDEV_SETUP_TIMEOUT_HZ))
+		return -ETIMEDOUT;
+
+	return ar->last_wmi_vdev_start_status ? -EINVAL : 0;
+}
+
 static int ath11k_mac_op_config(struct ieee80211_hw *hw, u32 changed)
 {
 	/* mac80211 requires this op to be present and that's why
@@ -5165,20 +5179,6 @@ static void ath11k_mac_op_remove_chanctx(struct ieee80211_hw *hw,
 	mutex_unlock(&ar->conf_mutex);
 }
 
-static inline int ath11k_mac_vdev_setup_sync(struct ath11k *ar)
-{
-	lockdep_assert_held(&ar->conf_mutex);
-
-	if (test_bit(ATH11K_FLAG_CRASH_FLUSH, &ar->ab->dev_flags))
-		return -ESHUTDOWN;
-
-	if (!wait_for_completion_timeout(&ar->vdev_setup_done,
-					 ATH11K_VDEV_SETUP_TIMEOUT_HZ))
-		return -ETIMEDOUT;
-
-	return ar->last_wmi_vdev_start_status ? -EINVAL : 0;
-}
-
 static int
 ath11k_mac_vdev_start_restart(struct ath11k_vif *arvif,
 			      const struct cfg80211_chan_def *chandef,
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
