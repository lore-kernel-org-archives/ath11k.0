Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACFAD5B160
	for <ath11k@archiver.kernel.org>; Sun, 14 Dec 2025 02:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0/28AV0EuwihBLTp87IeykhYBs1dfdS5hG7E4DXt3fs=; b=YMtIH6w7bcsFaf3b4VDpVM1/bp
	vLnEICaLwjj6PBNgZbTReL6k57DCyqSOHLDbVbnGLJagE90OQxLJSW1t7CaDUv9erJiSZZGPlFYpl
	RhEkFuos6x91FcKfrmgQaOUdSZQxzUsZCWs8C5mL3lKKNjQUuqW3GKCrTDTHo5Z5ozBgxdjUhxYIN
	h9jFpCqFu1L+RLHdZ9Wbl6rHn9zzVtVPc8g4E+DGkiBMNEtBPqXF+MjaRRNkSea3MQtUonyKQlEY/
	4JMpbrACNbEZC269bHcO4EnKvJ0j9DIJWOTEjXbJoo8hW2t+n9p6JYW/W3uBAhV3XMxBS+p12hgUy
	xZsbPXiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUcEg-000000027S0-38iR;
	Sun, 14 Dec 2025 02:53:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUcEe-000000027RD-1yIe
	for ath11k@lists.infradead.org;
	Sun, 14 Dec 2025 02:53:25 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BE0db0T943663
	for <ath11k@lists.infradead.org>; Sun, 14 Dec 2025 02:53:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0/28AV0Euwi
	hBLTp87IeykhYBs1dfdS5hG7E4DXt3fs=; b=pI+41+7zFNKV24QV/YfB3I9NcAO
	Xhtk0ovWQL6fPNqc/Rldbv/r8IWciFfVvWG+mMb0o6Arhh+5j/fxRTnk9MmRcip1
	ZPj7aBII5+GpQV7Dpj5f3QmIFR9pa/zroMU1CwKXru+3hiUattlpdHr+O19aNaZA
	HPy0AsZhBAwdGqRQgpjsjCGK0nwOOPy0i4MK23UMzzWiPebhCsGolBIZG1Chn8JS
	aBbjb+21aCpnTn2CNeZrzfKeXt62kqmWWEWVCpr5nlxmzDl8Jsi0cZCbkDToLcEz
	1iRb5X4D4HUOMVQllWLxH/yOhG6v4e87NbCFj4uoJNUNc8QyqQIjPEB8DzQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11avhbe1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Sun, 14 Dec 2025 02:53:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-299ddb0269eso30473635ad.0
        for <ath11k@lists.infradead.org>; Sat, 13 Dec 2025 18:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765680802; x=1766285602; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/28AV0EuwihBLTp87IeykhYBs1dfdS5hG7E4DXt3fs=;
        b=GVF8nXagVIQ3Q6MvShZVVyBbf0zsGh8BZADFGUXrTE5EgaQZZasGKkcPbQDtZK7wWc
         vxnx3VBkhY0ssZA3pkw4ocUdSSzxY5vISTjzl8oLNoaKQITnIBfgYX25vdfgZTicnWim
         6CMKMMnuYrCTnbnEyBMLBqcz7fsIsK1rBPwuF3RRiRa4QfpDxaHtSl9SvPUS/2lt0DB1
         UxmVHoRr+FxYXPTfFEQ5z7BIlfP01w0FuZ29jkKhNrrl9RSSTzDXAWVkoCautM1OvhwE
         W+PrFHXcM73orPrhs2uBeI62e4JdJCwgYeJRSNU10ARmSi6+W/9i85EQRFInXMH6mB5j
         aWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765680802; x=1766285602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0/28AV0EuwihBLTp87IeykhYBs1dfdS5hG7E4DXt3fs=;
        b=LpLoisKW1GpTUmD+H+Ux499/Tu/loIqZUwO2baZyi5RikRBlEAg0VUN5AESHRg7Aj9
         KKfKp191JcgCM53d5rx7H7jdGVR+pXYH03m5zW4ws8Y/aEUAESeccJoV9B9BIP2P22yV
         xnHyprENMkR6PTRh+BYw3VbaCReotkh5qm9lEqLVaKaWAbzN0+oDA+gDV8XEgJ3SXxzu
         fmU8vB0RmCx4JPnRvlgAHuq1+9/GsQphO0M3EAiaAa3au8thGY3RBGjJcR+/x3AB868T
         m3hA96HJI4FzNQLPQvokm2KigQj+/7QtyWO6l5bv8n8IQ/VGlJ8lkRe11pI9us1kuZ23
         cDbA==
