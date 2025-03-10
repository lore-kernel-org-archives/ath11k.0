Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35B2C35FF4
	for <ath11k@archiver.kernel.org>; Mon, 10 Mar 2025 20:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ocngaqNuTAmFDtQ/nMV7R7IQxYddeURnB+NCuAeJxDc=; b=y19CSFYMX2yAdoINVoBknMctHp
	xYUEJWoqbrtnUdTwDRyUiZ+kBTTqurXgkv/YB1QaxmZkS0udUn6WTcrfM7R3ITOIno+u6cutrJhgD
	9B6gaKczd2Qh6TEdK4N3njn41JmDzSJ2fda4/vxcGCgUWKpLRgTeuE2obt7eJKz3vyANFKj71uSJK
	qdneUfghmP9C9ed7O8der6hOTXMs+y4mPjdcJ7qWdfBLqOT9SQ7dkCL0i2C2qI9AldIJogVbfhjgf
	cpYxFGiba2mWqAvyqw27Krab70SyZC+36Padq8FTI+pCUVaoFs5VJ4Evh5PGLWEMyyAh61wXCZ/fE
	Mk53xYBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trjV8-00000003pNl-3r3e;
	Mon, 10 Mar 2025 20:13:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trjKm-00000003nki-3lq4
	for ath11k@lists.infradead.org;
	Mon, 10 Mar 2025 20:02:46 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52AIpXvN021615
	for <ath11k@lists.infradead.org>; Mon, 10 Mar 2025 20:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ocngaqNuTAm
	FDtQ/nMV7R7IQxYddeURnB+NCuAeJxDc=; b=bQkMxjrE+aIY7f5CVBT6y3z8BJV
	baYMO+blcPkp7ZjMK/JeN7e8kjbm7/6MgRQRbx6GAbKmCXa4Nnj4D+fABjvRKZYZ
	al/MRWfRYWkAu56cov6HIVUrPEMKrbeKPpqIRDv7539GN8z2X31B/A7KxkSmjoXQ
	d6o3dTbXhkg+yuNUyfiW+B82K5hxHwe8AssxN/bhwWmja1TMQONPSFrBRiotbPvc
	FVbfh0t1cUgYCDcSIYkMXcuGPn8cCUz7aPUwxyYmIDM0gOq921e+D66LY+K1Xjr+
	QOfWbs28la5WHI4vG895qJQGskZyRt33IXzTWESkT4wN376alX1GE0NSqrg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458ex0x2ky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 10 Mar 2025 20:02:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff53a4754aso13182499a91.2
        for <ath11k@lists.infradead.org>; Mon, 10 Mar 2025 13:02:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741636962; x=1742241762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ocngaqNuTAmFDtQ/nMV7R7IQxYddeURnB+NCuAeJxDc=;
        b=B+WFZfTej19DoOZDEOZC83AoaeiCClp8QnlPQBShBWSmSW21LpMwjdZ9uiJdzVlepD
         BhE6EKvdLch28Aor/0PY0xgpO57W9gLO3jRgk6klVu9eWax/D4mv5dwnDwq0FltBS93F
         RfQ9es6S/01UN4rB/UJECX80afMf8YAqPg3213LNpHJ1VhRrpVPMPhGQrBfcpqy6ttT+
         7lczvGT4qDWnUx8hWXssRthDp/H1EDPv+SSix50rb4AUBbp+MCrXtew5VNTeO15JbW6N
         mnK2jFxjZj+yvlTBW/3v0nq5Nue441+nqkfHIoAuDfyqsBm5MLkQ/Zd2UTpBHdbn4huH
         2w2g==
X-Forwarded-Encrypted: i=1; AJvYcCUlbU4XCo9cCt4+zAfRDYD6s7W6V+vBI4bLZSedwvjlYdIb5J4d+zDS4NojWP/egCZpvGEWCEc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxCZTF3VAjscU5I7LvH2WJKAXRFWIERJBoBWSfT0UpBsEYeeArq
	5/mNKgKDUq+RZxpnT5FNVqk/bl0wl3/SC6SLRcoRQLm84NAdKojXY4Hi0jUFpQuXxXLxqIbu5W5
	v/LmfTZuzJbJjS3roInG46QZp9735JbzLzrgMuNTquXQhu31VCJwWaXlvUzUhW071QIWh
X-Gm-Gg: ASbGncvO3Nsw1X2+IWVw+9IeMQtBkGgJdGdoh/ds0QDO/7eV1XVtYTFjhXtLm08EMNK
	Z5K7sGzCXaTyrNuR9rEZJZZaCIr+I1GzJtUIss5+MVH9RULYAbPOf1JVXiiq98ctcQvYutqVi1R
	NqtbZBde0VlMT08wIhGGdxF30yxpB2T5patN85jP/O9YGXuECPvP3AfT4W9bgwBL1IUPiD/eXKv
	QYueMtjJPL/NXcTPM+QvfQYekWJ8eV4n0i2ymc76F+wNG9EW/CZbNAGngjrRuld1y5qmogTom1W
	cYeXnjydaM8ClwZwoeYDowaTYqnTSdJfsfJZZHJqyELwk+E9K/9vfYIRkcaK21FZgpFEavg=
X-Received: by 2002:a05:6a20:72a5:b0:1f0:e7e2:b295 with SMTP id adf61e73a8af0-1f544acd6a7mr17950238637.5.1741636962022;
        Mon, 10 Mar 2025 13:02:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPVM55Ipm+xg8CMpt0MVYTdLPhq0VahYP883c6p2nk/KwVbYVK9hWRJxAp3Mx4wa3aPTOijw==
