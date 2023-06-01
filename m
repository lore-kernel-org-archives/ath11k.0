Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4613C7EE23
	for <ath11k@archiver.kernel.org>; Thu,  1 Jun 2023 14:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=53qOxc6rtqdOBmZRJbnAaWloBteMdChXFJP1bp+oFd8=; b=lmKGGwq3atlI9g
	13SUqLVRkq607kUzcY8vC1QBhtaav+xTXSPlDQZVWNotKN50vYlS/rtu0W3V+YKKTAiavuTMb+SbY
	S/2DwmxrkbGQ4EUP9bAoMAT4FJzsnsc484rB8penh0uODzT/+kSRDKbGh4fYLkd59GpULC8oYlDn3
	HOwOblWIWzoJAlQRNIkFJqds07BteDILzkIMG3LhnLvkBIe/fLf31gN90YVGBGipgc5Et2EuSyfx2
	+UTuYV9B355eB30YboMa6Tyu+IWuAHmP/eqFZZF9RQ7Akgccsn8X0QVTeX4ojbZ/YaxXwJU7fszZ2
	TiFXX2tUpPh774XySpYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4jM4-003s17-12;
	Thu, 01 Jun 2023 14:32:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4jM1-003s0D-1J
	for ath11k@lists.infradead.org;
	Thu, 01 Jun 2023 14:32:43 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 351A83ia011454;
	Thu, 1 Jun 2023 14:32:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=o+c8AeKmJiMLSsaLrBv858IYbfUAvPdo/g6VIV6fl0o=;
 b=GHQ4tuzCAHu76GNBdbjT39+nptdIYJ0jQm/x72xjduWttyxuoSnuqZyWhubKLWAqrCQf
 YZJs+4nK6qmzWB4jjeHs6C1ZV8UuxBoHyh8q1K3zDFcl+A9I90p7B39ng1MNSWdEZO+S
 72J0NOOCksR1qvzPfEsV3JmtV0FR3HRLkfCtDtV73qJ8RaZiAyvMdgCsvHWI81JqM07a
 PWK2aspwPCahJfib9iSz0B2f/BSsmZXikdCdCFh88Iy8dGQi/FnXZGT6VVE1TI6PvNMZ
 vSy2H27q/Ek2CtY5spbA/KIVfPzmSfHLGEpUOkx4tyBsjQi9wn2170vW8zTRZEXnzKmL hQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qxs9grqtv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jun 2023 14:32:38 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 351EWb6W030229
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 Jun 2023 14:32:37 GMT
Received: from rajkbhag-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 1 Jun 2023 07:32:35 -0700
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Venkateswara Naralasetty
	<quic_vnaralas@quicinc.com>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Subject: [PATCH v3] wifi: ath11k: update proper pdev/vdev id for testmode command
Date: Thu, 1 Jun 2023 20:02:14 +0530
Message-ID: <20230601143214.13006-1-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 73Zeq50z6H-qEXnIKJoZOm_N6qZ577CI
X-Proofpoint-GUID: 73Zeq50z6H-qEXnIKJoZOm_N6qZ577CI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-01_08,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306010128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_073241_563340_B5924102 
X-CRM114-Status: GOOD (  20.45  )
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
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
v3:
- Rebased and validated in latest ToT.

v2:
- Rebased and validated on latest version (v4) of dependency patch.
---
 drivers/net/wireless/ath/ath11k/testmode.c | 37 ++++++++++++++++++++--
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/testmode.c b/drivers/net/wireless/ath/ath11k/testmode.c
index 3611b6ec39c6..8fc5cddb28bd 100644
--- a/drivers/net/wireless/ath/ath11k/testmode.c
+++ b/drivers/net/wireless/ath/ath11k/testmode.c
@@ -297,13 +297,16 @@ static int ath11k_tm_cmd_testmode_start(struct ath11k *ar, struct nlattr *tb[])
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
 
@@ -327,6 +330,34 @@ static int ath11k_tm_cmd_wmi(struct ath11k *ar, struct nlattr *tb[])
 
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
 		   "cmd wmi cmd_id %d buf length %d\n",
 		   cmd_id, buf_len);
@@ -460,7 +491,7 @@ int ath11k_tm_cmd(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	case ATH11K_TM_CMD_GET_VERSION:
 		return ath11k_tm_cmd_get_version(ar, tb);
 	case ATH11K_TM_CMD_WMI:
-		return ath11k_tm_cmd_wmi(ar, tb);
+		return ath11k_tm_cmd_wmi(ar, tb, vif);
 	case ATH11K_TM_CMD_TESTMODE_START:
 		return ath11k_tm_cmd_testmode_start(ar, tb);
 	case ATH11K_TM_CMD_WMI_FTM:

base-commit: a4756ac34a7002861c9bdf8cf45aec53a77fb78d
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
