Return-Path: <SRS0=H079=MN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7491C6377B
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 21:21:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F96961208
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 21:21:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F96961208
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YpEJW9w8wwYFsVtWRu6vRyHsSIoICFme+mzxNiKhqvI=; b=PfYarCyVool7dE
	5pP46VxHg91jXn++O0/Ht/fdjJe3TtNF8bQax9rMyvVnAId00qxqcJoosYobgn5BELa+mj0EF7EDv
	0aCgYwzxlg5xdLtEe1sOS+d0GHmcAkQ3G+JS4Bhq0q03ar0bQot3etBQK5nu0+vSZqpBFShR1Ng/b
	FYGlA5fH7P0fKcjzXq4WplBTK8BCvHFSdsXmVlNkOuilpYpHUg465W7Uqhg0EEVK8nm2eRCzMzJIu
	wRzjcsSPMXC0sf17uTNBH4dIpgsVDmme28j1uNNhPXRUyPuHPQNZhHYw1A4C1p91S4eOAQvktOFCU
	Y6Sz/aCO3bduWmRf2Azw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6Jec-00HIfI-9Y; Wed, 21 Jul 2021 21:21:22 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6JeX-00HIMz-3w
 for ath11k@lists.infradead.org; Wed, 21 Jul 2021 21:21:20 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1626902478; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=+0gTMSpTe4VOdR/em1UPwDrws0mGZ8rGLV1xcfNcHsU=;
 b=m2jCOHkCVQF7T0X0KSWy0zBOI/+uaO8mlPH+Obwx1zxUJw5AFryVabz28pZz2QalrD2DhOvW
 /+06xXWrsbhK2An+p+NFU+mhe0hziBgtl15LS0hj/DdP5IFFCAiyIAWQcVWLqiUJo8phtszP
 AdsOHhDDfq2xFLHFcgRrciuKMJM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60f88fc5b653fbdadd8ee90e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Jul 2021 21:21:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 71C4FC43217; Wed, 21 Jul 2021 21:21:08 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-67-217-nat.elisa-mobile.fi
 [85.76.67.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4F76EC43217;
 Wed, 21 Jul 2021 21:21:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4F76EC43217
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Lavanya Suresh <lavaks@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 11/12] ath11k: Clear auth flag only for actual association in
 security mode
Date: Thu, 22 Jul 2021 00:20:28 +0300
Message-Id: <20210721212029.142388-11-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721212029.142388-1-jouni@codeaurora.org>
References: <20210721212029.142388-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_142119_149898_6ECFFD27 
X-CRM114-Status: GOOD (  16.17  )
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

From: Lavanya Suresh <lavaks@codeaurora.org>

AUTH flag is needed when peer assoc command is sent from the host in
security mode for non-assoc cases. The firmware will handle AUTH flag
when the client is associating as AUTH flag will be set after key
exchange. For internally provided peer assoc commands from the host,
there won't be any key exchange, so AUTH flag is expected to be set in
the host.

Signed-off-by: Lavanya Suresh <lavaks@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 3 +++
 drivers/net/wireless/ath/ath11k/wmi.c | 2 +-
 drivers/net/wireless/ath/ath11k/wmi.h | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 11276617a11f..5ab42324a564 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -2300,6 +2300,7 @@ static void ath11k_bss_assoc(struct ieee80211_hw *hw,
 
 	rcu_read_unlock();
 
+	peer_arg.is_assoc = true;
 	ret = ath11k_wmi_send_peer_assoc_cmd(ar, &peer_arg);
 	if (ret) {
 		ath11k_warn(ar->ab, "failed to run peer assoc for %pM vdev %i: %d\n",
@@ -3563,6 +3564,7 @@ static int ath11k_station_assoc(struct ath11k *ar,
 
 	ath11k_peer_assoc_prepare(ar, vif, sta, &peer_arg, reassoc);
 
+	peer_arg.is_assoc = true;
 	ret = ath11k_wmi_send_peer_assoc_cmd(ar, &peer_arg);
 	if (ret) {
 		ath11k_warn(ar->ab, "failed to run peer assoc for STA %pM vdev %i: %d\n",
@@ -3774,6 +3776,7 @@ static void ath11k_sta_rc_update_wk(struct work_struct *wk)
 			ath11k_peer_assoc_prepare(ar, arvif->vif, sta,
 						  &peer_arg, true);
 
+			peer_arg.is_assoc = false;
 			err = ath11k_wmi_send_peer_assoc_cmd(ar, &peer_arg);
 			if (err)
 				ath11k_warn(ar->ab, "failed to run peer assoc for STA %pM vdev %i: %d\n",
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 6d2696db1e07..5e196829ecf3 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -1762,7 +1762,7 @@ ath11k_wmi_copy_peer_flags(struct wmi_peer_assoc_complete_cmd *cmd,
 		cmd->peer_flags |= WMI_PEER_AUTH;
 	if (param->need_ptk_4_way) {
 		cmd->peer_flags |= WMI_PEER_NEED_PTK_4_WAY;
-		if (!hw_crypto_disabled)
+		if (!hw_crypto_disabled && param->is_assoc)
 			cmd->peer_flags &= ~WMI_PEER_AUTH;
 	}
 	if (param->need_gtk_2_way)
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 2587d22f42ce..e831d268db1d 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -3617,6 +3617,7 @@ struct peer_assoc_params {
 	u32 peer_he_tx_mcs_set[WMI_HOST_MAX_HE_RATE_SET];
 	bool twt_responder;
 	bool twt_requester;
+	bool is_assoc;
 	struct ath11k_ppe_threshold peer_ppet;
 };
 
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
