Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099D2C87FCF
	for <ath11k@archiver.kernel.org>; Sun, 10 Aug 2025 17:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4h9YmX5bgFUDWuxv9D4v9MgWHuFFtxtGCWyNUkSBTPk=; b=FYPBYpgdfdDh+jSWzwX7tRw8Nn
	iaeMLy0XzDB43FdGtIuninfxdtJOC/Wl6aSBS0XoEfo2LDOooFJBElwhTaoFSmvDk/dqLDkgtskuT
	2BLM0w8n5FX2MpBDkojXabteOYyC8qkZVewcD0K5+LGTMeSsYq5fsdf/lejjoVm+csa+3qqy8XWmN
	kKDZF2YDhGVLdSLJmr05DPQEKXZn4EEYuALmcZ90Etq4Yk/ZON+d5Gc2ujCmqguNeh+7XUnZBMz29
	t+dq+J5AzpTOZq7x//IDZ5hGf+uQMEx4XaMEU2dzBRvVb59A8dAQAo0GvGAaDRL3kZ4m+u4QO2GZL
	CieCgw2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul9Qy-00000005odU-2x8H;
	Sun, 10 Aug 2025 17:02:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul9Qw-00000005ocQ-1OfP
	for ath11k@lists.infradead.org;
	Sun, 10 Aug 2025 17:02:11 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57AEWaU5012811
	for <ath11k@lists.infradead.org>; Sun, 10 Aug 2025 17:02:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4h9YmX5bgFUDWuxv9D4v9M
	gWHuFFtxtGCWyNUkSBTPk=; b=A4OFE8RlZeA8/dm/FORXYENTD9xGn+LHHtvGzu
	y4Nu8v3C2ZF/968+QuJr7ne725yjpGqG/h9XDH7968Sfqn5ch7EQIU5ru3Gnpc4g
	HQ2HEibuJA+ILgI3k/Vfxv899gFWqIejtro+WOnf4f+NHJfOis9gQmumLuiTicz9
	VSRCHvtd3hGYihxSIlAdmYAgofu9pPThiuIOt73FiZILaVvBiw7i6GHcgz2PE1bA
	RTCADUrLHnL9vy34HQooHk0v5vmICx9x3W8d7hva0Q3MaPTkcAegaHsesetgvuPY
	4BktiwiGGb8tb8nfeDxfaUmm/RWe9i2Cwj1GJcuVaXC6o0UQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxq6t6g1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Sun, 10 Aug 2025 17:02:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2405fdb7c15so53578325ad.0
        for <ath11k@lists.infradead.org>; Sun, 10 Aug 2025 10:02:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754845326; x=1755450126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4h9YmX5bgFUDWuxv9D4v9MgWHuFFtxtGCWyNUkSBTPk=;
        b=ihviFoDsULVRqS8mJs0ROBAOcE3lRVRGU6lTGgdOnqdJJw+aD8Fbzk/rDlZFl5YDtt
         BdqKBUZkFkBIYh0JEaxqI2JwNHuyOBwicPL6PZvkNgVEN+OfQhyY/v2Ff0e3UwGnIkR2
         vMf56uzItvJtAVjcEesLOcO4Uz/zfe1Z+XEFXeUjsOHJy/LdfPBs4kc3sm0VYGXevavm
         qgQOHORc3MZz3enBJEjDADXqD86r8Iar9MfJFVgm9Fr2VXIMz1KbcAiSFsaBnnKor7hX
         dHdhxlY4NmgVhe6SPm8UOlRlJcynl92AyLmCtNr3tRTJ7oXhm+GeiwqBIzU5cwYsnBvL
         PKRA==
X-Gm-Message-State: AOJu0YwosS2LFJ3oN9oYdgxiiTqhqcrz0N+cD8fiXRhZx+Sszms/F1k2
	z6558N82PJ0evFgEoaOsWPyR1Y75Hdh4C/wsFvdkSwzyzQfEFnF5UwHsUIHDDGFuMDiOCBmuccb
	VBSpXOQWH9JPDCr27SeZNov//j7EA1NZZZ/DS9pJQKMG8zGXujZ5mibi1uctwAOdC3QnP8CQW
