Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A61DECCF2C9
	for <ath11k@archiver.kernel.org>; Sun, 18 Oct 2026 21:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IjCL8rWWQCqnPM2ezT/ruQu8lgpi8/XSKN8Gv6f2o+4=; b=QlqNn42wxTcL5B+A/wvVfaw0ir
	Nc6hV1SlROpaNEBDoLuhMYqn/LdlbCgI0VfE9+H+eBDYk1NDHTfsYoKYwX+lZjzrTzxQgIDC2aEJ4
	TptJ/aO34JcTacXRFiJ4+WopmVZDrDv7Np7S7K+iCE/k4ERP/Zr7NTnnyWjC6nO0VqDwQfj8uJlMN
	H5RTrGULwXnXPwcRkrn/PZsxlXwCcr0n+I1U2UXItO6rcyEmpDhS16q/kd7N5R4v6hvJNONPE7TZ5
	f8hSjEpOy59Q/YOmRhsohusculuU3CEarssT2q2SU55DkYRPUBUmL5M8KAvi2TXPgiB8EHmSXVrVq
	HEXcsqzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIY1O-00000006ER4-3c78;
	Sun, 18 Oct 2026 21:02:22 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIY1J-00000006EMa-3svp
	for ath11k@lists.infradead.org;
	Sun, 18 Oct 2026 21:02:21 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c40e30c26a4so334577666b.0
        for <ath11k@lists.infradead.org>; Sun, 18 Oct 2026 14:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792357336; x=1792962136; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IjCL8rWWQCqnPM2ezT/ruQu8lgpi8/XSKN8Gv6f2o+4=;
        b=QKtvH24rzDP3wFgJnwx8Ycr+bRGiyEjC3T/uOhuRj/n4KrqYddaUCIasiYKHd0cbZh
         rZiSUaktNHOst1EAO4qvtI3KkqzMEV3c3Gn4/tuLh/8RrF/bWXMX2O14MIufNHYy5ak8
         /lsfYpPtMpK08C1e+ZaAFV5NuW/R+4w0WVC+5tFYMKqzuTuKmfnVADlRHbxdBEI3nPsW
         QO9CoAjsivz3v6a7AEdkqTQ+nRnTd0M0VeHMaXyscT6aAk9R5c7zB/F5ERw1LaS/K7bP
         ovQSrJbr3QTRb8sdIHteBXUtWNdq/fzKfM+RyZnVWye3sGSppF1mZnzHbi4ixPJhQGVJ
         surQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792357336; x=1792962136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IjCL8rWWQCqnPM2ezT/ruQu8lgpi8/XSKN8Gv6f2o+4=;
        b=0iwBY1T9L++gV6EXv4DGUHkiZ2jeUdxbWvylbBd6FadoXyK+BZywVg58lXqBy08IZQ
         /j4T9t4eDakVZJs0g5WDQOQQbupZl1pOzZnl8+WMz5AU4Mz3OTTX27FzSigqVD6Mg344
         gm3q2g8ZtvPSgYn6bPAvuqDc1Pf2Eus499Jsk3Nbjuh7mQRUKCqt6oK/Bu/9BNkDxwhj
         7bQHGRk90/ghkpoXWfXWZmuGvaXpkPOm9RNPU/kVytlD1B/uonHMW67N8/SvULmkTo5q
         5i3bcpWQYTvcyAJx/eo6Hi5qWwJLOn/8Cz9cc74qjQerurRo5LXVIl09N+ZkgWk65R+n
         dBsg==
X-Gm-Message-State: AFq9FYL2mvmge0KEf/pxQcS7xcmwIzLvYfZsQIFQtLCP0oGJakojlFmX
	LavlMgJLJdfiHmfGAAoZldUEJynAEiWs0IZ8SfwJLDD6FbRCPrEZgfo0iMvc+/ZARA==
