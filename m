Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D1F2C7618E
	for <ath11k@archiver.kernel.org>; Mon, 24 Apr 2023 09:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7Z2uRPRxxdczIdwJYtnbBiT77P1QydrNqgG4gQKOt9I=; b=ATkTDyPhdRPsAC
	u/NiAV3dXCPrQ1TT/17YekA2z1OW5tjdmLFQKflF3Js4hG+lej2F3vJ0vJHW7M239/rDdBSrMt2NI
	VoxMxULu8VJhmjRkWfImoo/VrElm1EPTEjm8ki/G+Lcey9+3qaMlgD2ZR2oey8F7qHQKMX46yW/ne
	2nOHBsFEO8lLZOfS1wXdxBukvFSwO9w8WkIWb7ej1EiEzgYwFcvbWmCshmz6XQNW6Yf5btQApnp/P
	LCH7iWzxSZHgTseD7T9gE5ZKczfzHO9sY3UDEYzvLHuj/e1v6PAYkiberx8KynmxT/gxvVEOvLgEW
	V3jigRXJb+XVHbaS9ljQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqsRN-00FmiX-27;
	Mon, 24 Apr 2023 09:24:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqsRK-00Fmh1-1S
	for ath11k@lists.infradead.org;
	Mon, 24 Apr 2023 09:24:56 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33O7XEWo031805;
	Mon, 24 Apr 2023 09:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=AeCRIKvEEd7pJNF8iwbK7JUM8Cu7dmfuEFjnB88eL3I=;
 b=j2MaYFd8SFtbYAR5So9oH+lpkDh9lvaW6p698y/I0fsPQrOF7Ktl2OiSLkHjTUkQXAA0
 3eOv+ZfNXRjfOOa4QShDooczSXkn0WYIV3+2NQTjRHaFuaNMD88wftTpYgQ93H1oKIBy
 2K6nYlyDCrU7scG4BLZMRNMYJTmxIREGxgxoL6n41zkBw8AwvvwapsyB1B8K1qOEcSfy
 dZ33ldAkcd6cWlAgxVL9P7uZoz3Pb/ug+W4gArocFp6VfgCjh1gDuTI5t3deENlDsbsR
 JfKDT1iWakO38jURRlM/7o77+mxsAWLsQDtddHXLRBLMkOkd1m57ykIlMOjRXiST80qi sA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q489maxrm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Apr 2023 09:24:52 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33O9OpMW026710
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Apr 2023 09:24:51 GMT
Received: from rajkbhag-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Mon, 24 Apr 2023 02:24:49 -0700
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Venkateswara Naralasetty
	<quic_vnaralas@quicinc.com>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Subject: [PATCH] wifi: ath11k: update proper pdev/vdev id for testmode command
Date: Mon, 24 Apr 2023 14:54:20 +0530
Message-ID: <20230424092420.12794-1-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: aTh8opf8cavHnAepYcKwZujzEnS5MVmB
X-Proofpoint-GUID: aTh8opf8cavHnAepYcKwZujzEnS5MVmB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_06,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 spamscore=0 mlxscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304240083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_022454_625932_74DBB1BD 
X-CRM114-Status: GOOD (  19.38  )
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

From: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>

User can extend test mode command support to set vdev and pdev params
for debug purpose at run time by sending vdev/pdev param set command
through the testmode command interface.

Fill the proper pdev/vdev id in driver since, pdev/vdev id details may
not be available at user space. It will make sure that the proper
vdev/pdev ids are sent to firmware.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Depends-On:
	[v3,3/4] wifi: ath11k: factory test mode support

Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/testmode.c | 37 ++++++++++++++++++++--
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/testmode.c b/drivers/net/wireless/ath/ath11k/testmode.c
index bebd9c1776ba..e1edbc532eb6 100644
--- a/drivers/net/wireless/ath/ath11k/testmode.c
+++ b/drivers/net/wireless/ath/ath11k/testmode.c
@@ -250,13 +250,16 @@ static int ath11k_tm_cmd_testmode_start(struct ath11k *ar, struct nlattr *tb[])
 	return ret;
 }
 
-static int ath11k_tm_cmd_wmi(struct ath11k *ar, struct nlattr *tb[])
+static int ath11k_tm_cmd_wmi(struct ath11k *ar, struct nlattr *tb[],
+			     struct ieee80211_vif *vif)
 {
 	struct ath11k_pdev_wmi *wmi = ar->wmi;
 	struct sk_buff *skb;
+	struct ath11k_vif *arvif;
 	u32 cmd_id, buf_len;
-	int ret;
+	int ret, tag;
 	void *buf;
+	u32 *ptr;
 
 	mutex_lock(&ar->conf_mutex);
 
@@ -280,6 +283,34 @@ static int ath11k_tm_cmd_wmi(struct ath11k *ar, struct nlattr *tb[])
 
 	cmd_id = nla_get_u32(tb[ATH11K_TM_ATTR_WMI_CMDID]);
 
+	/* Make sure that the buffer length is long enough to
+	 * hold TLV and pdev/vdev id.
+	 */
+	if (buf_len < sizeof(struct wmi_tlv) + sizeof(u32)) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	ptr = buf;
+	tag = FIELD_GET(WMI_TLV_TAG, *ptr);
+
+	/* pdev/vdev id start after TLV header */
+	ptr++;
+
+	if (tag == WMI_TAG_PDEV_SET_PARAM_CMD)
+		*ptr = ar->pdev->pdev_id;
+
+	if (ar->ab->fw_mode != ATH11K_FIRMWARE_MODE_FTM &&
+	    (tag == WMI_TAG_VDEV_SET_PARAM_CMD || tag == WMI_TAG_UNIT_TEST_CMD)) {
+		if (vif) {
+			arvif = (struct ath11k_vif *)vif->drv_priv;
+			*ptr = arvif->vdev_id;
+		} else {
+			ret = -EINVAL;
+			goto out;
+		}
+	}
+
 	ath11k_dbg(ar->ab, ATH11K_DBG_TESTMODE,
 		   "testmode cmd wmi cmd_id %d buf length %d\n",
 		   cmd_id, buf_len);
@@ -411,7 +442,7 @@ int ath11k_tm_cmd(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	case ATH11K_TM_CMD_TESTMODE_START:
 		return ath11k_tm_cmd_testmode_start(ar, tb);
 	case ATH11K_TM_CMD_WMI:
-		return ath11k_tm_cmd_wmi(ar, tb);
+		return ath11k_tm_cmd_wmi(ar, tb, vif);
 	case ATH11K_TM_CMD_WMI_FTM:
 		set_bit(ATH11K_FLAG_FTM_SEGMENTED, &ab->dev_flags);
 		return ath11k_tm_cmd_process_ftm(ar, tb);
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