X-Gm-Gg: ASbGncu2kxEAL0LP2BCP1JYiAqu0YkMcEpPry0UjEcg9/alHP2Adywnv76q+6lykchP
	2MHzOUDTNtoCDjo4GhbrK+9fZM9wCsEAZ23FIP+cNlAjdlF60UnahrEdHKjjmURp5pDWnA8habA
	tux4ETcNGG+qNojTDdcO54BKwCrPOOOkdsTXxfPsppdCjyTe/b+dVrlMHPFPiekIETK3smNPtS3
	jDRHUsuGJAEYEZdErZ+Dnn/6P3vL0NUFtNglmRb4NmGQ44UQChOoiRtKpttXhm08bYB1XCwhKmn
	7PBJ6blNR5No1gdB6/L1OxPLP6/Y+ftre3g3+rr3XcIaRN2uOSEQhd54GbJV+m2dRuPZAW/hmx9
	2Bg18/DAjmJmMlpQyI14CW/w8Amn7oVaRXJ6qGa5Bd34x8CpRgoI3sCJCMIX21fR7HwoS
X-Received: by 2002:a17:902:d50e:b0:242:9bbc:6017 with SMTP id d9443c01a7336-242c2276a77mr122282265ad.55.1754845326338;
        Sun, 10 Aug 2025 10:02:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeAHYDlK+Vq16Kaq0mArhH6pVAbOI3w8Aa7zAQNc40O+t/8yYGN3RmPW2Vjcx2TvpxKJ2Szg==
X-Received: by 2002:a17:902:d50e:b0:242:9bbc:6017 with SMTP id d9443c01a7336-242c2276a77mr122281745ad.55.1754845325529;
        Sun, 10 Aug 2025 10:02:05 -0700 (PDT)
Received: from hu-ramess-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef67e8sm255072665ad.8.2025.08.10.10.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 10:02:05 -0700 (PDT)
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Steffen Moser <lists@steffen-moser.de>
Subject: [PATCH ath-current v4] wifi: ath11k: fix group data packet drops during rekey
Date: Sun, 10 Aug 2025 22:30:18 +0530
Message-Id: <20250810170018.1124014-1-rameshkumar.sundaram@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyOCBTYWx0ZWRfX8zAOlPa1+Tov
 bMj4/GqvDEyw6iyxC/e3HhiV3dcqmMPru/luAkhmTSHdGTkG4DDSan0qpGA7yNeTGC4Fkcc4z50
 cjkNVd/BZLCx5l+TCYsWpZr2dZDXBA1UgPJuTMqj6hucFjQCbdS77WZY9UyOUx6dJ2ghZ6UfSbq
 WewGHzS84ALa37zKDgI7pazPl0YfWa1Aua6lMdpG/UXE6JNCoQ9gxPEnITsXhFAc+WpscSSOqnh
 zP7kbIM7uzW3naHpn8kdPc07mf7czwWlBX04tbZN6zRiK1Lw4nwyZvvwPtCVtNyv8IbHAROEoJa
 hGye6OxBCnHkR4lh/EUSErDH+6m5y8nQ01buUeFX7ugw/y9q617uiR17CsyPvtY6LJlav2MBO0G
 fBvKBDvD
X-Authority-Analysis: v=2.4 cv=QYhmvtbv c=1 sm=1 tr=0 ts=6898d08f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=SPZcrJulSsLfHTziI8sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: vWsvEgNKPaYJdzWHvow9YRzD8hQOK9ej
X-Proofpoint-ORIG-GUID: vWsvEgNKPaYJdzWHvow9YRzD8hQOK9ej
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-10_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_100210_492167_8666C53F 
X-CRM114-Status: GOOD (  31.53  )
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

During GTK rekey, mac80211 issues a clear key (if the old key exists)
followed by an install key operation in the same context. This causes
ath11k to send two WMI commands in quick succession: one to clear the
old key and another to install the new key in the same slot.

Under certain conditions—especially under high load or time sensitive
scenarios, firmware may process these commands asynchronously in a way
that firmware assumes the key is cleared whereas hardware has a valid key.
This inconsistency between hardware and firmware leads to group addressed
packet drops. Only setting the same key again can restore a valid key in
firmware and allow packets to be transmitted.

