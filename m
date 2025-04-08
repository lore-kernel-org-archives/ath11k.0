Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCDBC369A6
	for <ath11k@archiver.kernel.org>; Tue,  8 Apr 2025 19:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nGewVlGR5Rw3EAn1ECySsP4zNMvSdf5+Gq5+AeTqVY8=; b=0OmbGtqfoPHcFxgBYf7AO+AXHb
	PVRCGuhuXuBXkcR3s9fae7JH+0X9funG+nF+qfThbc3KAAAqYq6MQxWM2sFNNtmDK198/wxMcPRdd
	NoFZqTeHW7e/t/4CvezcTWR1oIT4p+ndLT/MamgpBYViOGF8j9M9zfqFP4EK5guD4dB3u3gundoue
	bUdrTVpXDYVxL2hUPEzLRC/xxnyoPV/9rlNANoCicDRI6OHB8r490KKzqEbxCYogU+cRxlM9BKG2r
	Vb9A+QLYUVz+vsLvJhdLzERQ75CV9zxq0BICSXMdwkMf/s85M0ZgCgY6fVBPptZAPzNtuwA3CzeJd
	3e7/G/yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2F4y-00000005HcQ-065C;
	Tue, 08 Apr 2025 19:57:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2DwY-000000059CT-20PH
	for ath11k@lists.infradead.org;
	Tue, 08 Apr 2025 18:45:07 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BliFS014181
	for <ath11k@lists.infradead.org>; Tue, 8 Apr 2025 18:45:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nGewVlGR5Rw
	3EAn1ECySsP4zNMvSdf5+Gq5+AeTqVY8=; b=GNMLwAN1/geTCrT3bfp/FuFFkAu
	3N+qTtt/bxlRYRaQydTX9/vgXCfqCd7WMB2+aJIZ/uoeKdczdYqDKX7r1n6xkQmG
	0ZhmY0kA90X71TxvDOjFjn/W8cvzuMaCXbvEI1OHg2amOb1QGmgxppBNniV7vbPv
	tdCGQAVo/SBwm7CBkB9KVfLtbszdTGIn4EkFxEFFwv1ltbVukL9gE48KTVahv2wu
	p9oLf9w1sN8UukfNwvnWmr1PEFLFBZMSKOssP1aYfW8uuf6xSKdJXm2RGQ+pVSr7
	Y+jaa1NmTQgYoiL9lkHlrozTVj+KadNIw2DpoPBs9kM7PlPOh6TTYXc2aAg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpm8u1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 08 Apr 2025 18:45:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ff581215f7so4763540a91.3
        for <ath11k@lists.infradead.org>; Tue, 08 Apr 2025 11:45:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744137904; x=1744742704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nGewVlGR5Rw3EAn1ECySsP4zNMvSdf5+Gq5+AeTqVY8=;
        b=b7YqYyhp9qT8P937FrDmISHta30odz0zf/pLwlOVPqgeqDnO2YjQp283nQYmflAIvc
         Qzr9b9PBBAOsLMtTETYZhx6cHaneCGmrELTctessFcYWSLlHShKGrLZcO7jumML6mwqz
         7BgJZwsW6VeRfRE7BBQwzfnJEAe/VzPNmAQckb8ejsVrm5/XrIb09fZ8Jj+7pFcSkzFK
         NDNIaVOuB0BVwciWoV0IO0Bmd/Pd9UtNa3b+uliBJfWwtQKRBdyOLZ1oBq68AGvl3Pbu
         PL2y+u6hmSKJ+uUWM0htES90MbZh8ho3/suqaskzThFZf/ZLVoFB1HFyJ07TDROXFtLu
         GgWQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1+tKRDRqU/lHAeKshiDFb3Gb+reN8MLNxOHORSCszU2vctyqK9Cdi74WpJb9x2ZsjxLqA8zg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7BuWBB/fMnpr9uSCtSP7aLrMkh+1uIwK+LDkUvld7xqLvJFv+
	bekb+NGA7DhohbZBiT6vr/1LhWoka87t8JUCngdFxk3AUKOKXz8yoDatb34Fuu2Q9lyRzwG+Zjw
	thfLL6+kIsCF6/X82ILuJm7ygdwCsF26Mc/Up8rRQWLlDHNrbZAKCZxDYBWQg
