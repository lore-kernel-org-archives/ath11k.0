Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC91FC4332F
	for <ath11k@archiver.kernel.org>; Fri, 11 Nov 2022 11:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y8JqOoDamve29ufafa/VhZiUpFxI1OGdNssf4J30zDY=; b=kr2PYvkNrr4p8r
	cvikF0/M3qmVWo5PrLAUdylM5SzD0mH9I9Cj8/4eoszeEeMUUeJ2VcOPHsh80Duvfg3NejHL4lu86
	RHz7fsD+2Chwg8JC/YpoDjLCMIsj7WICWVku+OWf/5KJ6xi8LGECj8BXaoMb7GARmt/gqEp4/ouMy
	t5DckN1+YXXdZ9Ai3dBRlOO6P+8Cf8BT4pKo6yHYNhiaM0SDKSL0Sh0/TLYT8Hmb5N2a7rf0qCrqd
	DbVpaI+pBJ66FuC7cQEXmOVqqfJ5yPactBZ1EdozJ4NwcyOJLTvkm7itK1c40RQmSueCrw88xrN2j
	rVVZSMlaMwUbCFqESFqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otSRu-00FLzO-7z; Fri, 11 Nov 2022 11:43:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otSR2-00FLtl-Di
	for ath11k@lists.infradead.org; Fri, 11 Nov 2022 11:43:02 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ABAt9kZ025079;
	Fri, 11 Nov 2022 11:42:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=seBFUaRp3ouDX4be0OELujUijoj4Q03BoNVadg0/LK4=;
 b=oVitbTaMdAuM7waoylsi39KLcq28CejbgAl/pb+ujA7f78qkVkD0+774T9TRPwDhxz26
 Vzo8MkcDofre/6lm2Cbng98/C98GDb4t9ZkLmy6UjuRoNMDvHCUK7n9o7xJpKt1jP14N
 /VNhtcx8lC8vXuCUjLVPkyptYqTgmuBrv+1od+YUBSS9li6Q+o0bvwWfrWyTEsxYeeRx
 7q0Nj5nk7Au+a2DOO9SIPltuGl6GDDtoT6GEGemn8ZDrkHJayH4PWnJPpZ2nm9i/nk/q
 HDD+MS65+iR8kd3cQ/nEJIj35Z4vofYmph0g9YXzCY8uE4DWoNrMsoIlKFyFnSx9a8y0 fw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ksada1t6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Nov 2022 11:42:57 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2ABBgu7J010956
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Nov 2022 11:42:56 GMT
Received: from youghand-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Fri, 11 Nov 2022 03:42:54 -0800
From: Youghandhar Chintala <quic_youghand@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_mpubbise@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        "Youghandhar
 Chintala" <quic_youghand@quicinc.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v3] wifi: ath10k: Add WLAN firmware image version info into smem
Date: Fri, 11 Nov 2022 17:12:35 +0530
Message-ID: <20221111114235.10287-1-quic_youghand@quicinc.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pn7p2lM7IEusjRFCpMHEAhgXTRTm8JN8
X-Proofpoint-GUID: pn7p2lM7IEusjRFCpMHEAhgXTRTm8JN8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-11_06,2022-11-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 mlxscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211110078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_034300_612922_2AEE6ACC 
X-CRM114-Status: GOOD (  19.56  )
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

In a SoC based solution, it would be useful to know the versions of the
various binary firmware blobs the system is running on. On a QCOM based
SoC, this info can be obtained from socinfo debugfs infrastructure. For
this to work, respective subsystem drivers have to export the firmware
version information to an SMEM based version information table.

Having firmware version information at one place will help quickly
figure out the firmware versions of various subsystems on the device
instead of going through builds/logs in an event of a system crash.

Fill WLAN firmware version information in SMEM version table to be
printed as part of socinfo debugfs infrastructure on a Qualcomm based
SoC.

This change is applicable only for WCN399X targets.

Example:
cat /sys/kernel/debug/qcom_socinfo/cnss/name
QC_IMAGE_VERSION_STRING=WLAN.HL.3.2.2.c10-00754-QCAHLSWMTPL-1