This issue remained latent because the host's clear key commands were
not effective in firmware until commit 436a4e886598 ("ath11k: clear the
keys properly via DISABLE_KEY"). That commit enabled the host to
explicitly clear group keys, which inadvertently exposed the race.

To mitigate this, restrict group key clearing across all modes (AP, STA,
MESH). During rekey, the new key can simply be set on top of the previous
one, avoiding the need for a clear followed by a set.

However, in AP mode specifically, permit group key clearing when no
stations are associated. This exception supports transitions from secure
modes (e.g., WPA2/WPA3) to open mode, during which all associated peers
are removed and the group key is cleared as part of the transition.

Add a per-BSS station counter to track the presence of stations during
set key operations. Also add a reset_group_keys flag to track the key
re-installation state and avoid repeated installation of the same key
when the number of connected stations transitions to non-zero within a
rekey period.

Additionally, for AP and Mesh modes, when the first station associates,
reinstall the same group key that was last set. This ensures that the
firmware recovers from any race that may have occurred during a previous
key clear when no stations were associated.

This change ensures that key clearing is permitted only when no clients
are connected, avoiding packet loss while enabling dynamic security mode
transitions.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41

Reported-by: Steffen Moser <lists@steffen-moser.de>
Closes: https://lore.kernel.org/linux-wireless/c6366409-9928-4dd7-bf7b-ba7fcf20eabf@steffen-moser.de
Fixes: 436a4e886598 ("ath11k: clear the keys properly via DISABLE_KEY")
Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
---
v4:
  - updated branch tag, CC'ed Reporter and linux-wireless
  - Removed internal version history details.
v3:
  - first public version (should have been v1)
v1 & v2:
  - Internal review versions
---
 drivers/net/wireless/ath/ath11k/core.h |   2 +
 drivers/net/wireless/ath/ath11k/mac.c  | 111 +++++++++++++++++++++++--
 2 files changed, 104 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 220d69a7a429..e8780b05ce11 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -411,6 +411,8 @@ struct ath11k_vif {
 	bool do_not_send_tmpl;
 	struct ath11k_arp_ns_offload arp_ns_offload;
 	struct ath11k_rekey_data rekey_data;
+	u32 num_stations;
+	bool reinstall_group_keys;
 
 	struct ath11k_reg_tpc_power_info reg_tpc_info;
 
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1fadf5faafb8..106e2530b64e 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4317,6 +4317,40 @@ static int ath11k_clear_peer_keys(struct ath11k_vif *arvif,
 	return first_errno;
 }
 
+static int ath11k_set_group_keys(struct ath11k_vif *arvif)
+{
+	struct ath11k *ar = arvif->ar;
+	struct ath11k_base *ab = ar->ab;
+	const u8 *addr = arvif->bssid;
+	int i, ret, first_errno = 0;
+	struct ath11k_peer *peer;
+
+	spin_lock_bh(&ab->base_lock);
+	peer = ath11k_peer_find(ab, arvif->vdev_id, addr);
+	spin_unlock_bh(&ab->base_lock);
+
+	if (!peer)
+		return -ENOENT;
+
+	for (i = 0; i < ARRAY_SIZE(peer->keys); i++) {
+		struct ieee80211_key_conf *key = peer->keys[i];
+
+		if (!key || (key->flags & IEEE80211_KEY_FLAG_PAIRWISE))
+			continue;
+
+		ret = ath11k_install_key(arvif, key, SET_KEY, addr,
+					 WMI_KEY_GROUP);
+		if (ret < 0 && first_errno == 0)
+			first_errno = ret;
+
+		if (ret < 0)
+			ath11k_warn(ab, "failed to set group key of idx %d for vdev %d: %d\n",
+				    i, arvif->vdev_id, ret);
+	}
+
+	return first_errno;
+}
+
 static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 				 struct ieee80211_vif *vif, struct ieee80211_sta *sta,
 				 struct ieee80211_key_conf *key)
@@ -4326,6 +4360,7 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	struct ath11k_vif *arvif = ath11k_vif_to_arvif(vif);
 	struct ath11k_peer *peer;
 	struct ath11k_sta *arsta;
+	bool is_ap_with_no_sta;
 	const u8 *peer_addr;
 	int ret = 0;
 	u32 flags = 0;
@@ -4386,16 +4421,57 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	else
 		flags |= WMI_KEY_GROUP;
 
-	ret = ath11k_install_key(arvif, key, cmd, peer_addr, flags);
-	if (ret) {
-		ath11k_warn(ab, "ath11k_install_key failed (%d)\n", ret);
-		goto exit;
-	}
+	ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
+		   "%s for peer %pM on vdev %d flags 0x%X, type = %d, num_sta %d\n",
+		   cmd == SET_KEY ? "SET_KEY" : "DEL_KEY", peer_addr, arvif->vdev_id,
+		   flags, arvif->vdev_type, arvif->num_stations);
+
+	/* Allow group key clearing only in AP mode when no stations are
+	 * associated. There is a known race condition in firmware where
+	 * group addressed packets may be dropped if the key is cleared
+	 * and immediately set again during rekey.
+	 *
+	 * During GTK rekey, mac80211 issues a clear key (if the old key
+	 * exists) followed by an install key operation for same key
+	 * index. This causes ath11k to send two WMI commands in quick
+	 * succession: one to clear the old key and another to install the
+	 * new key in the same slot.
+	 *
+	 * Under certain conditions—especially under high load or time
+	 * sensitive scenarios, firmware may process these commands
+	 * asynchronously in a way that firmware assumes the key is
+	 * cleared whereas hardware has a valid key. This inconsistency
+	 * between hardware and firmware leads to group addressed packet
+	 * drops after rekey.
+	 * Only setting the same key again can restore a valid key in
+	 * firmware and allow packets to be transmitted.
+	 *
+	 * There is a use case where an AP can transition from Secure mode
+	 * to open mode without a vdev restart by just deleting all
+	 * associated peers and clearing key, Hence allow clear key for
+	 * that case alone. Mark arvif->reinstall_group_keys in such cases
+	 * and reinstall the same key when the first peer is added,
+	 * allowing firmware to recover from the race if it had occurred.
+	 */
 