X-Gm-Message-State: AOJu0YwquqZScPKxbTCgBZfcN1L20DA+EtmeMHpAgrYtRs6hVYVC1uGF
	UI/XRzE5E5H/fkaBDvkxr99R/6Qn2l/1IVwvMdiciJd+x/47bEqLLFrJX/fSnI2da3xTwQgwKZ2
	qWglbmaQJGfaqR3jIaHEdwN723XonJX0zkc9auRSg74FFUur8Pw7HrZlyDro0x6HT
X-Gm-Gg: AY/fxX5VtR6Gl4v2CKbbCYpXGAOQlWGGzGucpYq1Nwn3CZIZd51IxtKNFuUEX7MXsBN
	RwwwJDPCc76W0ZGmYrdm/ZvzY/SkGxg2EiGz44A4MDdmJDvxxGi8yDCcT0wyinMcfOWk98NAWiP
	ts1f5cA03tA8i+V0MwVs9saZn4arRyKneLCm+mn+3VqqqiFYM0SXAAob3K5lYtFWcM0SjFkPOY0
	ZQ+TXBZa2o5MaDMAK6WTNNR4ieBF88HQbN00gzrXXP+n04g607yuc3O06nd5nNNombUDA7Gj9fr
	ct47dmbMVCF5nSvIDNYuraVmZqbFAuqeb7PY2zSveyd+Wb3Bu/9AahqsTuQTSgKhn9BoLT9siPA
	nLUd/C1OM3beX54XiWebI+DRBwA9vHC5kOD09mE04BiwXULVPEkCou5skiDOKusJUUJmF
X-Received: by 2002:a17:903:1c3:b0:268:cc5:5e4e with SMTP id d9443c01a7336-29f23de47f9mr57961875ad.1.1765680802365;
        Sat, 13 Dec 2025 18:53:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHD82J143Gwteiul8EadMeaMm7d83geu6UUvxKwdal4ICJXBB+/kg1J1G/V71wv+YloxAzRsA==
X-Received: by 2002:a17:903:1c3:b0:268:cc5:5e4e with SMTP id d9443c01a7336-29f23de47f9mr57961745ad.1.1765680801906;
        Sat, 13 Dec 2025 18:53:21 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea01723bsm94148115ad.62.2025.12.13.18.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 18:53:21 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org, johannes@sipsolutions.net, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krzk@kernel.org, Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Subject: [PATCH v2 ath-current 1/2] wifi: ath11k: add usecase firmware handling based on device compatible
Date: Sun, 14 Dec 2025 10:52:29 +0800
Message-Id: <20251214025230.716387-2-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251214025230.716387-1-miaoqing.pan@oss.qualcomm.com>
References: <20251214025230.716387-1-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE0MDAyNSBTYWx0ZWRfX6m7xKywEgj/o
 AdoazZxm7PgEXy3ZpvGjCLblhETQ8tcvu3VZQRPYwRx+FO2I1XZ3FqePH8vIEwUdhywgv23vpLE
 7hnI/MWo448rbS+ncsoi4JUP2hfz7tMOA1/+w85O8airnz4nBy1vqUV2q+nFnklFzCmTSGtWjwn
 6Rzj6UpFqnjjWpHP/QgNG2mMYu/t37zYxQRArF2aEGbk2Zlz9V5pJQ+DmGLAMGqbr4yGczoGX2f
 cP/i73+xwKyL7iiNS+hBR9QhhPAMVaCOWAjGNGZwGg97mN/1b5kj+DSk3BI1+JqP7FY24qQl/2P
 sJfpzNfqA0IuALK7hqyb+mrzCGYppYirI7YIQHHToeLf1DvPKmk7GW2LiKmYodQgwYlfDwwlFCo
 I5wuYbbAgC+6358pd3rQvfA4MR36lQ==
