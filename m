Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914A6D1D87C
	for <ath11k@archiver.kernel.org>; Thu,  4 Dec 2025 07:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+Yt+b8q8VjxvzQ2cWX0SzX2S2I2lHz/ZTVgM/PTf5I=; b=VzKW1TFipxhpJIUwxHNNn0V4E5
	NxOCpVhibASkWG7UzlSxe5moaE9NtLo/sQfC0N1TjU/Aed1tDcvbczTGQ7owZ+ZlK4OgA2NfhcCcx
	svZGppMYArRBecUS/Mc3X8kvCejr7gkvt7fOkbY9oOl9XpoYbWlJ5Hza367BQkUQdeGj2vrQ4EZl5
	H2Y5kwduV4LDVoWF4YyRTNff5HihTpKkI+D6uLKXQqnpNfIHBHXvjz+bu9C6TOAU3RIB2sScvF1aL
	HP5Kxv3v9e6ibiluLtVuMwLCmWrj/NEPbPuv7Ko0NX5lXP/w+BByO5CyFarhUSVFVmfs63bJluvhQ
	3ST8BG4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR3Un-00000007b6D-0Bd4;
	Thu, 04 Dec 2025 07:11:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR3Uj-00000007b5K-3IHW
	for ath11k@lists.infradead.org;
	Thu, 04 Dec 2025 07:11:19 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B468nw7823756
	for <ath11k@lists.infradead.org>; Thu, 4 Dec 2025 07:11:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=w+Yt+b8q8Vj
	xvzQ2cWX0SzX2S2I2lHz/ZTVgM/PTf5I=; b=g699UPgee6rpPlKYIFmSLUSMWZI
	MuQWa8FPTVolJHpm88IBtaYuLFaIQndvzXhA2oHtR0Ahb77VOtkhXUhKu5AzK2TK
	BO9o4EdY57haEl76uforGRDZt6PiEJtcGgIbG37UdT4yEGstsk0Wo5OoCTkQ7/kH
	wdE7kWBNZedfzpMF/MpxuUGeXX6GM2NTd3JxJXqoeF+RVpYK0b8zgBBQUbcPVXE/
	44vHWlAXVRC0w1+gcZclZKuIPCtsmHxweIte97ZacXNovp1JdmEfwyNaoEfbKhpy
	4eNPkujo2ykPllmhdSgEWEdk1Lg/QGCKAkB90nn25dVzFCZiaRxdNdsoing==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atm12b4bn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 04 Dec 2025 07:11:16 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b89c1ce9cfso613032b3a.2
        for <ath11k@lists.infradead.org>; Wed, 03 Dec 2025 23:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764832276; x=1765437076; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+Yt+b8q8VjxvzQ2cWX0SzX2S2I2lHz/ZTVgM/PTf5I=;
        b=go/24emtHl2CJe8bJaCAJOOT7rscyCAGy+vIDlYglskCya8j42da49YdyC4lnrPkhy
         rXycO/kFxNMSW/ZROCGg2p33T+3BChfA+q3hBa8Ow/hcdpmCRJCYkKcZMuVWvkZ9homI
         khQy3mnY0/HOVgz1zS0ciD8KOwyqjPkGfNfS5FFz5XTXc9jrezuqar4oEMIzkHTX0ptF
         uns2fNJAaRVWp6Ai9Gbi4svcbYj1QYMlxbYX3U6E7e3yc/WyF1BEfQBEkkXnF6FRnHAN
         1+/pkn2ZlAMWALMdCMM9BTykpt3cRvs51rAlGwAEwHHlLIBMJ7bNW9y+XnhsrQugJYWe
         jOQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764832276; x=1765437076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w+Yt+b8q8VjxvzQ2cWX0SzX2S2I2lHz/ZTVgM/PTf5I=;
        b=InieSAephrXgCnN7v8LLq+26HPhiz1IVowWuxHnNinBLpI3BrXaGKhMBQ4fM4VXEVb
         M05BDna7NoUWp9QkC9vYAQMhMA/YDYc2SVbNBu+/49jOOOjRQhngAqArU/U6OEEblTK/
         qvFJw0N0j8nRNLbpaMrqjHUgV1aQl/2aV8fQWUhXNAymCnoOUvyPDLiJQHOSktUdK8M9
         DMxUcYH/EG26CMeBhr0wCJ/1yCMGoe6rlkFzi6s7Gzm6KylXqWYKhTVi6qibCa5nzCXM
         Ea7RNCvqSPcGFkr1V98zesc+Zl6/8IC8TFBgmY6sJTdVE4iuKlILTpUEaw18TEz44d0f
         BwVA==
