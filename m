Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E099ED29C2A
	for <ath11k@archiver.kernel.org>; Mon, 19 Jan 2026 14:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9lX1BPtTqqhG7Gi/G9hTfEQjmDYEFYWw7UxUB8RToE8=; b=JnoKxDC/dEGjZXHEzJ5ug+pGsi
	Oyv/juMr3ZvcNm5dmKDOJqvBktgqH8GdXl0vk2wqMnE0wERpHPtdruNgxlApmFys75bWXjsWWltbO
	9nM8BCeddW3qOVtBb6pfhIJplFMaU+P3ND03x/mibHPpWDqqaQbdJLjeZbKzhyy0W3LMdJkYb8ZE8
	Ye+jk5Jks/1N/vDsJ5OeVkGWgbxfjY3UmBNUjUxs1VgR1EBEsy4Q7/k7cAwPycRg1+MB8PhV+q0O3
	GUvHQ1Gf4SdX2PVM8Ix9ApRaGjp6qRo+TlcBQLNL0yb1/XOnHFD0GEi8YsiB26RKJlwkgYJ3BPELA
	tRoXDPvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpqJ-00000002DC1-1yyA;
	Mon, 19 Jan 2026 14:02:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpqH-00000002DB1-0MfL
	for ath11k@lists.infradead.org;
	Mon, 19 Jan 2026 14:02:54 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JA7YbB597706
	for <ath11k@lists.infradead.org>; Mon, 19 Jan 2026 14:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9lX1BPtTqqh
	G7Gi/G9hTfEQjmDYEFYWw7UxUB8RToE8=; b=fJFE0a/pbHMR91J1XWTIBZ27muO
	Yt7G0LdCNKLDe2Jg8LRzUx2KlPBgu0FgDyjNfCJa3YDfXGIMfeByYJUVqwnIzgmz
	h0utKjEYojyQxe43WVjsEH3NQEK7cOnCKXoYAkVYRn/pGRQZy4Ik0S0f2DIBS0SK
	ifpyFIZN0sAh8TzHKrUQKCGjGaffhYNVwDXv+3PKbTA1sY9+anIWemySeVPCxPr0
	agS9c1n1y7Se76aDaDuil32ah91GSGfB9MxNq4JIx4CC9uili5wP08Wb4Yg6q4Vz
	lx5T3dSb3HUHpERisEvIGNbnXt1vZXflKf0DRWdVP+4utDy/NtWpnZx/y2A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjk7gnmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 19 Jan 2026 14:02:52 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c55434c3b09so2450179a12.2
        for <ath11k@lists.infradead.org>; Mon, 19 Jan 2026 06:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768831371; x=1769436171; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9lX1BPtTqqhG7Gi/G9hTfEQjmDYEFYWw7UxUB8RToE8=;
        b=govDhmWwqSOKnNIOO3ld8R0tGkt7cPXkYGsDRsa77cCi/bGmZFCZwnE5MaQxuvgO8E
         CZBrH1q0vcgVpjIFNlLKuyEnXkTTIZ6e3MYViR3LLknpIqnJa/MW7pO4YKRUh0jbp63R
         o4MxENbZrsJUWj8ynRJDM4Qz1JedaU1TJmFSrQuiVCApduSnWlRpo7/wHr9jYnvtbbg9
         8OqsQ3o3VgGTn2o37gHf9s/n5/MZ8goYfTTGuVSUd/oMWdDl5S8OyVOQbooDDukxeEsQ
         /IcFRdcCBK4lFu3LNdfFpychI9FOBcj/c5pHJT7Jm83BWTpNU10T0NfPe15yOFayB+xC
         knhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768831371; x=1769436171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9lX1BPtTqqhG7Gi/G9hTfEQjmDYEFYWw7UxUB8RToE8=;
        b=PLMqoKkTRnCCT/L2hao8DutUZWem20R+d97IK5TSfyQ8V/Yc1rbl0TvWPOGJcwx88p
         iOE6Uu6wJbGYUjhLumInmEkOr42Jf69tXb1nWibXF6KdWuLsKgLVrfMXZDp/EIlaFcqZ
         H1e0rbOSn2qB9y6R0S+UpK7AKGg8Zx4iDUKCYngLUIEsbJEx2xq9acDiOAUWDgx4o3ny
         SWKwc8Z9SF7//2BS2VejPM8Laxk570NFEEC6zR63vyRUrF51QNb9uvrINGGsGkp/DXJz
         VJQypHI5quPBQk/26SpTS3pKey33iiv5L242qAJS11SPZLeAaVa3j/G0a+iqegtuq7ne
         +mVA==
X-Gm-Message-State: AOJu0YydAREbPKn/ssApo31hsHG29UYMMx4oLNB7l6PrbJueD/MyZy6y
	FxEDv+/POAzoHHjqyuIOHgEx21r8gOiWSW5b9S5L7Q+oex5iGuNkthzeECJuVVpzO4I9y2l0NDB
	lL5hOW9B54sQGEzXsx3eLEXzV+AUawfpjpfLwdcFKmOXPI6NQXe1HTGwrrOLooYUa
