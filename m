Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA354CCD184
	for <ath11k@archiver.kernel.org>; Fri, 17 Oct 2025 04:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=asdZZKjyk0fwGLdaYXPlNfa31eWk+R36oHWV8aFgJSY=; b=W+dL7ngY77SU3KJUmMZQGrqZUa
	VMO49KJhrGeJzpfCSh8P1V8oR4EZ/dHBZzvD7cqLiX6uRJDHrR4iPRne8AN4Ryy5UxY+yGWMUXSLG
	8tJJ4qywsgKP5xhosH5hNiLxm+eyefi0MLpTOrHaydvbxh6mhgrT0Vv3aRmT2rixSlGiFyYyEbpzt
	b8mwyfj6OXEtFtlAEzGGD9qCLJjBXsh3lsy1e4s4xn2xpg/iol0LabIBhBH7PN+7kAxZFORBc7PCM
	ODWsRIHfvXXEdkF/1u63V8BWApHuRXusWvexbGGYtAozJ3aYfszbuzVbUE2dZwFP2WCXdL+Grcn/z
	eDOpuGKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9blM-00000006UxS-3nU7;
	Fri, 17 Oct 2025 04:08:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9blJ-00000006UvE-451F
	for ath11k@lists.infradead.org;
	Fri, 17 Oct 2025 04:08:19 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLWpR020342
	for <ath11k@lists.infradead.org>; Fri, 17 Oct 2025 04:08:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	asdZZKjyk0fwGLdaYXPlNfa31eWk+R36oHWV8aFgJSY=; b=ThTAtmGcdpJlA5Iu
	0VVpNooDZ7YMhimleUcUOHwbkxt5UN8/Gro4pOjBMjlr/J7/5QvZdvYRyrtHosTF
	JP8SjW6iUyo034TH98H/wBu4TPJyzitz20cxdGjD5tRGJ5RpSgEHz/U7gu9TfXm/
	mR+fZbDRvNrJfskXZFDDZZ4U9Qtgco4cZHn6FI2/oDvxJzM9NTieOVCQU6g7Wp1p
	Vi8W43cgztWJMWodvTs9lXjVI0fYNq5fkGJjUX94TEtz1zeOc9/k53c2UG8t3cz9
	oYr5kQ8G0SBszhYe0H5TXwKYnsmjC+ztBoEWEreFcCAKXbf2QK99KFVv3GhLw09L
	NUiquA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49tqvpm64d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 17 Oct 2025 04:08:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-28eb14e3cafso27558295ad.1
        for <ath11k@lists.infradead.org>; Thu, 16 Oct 2025 21:08:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760674095; x=1761278895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=asdZZKjyk0fwGLdaYXPlNfa31eWk+R36oHWV8aFgJSY=;
        b=NH4CFNZjSa7xAyo1IzVJm8xgY0p5tTszgQfCadjKYMvU3EC2XSI6YBkRXk/mEqnFxl
         4fngNgwXv94zbun5lWQ5QRDzGpEw3wFm1XGYwwyx1H+YSPjdrCHawrgXRAYYiCHxzAlZ
         BWmrnX8twXqkyvlI7eHGSqCFMEiLhbHSS0RT2r08NQvIPJ2W+O+pztj1vJ21noZ3Uxq3
         6Ei2h5ltI+KnEZBtxup/IoZNs3HnMINgHPaSpdkWjFNp4K4SCN4V46xR/CyJ9xxWmnIs
         k2uMicnyn13lWsMBtt8mH7ChRdJMGLclPcJQM/qoxfyY6yXBg1FAxZOBfEIUPycNWmK8
         7acg==
