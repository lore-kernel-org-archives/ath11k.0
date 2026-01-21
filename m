Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FEBC44503
	for <ath11k@archiver.kernel.org>; Wed, 21 Jan 2026 09:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GiQ/XgYHT/WTkJNrYSdtUPJtPfB1bDJIXOaoB92xpxs=; b=aqK5HJo9SRRzs8jpA+WabbdMHk
	glEfXxJktAmq0mrOnxDYw+GTAwsjEUOPT5qtjxqEv3kyoOAYbMXWqWWIQusfZJEMBzfgxdbH7CcUr
	G5uviYiFJwfugtjbwc960WZdXoDtIzO4ivvjuN4Qou5tgroYSVfly5K4pvkt6eKzcWZeUoRXrY3Fp
	PzjUtB1AZ4L7AhHerJuVW3hTAL3TesWNYGuKV3gVh8jfCj2xFkZK2DM9vKjG8HZyRDlIWgpjKuns6
	lwtTQcoqNfbh8LrGyQQX4mSzfFk0EC12m9KZtaN1RVFS+Fgeg/AE6MC70NJI7LqTU34uuRirBq17m
	sOA06ZuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viUrn-00000005DSf-0GUE;
	Wed, 21 Jan 2026 09:51:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viUrj-00000005DRT-3vwJ
	for ath11k@lists.infradead.org;
	Wed, 21 Jan 2026 09:51:09 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L6XOEO2938579
	for <ath11k@lists.infradead.org>; Wed, 21 Jan 2026 09:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GiQ/XgYHT/W
	TkJNrYSdtUPJtPfB1bDJIXOaoB92xpxs=; b=FcGcdvdRaYlCBKan5SOhYwBOrQ3
	IsIyfqaapy+MPouZkjrCwYHX6lqjPSM4j/ZS35IvF6dXAJwMffxzgXPAGChQ5e2a
	1SEdk09nA6ktDj9MFCrdeJUFbFG838Z7vpGiaDJHKUSAPwiYq+3Jk4swpjpCQv44
	gCKpPeWhTdztA42VDDjMEXfihe2HeINBjPIouxJVs9slIdTj93fUfmS7CY5Te780
	4jEG0pLnXaja74oOmIALqrnBR9nVyss+F9vPaCHknXwZ/by1obeFgh4O/S0AJ1ZQ
	kYcxSf6DmDr29DlAttjP0S7zcUwwbZsPut2wUV8grBOfO1fQOvHIVR3i0iA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btsmu8vf0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 21 Jan 2026 09:51:07 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso3607836a12.1
        for <ath11k@lists.infradead.org>; Wed, 21 Jan 2026 01:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768989067; x=1769593867; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GiQ/XgYHT/WTkJNrYSdtUPJtPfB1bDJIXOaoB92xpxs=;
        b=HnaEdpeMn0knzScAbqyGIj5DYly5ZsPFdNuR2fx34Ktiik9P34DjWDDrxSkOIj7lvv
         xI1YHhlP5/2cLJVEB6n21iq6qwK1YoBLNXYPkyUBQ6MYi/2ubJxa6CGFgaWgNi9weRwR
         kccbjwb1nMXGYo6twwS8YzF+Gy7Z9UMj8squ+s6P/CxeDaNhM8edvqL+SWWeISu86vUN
         WHDV/AiMny3xebcavtl8hnhK1MFlNVtVgdSv1NLAgLKP4UXRi717OhW5qcgHsPKTD/Aj
         MHwqcICoZ42NBvb7/fVHN5QfXx7RlI4Pg0rKG+rCGe8eIbgg17BxSajdG0ntRzk6/5DM
         GOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768989067; x=1769593867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GiQ/XgYHT/WTkJNrYSdtUPJtPfB1bDJIXOaoB92xpxs=;
        b=YfiXd2YfoXKIJwC6PopQdMVjHS4DHm3aALHy7DWWVVSxhinb3XXE+UhoW8OWEP8VtD
         EbAGpcYSMqGNgOeWlGZGlTG4sFcT+gs2Jkga21/Q9KPa65bdzfHg1NsnI/hnpgO5DnLY
         SlstspHCLGa3ylEwLufV2sZ5JvvapZKkIgFYAKhGYFxINaNHEbnWyW0lSvEytKElv5WM
         7ohP9GBV9TkZhROOXqXYqsDRwMIMwDr51brZ2eg6VdK8oCBMDIc25dDA7UQAJhzaxYHu
         AcHa1U7s39sw2lq+xqPZg9k2q0UP91RcbXFF4Ke9h7dpkvRcJZhs9qoLVGKibP+K5d3z
         QWTg==
