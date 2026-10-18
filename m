Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A688CCF2C4
	for <ath11k@archiver.kernel.org>; Sun, 18 Oct 2026 17:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VpsxtVvi9ogB8U9CtpikmUlQdCiUBK5dcmVCHnoFJIw=; b=CqxqmZwk2HYp2xBvwmzlTaww5C
	rkeZ7Hzz5QlDufIh++27ekqPVtTC4L4PuAbGn+eIkXX67mI8LMlAOLVA9u5rqYiGTZWAyzmfvYBnZ
	HCZfjxE3b64+LLaRPpLjzTkJot4SgK6V98YXxtyiHJHME370Z6fI7d30ryx0OB3plh1/ZRTBKuSfO
	9t8S6Yy2dbBP+KWtZubmBTLV85MyBIzqqjR4J5gHXdYC3uU9I5hRx3OXeqLcWo+toeF4FZm80xax4
	o9pJVBnQwZ5zsyM9cKbhLzJOSuC+eavm8z7rdBWfg/TaCAMRPjGgekYfs+DQwhO6jgvpHVQggzx9Q
	hlDbIMcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIV0h-000000067Hv-1tTO;
	Sun, 18 Oct 2026 17:49:27 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIV0d-000000067BU-48gF
	for ath11k@lists.infradead.org;
	Sun, 18 Oct 2026 17:49:25 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso4261723a12.0
        for <ath11k@lists.infradead.org>; Sun, 18 Oct 2026 10:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792345762; x=1792950562; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VpsxtVvi9ogB8U9CtpikmUlQdCiUBK5dcmVCHnoFJIw=;
        b=FlO2Hm5k8D4VBrOtIhEuKDR1h+Ash0IHZG1+jire1vN7SqXn8Eo5EpK7z3Z/pM+Vtv
         98ihoJRIiWSNn782t61ca6DBd3ZW9dEPXxJK6zz2IZ0ngKD+jkg7oc4LYe7mWgqS4fWJ
         Mfzk9jqgQO2GigF3lEmlA1XPfwChwumAFqvQHOUijNiR8QkmEnAOl08QV8xU160/6Xex
         mABjlD08cDRYbMQnkbXbx9JQh2QgNrB/6+Eqv5hr3Qyaqf+QU28r9mXiD7w7p0cGMemY
         rkASP7g2S4QevbZPwWLNp8N86J53Hwhy5/OUvgiaIkZsbal/FXDUkAFcJrht+S5FBir9
         Pjdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345762; x=1792950562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VpsxtVvi9ogB8U9CtpikmUlQdCiUBK5dcmVCHnoFJIw=;
        b=sdYRm/5C/Cpeka95tiWYZpZX0V3bqKwlUHSzwtOfwd02EuwkiJ8BzXTE4IxuJ+nRyq
         ONiSrqUvSM8ryFy9yb3sRlzEYZ0bf22g6eq4htKvGUFykmVh4tWV3T8SBWOKLInAB/TL
         EaQ9RyJYXc4chQ3iuuP+8fLjOyQNTfKj5WN6D+jRqnYqzwttmdGUFtsvnqbmGtRMlAEB
         EHN56zrzgzDnYfyXngoC7fd/llNEyU8kZ8gTPkszPI2TKPMaMPg0VxnH6HMMD5/hRkzz
         kdp7lqKp8sHOR5+iDJ34ZMmUbfPlpVTe/6vcCMxN+VgAUASo+73kDqb5WSAmEgxLqVC/
         KGPA==
X-Forwarded-Encrypted: i=1; AKwUvBz3KR92u4Ptn2RcapP8hmqYrUJEpisXDMuXiMiDRxM3FNZUlAQBtRTm3rJyKngrqhPCAR9Q670=@lists.infradead.org
X-Gm-Message-State: AFq9FYKHltIJGf3lh1+uKB4mGCKyVqxgU1o4TwqPmHVFaf7AA71CBzI7
	9VARlMeZauGvO7nba2QGEatZd2eTH1XpLdAju6Y3szJW+5hQui1UgSMh2VSO2BhcJg==
X-Gm-Gg: AYBFou3JLovWbS4tPVoLwb++53sFrdVNNWzTaJ2Zv/1AVU/0GJN6czKIHkTtB3DtGT9
	RvgRNsmHdwb9MmSXGPWHBbEsGNQWJHBYL8S+3i+N1Cx5j6cVuO84V8Oflv9Hjg2Xrxjej+GyA7A
	6UqPp7LEYtv8SEs5mALi7NR+OKJroYkiCb+4OAgPZn78CJNIw6/NKWjpB8CbFyEODHJoDje8XJP
	2FVRwoLMuSm8tgQJIaQI7x8SMQqgfY8aQCl1WOo0r56q7xxeroH9uLwQp+XyiG4DEKUxDbzKzBh
	sr3/sFHjwuwnfECq1U3Vf3sH/cpcjjfkQvVnidiMQO8gl8sK/Z5LnyWvrHsuUwv3knm5hCTlNtU
	BuVeDMCsv3/hC5vtaSbQrAHpczPMz8OB+0HaQL+wuZeoOWNoRO+DuHT1p17k1g6ISZkxa4boP7d
	cTU/7JqeKRRd/6YfW8FeQ3xR4I32mvigco52acP0bqv9lG74D/Fc7iyXTBSLf6/3ZWdccV2E202
	CAxq7D4F9tlWakRK3lhYBZVOhDwuql9qSAxCzitSerN8QpWaFVnjSDikoiBalQ9iyWgsMQgT0Z8
	4XXOt/JNyhgf8ybFy8j5m/OF7gRUm1Obd7q1KoHBo6kERr04Zv2sVOaGI7I6qMxyf1oHBsbcUdo
	JJYr2zZLlzM8JRhWHM8RmJaahh0CahlOEq9Bproccj7YzzKeJh3ucefFNsE7P++98SiUWJ9Zjw/
	w/fm1VSG4xhwZTHi2kmjY=