X-Gm-Message-State: AOJu0YwWzBJ9kCZg7Ob2DpU8NvH+e3rIf/T9GzAMky7ZhttlRJpDKhOz
	RbEX9eNjUrixi5V1c+TivwCKVN/i1IYJjeMudeDNrrrWXNk7mlpGWH/LBobjFyuWac+HWTxrIxV
	b24XZkpuMjO36ucHCCPKRMqPbNQq0+1v/lDA4OAoFSXtbGorrLxErAP8QKznU4CVt
X-Gm-Gg: ASbGnctLRTawjm9F5bLHJEzBsMkdFKUDfuOd62Hd2nvGbLDX62kF6U7HRiRS8ZSNT5D
	ejoXbY/zQrBY/soV9HOr6r0UI2uPbQWoytmg+IVqIF7RgMvjT2pGPW3iqlcIE+7ILsyYYn/Z09Q
	wtA+DK49sTObwvkH0yikS4+mzt35DCTXksOXc5d6F/hbId9n6YHMS6/JAj7Vl4IQC5HW1eeRK/f
	it22tQUMGupPoRlBLv2eZQeIMtcqYtYyps4R+kzx3cLYk6ETVAe2AJMgv9Ey2JEfehK3W40L98C
	Fcf2UOJ6fgJ2jB+oztPxATbpDjahEu02d7+fPVmiXqxNjRc+VHHPhnqK0DkgVE+GTkDLMnnDXjv
	036Z5dw0iGmdPYC38IGbJguf8+mNdrQf43y+Hv7Zl8DW4j6RBTdN7Pc0yqN+xZIzdvRpz
X-Received: by 2002:a05:6a00:2e9f:b0:7a5:9cf5:b341 with SMTP id d2e1a72fcca58-7e2259ddfcemr2440409b3a.7.1764832275674;
        Wed, 03 Dec 2025 23:11:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHdjjjpA4rf37aA7kTwgkuuiTsJYAC1y4NmUcAkrMaRDWq3DGig0k1Wx+gXs04GDeqg0OKrqg==
X-Received: by 2002:a05:6a00:2e9f:b0:7a5:9cf5:b341 with SMTP id d2e1a72fcca58-7e2259ddfcemr2440381b3a.7.1764832275193;
        Wed, 03 Dec 2025 23:11:15 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e29f2ed331sm1117470b3a.4.2025.12.03.23.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 23:11:14 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org, johannes@sipsolutions.net, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-current 1/2] wifi: ath11k: add usecase firmware handling based on device compatible
Date: Thu,  4 Dec 2025 15:10:59 +0800
Message-Id: <20251204071100.970518-2-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251204071100.970518-1-miaoqing.pan@oss.qualcomm.com>
References: <20251204071100.970518-1-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA1NyBTYWx0ZWRfX0VlO2EQFD1qN
 k6wOshu95973eTHL/zIZL+NCPy/WJPeORyzkxHjEPRRiPhIRFHtwRa2MeyGhfMntr8pIg/e93mW
 n2CoZmFONyRxuvJt1glqG0bEWciWh4Wzf8bzUgPNBHIMg6u1O7lNgRgg4d8zagZDOpwiKkDDmLR
 /Dx9in+q94KXh9bVjw9DgX9SD/ULi2xivEkH++3HijFi8VCA+pZRE96ziDGu+hmAGGr2auWzunX
 uv3rS0lpPCw2WCLFz9w6JrwevBJHa6Q5A8GO0hgrBDKJ94/4MiU4DMy8QvbySt0+M+Vgb0tfdFt
 Y8gc0I71sHFoji9QUp3xRICw/aC46xsYKOaXq7Ez2NP242ftQF35rgfG7dsWMKA51gST0RZvHYA
 +ftV8Ims3NvDjRKDNAjbUNU+6gbEVg==
X-Authority-Analysis: v=2.4 cv=JY6xbEKV c=1 sm=1 tr=0 ts=69313414 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=abYA0IzpRIpkkFLbjSYA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: bxnaBuVBW9VHjcNgQD0Icv_z8BJfOpft
X-Proofpoint-ORIG-GUID: bxnaBuVBW9VHjcNgQD0Icv_z8BJfOpft
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_231117_940878_7CE58E89 
X-CRM114-Status: GOOD (  20.23  )
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