X-Gm-Gg: AYBFou3RnZ8MOulQh2QZs8HK/SvKXb+PxUM3sLyGZbUGk1eyeYH4B527fox1+gltN1P
	kDHHYT7wi+TRUHrv8C1NFo52GAIpgQvTp1Zvsenyw7zJTpQC0iuuphlx3lTKyJppfV+10K233O7
	pLQ5XVn0tqpSm3V5wDCPhvst2ZR0fJJFFHA6ofSIKIQVRMcEs0rLweCdKNRxfOGDuRCtl8rNTC/
	mNumzFpq9YQwmb7GP3AfADk2dBbmK8g+1H4Mk5rcSeHPUtfpabSWdJO6AdCaFfAHnxWDDHEjG3z
	j+GBGYpKGKg/lTmxVWPeyEYUXOlBVmw1AEdVDk8SxPf9AuiFzv/xm0Csv4Sz5SjTpPl9l4BDnMD
	bdIfnHIRxFdkVdQrZWu/idTLDgShD7RMvMM1yX/hKjduqA5zIjkSqwifM6LEU4zbLxcb9wZioJI
	QErUmeiJn1PKXurJP//QLsa1M3ms6D2njaBQ2TK21tZrp2AXDfqhF6j/417OJph8gEzZHqhXICD
	XryOTzVRNMLnq+Sh83iR4As7kC0S146Yo9Ng0rqVQReIbsbhde+OprWk9xrXW+zY6y97stFrko3
	rcegImre8YBFXRaasCwV+S+cEA9OCS+r/+VOK+m+4Br4n0mGEjQqySABMJLyDS/V5TqONzz+mpb
	q+bFhougpxSVl14BI7T4xB4QyJ9iQqMdV9oB5A2osO9oJmRgK9KakAIleEc8RH9VeiC0i2gV1/B
	Iys8YlbCnALA==
X-Received: by 2002:a17:907:2d0a:b0:c31:5918:86d1 with SMTP id a640c23a62f3a-c419e03a4c8mr432252966b.10.1792357336034;
        Sun, 18 Oct 2026 14:02:16 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4465eb0c67sm21953166b.12.2026.10.18.14.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 14:02:13 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>
Subject: [PATCH RFC ath-next] wifi: ath11k: advance the TX PN of keys reinstalled after a firmware restart
Date: Sun, 18 Oct 2026 23:02:12 +0200
Message-ID: <20261018210212.1926073-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_140217_990103_1BF521B8 
X-CRM114-Status: GOOD (  15.07  )
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

After a firmware crash mac80211 installs the same pairwise and group
keys again. ath11k_install_key() leaves key_tsc_counter at zero, so the
restarted firmware sends with PNs the key has already used: stations
drop the frames as replays until the PN passes the last one they
received, and CCMP and GCMP reuse the nonce under the same key.

A station that had received 11, 2012 and 3512 frames before the crash
accepted downlink again only after 11-13, 1817-2119 and 3324-3627
frames after the restart. Broadcast ARP requests are dropped as well,
so a station whose neighbour entry expires stays unreachable.

Start a reinstalled key past any PN it may have used. An HE PPDU
carries at most 256 MPDUs and lasts at least 40 us, so add 8 PNs per
microsecond since mac80211 last started the radio to the key's tx_pn.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
RFC because WLAN.HK.2.9.0.1-02146 ignores the field: with key_tsc_counter
set to 83834696 on every reinstalled key, the station that had received
3511 frames still needed 3324-3627 frames before it accepted downlink
(1 run).

