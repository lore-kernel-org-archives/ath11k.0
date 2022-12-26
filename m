Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568BDC4332F
	for <ath11k@archiver.kernel.org>; Mon, 26 Dec 2022 08:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1j54zEE0PRCCZ70ieTohR/5S6sRZBFU0YJQrRq5KBSs=; b=g/utD2qLUfNcsH
	LY8yO7Ll9Lt7x5PRSUD9+BtSgD0ihVE/4lWCp1IIKjSRVN7zoTPnd2eaGWfKK1a91C+D2zR/Pvslg
	z/+2qpHgAIcrgOW9X0VlObmWVj7E/9suZOycSEIAv4SBTTwq5YxWF7zWZ1ijjd7yj72GHUV+Mxy8D
	S0g2MGIx/fi5MliAPC0FCviA/3Et4ntrHPVhMqWYWzSICLoTX5PkQDGKRpRv2Ab1Iktju+JW8HV9/
	NspZ2pmNcY7rYFD4ogAVGf4cnvpNe0x7M+zvoLTpF11Cebg/IZAJWXBCJuEFxGHDEM4/KDtb2hxAi
	y3OJudnzzn6RtFWKRrOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9ivh-002hBD-6P; Mon, 26 Dec 2022 08:33:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9ivc-002h9n-J7
	for ath11k@lists.infradead.org; Mon, 26 Dec 2022 08:33:50 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BQ5SUlA030390;
	Mon, 26 Dec 2022 08:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=W/BAUuFz1Nwd8KZNQzffNYl5Rqqhtt0te+jAOvUkxbc=;
 b=m5deBAVodVNJtPWxNA5UMP/QvQJSStTX8Nxr3IMSYWdwUrn7H1dSvsEnJAmylq9gJ6dp
 klsSnoM+EG8o5Lfrkubu9CO7evSzHXrIAvG9Iu9IhL1X8KwGOLXUkSvlSBw05VbxOdEg
 41CHqy/lzWJlEzInJslbnU6C7zi6thbm1d2CQod7T5KWsFwy+DjE5wpAlpj4F44kN2l0
 iCVqP4onUugS9Ysxj7Afv3cZeANFYA+FGAbGbpXKUn1G5i699oy2y1pTz9pBWHPP7CnI
 F/lhdCIoxMAqojNVJH0mTtMEOX2HmsT6aXMTwCAai7Xi2JaeAdshzPuan1qC33oZP0kx bg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mns18305c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Dec 2022 08:33:47 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BQ8Xke4010793
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Dec 2022 08:33:46 GMT
Received: from ramess-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 26 Dec 2022 00:33:44 -0800
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <johannes@sipsolutions.net>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Rameshkumar Sundaram
	<quic_ramess@quicinc.com>
Subject: [PATCH 2/2] ath11k: add support to enable/disable BSS color collision detection
Date: Mon, 26 Dec 2022 14:03:28 +0530
Message-ID: <20221226083328.29051-3-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221226083328.29051-1-quic_ramess@quicinc.com>
References: <20221226083328.29051-1-quic_ramess@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VPHDpsAdRot3GJ2I8GX6AFL_U3grNsbW
X-Proofpoint-GUID: VPHDpsAdRot3GJ2I8GX6AFL_U3grNsbW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-26_04,2022-12-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 mlxlogscore=990 priorityscore=1501 spamscore=0 mlxscore=0 phishscore=0
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212260074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221226_003348_840393_E530CA23 
X-CRM114-Status: GOOD (  15.83  )
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

Enable/Disable BSS color collision detection based on user
configuration of collision detection and BSS color feature
itself.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01228-QCAHKSWPL_SILICONZ-1

Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 9e923ecb0891..6d5290996d9f 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3112,6 +3112,7 @@ static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 	u8 rateidx;
 	u32 rate;
 	u32 ipv4_cnt;
+	bool color_collision_detect;
 
 	mutex_lock(&ar->conf_mutex);
 
@@ -3370,10 +3371,12 @@ static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 
 	if (changed & BSS_CHANGED_HE_BSS_COLOR) {
 		if (vif->type == NL80211_IFTYPE_AP) {
+			color_collision_detect = (info->he_bss_color.enabled &&
+						  info->he_bss_color.collision_detection_enabled);
 			ret = ath11k_wmi_send_obss_color_collision_cfg_cmd(
 				ar, arvif->vdev_id, info->he_bss_color.color,
 				ATH11K_BSS_COLOR_COLLISION_DETECTION_AP_PERIOD_MS,
-				info->he_bss_color.enabled);
+				color_collision_detect);
 			if (ret)
 				ath11k_warn(ar->ab, "failed to set bss color collision on vdev %i: %d\n",
 					    arvif->vdev_id,  ret);
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