X-Forwarded-Encrypted: i=1; AJvYcCW7OJrYUBERbbfn0/sz9qPbechvImJx43ahTPKygtE9yYhldfcrIql6sCEx5mxdmq0Q7Ne8uXk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwCaaKvpYFLSeqP/BP0T9q0mv0iriFf/OsSXeG4NnQYovhF5aSe
	LuBDWBnVUce4gKJiYhj1u2HLbidlUc5249GZ0krUA6RtX3LJarZLyx2NHx4AmEhDG+7dAs3JAfQ
	V9oDnmA7wSlZCi+CqvRsowJYf4kB6d5sWNVLR39mRhowDAQE0W1bELQ1YEvzzPJBx
X-Gm-Gg: ASbGncuRmc1z5rxp+fp9Sfy96+Ar6SDDpyTNl4kgwMSLgUYj/44OAKC9FvvDHZh0/Ii
	ccBdCPiMPfLUtdIQHZ7H8tdq7VsXGG/yYwERkPzu/FtPxsDe08HcfCc9daIj4wG1ilM+iC7tmxd
	6Tc28ahbQ6OauMEJkZ3IPB9ljeE4fbX6QqC6pGQa5SwrWWM9x3qoqPjQ6n2CD67FrUNBOz9g8ko
	BPfIocD3mATYT89YDdigIXlf3J66Qk+QCxB3ecqeeL8HeVH9ekvb7ftAOCitfNoK4F/2LamlcTN
	G8/W3+s43vl/iS/ushJenIL2xBr9p0F7bBUCoEVVtWpPWsUFNYH3OqL5Vjbw8MHRdRsbk9m8mT/
	lvXF3U1Xi+MSJAmTOVuI2MY38dx4CwPR2Lxhtf0eLU1cl7RwC5dGGnu0EeJQkfmghUpOa97jKhA
	CRQsCTFcRad1e6k74YePS1JFI=
X-Received: by 2002:a17:903:19cf:b0:27b:472e:3a22 with SMTP id d9443c01a7336-290cc6da03emr27126925ad.56.1760674095313;
        Thu, 16 Oct 2025 21:08:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSFzb7wjzoXwJcRXVoLB6Wm6cPtg9l7YEyvW8Iduat+Gr7L4HFg6g+CmISuItqlx3N8AR1nw==
X-Received: by 2002:a17:903:19cf:b0:27b:472e:3a22 with SMTP id d9443c01a7336-290cc6da03emr27126655ad.56.1760674094879;
        Thu, 16 Oct 2025 21:08:14 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099a7afcbsm47635345ad.76.2025.10.16.21.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 21:08:14 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 09:37:59 +0530
Subject: [PATCH ath-next 3/4] wifi: ath11k: add support for Tx Power
 insertion in RRM action frame
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-add_tx_power_insertion_support-v1-3-f08feacfca93@oss.qualcomm.com>
References: <20251017-add_tx_power_insertion_support-v1-0-f08feacfca93@oss.qualcomm.com>
In-Reply-To: <20251017-add_tx_power_insertion_support-v1-0-f08feacfca93@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=aPD9aL9m c=1 sm=1 tr=0 ts=68f1c130 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=U2OQ5zEU71Qse62bi5cA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE2MDAxNyBTYWx0ZWRfXy5/Pzbkk3CWQ
 J7uLlBuw9YdeHCFNkG2DFOnycHCWdFX9mvhlPc0e4rgRdpYXVaxELPJ9MyLyg+7aIY4BhsgzsAD
 Q3dlxeZUwdE2YbXxWv20HkYHOFhB3UInd7zrff2388gbjzy9ohCmgJ6AQGOLH2fTZx1t7PV4sPf
 eZIB0d39qTFGQ+hlH1wOPLYytALlPAutKDl2MZcmnVGE+0T2J63V7YTQApMTfCIEJDBhcYSWjRe
 uYbyEv5uQZ12zdKktAApxja4NY3SpYFAHBie0UpHcSQzUR3W8mjZUMbPBGx5tN4hnTw5TWCEyca
 Oh4+e0tdaodn30gtryDPza5WtBL2jibtvJzdV9k+9N5x7rtAebB4EPPNEO/J3jmca28hirTdBKV
 /xJCBz7bVWboE/RQC5piK7KoZq+RUw==