X-Gm-Gg: AZuq6aKye1ZcN/tKnK6sORlGRKs68ioZSlBtM4jyb+Ed5UuC1QNcSH8FB+85uZe3Nfw
	LVMsYBc3uxDYsZiJexHOUwjmQUFwftcDq+oOWtMbvxZVWKT8+5SkU9AGk6r+t6BSroY3Q5PFnkT
	WejnjpnNlGf6ZKMN6N7kGSwaF9JEFt/CH3OgvFLA4G/iVkA7kSdw7zkFFSt4hsXy+G0s3MUNFt/
	t3QrID/UlkkbdZxiXaCzBSBIuGvv29s+XpfTkFsYsDnuDRBSNQvKNumPTelUFEe0rje2rTl1bUN
	W3vfU+irbA1ivdot7AOEx8IUpXynWowCYf9uSLzUlhxUNIAG/3BYsyykfT0e8g+OIYlCvxuN+5m
	s+/Zraw64kZzXbMyi5jU6vzVeY6T9otlaTez/cfb8BY6vBPW6jq55Pzg0Obdif0fxvTLg
X-Received: by 2002:a17:903:1a8b:b0:29e:9387:f2b9 with SMTP id d9443c01a7336-2a71751c69emr112215095ad.24.1768831371058;
        Mon, 19 Jan 2026 06:02:51 -0800 (PST)
X-Received: by 2002:a17:903:1a8b:b0:29e:9387:f2b9 with SMTP id d9443c01a7336-2a71751c69emr112214645ad.24.1768831370365;
        Mon, 19 Jan 2026 06:02:50 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a71941b915sm97416715ad.90.2026.01.19.06.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 06:02:50 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org, johannes@sipsolutions.net, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krzk@kernel.org, Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH v3 ath-current 1/2] wifi: ath11k: add usecase firmware handling based on device compatible
Date: Mon, 19 Jan 2026 22:02:37 +0800
Message-Id: <20260119140238.3360658-2-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260119140238.3360658-1-miaoqing.pan@oss.qualcomm.com>
References: <20260119140238.3360658-1-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDExNyBTYWx0ZWRfXw79IxbwMfMUJ
 a3mQjzq+4wyiidW/cL2MXjxNtJg5wjW4FYP/mpyhatK3hUBnQ629ptAUZHD9gwtG2Gy6B0l9FRs
 /pkY99xLBiarVJIl3Cxyx47p4ic/X7DUZKeRKxQbcaFMqE8GE9ggOfWL1iO7z8TCbZWL4/2j9RY
 pjRM014g73i0WaBI+fJ/fE2ud27DVXbehnVVmmdPSNA/RKmm2DwsWWif4bd/NYiIEihgol2kL8a
 O62zmj14Y5Dr9UL4B5J4nRsmjVf8PZt172NLRs/oa97j3bCPAyLdHbxH7kIaGUdrMDZ64XH9ZXZ
 Vmj7g51/OGDOsK3aA5zse6Qj+AltyJHDVVR6ZlrKFuhDC3RTlJHObp0K31BnOOXioh913x+FGqA
 N5gAZC2tEIGW9mLBnnt48lZZeb3n4gpGj4HsJwwefjXcYUjcimGs5ClqNNRQF+eRkzCM74JdlrY
 450uiy4RUA7AaQtYxvg==
X-Proofpoint-ORIG-GUID: 1j-vG5NER7PcPb8EpBIBTYIXGxuQiztv
X-Authority-Analysis: v=2.4 cv=WoAm8Nfv c=1 sm=1 tr=0 ts=696e398c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JAFltXB-HLbv1eA7pZkA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: 1j-vG5NER7PcPb8EpBIBTYIXGxuQiztv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_03,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_060253_245296_83259AD8 
X-CRM114-Status: GOOD (  17.50  )
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

However, support for the firmware-name property is retained to keep
the ABI backwards compatible.

For details on usecase specific firmware, see:
https://lore.kernel.org/all/20250522013444.1301330-3-miaoqing.pan@oss.qualcomm.com/.

Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04685-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1

Fixes: edbbc647c4f3 ("wifi: ath11k: support usercase-specific firmware overrides")
Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 36 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/core.h |  4 +++
 2 files changed, 40 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index de84906d1b27..1cf7f4e601c3 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1044,6 +1044,42 @@ static const struct dmi_system_id ath11k_pm_quirk_table[] = {
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
index 3f41e6569a78..a0d725923ef2 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -1292,6 +1292,7 @@ bool ath11k_core_coldboot_cal_support(struct ath11k_base *ab);
 
 const struct firmware *ath11k_core_firmware_request(struct ath11k_base *ab,
 						    const char *filename);
+const char *ath11k_core_get_usecase_firmware(struct ath11k_base *ab);
 
 static inline const char *ath11k_scan_state_str(enum ath11k_scan_state state)
 {
@@ -1346,6 +1347,9 @@ static inline void ath11k_core_create_firmware_path(struct ath11k_base *ab,
 
 	of_property_read_string(ab->dev->of_node, "firmware-name", &fw_name);
 
+	if (!fw_name)
+		fw_name = ath11k_core_get_usecase_firmware(ab);
+
 	if (fw_name && strncmp(filename, "board", 5))
 		snprintf(buf, buf_len, "%s/%s/%s/%s", ATH11K_FW_DIR,
 			 ab->hw_params.fw.dir, fw_name, filename);
-- 
2.34.1