-	ret = ath11k_dp_peer_rx_pn_replay_config(arvif, peer_addr, cmd, key);
-	if (ret) {
-		ath11k_warn(ab, "failed to offload PN replay detection %d\n", ret);
-		goto exit;
+	is_ap_with_no_sta = (vif->type == NL80211_IFTYPE_AP &&
+			     !arvif->num_stations);
+	if ((flags & WMI_KEY_PAIRWISE) || cmd == SET_KEY || is_ap_with_no_sta) {
+		ret = ath11k_install_key(arvif, key, cmd, peer_addr, flags);
+		if (ret) {
+			ath11k_warn(ab, "ath11k_install_key failed (%d)\n", ret);
+			goto exit;
+		}
+
+		ret = ath11k_dp_peer_rx_pn_replay_config(arvif, peer_addr, cmd, key);
+		if (ret) {
+			ath11k_warn(ab, "failed to offload PN replay detection %d\n",
+				    ret);
+			goto exit;
+		}
+
+		if ((flags & WMI_KEY_GROUP) && cmd == SET_KEY && is_ap_with_no_sta)
+			arvif->reinstall_group_keys = true;
 	}
 
 	spin_lock_bh(&ab->base_lock);
@@ -4994,6 +5070,7 @@ static int ath11k_mac_inc_num_stations(struct ath11k_vif *arvif,
 		return -ENOBUFS;
 
 	ar->num_stations++;
+	arvif->num_stations++;
 
 	return 0;
 }
@@ -5009,6 +5086,7 @@ static void ath11k_mac_dec_num_stations(struct ath11k_vif *arvif,
 		return;
 
 	ar->num_stations--;
+	arvif->num_stations--;
 }
 
 static u32 ath11k_mac_ieee80211_sta_bw_to_wmi(struct ath11k *ar,
@@ -9540,6 +9618,21 @@ static int ath11k_mac_station_add(struct ath11k *ar,
 		goto exit;
 	}
 
+	/* Driver allows the DEL KEY followed by SET KEY sequence for
+	 * group keys for only when there is no clients associated, if at
+	 * all firmware has entered the race during that window,
+	 * reinstalling the same key when the first sta connects will allow
+	 * firmware to recover from the race.
+	 */
+	if (arvif->num_stations == 1 && arvif->reinstall_group_keys) {
+		ath11k_dbg(ab, ATH11K_DBG_MAC, "set group keys on 1st station add for vdev %d\n",
+			   arvif->vdev_id);
+		ret = ath11k_set_group_keys(arvif);
+		if (ret)
+			goto dec_num_station;
+		arvif->reinstall_group_keys = false;
+	}
+
 	arsta->rx_stats = kzalloc(sizeof(*arsta->rx_stats), GFP_KERNEL);
 	if (!arsta->rx_stats) {
 		ret = -ENOMEM;

base-commit: 95bf875b89b48a95a82aca922eeaf19d52543028
-- 
2.34.1