Reported-by: kernel test robot <lkp@intel.com>

Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.2.2.c10-00754-QCAHLSWMTPL-1

Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>
---
Changes from v2:
 - Removed blank line between trailers
 - Changed memcpy to strscpy
 - Removed version_string_size
 - Added new condition fw_build_id against max length
 - Added depends on QCOM_SMEM for ath10k_snoc
---
 drivers/net/wireless/ath/ath10k/Kconfig |  1 +
 drivers/net/wireless/ath/ath10k/qmi.c   | 34 +++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/Kconfig b/drivers/net/wireless/ath/ath10k/Kconfig
index ca007b800f75..e6ea884cafc1 100644
--- a/drivers/net/wireless/ath/ath10k/Kconfig
+++ b/drivers/net/wireless/ath/ath10k/Kconfig
@@ -44,6 +44,7 @@ config ATH10K_SNOC
 	tristate "Qualcomm ath10k SNOC support"
 	depends on ATH10K
 	depends on ARCH_QCOM || COMPILE_TEST
+	depends on QCOM_SMEM
 	select QCOM_SCM
 	select QCOM_QMI_HELPERS
 	help
diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index 66cb7a1e628a..6c3ddad26417 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -14,6 +14,7 @@
 #include <linux/net.h>
 #include <linux/platform_device.h>
 #include <linux/qcom_scm.h>
+#include <linux/soc/qcom/smem.h>
 #include <linux/string.h>
 #include <net/sock.h>
 
@@ -22,6 +23,8 @@
 
 #define ATH10K_QMI_CLIENT_ID		0x4b4e454c
 #define ATH10K_QMI_TIMEOUT		30
+#define ATH10K_SMEM_IMAGE_VERSION_TABLE       469
+#define ATH10K_SMEM_IMAGE_TABLE_CNSS_INDEX     13
 
 static int ath10k_qmi_map_msa_permission(struct ath10k_qmi *qmi,
 					 struct ath10k_msa_mem_info *mem_info)
@@ -536,6 +539,35 @@ int ath10k_qmi_wlan_disable(struct ath10k *ar)
 	return ath10k_qmi_mode_send_sync_msg(ar, QMI_WLFW_OFF_V01);
 }
 
+static void ath10k_qmi_add_wlan_ver_smem(struct ath10k *ar, const char *fw_build_id)
+{
+	u8 *smem_table_ptr;
+	size_t smem_block_size;
+	const u32 smem_img_idx_wlan = ATH10K_SMEM_IMAGE_TABLE_CNSS_INDEX * 128;
+
+	smem_table_ptr = qcom_smem_get(QCOM_SMEM_HOST_ANY,
+				       ATH10K_SMEM_IMAGE_VERSION_TABLE,
+				       &smem_block_size);
+	if (IS_ERR(smem_table_ptr)) {
+		ath10k_dbg(ar, ATH10K_DBG_QMI,
+			   "smem image version table not found\n");
+		return;
+	}
+
+	if (smem_img_idx_wlan + MAX_BUILD_ID_LEN > smem_block_size) {
+		ath10k_dbg(ar, ATH10K_DBG_QMI, "smem block size too small: %zu\n",
+			   smem_block_size);
+		return;
+	}
+
+	if (strlen(fw_build_id) > MAX_BUILD_ID_LEN) {
+		ath10k_dbg(ar, ATH10K_DBG_QMI, "fw_build_id length more than max length\n");
+		return;
+	}
+
+	strscpy(smem_table_ptr + smem_img_idx_wlan, fw_build_id, MAX_BUILD_ID_LEN);
+}
+
 static int ath10k_qmi_cap_send_sync_msg(struct ath10k_qmi *qmi)
 {
 	struct wlfw_cap_resp_msg_v01 *resp;
@@ -606,6 +638,8 @@ static int ath10k_qmi_cap_send_sync_msg(struct ath10k_qmi *qmi)
 			    qmi->fw_version, qmi->fw_build_timestamp, qmi->fw_build_id);
 	}
 
+	ath10k_qmi_add_wlan_ver_smem(ar, qmi->fw_build_id);
+
 	kfree(resp);
 	return 0;
 
-- 
2.38.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
