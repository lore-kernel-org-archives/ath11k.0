Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BA9C87FDA
	for <ath11k@archiver.kernel.org>; Mon,  4 Aug 2025 08:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+TpVBC8RafHGRnVqwMN2LZa4zEzDHFQCO8ZUVs9dSKA=; b=k5wvUIa9P68FQCRXUZGRCPvISY
	WBxTYT5ZR7c8Cxnpj5pxRb9jgg6VpbDHgNEead+TpUuuy7B2+PM0QSFAcRxb75SOPYEYklZCrUlx5
	cCIdUsSWziTnUA/fz6GnkQAgItf2H9T/TcjtveXb967vxRtIs4GZ/c3UJfgU+z9KtpJM7vY2wLqkU
	iVb2ALW/NC8DLGGyjTvkvYokUhWp/7l2YD4lzLR+Atlo0csVYGmcs1Yj8RgAkLxqKd4o8xTQLDS4z
	h2TtmdJRzgxv/I7fyl9iqnZS4WRsyp3vsTMmRVkgrPCNMI01iAOz7Cr663KGHG+sWA0lzzgMidQ5k
	lk2Eq4Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqTQ-00000009vwt-2Bw9;
	Mon, 04 Aug 2025 08:23:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiq77-00000009sca-1SOx
	for ath11k@bombadil.infradead.org;
	Mon, 04 Aug 2025 08:00:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=+TpVBC8RafHGRnVqwMN2LZa4zEzDHFQCO8ZUVs9dSKA=; b=FTV6iCLywpOMU4+4f/OtfF88Jr
	dXHcxyT4orvVR/NiSp2Z5Du5FTEfJ4zJzbg5lpY7v10c58JO0Rwi3g4JqNcpshMACNqZi6KIDQTLj
	KfMnDwHI4I43cNjf2b0ZM+8plOP3dHuv9ehRkGNWoln20S0Kd01cmnPQWynuZLp9Ta0shb1PzyBh3
	U+2NoIMnyFzlidTi3qBAKks0K8/C+sNBIMGb8vCOEgOrDE9b+nbXonRqsRQK+5voYgMj3Ac9J6dg/
	TOGa4eyyv2BSGqAOocvMhcAHRi5MAfb23qGUUzbBcOVOD9d6CLQoPw5NwF/SZjxeJcUkmpUrjj/ro
	VoYWcqDQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiq73-0000000Dp5n-0a0F
	for ath11k@lists.infradead.org;
	Mon, 04 Aug 2025 08:00:08 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5741NkTo031930
	for <ath11k@lists.infradead.org>; Mon, 4 Aug 2025 07:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+TpVBC8RafHGRnVqwMN2LZ
	a4zEzDHFQCO8ZUVs9dSKA=; b=LF1GsyjUT+MbZtF247s6YjO8egV1dUFYeXmh/h
	CyAsm0SjAEqtF2wcaUb8d6ZOGxcQS0ASfz7y9lMzXMfyXxH7aPkB8hfpibEZtpS8
	g92EOWUgDzzB1SC3qa0ZiE/iPdrdvMwfu3iuWIx4hdetUyXFEqufpZUJZLkMQ01c
	7NJ+qUSv3zRfXzEYye90KrXyKf7ZxNeNcl+Ak/AzlKwZnho/1TBgCYtZlFynbTUq
	FoMXun8jAwCicAdrB+tca/JbcTbORUWadop04Hv2X7gzG235zTB5lV9dfridDMcA
	L+JJUwpukri8Kn2/AX5CzrocWXMUk2FDQljRXIabvArditxg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ak5a0u8n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 04 Aug 2025 07:55:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2403c86ff97so43748595ad.1
        for <ath11k@lists.infradead.org>; Mon, 04 Aug 2025 00:55:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754294028; x=1754898828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+TpVBC8RafHGRnVqwMN2LZa4zEzDHFQCO8ZUVs9dSKA=;
        b=mQl/UsXZ26B7O7+rx2zE+wxtkDiZJB4sa/NtdFAZfKLWAG3aOkWFEo90pW9INsY4Vl
         Vjut+RcERIxbXQcnpFaUww2L52Cm7y04HIHHro+q2PA6ru9qDfNWe/FXuqZbpOdUBWbo
         9CTURG9LbslL3A+IusEWfP3SBe6yUIHtYDK8ihFEtK6OV/GQnZDIkydkA2r37zqWkzYN
         u/pbA1i9/dz0FF3Ya8n0zQ5LFdNSbirAbstp0bTz4/2fNpjQB/cAmzVuyU7xnaNnq+RC
         96L+mAkW3oId3FqkigcgUoWz1Y+dXCUrYoScu7bAoVCdDZzXx9K4Gcso2GHkgeET5bfJ
         pZ/g==
X-Gm-Message-State: AOJu0Yz2i42o70ZdzuGE8YPIBVo2SJ3BG+WW1Sc9b+pWoxDaSl4l7jl6
	ij4BmDgKm0/ESzqqfRsm2ZjRKDfjGLQsfSG43itZKyYx3tzKmrmCfe5pkbTwt+/65n05okAVS8X
	Q5cJvwxKlHoHJsOSMN4erjt72uk+2h5ppLxHUKdW0uzUtmBmuFB1w2F5MMxD3VbLEIgFq7Byv