X-Gm-Gg: ASbGncu+gNPXFteYcbfSHx5mbQWVyQG1e0ohGCc6PfdxBJvbD2VKSlrIumS62jt3jWs
	9JkuxMGSqXARLa/nkfZYylIjyzPSTly/e3YrtS9wFyBmivkknrtu+kYzC++8URri1BoLKwb07xd
	7jbzdO42FdVdA92YasmL4qWr9idZ8khfnBUqXXKzBcgR7X/+NHHU9upGMlTrHCVmUs3ArlRSQ5b
	inx0iD5f1mfBUCJW8HaG7ORDCrBoeCIKPFzfR2ypGvCVBKTTfklAhkOAZnB7uOWU4xFfOTGtZ+p
	8OFEdqRFx/uuspVeSa9OZmWmDTAcokEMPv3yT7FqKSVTjwNaoAiP1N+RgXEUpXWCd8iy6SU=
X-Received: by 2002:a17:90b:4ece:b0:2ea:5dea:eb0a with SMTP id 98e67ed59e1d1-306dbb8c16emr404210a91.4.1744137903937;
        Tue, 08 Apr 2025 11:45:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUOVLwRfGhy9gwHXSdQAnOWYQikjdvGvb9IJL52qmnY3UBEm9qZ17YKSWTwjSbsRDxb3wagg==