X-Proofpoint-GUID: x0HTCDxjPrU7n0Hrw0SCZup1TQY8kPGm
X-Authority-Analysis: v=2.4 cv=PJQCOPqC c=1 sm=1 tr=0 ts=693e26a3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=abYA0IzpRIpkkFLbjSYA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: x0HTCDxjPrU7n0Hrw0SCZup1TQY8kPGm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-14_01,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512140025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251213_185324_629633_4C0F1B5B 
X-CRM114-Status: GOOD (  19.22  )
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

For M.2 WLAN chips, there is no suitable DTS node to specify the
firmware-name property. In addition, assigning firmware for the
M.2 PCIe interface causes chips that do not use usecase specific
firmware to fail. Therefore, abandoning the approach of specifying
firmware in DTS. As an alternative, propose a static lookup table
mapping device compatible to firmware names. Currently, only WCN6855
HW2.1 requires this.

For details on usecase specific firmware, see:
https://lore.kernel.org/all/20250522013444.1301330-3-miaoqing.pan@oss.qualcomm.com/.

Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04685-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1

Fixes: edbbc647c4f3 ("wifi: ath11k: support usercase-specific firmware overrides")
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 37 +++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/core.h |  7 +++--
 2 files changed, 39 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 812686173ac8..a4a3a65c7752 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
@@ -997,6 +996,42 @@ static const struct dmi_system_id ath11k_pm_quirk_table[] = {
 	{}
 };
 
+static const struct __ath11k_core_usecase_firmware_table {
+	u32 hw_rev;
+	const char *compatible;
+	const char *firmware_name;
+} ath11k_core_usecase_firmware_table[] = {
+	{ ATH11K_HW_WCN6855_HW21, "qcom,lemans-evk", "nfa765"},
+	{ ATH11K_HW_WCN6855_HW21, "qcom,monaco-evk", "nfa765"},
+	{ ATH11K_HW_WCN6855_HW21, "qcom,hamoa-iot-evk", "nfa765"},
+	{ /* Sentinel */ }
+};
+
+const char *ath11k_core_get_usecase_firmware(struct ath11k_base *ab)
+{
+	struct device_node *root __free(device_node) = of_find_node_by_path("/");
+	const struct __ath11k_core_usecase_firmware_table *entry = NULL;
+	int i, count = of_property_count_strings(root, "compatible");
+	const char *compatible = NULL;
+
+	for (i = 0; i < count; i++) {
+		if (of_property_read_string_index(root, "compatible", i,
+						  &compatible) < 0)
+			continue;
+
+		entry = ath11k_core_usecase_firmware_table;
+		while (entry->compatible) {
+			if (ab->hw_rev == entry->hw_rev &&
+			    !strcmp(entry->compatible, compatible))
+				return entry->firmware_name;
+			entry++;
+		}
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL(ath11k_core_get_usecase_firmware);
+
 void ath11k_fw_stats_pdevs_free(struct list_head *head)
 {
 	struct ath11k_fw_stats_pdev *i, *tmp;
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index e8780b05ce11..f8fcd897ebd2 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef ATH11K_CORE_H
@@ -1275,6 +1275,7 @@ bool ath11k_core_coldboot_cal_support(struct ath11k_base *ab);
 
 const struct firmware *ath11k_core_firmware_request(struct ath11k_base *ab,
 						    const char *filename);
+const char *ath11k_core_get_usecase_firmware(struct ath11k_base *ab);
 
 static inline const char *ath11k_scan_state_str(enum ath11k_scan_state state)
 {
@@ -1325,9 +1326,7 @@ static inline void ath11k_core_create_firmware_path(struct ath11k_base *ab,
 						    const char *filename,
 						    void *buf, size_t buf_len)
 {
-	const char *fw_name = NULL;
-
-	of_property_read_string(ab->dev->of_node, "firmware-name", &fw_name);
+	const char *fw_name = ath11k_core_get_usecase_firmware(ab);
 
 	if (fw_name && strncmp(filename, "board", 5))
 		snprintf(buf, buf_len, "%s/%s/%s/%s", ATH11K_FW_DIR,
-- 
2.34.1


