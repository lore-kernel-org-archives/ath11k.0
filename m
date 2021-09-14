Return-Path: <SRS0=aNMw=OE=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 517D7C4321E
	for <ath11k@archiver.kernel.org>; Tue, 14 Sep 2021 16:43:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E50561151
	for <ath11k@archiver.kernel.org>; Tue, 14 Sep 2021 16:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1E50561151
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N9haA4B0pzbB70BKQ6Vt04oe36myCO9R/jj2zvCN6U8=; b=XamQPmfd6w/ttP
	x98b1onsmj96hNB/VQok+NzCbcv5aZvgYzm3t9y4wki/S/cRJ253pI8RHG48e15G9bW7voBEOzWka
	eLlr2jYfYagihMVH5mIuEXyu9ucF70INO4PcPQC0yWTztsqHqgdjx0KLjfsq1v/1U2nFfa0Fg60et
	qEsAndPxN3piMs4GBGbsnz0VgTOF15KZdUIbeyDaKN1OqbjTaJZBECqijRL91Ft7dlQAYwy30t8vu
	1gai3t9Z9e2K5hwHMO16zgMpzrHIoi5bY1YWSqlo6WTI6RURfCm8AP7X5Ifs+3puRqd+ziftinUgL
	/LgdHnwq8M0AjyJ0mqmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQBWT-006Tx3-7W; Tue, 14 Sep 2021 16:43:05 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQBWN-006TuX-NU
 for ath11k@lists.infradead.org; Tue, 14 Sep 2021 16:43:03 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631637782; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=RtHeM4fpoSVMko9E/IZR7kw3BPixXMNIElHptLzcLK0=;
 b=gDMIW8OunKgvhoXb2zAydl+qV7NpHupGhZmd0ZTrA2IzBUVpnXQKXgTgvS9bZRvRmCwBujWz
 4MabObCjJ/0xoJuOyx1To05Wy8d6mwFI2UZ9OXVS7HWPxJxZH0fymvvPrXQFz0GFMMJard/R
 kAZ8OoUZ/Riso9/Trb1ydg7objA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6140d0fabd6681d8edd5c0bb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 14 Sep 2021 16:42:34
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 87A7AC4360C; Tue, 14 Sep 2021 16:42:33 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-72-211-nat.elisa-mobile.fi
 [85.76.72.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BAEBCC4360D;
 Tue, 14 Sep 2021 16:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org BAEBCC4360D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Wen Gong <wgong@codeaurora.org>, Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 2/3] ath11k: indicate scan complete for scan canceled when
 scan running
Date: Tue, 14 Sep 2021 19:42:25 +0300
Message-Id: <20210914164226.38843-2-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914164226.38843-1-jouni@codeaurora.org>
References: <20210914164226.38843-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_094302_144000_65E36866 
X-CRM114-Status: GOOD (  16.52  )
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

From: Wen Gong <wgong@codeaurora.org>

ath11k prints "Received scan event for unknown vdev" when doing the
following test:
1. trigger scan
2. wait 0.2 second
3. iw reg set or 11d scan complete from firmware

Reason: When iw reg set or 11d scan complete, the new country code will
be set to the firmware, and the new regdomain info indicated to ath11k,
then the new channel list will be sent to the firmware. The firmware
will cancel the current scan after receiving WMI_SCAN_CHAN_LIST_CMDID
which is used for the new channel list, and the state of ath11k is
ATH11K_SCAN_RUNNING, then ath11k_get_ar_on_scan_abort() returns NULL and
ath11k_scan_event() returns at this point and does not indicate scan
completion to mac80211.

Indicate scan completion to mac80211 and get rid of the "Received scan
event for unknown vdev" print for the above case.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Wen Gong <wgong@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index d11022455d97..613362b28d8e 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -6289,8 +6289,9 @@ static void ath11k_mgmt_tx_compl_event(struct ath11k_base *ab, struct sk_buff *s
 	rcu_read_unlock();
 }
 
-static struct ath11k *ath11k_get_ar_on_scan_abort(struct ath11k_base *ab,
-						  u32 vdev_id)
+static struct ath11k *ath11k_get_ar_on_scan_state(struct ath11k_base *ab,
+						  u32 vdev_id,
+						  enum ath11k_scan_state state)
 {
 	int i;
 	struct ath11k_pdev *pdev;
@@ -6302,7 +6303,7 @@ static struct ath11k *ath11k_get_ar_on_scan_abort(struct ath11k_base *ab,
 			ar = pdev->ar;
 
 			spin_lock_bh(&ar->data_lock);
-			if (ar->scan.state == ATH11K_SCAN_ABORTING &&
+			if (ar->scan.state == state &&
 			    ar->scan.vdev_id == vdev_id) {
 				spin_unlock_bh(&ar->data_lock);
 				return ar;
@@ -6332,10 +6333,15 @@ static void ath11k_scan_event(struct ath11k_base *ab, struct sk_buff *skb)
 	 * aborting scan's vdev id matches this event info.
 	 */
 	if (scan_ev.event_type == WMI_SCAN_EVENT_COMPLETED &&
-	    scan_ev.reason == WMI_SCAN_REASON_CANCELLED)
-		ar = ath11k_get_ar_on_scan_abort(ab, scan_ev.vdev_id);
-	else
+	    scan_ev.reason == WMI_SCAN_REASON_CANCELLED) {
+		ar = ath11k_get_ar_on_scan_state(ab, scan_ev.vdev_id,
+						 ATH11K_SCAN_ABORTING);
+		if (!ar)
+			ar = ath11k_get_ar_on_scan_state(ab, scan_ev.vdev_id,
+							 ATH11K_SCAN_RUNNING);
+	} else {
 		ar = ath11k_mac_get_ar_by_vdev_id(ab, scan_ev.vdev_id);
+	}
 
 	if (!ar) {
 		ath11k_warn(ab, "Received scan event for unknown vdev");
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