X-Received: by 2002:a05:6a20:72a5:b0:1f0:e7e2:b295 with SMTP id adf61e73a8af0-1f544acd6a7mr17950208637.5.1741636961690;
        Mon, 10 Mar 2025 13:02:41 -0700 (PDT)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736cbe3fb3fsm3730419b3a.83.2025.03.10.13.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 13:02:41 -0700 (PDT)
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
To: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        ath11k@lists.infradead.org
Cc: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Muna Sinada <muna.sinada@oss.qualcomm.com>,
        Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Subject: [PATCH v4 1/3] wifi: nl80211: add link id of transmitted profile for MLO MBSSID
Date: Mon, 10 Mar 2025 13:02:35 -0700
Message-Id: <20250310200237.652950-2-aloka.dixit@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250310200237.652950-1-aloka.dixit@oss.qualcomm.com>
References: <20250310200237.652950-1-aloka.dixit@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HF575gQkqAUpYZ-NpkLVOcuyl4RaBYmr
X-Authority-Analysis: v=2.4 cv=f/qyBPyM c=1 sm=1 tr=0 ts=67cf4563 cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=diLcHdusufV46o6eeBsA:9 a=N3MwnUSRF2nazewGnDsO:22 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: HF575gQkqAUpYZ-NpkLVOcuyl4RaBYmr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_07,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_130245_059262_3BCF2D06 
X-CRM114-Status: GOOD (  19.43  )
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

From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

During non-transmitted (nontx) profile configuration, interface
index of the transmitted (tx) profile is used to retrieve the
wireless device (wdev) associated with it. With MLO, this 'wdev'
may be part of an MLD with more than one link, hence only
interface index is not sufficient anymore to retrieve the correct
tx profile. Add a new attribute to configure link id of tx profile.

Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Co-developed-by: Muna Sinada <muna.sinada@oss.qualcomm.com>
Signed-off-by: Muna Sinada <muna.sinada@oss.qualcomm.com>
Co-developed-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
---
 include/net/cfg80211.h       |  2 ++
 include/uapi/linux/nl80211.h |  6 ++++++
 net/wireless/nl80211.c       | 14 ++++++++++++++
 3 files changed, 22 insertions(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 6b170a8d086c..0f7a4f410d45 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -1286,11 +1286,13 @@ struct cfg80211_crypto_settings {
  * struct cfg80211_mbssid_config - AP settings for multi bssid
  *
  * @tx_wdev: pointer to the transmitted interface in the MBSSID set
+ * @tx_link_id: link ID of the transmitted profile in an MLD, default is 0.
  * @index: index of this AP in the multi bssid group.
  * @ema: set to true if the beacons should be sent out in EMA mode.
  */
 struct cfg80211_mbssid_config {
 	struct wireless_dev *tx_wdev;
+	u8 tx_link_id;
 	u8 index;
 	bool ema;
 };
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index 9d8ecf20ef0d..ed2a181a2557 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -8022,6 +8022,11 @@ enum nl80211_sar_specs_attrs {
  *	Setting this flag is permitted only if the driver advertises EMA support
  *	by setting wiphy->ema_max_profile_periodicity to non-zero.
  *
+ * @NL80211_MBSSID_CONFIG_ATTR_TX_LINK_ID: Link ID of the transmitted profile.
+ *	This parameter is mandatory if the transmitted profile is part of an MLD
+ *	and the interface getting configured is a non-transmitted profile. For all
+ *	other cases it will be ignored.
+ *
  * @__NL80211_MBSSID_CONFIG_ATTR_LAST: Internal
  * @NL80211_MBSSID_CONFIG_ATTR_MAX: highest attribute
  */
@@ -8033,6 +8038,7 @@ enum nl80211_mbssid_config_attributes {
 	NL80211_MBSSID_CONFIG_ATTR_INDEX,
 	NL80211_MBSSID_CONFIG_ATTR_TX_IFINDEX,
 	NL80211_MBSSID_CONFIG_ATTR_EMA,
+	NL80211_MBSSID_CONFIG_ATTR_TX_LINK_ID,
 
 	/* keep last */
 	__NL80211_MBSSID_CONFIG_ATTR_LAST,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 2c4e06610a79..0ebbce9fbaf4 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -469,6 +469,8 @@ nl80211_mbssid_config_policy[NL80211_MBSSID_CONFIG_ATTR_MAX + 1] = {
 	[NL80211_MBSSID_CONFIG_ATTR_INDEX] = { .type = NLA_U8 },
 	[NL80211_MBSSID_CONFIG_ATTR_TX_IFINDEX] = { .type = NLA_U32 },
 	[NL80211_MBSSID_CONFIG_ATTR_EMA] = { .type = NLA_FLAG },
+	[NL80211_MBSSID_CONFIG_ATTR_TX_LINK_ID] =
+		NLA_POLICY_MAX(NLA_U8, IEEE80211_MLD_MAX_NUM_LINKS),
 };
 
 static const struct nla_policy
@@ -5561,6 +5563,18 @@ static int nl80211_parse_mbssid_config(struct wiphy *wiphy,
 			}
 
 			config->tx_wdev = tx_netdev->ieee80211_ptr;
+
+			if (config->tx_wdev->valid_links) {
+				if (!tb[NL80211_MBSSID_CONFIG_ATTR_TX_LINK_ID])
+					return -ENOLINK;
+
+				config->tx_link_id =
+					nla_get_u8(tb[NL80211_MBSSID_CONFIG_ATTR_TX_LINK_ID]);
+
+				if (!(config->tx_wdev->valid_links &
+				      BIT(config->tx_link_id)))
+					return -ENOLINK;
+			}
 		} else {
 			config->tx_wdev = dev->ieee80211_ptr;
 		}
-- 
2.34.1


