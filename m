Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5275ED0BB46
	for <ath11k@archiver.kernel.org>; Thu, 24 Oct 2024 00:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bh6viNY/CMUSxXuYICO/0PagqIHUhjSm/VjBvclHGP4=; b=s7sKKHIbXQgW5EZwJgvPQMxwyk
	LXtN/SrfeooxKqOP04yMwMVk6TfMiWTEhK8dd4bqNdoQWNQNU+9yabchhbpCC9jgHqlZSjEMGtZnx
	xbCJohEyUW4RJ08T4HlQLtkrZXOpSr9bi6SKROP3y5d85MlkbwEE4L6X26mgI5OfR6P4VnfM3Cnmx
	avoZKSj0lsFW5sT3phNsJ+ZY1mVpWepICcxvlVmjI57XhQ+q9rCFpiu3m7EPsPCuyfOOBJ08D+HLL
	tJ6NzUbNhjNRd6/B73GSofnroSdQHPxnEwi9w6WTFAm+yQZ5LY+7hl6vv1shGTNr3ErPLVw0C5EBv
	/j7bqOlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3lgP-0000000GJjk-09Sy;
	Thu, 24 Oct 2024 00:26:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3lgN-0000000GJit-0YN3
	for ath11k@lists.infradead.org;
	Thu, 24 Oct 2024 00:26:32 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49NKTYem023371;
	Thu, 24 Oct 2024 00:26:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bh6viNY/CMUSxXuYICO/0PagqIHUhjSm/VjBvclHGP4=; b=H5aXogzVegbdiFrZ
	PKLCGwe/GAUMMsa4Dmdy2MkAWlGZ5LOjZv1bVqn3QBh4Dw1FBm9lO2GbyLpb/Nm/
	6stx44pY8MQQbd4IMNTdy/xCjz5N0uTmNwExiJEbZEJg4DRYzlcxtyUoVx+MDZly
	HeQYdo0WszaM9laypy9wGS2zRJiGKd13Ril6cPxNUJmNMwEphkOjrm4ioVdPLnPt
	OjekC8zBfkwvJsI/ZZasyNcas5j/lkKIz2+l8rPBFvwt7tqN9uuWJ2/kwm5mvaq7
	k14oJZTCF5ZJsAPpKxbGQ+wjZPR11XuV22jwTawwCH86rc+Fq1VkiMfMJw+BfkRw
	SfXoVw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3ukx4b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 00:26:27 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49O0QRU9001328
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 00:26:27 GMT
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 23 Oct 2024 17:26:25 -0700
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
To: <kvalo@kernel.org>
CC: <quic_jjohnson@quicinc.com>, <ath11k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>, <dmitry.baryshkov@linaro.org>,
        <linux-arm-msm@vger.kernel.org>,
        Miaoqing Pan <quic_miaoqing@quicinc.com>
Subject: [PATCH v2 2/2] wifi: ath11k: support board-specific firmware overrides
Date: Thu, 24 Oct 2024 08:25:14 +0800
Message-ID: <20241024002514.92290-3-quic_miaoqing@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241024002514.92290-1-quic_miaoqing@quicinc.com>
References: <20241024002514.92290-1-quic_miaoqing@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Z-WDuQEx-v8ZR6VZ5evom6odRkvxKhjN
X-Proofpoint-ORIG-GUID: Z-WDuQEx-v8ZR6VZ5evom6odRkvxKhjN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410240000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_172631_199643_B6F1A4C9 
X-CRM114-Status: GOOD (  13.43  )
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

QCA6698AQ IP core is the same as WCN6855 hw2.1, but it has different RF,
IPA, thermal, RAM size and etc, so new firmware files used. This change
allows board DT files to override the subdir of the firmware directory
used to lookup the amss.bin and m3.bin.

For example:

- ath11k/WCN6855/hw2.1/amss.bin,
  ath11k/WCN6855/hw2.1/m3.bin: main firmware files, used by default

- ath11k/WCN6855/hw2.1/qca6698aq/amss.bin,
  ath11k/WCN6855/hw2.1/qca6698aq/m3.bin

Tested-on: QCA6698AQ hw2.1 PCI WLAN.HSP.1.1-04402-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1

Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 16 ++++++++++++++++
 drivers/net/wireless/ath/ath11k/core.h | 11 +++--------
 2 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index be67382c00f6..775e48551522 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1178,6 +1178,22 @@ static int ath11k_core_create_chip_id_board_name(struct ath11k_base *ab, char *n
 					       ATH11K_BDF_NAME_CHIP_ID);
 }
 
+void ath11k_core_create_firmware_path(struct ath11k_base *ab,
+				      const char *filename,
+				      void *buf, size_t buf_len)
+{	const char *board_name = NULL;
+
+	of_property_read_string(ab->dev->of_node, "firmware-name", &board_name);
+
+	if (board_name)
+		snprintf(buf, buf_len, "%s/%s/%s/%s", ATH11K_FW_DIR,
+			 ab->hw_params.fw.dir, board_name, filename);
+	else
+		snprintf(buf, buf_len, "%s/%s/%s", ATH11K_FW_DIR,
+			 ab->hw_params.fw.dir, filename);
+}
+EXPORT_SYMBOL(ath11k_core_create_firmware_path);
+
 const struct firmware *ath11k_core_firmware_request(struct ath11k_base *ab,
 						    const char *file)
 {
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 09c37e19a168..ce4102cfed4d 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -1249,6 +1249,9 @@ bool ath11k_core_coldboot_cal_support(struct ath11k_base *ab);
 
 const struct firmware *ath11k_core_firmware_request(struct ath11k_base *ab,
 						    const char *filename);
+void ath11k_core_create_firmware_path(struct ath11k_base *ab,
+				      const char *filename,
+				      void *buf, size_t buf_len);
 
 static inline const char *ath11k_scan_state_str(enum ath11k_scan_state state)
 {
@@ -1295,14 +1298,6 @@ static inline struct ath11k *ath11k_ab_to_ar(struct ath11k_base *ab,
 	return ab->pdevs[ath11k_hw_mac_id_to_pdev_id(&ab->hw_params, mac_id)].ar;
 }
 
-static inline void ath11k_core_create_firmware_path(struct ath11k_base *ab,
-						    const char *filename,
-						    void *buf, size_t buf_len)
-{
-	snprintf(buf, buf_len, "%s/%s/%s", ATH11K_FW_DIR,
-		 ab->hw_params.fw.dir, filename);
-}
-
 static inline const char *ath11k_bus_str(enum ath11k_bus bus)
 {
 	switch (bus) {
-- 
2.25.1