Which command or field sets the TX PN of an installed key on this
firmware? Without one the stations need new keys after a restart.

 drivers/net/wireless/ath/ath11k/core.h |  5 +++++
 drivers/net/wireless/ath/ath11k/mac.c  | 12 ++++++++++++
 drivers/net/wireless/ath/ath11k/mac.h  |  3 +++
 drivers/net/wireless/ath/ath11k/wmi.c  |  4 ++++
 drivers/net/wireless/ath/ath11k/wmi.h  |  1 +
 5 files changed, 25 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index a0d725923ef24..683d6b750439c 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -668,6 +668,11 @@ struct ath11k {
 	u8 mac_addr[ETH_ALEN];
 	struct ath11k_he ar_he;
 	enum ath11k_state state;
+	/* last mac80211 start, and the TX PN advance for keys reinstalled
+	 * after a firmware restart
+	 */
+	ktime_t start_time;
+	u64 restart_pn_advance;
 	bool supports_6ghz;
 	struct {
 		struct completion started;
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1a237adaa37d1..0f9bf1d00546f 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4421,6 +4421,13 @@ static int ath11k_install_key(struct ath11k_vif *arvif,
 		key->flags |= IEEE80211_KEY_FLAG_GENERATE_IV |
 			      IEEE80211_KEY_FLAG_RESERVE_TAILROOM;
 
+	/* The restarted firmware has lost the TX PN of a key that mac80211
+	 * installs again, so start it past any PN the key may have used.
+	 */
+	if (ar->state == ATH11K_STATE_RESTARTED)
+		arg.key_tsc_counter = atomic64_add_return(ar->restart_pn_advance,
+							  &key->tx_pn);
+
 install:
 	ret = ath11k_wmi_vdev_install_key(arvif->ar, &arg);
 
@@ -6645,6 +6652,9 @@ static int ath11k_mac_op_start(struct ieee80211_hw *hw)
 		break;
 	case ATH11K_STATE_RESTARTING:
 		ar->state = ATH11K_STATE_RESTARTED;
+		/* Every key in use was installed after the last start */
+		ar->restart_pn_advance = ATH11K_MAX_MPDU_PER_US *
+			ktime_us_delta(ktime_get_boottime(), ar->start_time);
 		ath11k_mac_wait_reconfigure(ab);
 		break;
 	case ATH11K_STATE_RESTARTED:
@@ -6656,6 +6666,8 @@ static int ath11k_mac_op_start(struct ieee80211_hw *hw)
 		goto err;
 	}
 
+	ar->start_time = ktime_get_boottime();
+
 	ret = ath11k_wmi_pdev_set_param(ar, WMI_PDEV_PARAM_PMF_QOS,
 					1, pdev->pdev_id);
 
diff --git a/drivers/net/wireless/ath/ath11k/mac.h b/drivers/net/wireless/ath/ath11k/mac.h
index 127cb476b44b7..cde8f1c08eb0e 100644
--- a/drivers/net/wireless/ath/ath11k/mac.h
+++ b/drivers/net/wireless/ath/ath11k/mac.h
@@ -20,6 +20,9 @@ struct ath11k_generic_iter {
 };
 
 /* number of failed packets (20 packets with 16 sw reties each) */
+/* An HE PPDU carries at most 256 MPDUs and lasts at least 40 us */
+#define ATH11K_MAX_MPDU_PER_US			8
+
 #define ATH11K_KICKOUT_THRESHOLD		(20 * 16)
 
 /* Use insanely high numbers to make sure that the firmware implementation
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 5c27e7057e6ad..0deab00939af7 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -1876,6 +1876,10 @@ int ath11k_wmi_vdev_install_key(struct ath11k *ar,
 		memcpy(&cmd->key_rsc_counter, &arg->key_rsc_counter,
 		       sizeof(struct wmi_key_seq_counter));
 
+	if (arg->key_tsc_counter)
+		memcpy(&cmd->key_tsc_counter, &arg->key_tsc_counter,
+		       sizeof(struct wmi_key_seq_counter));
+
 	tlv = (struct wmi_tlv *)(skb->data + sizeof(*cmd));
 	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_BYTE) |
 		      FIELD_PREP(WMI_TLV_LEN, key_len_aligned);
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index b2dade0516ac7..049c90fa80c4d 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -3690,6 +3690,7 @@ struct wmi_vdev_install_key_arg {
 	u32 key_txmic_len;
 	u32 key_rxmic_len;
 	u64 key_rsc_counter;
+	u64 key_tsc_counter;
 	const void *key_data;
 };
 

base-commit: cd026e68fdbf88b9cc522b76c7a9d92c9a41f709
prerequisite-patch-id: cd9f2849ade92e165f15fe3f887edabd1d06b6e8
prerequisite-patch-id: 3c9ba2aec0d93942448aba1dc5d26b632d519e5a
prerequisite-patch-id: 9a833c602db147b490fba6df590eeea3847f4877
prerequisite-patch-id: 6fd3e11242fb3ead65751e3cd9972c4d7c63f989
prerequisite-patch-id: 01e149ed860e5e40e79725580548ce4034f344b2
-- 
2.53.0


