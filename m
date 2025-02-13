Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF03C021A6
	for <ath11k@archiver.kernel.org>; Thu, 13 Feb 2025 23:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p6grw8wuFGe/gguOVhEpgEpd6veb5fHEaE9GwGP73BM=; b=BQpXKhbDk/EhhhU6XQq+55P0sF
	3PFnwX9yML567lsT0f3NlAzwrlBAJz7E4d0KiKHFh9dgUbe8xxmLco5dx5zPQwiG0CYx9Jefrl9sa
	yyfn0oewzP+uxwWyiYmOrewbXUFES9lxQbMipnmUtEOZrdTEDiqHZypPJq2RNSeBEPPBRVNZ3TrlP
	w2o8cBekEvubeWcZ5IJCq912fgzv4Pfa2DEIRzCCo6o1iA3oe/Y9HVq3Sf85cDKQxnP47pUewrkHh
	Xj/UMArqhFTlfm8AP76+LuYAEJ7tFW1ubnZxem8z48SWN6lr7fWxBS3ESLov+o6FYcTi/udL77c4v
	NE5rlpkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tij48-0000000D09S-3FXi;
	Thu, 13 Feb 2025 23:56:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tii2e-0000000CrqF-36YJ
	for ath11k@lists.infradead.org;
	Thu, 13 Feb 2025 22:50:46 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DKDBsb027801
	for <ath11k@lists.infradead.org>; Thu, 13 Feb 2025 22:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=p6grw8wuFGe
	/gguOVhEpgEpd6veb5fHEaE9GwGP73BM=; b=Oc83GJrrP3tiTxtzl4TPWGI3C25
	EQF8QaZPD/DPPMF4PBwigrfn1vuu2KMVrrNhw2LFSwktsFoZXfiWsQ8coLS0FzUW
	GDlLwflXjZqmZUoykBqhHqGWaLjdf2/nZzTFAoIYPr1r5x/G5fEA0Py3SzA043Cy
	xXOCIMW+4xSMm8ijPvd/hCQSKSWipOslFOCL0WI4rlkRwCvkvSwEUHlOxUxv/3U0
	slrJ1xwf6LMb5rYUWGHH5jYdK2/FmhQctJBNGsMl1fbwocgKjcPO/0EBO+1HcxP5
	E5lLq1497PwJHtadLdD6fTtQoJO4qlvVJ7Nz+kAzmqNYnEUoJmSymDvMIpw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44sebn9wtc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 13 Feb 2025 22:50:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-220ec5c16e9so5359725ad.1
        for <ath11k@lists.infradead.org>; Thu, 13 Feb 2025 14:50:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739487042; x=1740091842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p6grw8wuFGe/gguOVhEpgEpd6veb5fHEaE9GwGP73BM=;
        b=v6MhtjMyl6JNQUQp+xtKCa10ed5rKL/x4SN2waSVWw1v9IqoX2vEBy83tx4iMZCAuW
         92KACdmNNtqE5P51Jr8dZbvv2J5fSE10D+dOtNvMC3Wi6RXzPirVIYoFsWZu9wAeFIXY
         kQ63JvewXKALhs6TSnSIDu5bsWmo6HPrL/aaYHum8Ej2veVvJquN4IOPJ5NFpAyryavv
         OFwT/QM0Y96hYvXiB1GAXFI0yEqCrn3QpEbQBMBjFwkMmV13G+7+UVqQMP/oiBouUuip
         1IVxRaRpYY/+uF35NGxlME2brGcCSPXMsVlRQ10hH5cYvh0CKjsehPVl1TqPuY4h958u
         Sn9Q==
X-Gm-Message-State: AOJu0YwJ2H0348pq9Oa+uIsmy59K4S/P7RbjB/wJa46nJZvddwPNlrwG
	HdRm88dYJB/WAgaY094BaqBNme/3uZF4mWtHR5HqH5dkwMpQZYIS5TQqOVgaEUDOCbMT1KwWKUM
	LG2ELrTuk3qXMMyM78VBDT/wvkD12K1xZ3Dy1r3Qun9tAt5s9Q20ojpJVtK8np1cLqZJj
X-Gm-Gg: ASbGnctfqFMlL9z/gAJuK892VD7mKbbhvvB+1WvZK0ffsOgSKcHi0Iy0m0DmXpaMFZ+
	AoKzssp1An63tGGxmVgfgNBvAVR1KbYeDrLOMl+W1nVWyhFe+wtHyqYvoz0yG+UI3BGhcskIcYL
	WBvSQcYuAYrIcDmMWe3tQj3VPoXHvhK+CTN8qOqJ0DH5KRO+hXLIXbStvuTducSSx9bS+n5gdJT
	zTCPLph5O+2FUFBQ4RoARHTzz21rRmoosLl9QHsud36I0tgIPWOHjVRBRqXbC3gHpGOu4A9CHlr
	uzJMwghw6FrliA6nc1ZUKGCQSzGFI0ZCNQYq3rwSv6/3rZ4Rq8AMLF1oBxzf
X-Received: by 2002:a17:902:c402:b0:220:d7f9:9ea8 with SMTP id d9443c01a7336-220d7f99fc9mr51790595ad.26.1739487042410;
        Thu, 13 Feb 2025 14:50:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEbl+ByEJmGsoi3MIiBDk9HO865Pptlkod6xeE/FgmeLuvCEu8A5fRJ/bY82qQD4lJfd4D3bA==
X-Received: by 2002:a17:902:c402:b0:220:d7f9:9ea8 with SMTP id d9443c01a7336-220d7f99fc9mr51790315ad.26.1739487042011;
        Thu, 13 Feb 2025 14:50:42 -0800 (PST)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d55916c7sm17571665ad.243.2025.02.13.14.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 14:50:41 -0800 (PST)
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
To: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
Cc: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Muna Sinada <muna.sinada@oss.qualcomm.com>,
        Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Subject: [PATCH v3 1/3] wifi: nl80211: add link id of transmitted profile for MLO MBSSID
Date: Thu, 13 Feb 2025 14:50:34 -0800
Message-Id: <20250213225036.3118133-2-aloka.dixit@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250213225036.3118133-1-aloka.dixit@oss.qualcomm.com>
References: <20250213225036.3118133-1-aloka.dixit@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pC8Y1Er_c_y7lzUQqNsuKPTf7IBiKOez
X-Proofpoint-ORIG-GUID: pC8Y1Er_c_y7lzUQqNsuKPTf7IBiKOez
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_08,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_145044_800645_EBC3055F 
X-CRM114-Status: GOOD (  19.19  )
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
index a72e7eb7027f..d0e5e146704e 100644
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
index 8bd09110d393..13fc03858474 100644
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