X-Gm-Gg: ASbGncvIlm2HQ+etdcnLXKhsUlTAFn5nqkPb+T0J1c6v3IN2j+l/QnfzKbAFUGve5lh
	1udJaS9b0a1QstUbl8Yh+/wPuE09kqSrRhrQZLwKcLjG/XdJb4ZQW1IRfcgk9B22YTKSFcOA9fP
	cUu5MdFSv+N7+B6aDvqux6kiYYf8oUaDX7mvTSWksZDYSFWuEuuW7wma/9g+X3Ch7UUud3gmp+N
	4KlnwW5pzgzcCh2FyrFfQh5PcxBI5FYVOr6mHKrOtneCDq2YfVKVqH1b7mvva//EjxNDICeAs4e
	82z25WVz82fTdsV9+kovJYNI4rRcSglVUAdUbWgs/p1cATwB6dafgubw+/fiTEAhs/NtGSSeZt7
	F1HZEY6XBu3oF9jLY2xYgbCGGoKBpYYBvz3gJ+ACypllDHFzyW/CAsc4NDlowmJAnA6OX
X-Received: by 2002:a17:902:ec90:b0:240:5549:7094 with SMTP id d9443c01a7336-24246f65f32mr102049425ad.18.1754294028420;
        Mon, 04 Aug 2025 00:53:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEE9avTyhjyczA6TkiJ1Gp8ExpFz9wY98k65mdMBhMuAnPXA6MdnXwSxCJlI+ojIORrgFh23Q==
X-Received: by 2002:a17:902:ec90:b0:240:5549:7094 with SMTP id d9443c01a7336-24246f65f32mr102049065ad.18.1754294027800;
        Mon, 04 Aug 2025 00:53:47 -0700 (PDT)
Received: from hu-ramess-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8aafb8csm102136855ad.179.2025.08.04.00.53.46
        for <ath11k@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 00:53:47 -0700 (PDT)
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
To: ath11k@lists.infradead.org
Subject: [PATCH ath-next v3] wifi: ath11k: fix group data packet drops during rekey
Date: Mon,  4 Aug 2025 13:23:44 +0530
Message-Id: <20250804075344.3494691-1-rameshkumar.sundaram@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA0MSBTYWx0ZWRfX6hvQQtMQlYy4
 z//IEyqv/XU9vHxmnLBDG73ZPBl3fZJsN56853ySBzy/TDcS/H21croq3K55feJFmfNRZ7i0Oo0
 nE80W2nF4K9gBQZ1HKcZHpBAhLwuX7f20331fDQDlmhQHsZHI/Rdoe50dh+b27Y9pj37CANEJIj
 eEU6uLEhlZqXNg5BWGli+h4i7zjyp60oOHE0ZCMvaoU1rRtXgFSE+vyr9oc7yXrjm9rI+NemG9p
 12n8rTRawsaO9RnmVeFYmA/6MVDh06fbKEJRyINJlF0wi+ZjDML5hN1yaHGotU2lhLVdeouY0fT
 H8EKTyAIwQU7boh/lYi5VYE1JIsW28oEfx1N922kKVJ0wimVm/YCdUQd3a7G4rEziQTon/4Y11E
 7qnvS2phnAE8kBVeOV9x73UFzD2V00V2VUzcO8+BgmFZcCqoLK5VHyvYODcn3K2uX3OzC8tx
X-Proofpoint-GUID: XhhrKzcUv7_fk7P3WgaIRZphREXP9E4q
X-Authority-Analysis: v=2.4 cv=LP1mQIW9 c=1 sm=1 tr=0 ts=6890678d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=SPZcrJulSsLfHTziI8sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: XhhrKzcUv7_fk7P3WgaIRZphREXP9E4q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_03,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 spamscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1011 bulkscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_090005_961772_4A47422D 
X-CRM114-Status: GOOD (  35.47  )
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
v3:
  - Allowed clear key strictly only for AP mode
  - Rephrased the commit text and comment in ath11k_mac_op_set_key()
    to explain that the race occures rarely under heavy load and
    discrepancy of states between firmware and hardware
  - Added newline (\n) at the end of warn log in ath11k_set_group_keys()
  - Made addr varaible as const * in ath11k_set_group_keys()
v2:
  - Followed r-xmas style
  - Removed vdev_type check before calling ath11k_set_group_keys()
  - Removed lockdep assert in ath11k_set_group_keys()
  - Removed flags variable and passed WMI_KEY_GROUP in ath11k_set_group_keys()
  - Changed the if condition to have positive cases in ath11k_mac_op_set_key()
  - Added code comments in ath11k_mac_op_set_key() to explain how clear key and
    set key are issue back to back by mac80211 and added high level information
    about the firmware race.
  - Added comments in ath11k_mac_op_set_key() and ath11k_mac_station_add() to
    explain why a reinstall of same key is needed.
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

base-commit: 4cedae6335644a5858e1bc2c367aedc10482b654
-- 
2.34.1


