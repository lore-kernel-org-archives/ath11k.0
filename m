Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE768C636D4
	for <ath11k@archiver.kernel.org>; Wed,  1 Feb 2023 06:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M2jYYhGYg9eFwc7KG+ZvA3FvQl82bNMIHcmTYSfzfmw=; b=NZRvXrRas4ZWXg
	/1XzliqzK9DTdGgAA8fV+mUaD7JkBmNO4p5Z0rN074NiIooSJNsPV5nkOywzyj+ukEaYcSLNEXNvO
	M2jD//5EOvelK5YIOUw6syxGSaWS8MgDEbRVM7JMSdEd4dEngF+I0B5I3hPTEd+hiN1x0Zr32KdT2
	ztI0uRkJnzInCgWDNr+6lZJZVKko5A/RDv3nZ0WoSr8Aji/D9bPt4LGCq8ZFWCCyNY7LBaFyCwefc
	VTBFzWK9tUcSvG5E7Gb5QeIjEPrp9dlKt3rml8YWyu0zAfrjygfk4XtBeTFu6ixARemGj2PQRYAQo
	Jbc9QvqulGKB5C6D047g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN73c-00AXLg-1n; Wed, 01 Feb 2023 06:57:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN73Z-00AXKg-NQ
	for ath11k@lists.infradead.org; Wed, 01 Feb 2023 06:57:23 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3114jkhv005125;
	Wed, 1 Feb 2023 06:57:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=M366HwuphEn6XqbknvbhbZfdfjn9c1C/XPeCWaxT5FQ=;
 b=QwludCRXMziWu1WuxAkXHCPOqIzEnZETNdHyNCUKGmbd646KKyjrTLquYvhZLs2RrjZJ
 tkumwWrMbYmhIDea/kp+DiBVcOohgNhZno72q7UxQXnUpD+7MHbKWB4WpGvQ+dAn0psX
 9ndtG11DiY8dt+3W/b43EORcMhlGer6pwGDvbTuV+LQkOTYAv0OqngbzO45wRTqRlsCc
 NTtQ2zE0R4i4EVUfi4YHEaK3SALd2b+L9pwhg/Lg2jLH0ulMXKvGDqxx31VYvGehgCtu
 7MwXNSkCnViAI6JhO9uoE3I26ztsz5HhGPFxtso6WWyf/gx5gi3rRI/CrtGfUrNBlFPR hw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nfbuh0x5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 06:57:20 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3116vJ58021327
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 1 Feb 2023 06:57:19 GMT
Received: from ramess-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 31 Jan 2023 22:57:16 -0800
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <johannes@sipsolutions.net>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Rameshkumar Sundaram
	<quic_ramess@quicinc.com>
Subject: [PATCH v3 1/3] wifi: cfg80211: add support to enable/disable bss color collision detection
Date: Wed, 1 Feb 2023 12:26:36 +0530
Message-ID: <20230201065638.25990-2-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230201065638.25990-1-quic_ramess@quicinc.com>
References: <20230201065638.25990-1-quic_ramess@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rTjFZwskU9SGcqtW0fBzPh6mTHxKB66h
X-Proofpoint-GUID: rTjFZwskU9SGcqtW0fBzPh6mTHxKB66h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_02,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302010059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_225721_916285_E023E99B 
X-CRM114-Status: GOOD (  19.08  )
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

As per 802.11ax-2021, STAs shall process BSS Color Change Announcement
(BCCA) from AP and switch to new color, but some STAs aren't processing
BCCA from AP and not doing color switch, causing them to drop data
frames from AP post color change.

Provide an option to disable color collision detection and therefore
not to do BCCA to mitigate the same from AP. If it's required in case
where STA supports BCCA handling, then it can enabled in AP using this
option.

Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
---
 include/net/cfg80211.h       | 2 ++
 include/uapi/linux/nl80211.h | 3 +++
 net/wireless/nl80211.c       | 3 +++
 3 files changed, 8 insertions(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 54a77d906b2d..c4c84ccf8e20 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -304,11 +304,13 @@ struct ieee80211_he_obss_pd {
  * @color: the current color.
  * @enabled: HE BSS color is used
  * @partial: define the AID equation.
+ * @collision_detection_enabled: HE BSS color collision detection is enabled.
  */
 struct cfg80211_he_bss_color {
 	u8 color;
 	bool enabled;
 	bool partial;
+	bool collision_detection_enabled;
 };
 
 /**
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index 8ecb0fbee721..a6068cdabf25 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -7442,6 +7442,8 @@ enum nl80211_obss_pd_attributes {
  * @NL80211_HE_BSS_COLOR_ATTR_COLOR: the current BSS Color.
  * @NL80211_HE_BSS_COLOR_ATTR_DISABLED: is BSS coloring disabled.
  * @NL80211_HE_BSS_COLOR_ATTR_PARTIAL: the AID equation to be used..
+ * @NL80211_HE_BSS_COLOR_ATTR_COLLISION_DETECTION_DISABLED: is BSS
+ * color collision detection disabled.
  *
  * @__NL80211_HE_BSS_COLOR_ATTR_LAST: Internal
  * @NL80211_HE_BSS_COLOR_ATTR_MAX: highest BSS Color attribute.
@@ -7452,6 +7454,7 @@ enum nl80211_bss_color_attributes {
 	NL80211_HE_BSS_COLOR_ATTR_COLOR,
 	NL80211_HE_BSS_COLOR_ATTR_DISABLED,
 	NL80211_HE_BSS_COLOR_ATTR_PARTIAL,
+	NL80211_HE_BSS_COLOR_ATTR_COLLISION_DETECTION_DISABLED,
 
 	/* keep last */
 	__NL80211_HE_BSS_COLOR_ATTR_LAST,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 64cf6110ce9d..ed344731e80e 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -377,6 +377,7 @@ he_bss_color_policy[NL80211_HE_BSS_COLOR_ATTR_MAX + 1] = {
 	[NL80211_HE_BSS_COLOR_ATTR_COLOR] = NLA_POLICY_RANGE(NLA_U8, 1, 63),
 	[NL80211_HE_BSS_COLOR_ATTR_DISABLED] = { .type = NLA_FLAG },
 	[NL80211_HE_BSS_COLOR_ATTR_PARTIAL] = { .type = NLA_FLAG },
+	[NL80211_HE_BSS_COLOR_ATTR_COLLISION_DETECTION_DISABLED] = { .type = NLA_FLAG },
 };
 
 static const struct nla_policy nl80211_txattr_policy[NL80211_TXRATE_MAX + 1] = {
@@ -5414,6 +5415,8 @@ static int nl80211_parse_he_bss_color(struct nlattr *attrs,
 		!nla_get_flag(tb[NL80211_HE_BSS_COLOR_ATTR_DISABLED]);
 	he_bss_color->partial =
 		nla_get_flag(tb[NL80211_HE_BSS_COLOR_ATTR_PARTIAL]);
+	he_bss_color->collision_detection_enabled =
+		!nla_get_flag(tb[NL80211_HE_BSS_COLOR_ATTR_COLLISION_DETECTION_DISABLED]);
 
 	return 0;
 }
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
