Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981E2C531D0
	for <ath11k@archiver.kernel.org>; Mon, 27 Jul 2026 16:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=62rAS9o8lPD0uvuFiOpTFU1QK9qOtWTB+oe/74fa6Q8=; b=p3P7XolrDSo0H+pX+TLTOaAkKT
	CeqDTnUEd2+R+42fqpoCyNvTonFFe3JSrPChOefZtgR8smHEzMi90y4hmv7DzgaVm9G93sA+ARdnH
	ChLiH9VcdkhrrhHFPC5jQOf3F/XegB/nXkRwZeuQipryhGZRUsTyXfQpwsbJ9PIjBaOUI7+Z0lg3y
	Y1s0vB1RHcDC9Qy1bsdcB8TioZ6vYFzjssPsK9Bvy1lD2lZlyOdkduNSawRXxHbiFOzkPerO6Y0Sj
	bl+E/AbCpL9BqQMYGXdQ1kxY4i/d/NLratiFTFtFAZF+sDLD+s4Prure+jJmNkIAzsx5swZGx7Xrp
	kvdjw0ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOBw-00000003KWh-0OdS;
	Mon, 27 Jul 2026 16:28:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOBn-00000003KMl-2wmR
	for ath11k@lists.infradead.org;
	Mon, 27 Jul 2026 16:28:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785169706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=62rAS9o8lPD0uvuFiOpTFU1QK9qOtWTB+oe/74fa6Q8=;
	b=foe1LuLGTN9HmFiFLlpwCIwQUaRGtQnXAxhiFtmsKP5HqVdQdWzkFS90qEdzNX4d0VmPOU
	rxEMTVlXnJhkqq2mD6kY88cXfIALe7OUNYTKNXMIXIC+9NxXA5stazfismntIa1aYrl1uD
	CTNMFAwzKhM1MuqQ83Qb/5JxzITOI2c=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-483-gbwE-AkZMZqF0wFeXLywPw-1; Mon,
 27 Jul 2026 12:28:23 -0400
X-MC-Unique: gbwE-AkZMZqF0wFeXLywPw-1
X-Mimecast-MFC-AGG-ID: gbwE-AkZMZqF0wFeXLywPw_1785169702
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0CF4118001F9;
	Mon, 27 Jul 2026 16:28:22 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.32.58])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E4813429;
	Mon, 27 Jul 2026 16:28:19 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH 5/5] wifi: ath12k: skip connection_loss_work for MLO beacon miss
Date: Mon, 27 Jul 2026 18:27:48 +0200
Message-ID: <20260727162748.963275-6-jtornosm@redhat.com>
In-Reply-To: <20260727162748.963275-1-jtornosm@redhat.com>
References: <20260727162748.963275-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: kGk-9A9g-2vIprXJA4xalNsiN-KJjkw-vguOLm9Brf4_1785169702
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_092827_856668_DEE334F9 
X-CRM114-Status: GOOD (  10.08  )
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

When firmware reports a beacon miss, ath12k queues connection_loss_work
as a 3-second backup timer that forces a full VIF disconnect via
ieee80211_connection_loss(). This work can only be cancelled when a
beacon frame arrives through WMI in ath12k_mac_handle_beacon_iter().

In MLO, this mechanism causes periodic spurious disconnections because
the firmware does not reliably forward beacon frames to the host via
WMI, making the cancellation path ineffective. The result is a full
VIF disconnect every ~16 seconds during normal MLO operation, easily
reproducible under heavy traffic.

Skip queueing connection_loss_work for MLO VIFs. The mac80211 AP probe
triggered by ieee80211_beacon_loss() is sufficient to detect real AP
unreachability. Other MLO-capable drivers such as mt76 and rtw89
similarly rely on ieee80211_beacon_loss() without adding a backup
disconnect timer.

Tested on WCN7850 with MLO (Wi-Fi 7).

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index af09153ad9d9..dfd69822c5ce 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -2008,9 +2008,16 @@ void ath12k_mac_handle_beacon_miss(struct ath12k *ar,
 	 * (done by mac80211) succeeds but beacons do not resume then it
 	 * doesn't make sense to continue operation. Queue connection loss work
 	 * which can be cancelled when beacon is received.
+	 *
+	 * Skip for MLO because connection_loss_work disconnects the entire
+	 * VIF based on a single link's beacon miss, and its cancellation
+	 * mechanism (beacon reception via WMI) is unreliable. The mac80211
+	 * probe triggered by ieee80211_beacon_loss() above is sufficient
+	 * to detect real AP unreachability.
 	 */
-	ieee80211_queue_delayed_work(hw, &arvif->connection_loss_work,
-				     ATH12K_CONNECTION_LOSS_HZ);
+	if (!ieee80211_vif_is_mld(vif))
+		ieee80211_queue_delayed_work(hw, &arvif->connection_loss_work,
+					     ATH12K_CONNECTION_LOSS_HZ);
 }
 
 static void ath12k_mac_vif_sta_connection_loss_work(struct work_struct *work)
-- 
2.54.0