X-Proofpoint-ORIG-GUID: qp5_gONKVSEMqer16zZo_Qt7YghNAalx
X-Proofpoint-GUID: qp5_gONKVSEMqer16zZo_Qt7YghNAalx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1011
 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510160017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_210818_199166_4F7BDE3B 
X-CRM114-Status: GOOD (  22.53  )
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

For certain action frames like the TPC Report IE in the spectrum management
TPC Report action frame, and in the Radio Measurement Link Measurement
Report action frame there is a requirement to fill in the current
and max Tx power of the device in the packet.

Add support to populate these fields in the relevant packets.

In software-encrypted cases such as PMF, skip insertion since the packets
are already encrypted and cannot be modified.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 166 ++++++++++++++++++++++++++++++++++
 1 file changed, 166 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index cd6e98ee1232..773ea1d4b358 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6251,6 +6251,159 @@ static void ath11k_mgmt_over_wmi_tx_purge(struct ath11k *ar)
 		ath11k_mgmt_over_wmi_tx_drop(ar, skb);
 }
 
+static int ath11k_mac_mgmt_action_frame_fill_elem_data(struct ath11k_vif *arvif,
+						       struct sk_buff *skb)
+{
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
+	u8 category, *buf, iv_len, action_code, dialog_token;
+	int cur_tx_power, max_tx_power;
+	struct ath11k *ar = arvif->ar;
+	struct cfg80211_chan_def def;
+	struct ath11k_skb_cb *skb_cb;
+	struct ieee80211_mgmt *mgmt;
+	unsigned int remaining_len;
+	bool has_protected;
+
+	lockdep_assert_held(&ar->conf_mutex);
+
+	/* make sure category field is present */
+	if (skb->len < IEEE80211_MIN_ACTION_SIZE)
+		return -EINVAL;
+
+	remaining_len = skb->len - IEEE80211_MIN_ACTION_SIZE;
+	has_protected = ieee80211_has_protected(hdr->frame_control);
+
+	/* In case of SW crypto and hdr protected (PMF), packet will already be encrypted,
+	 * we can't put in data in this case
+	 */
+	if (test_bit(ATH11K_FLAG_HW_CRYPTO_DISABLED, &ar->ab->dev_flags) &&
+	    has_protected)
+		return 0;
+
+	mgmt = (struct ieee80211_mgmt *)hdr;
+	buf = (u8 *)&mgmt->u.action;
+
+	/* FCTL_PROTECTED frame might have extra space added for HDR_LEN. Offset that
+	 * many bytes if it is there
+	 */
+	if (has_protected) {
+		skb_cb = ATH11K_SKB_CB(skb);
+
+		switch (skb_cb->cipher) {
+		/* Cipher suite having flag %IEEE80211_KEY_FLAG_GENERATE_IV_MGMT set in
+		 * key needs to be processed. See ath11k_install_key()
+		 */
+		case WLAN_CIPHER_SUITE_CCMP:
+		case WLAN_CIPHER_SUITE_CCMP_256:
+		case WLAN_CIPHER_SUITE_GCMP:
+		case WLAN_CIPHER_SUITE_GCMP_256:
+			iv_len = IEEE80211_CCMP_HDR_LEN;
+			break;
+		case WLAN_CIPHER_SUITE_TKIP:
+			iv_len = 0;
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		if (remaining_len < iv_len)
+			return -EINVAL;
+
+		buf += iv_len;
+		remaining_len -= iv_len;
+	}
+
+	category = *buf++;
+	/* category code is already taken care in %IEEE80211_MIN_ACTION_SIZE hence
+	 * no need to adjust remaining_len
+	 */
+
+	switch (category) {
+	case WLAN_CATEGORY_RADIO_MEASUREMENT:
+		/* need action code and dialog token */
+		if (remaining_len < 2)
+			return -EINVAL;
+
+		/* Packet Format:
+		 *	Action Code | Dialog Token | Variable Len (based on Action Code)
+		 */
+		action_code = *buf++;
+		dialog_token = *buf++;
+		remaining_len -= 2;
+
+		if (ath11k_mac_vif_chan(arvif->vif, &def))
+			return -ENOENT;
+
+		cur_tx_power = arvif->vif->bss_conf.txpower;
+		max_tx_power = min(def.chan->max_reg_power, (int)ar->max_tx_power / 2);
+		ath11k_mac_handle_get_txpower(ar, arvif->vif, &cur_tx_power);
+
+		switch (action_code) {
+		case WLAN_RM_ACTION_LINK_MEASUREMENT_REQUEST:
+			/* need variable fields to be present in len */
+			if (remaining_len < 2)
+				return -EINVAL;
+
+			/* Variable length format as defined in IEEE 802.11-2024,
+			 * Figure 9-1187-Link Measurement Request frame Action field
+			 * format.
+			 *	Transmit Power | Max Tx Power
+			 * We fill both of these.
+			 */
+			*buf++ = cur_tx_power;
+			*buf = max_tx_power;
+
+			ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
+				   "RRM: Link Measurement Req dialog_token %u cur_tx_power %d max_tx_power %d\n",
+				   dialog_token, cur_tx_power, max_tx_power);
+			break;
+		case WLAN_RM_ACTION_LINK_MEASUREMENT_REPORT:
+			/* need variable fields to be present in len */
+			if (remaining_len < 3)
+				return -EINVAL;
+
+			/* Variable length format as defined in IEEE 802.11-2024,
+			 * Figure 9-1188-Link Measurement Report frame Action field format
+			 *	TPC Report | Variable Fields
+			 *
+			 * TPC Report Format:
+			 *	Element ID | Len | Tx Power | Link Margin
+			 *
+			 * We fill Tx power in the TPC Report (2nd index)
+			 */
+			buf[2] = cur_tx_power;
+
+			/* TODO: At present, Link margin data is not present so can't
+			 * really fill it now. Once it is available, it can be added
+			 * here
+			 */
+			ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
+				   "RRM: Link Measurement Report dialog_token %u cur_tx_power %d\n",
+				   dialog_token, cur_tx_power);
+			break;
+		default:
+			return -EINVAL;
+		}
+		break;
+	default:
+		/* nothing to fill */
+		return 0;
+	}
+
+	return 0;
+}
+
+static int ath11k_mac_mgmt_frame_fill_elem_data(struct ath11k_vif *arvif,
+						struct sk_buff *skb)
+{
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
+
+	if (!ieee80211_is_action(hdr->frame_control))
+		return 0;
+
+	return ath11k_mac_mgmt_action_frame_fill_elem_data(arvif, skb);
+}
+
 static void ath11k_mgmt_over_wmi_tx_work(struct work_struct *work)
 {
 	struct ath11k *ar = container_of(work, struct ath11k, wmi_mgmt_tx_work);
@@ -6270,6 +6423,19 @@ static void ath11k_mgmt_over_wmi_tx_work(struct work_struct *work)
 		arvif = ath11k_vif_to_arvif(skb_cb->vif);
 		mutex_lock(&ar->conf_mutex);
 		if (ar->allocated_vdev_map & (1LL << arvif->vdev_id)) {
+			/* Fill in the data which is required to be filled by the driver
+			 * For example: Max Tx power in Link Measurement Request/Report
+			 */
+			ret = ath11k_mac_mgmt_frame_fill_elem_data(arvif, skb);
+			if (ret) {
+				/* If we couldn't fill the data due to any reason,
+				 * let's not discard transmitting the packet.
+				 */
+				ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
+					   "Failed to fill the required data for the mgmt packet err %d\n",
+					   ret);
+			}
+
 			ret = ath11k_mac_mgmt_tx_wmi(ar, arvif, skb);
 			if (ret) {
 				ath11k_warn(ar->ab, "failed to tx mgmt frame, vdev_id %d :%d\n",

-- 
2.34.1