X-Received: by 2002:a17:90b:4ece:b0:2ea:5dea:eb0a with SMTP id 98e67ed59e1d1-306dbb8c16emr404186a91.4.1744137903551;
        Tue, 08 Apr 2025 11:45:03 -0700 (PDT)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb9500dsm12882212a91.47.2025.04.08.11.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 11:45:03 -0700 (PDT)
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
To: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        ath11k@lists.infradead.org
Subject: [PATCH wireless-next v5 1/3] wifi: nl80211: add link id of transmitted profile for MLO MBSSID
Date: Tue,  8 Apr 2025 11:44:59 -0700
Message-Id: <20250408184501.3715887-2-aloka.dixit@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408184501.3715887-1-aloka.dixit@oss.qualcomm.com>
References: <20250408184501.3715887-1-aloka.dixit@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LuNCioylRvuORVC9mOgeIHZPlg8UH-Tt
X-Proofpoint-ORIG-GUID: LuNCioylRvuORVC9mOgeIHZPlg8UH-Tt
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f56eb0 cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=voIm8Yqn4N3_T5BSyJkA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_08,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_114506_522194_DEBE4B0B 
X-CRM114-Status: GOOD (  22.01  )
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
 net/wireless/nl80211.c       | 24 +++++++++++++++++++++++-
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index efbd79c67be2..ac51614fedff 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -1300,11 +1300,13 @@ struct cfg80211_crypto_settings {
  * struct cfg80211_mbssid_config - AP settings for multi bssid
  *
  * @tx_wdev: pointer to the transmitted interface in the MBSSID set
+ * @tx_link_id: link ID of the transmitted profile in an MLD.
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
index ddcc4cda74af..e9ccf43fe3c6 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -8036,6 +8036,11 @@ enum nl80211_sar_specs_attrs {
  *	Setting this flag is permitted only if the driver advertises EMA support
  *	by setting wiphy->ema_max_profile_periodicity to non-zero.
  *
+ * @NL80211_MBSSID_CONFIG_ATTR_TX_LINK_ID: Link ID of the transmitted profile.
+ *	This parameter is mandatory when NL80211_ATTR_MBSSID_CONFIG attributes
+ *	are sent for a non-transmitted profile and if the transmitted profile
+ *	is part of an MLD. For all other cases this parameter is unnecessary.
+ *
  * @__NL80211_MBSSID_CONFIG_ATTR_LAST: Internal
  * @NL80211_MBSSID_CONFIG_ATTR_MAX: highest attribute
  */
@@ -8047,6 +8052,7 @@ enum nl80211_mbssid_config_attributes {
 	NL80211_MBSSID_CONFIG_ATTR_INDEX,
 	NL80211_MBSSID_CONFIG_ATTR_TX_IFINDEX,
 	NL80211_MBSSID_CONFIG_ATTR_EMA,
+	NL80211_MBSSID_CONFIG_ATTR_TX_LINK_ID,
 
 	/* keep last */
 	__NL80211_MBSSID_CONFIG_ATTR_LAST,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index f039a7d0d6f7..bc48365ee188 100644
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
@@ -5523,11 +5525,13 @@ static int validate_beacon_tx_rate(struct cfg80211_registered_device *rdev,
 
 static int nl80211_parse_mbssid_config(struct wiphy *wiphy,
 				       struct net_device *dev,
+				       unsigned int link_id,
 				       struct nlattr *attrs,
 				       struct cfg80211_mbssid_config *config,
 				       u8 num_elems)
 {
 	struct nlattr *tb[NL80211_MBSSID_CONFIG_ATTR_MAX + 1];
+	int tx_link_id = -1;
 
 	if (!wiphy->mbssid_max_interfaces)
 		return -EOPNOTSUPP;
@@ -5551,6 +5555,9 @@ static int nl80211_parse_mbssid_config(struct wiphy *wiphy,
 	    (!config->index && !num_elems))
 		return -EINVAL;
 
+	if (tb[NL80211_MBSSID_CONFIG_ATTR_TX_LINK_ID])
+		tx_link_id = nla_get_u8(tb[NL80211_MBSSID_CONFIG_ATTR_TX_LINK_ID]);
+
 	if (tb[NL80211_MBSSID_CONFIG_ATTR_TX_IFINDEX]) {
 		u32 tx_ifindex =
 			nla_get_u32(tb[NL80211_MBSSID_CONFIG_ATTR_TX_IFINDEX]);
@@ -5572,10 +5579,25 @@ static int nl80211_parse_mbssid_config(struct wiphy *wiphy,
 			}
 
 			config->tx_wdev = tx_netdev->ieee80211_ptr;
+			/* Caller should call dev_put(config->tx_wdev) from this point */
+
+			if (config->tx_wdev->valid_links) {
+				if (tx_link_id == -1 ||
+				    !(config->tx_wdev->valid_links & BIT(tx_link_id)))
+					return -ENOLINK;
+
+				config->tx_link_id = tx_link_id;
+			}
 		} else {
+			if (tx_link_id >= 0 && tx_link_id != link_id)
+				return -EINVAL;
+
 			config->tx_wdev = dev->ieee80211_ptr;
 		}
 	} else if (!config->index) {
+		if (tx_link_id >= 0 && tx_link_id != link_id)
+			return -EINVAL;
+
 		config->tx_wdev = dev->ieee80211_ptr;
 	} else {
 		return -EINVAL;
@@ -6325,7 +6347,7 @@ static int nl80211_start_ap(struct sk_buff *skb, struct genl_info *info)
 	}
 
 	if (info->attrs[NL80211_ATTR_MBSSID_CONFIG]) {
-		err = nl80211_parse_mbssid_config(&rdev->wiphy, dev,
+		err = nl80211_parse_mbssid_config(&rdev->wiphy, dev, link_id,
 						  info->attrs[NL80211_ATTR_MBSSID_CONFIG],
 						  &params->mbssid_config,
 						  params->beacon.mbssid_ies ?
-- 
2.34.1