X-Received: by 2002:a17:906:4795:b0:c42:fc8b:6c6a with SMTP id a640c23a62f3a-c42fc8b8ea7mr172167566b.14.1792345762000;
        Sun, 18 Oct 2026 10:49:22 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb14a7sm291056366b.76.2026.10.18.10.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:49:20 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tamizh.raja@oss.qualcomm.com,
	jtornosm@redhat.com,
	baochen.qiang@oss.qualcomm.com,
	rameshkumar.sundaram@oss.qualcomm.com,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	sriram.ramachandran@oss.qualcomm.com,
	yaojiale02@163.com,
	quic_pradeepc@quicinc.com,
	kvalo@kernel.org,
	sven@narfation.org,
	john@phrozen.org,
	toke@toke.dk
Subject: [PATCH ath-next v5 7/9] wifi: ath11k: charge received airtime to the station deficit
Date: Sun, 18 Oct 2026 19:49:02 +0200
Message-ID: <20261018174904.1757161-8-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018174904.1757161-1-julius@bairaktaris.de>
References: <20261018174904.1757161-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_104924_065280_3635753E 
X-CRM114-Status: GOOD (  13.19  )
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

mac80211 charges received airtime to the same deficit, as AIRTIME_USE_RX
is set by default, but ath11k reports none. Register each received
PPDU's duration, which ath11k already adds to rx_duration, once against
the PPDU's first TID, or BE when it names none. The TID comes from the
PPDU end user stats TLV, which is added to the default monitor status
filter. The call runs after ab->base_lock is dropped, under the RCU read
lock.

A station uploading with DSCP CS5 moved its VI deficit in 3 of 3 runs;
uploads marked BE left it unchanged in 3 of 3.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 14 ++++++++++++++
 drivers/net/wireless/ath/ath11k/mac.c   |  1 +
 2 files changed, 15 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 8b9df63966989..42ce3dcff5ce9 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -5275,7 +5275,9 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 	struct sk_buff_head skb_list;
 	struct ath11k_peer *peer;
 	struct ath11k_sta *arsta;
+	struct ieee80211_sta *sta;
 	int num_buffs_reaped = 0;
+	u8 tid;
 	u32 rx_buf_sz;
 	u16 log_type;
 	struct ath11k_mon_data *pmon = (struct ath11k_mon_data *)&ar->dp.mon_data;
@@ -5329,6 +5331,7 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 			continue;
 		}
 
+		sta = NULL;
 		rcu_read_lock();
 		spin_lock_bh(&ab->base_lock);
 		peer = ath11k_peer_find_by_id(ab, ppdu_info->peer_id);
@@ -5342,12 +5345,23 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 
 		arsta = ath11k_sta_to_arsta(peer->sta);
 		ath11k_dp_rx_update_peer_stats(arsta, ppdu_info);
+		sta = peer->sta;
 
 		if (ath11k_debugfs_is_pktlog_peer_valid(ar, peer->addr))
 			trace_ath11k_htt_rxdesc(ar, skb->data, log_type, rx_buf_sz);
 
 next_skb:
 		spin_unlock_bh(&ab->base_lock);
+
+		/* Charged once per PPDU with the measured duration, as on
+		 * the transmit side, to the first TID of the PPDU; BE when
+		 * it names none. Outside base_lock, which tx completion
+		 * contends for; sta is held by the rcu read lock.
+		 */
+		tid = ppdu_info->tid < IEEE80211_NUM_TIDS ? ppdu_info->tid : 0;
+		if (sta && ppdu_info->rx_duration)
+			ieee80211_sta_register_airtime(sta, tid, 0,
+						       ppdu_info->rx_duration);
 		rcu_read_unlock();
 
 		dev_kfree_skb_any(skb);
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 4527ab6977d04..d17f80cbcdb5d 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -229,6 +229,7 @@ ath11k_phymodes[NUM_NL80211_BANDS][ATH11K_CHAN_WIDTH_NUM] = {
 const struct htt_rx_ring_tlv_filter ath11k_mac_mon_status_filter_default = {
 	.rx_filter = HTT_RX_FILTER_TLV_FLAGS_MPDU_START |
 		     HTT_RX_FILTER_TLV_FLAGS_PPDU_END |
+		     HTT_RX_FILTER_TLV_FLAGS_PPDU_END_USER_STATS |
 		     HTT_RX_FILTER_TLV_FLAGS_PPDU_END_STATUS_DONE,
 	.pkt_filter_flags0 = HTT_RX_FP_MGMT_FILTER_FLAGS0,
 	.pkt_filter_flags1 = HTT_RX_FP_MGMT_FILTER_FLAGS1,
-- 
2.53.0