X-Gm-Message-State: AOJu0Yx0aAPoN7r14SnPrRQdCt8oL7LppGieX/I49OQIWCq2tfCBQgN3
	DKEva6FNn4kI51H9JY1SjgXiiXMbUVNccQkgcmvgpvC2gywP1wbRC7YPi9U4cnc+wvuY57gF4uP
	ffQrDELAZSN5ctT4gA23get3vrLEMzQQnkNq680+YRUdxoELp2tMUKMkLWmEn2inp
X-Gm-Gg: AZuq6aJipRUUQLpuqxNH9yeCeVanduCKOQYKFVzqFDMKR1drpO+6yHq31i9OnAZhXpw
	RgW/RfTEPtGwt2kSTYHU6R45W1Eck1SDdsRZEGUCVcznAdD8h898Qj6pl+jLqf+P2pjchfcKwxG
	zEjGbtEmQM/NsxLKjqxgs8bbeLgtR+0mEJ4XZjK0ughMUnxNbDJrDccmwgWc9+PlQTKT/Jf+0CX
	Qi44UmX90t7SKPasje2jzby6VQqg+R8S1eDFM4f4JNXiznxnnYl0fJyw/QztAR2979m2zlvllej
	cPrSCaZQO1UwocC/T7xYvU+1sHa04p/aZM5YmrSkSHtsG0ecPX7zEpY5a/gc2/8yYrgaFPF3gsg
	S9aEd1kdDvYUzVex35ja+yO3aXda2KKvdetMoNaB3dEUU7Tz279j72q+h1/nV/PN6sWDQ
X-Received: by 2002:a05:6a21:9994:b0:38d:fa67:e87f with SMTP id adf61e73a8af0-38e00bba20dmr17504860637.12.1768989066737;
        Wed, 21 Jan 2026 01:51:06 -0800 (PST)
X-Received: by 2002:a05:6a21:9994:b0:38d:fa67:e87f with SMTP id adf61e73a8af0-38e00bba20dmr17504826637.12.1768989066234;
        Wed, 21 Jan 2026 01:51:06 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-352678af047sm16997295a91.10.2026.01.21.01.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 01:51:05 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org, johannes@sipsolutions.net, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        jonas.gorski@gmail.com, krzk@kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH v4 ath-current 1/2] wifi: ath11k: add usecase firmware handling based on device compatible
Date: Wed, 21 Jan 2026 17:50:54 +0800
Message-Id: <20260121095055.3683957-2-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260121095055.3683957-1-miaoqing.pan@oss.qualcomm.com>
References: <20260121095055.3683957-1-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OaiVzxTY c=1 sm=1 tr=0 ts=6970a18b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JMaiino2ulENCBURCGwA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: F2bcmYSHAK5DWtehMYhBYQXLw0R88nDQ
X-Proofpoint-ORIG-GUID: F2bcmYSHAK5DWtehMYhBYQXLw0R88nDQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA4MiBTYWx0ZWRfX5Jut2Wh56QFf
 yH0Louzd9SsFlz2VXALkWTP/+nVAywYaTqCVY1fi9kGjvZ+uuVeYjl0M9pwVuqPLnWdmWc/USSa
 lBYXdjoijoDPOdqQfNlEVM1A+QwXh051blu+3pKXzSpP4ofg5+7msI2wjWxthdW7huEsLTkz0c7
 UxgQjuAMGS8RX+QXajnCIa5lCKJgVMEcix5Cselzs+twsSXF7/npIZJWGK2lN3HzvSEBG3XUCvc
 9j3IEaboIgxGkhFqL6t/hoprAedNxv28myJhBemStDU9Qohfgfv93pzErIWYNouD/ELq1s97efV
 aGB4aVRi5QMmnIJW0wsFCzOrJeqfvGL5QBcaVh9gW7w4dR8M88GQ5rZL1LHrScty67+NqYhoncR
 BsC9ERVqI7uMiJU7MvfsnksWbDWV4wpFnHeSuEltbc2HgvGWUEucnQ18jbnuHv6X4wD+yzm6tj4
 UcrOCTVeQP9MZVb5qEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_015108_000771_4AE02126 
X-CRM114-Status: GOOD (  14.81  )
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
 drivers/net/wireless/ath/ath11k/core.c | 27 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/core.h |  4 ++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index de84906d1b27..3f6f4db5b7ee 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1044,6 +1044,33 @@ static const struct dmi_system_id ath11k_pm_quirk_table[] = {
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
+	const struct __ath11k_core_usecase_firmware_table *entry = NULL;
+
+	entry = ath11k_core_usecase_firmware_table;
+	while (entry->compatible) {
+		if (ab->hw_rev == entry->hw_rev &&
+		    of_machine_is_compatible(entry->compatible))
+			return entry->firmware_name;
+		entry++;
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


