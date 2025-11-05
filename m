Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBA5CCFA1B
	for <ath11k@archiver.kernel.org>; Wed,  5 Nov 2025 17:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E/JGA8NlNfLRHt5JiK60dzndBvs8Ulpj2FKRq2wFm+Y=; b=xt8UHNAeAFpzLBJ1OlQAYwKRF4
	P7ZQu7D0hU8xhqGHe5/0OqFLJltPb6MnWL52oQwKlQbsX6fWho5CSeJh90epFsfJmYIRZGKXk1RfR
	rZChVFM2361FC1/sqFIbzAihdAEBzzvHPoUDNKQIWchwW8lFxHyFyva+1OLjnxy5Os17eNC/dGTzO
	xO30G3pMhlQywduFH+1wAh+hfgdL+bsLZq5V+914NKRfDvc4eWS1wlhlEGUbG0PFgmqowCRb49em8
	lgPFNX7Qy1QSzxwxmNWE2lpyB5s/xBu8s6Oaz/e3mvWQxJvJW0CJ01t8zR9DMo4WLxZgFSHwpqRpR
	Ce06H4aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGhDT-0000000E9aL-0KmY;
	Wed, 05 Nov 2025 17:22:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGhDQ-0000000E9Wv-3RJn
	for ath11k@lists.infradead.org;
	Wed, 05 Nov 2025 17:22:38 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A58Uktu3089789
	for <ath11k@lists.infradead.org>; Wed, 5 Nov 2025 17:22:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=E/JGA8NlNfL
	RHt5JiK60dzndBvs8Ulpj2FKRq2wFm+Y=; b=fjsJtXBzDSPJJ349QyWR+5zW7t2
	BHj9sS6k6/MPWe5I9YF4lCXV0+M5tLznEKi5kAG/egd3EnpEXcwPO1JYOzidhLtr
	qn5ScDgkUT1WPeijvvVH7diNH0AI5Cv9CF1IJokHnFNF0CE0+Q8SplvoKdmZ5FeW
	CxLxX/uUm7xMLcnSkCmNsqyLK8p1bDgBKg7GnD23uvP7V44FfuhsN86xDcE2xG1Q
	nyOzuX2Ug8pAf8Xi+uxGFD4v/W0x0nCwufmShzKOUdbL9z91dcsWA88YnHdFYqyZ
	YF5f+EPPLYUWvKngW30dCpqTCOaRerwFRPxftDj0SNgBShlyNN79b7LRO6Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7s5eb6d6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 05 Nov 2025 17:22:35 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b9d73d57328so12463a12.1
        for <ath11k@lists.infradead.org>; Wed, 05 Nov 2025 09:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762363355; x=1762968155; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/JGA8NlNfLRHt5JiK60dzndBvs8Ulpj2FKRq2wFm+Y=;
        b=DpBf8NdoMjtN1CRv06xaj2k6cmsjKyHOLbioRh1VgfeZzkqesh5k0mQ88traaYVfCn
         PjGCzl48JbJNUglF3aZdPB8V/caPgoPzjqYGxwEMfWdM9Z+yCjkjqKy8I34uBg+7iDKb
         wb/kou8aYNxxXrfDXmkkFZ58H/5jA5wJm6905ckuXRJABVD0zvM6RcPSFLKMXoc2n1DI
         EejcyuUj8pXzV1LWd9Q2jg+u663/Dmzmo/gwcTHYsyg3YW6vo+sct+LjluFt2pxBBMe/
         9gBWzTZDcwG1rAoxqe/y8OejivhHQr1Bh7LDiw4bxmwoPVZSAVrn+uT324O7Y5aM6NEW
         GCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762363355; x=1762968155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/JGA8NlNfLRHt5JiK60dzndBvs8Ulpj2FKRq2wFm+Y=;
        b=pk6FPQ86DIAm7Bq2M+5T6+yAX/OG6XOevYzDTfdit+9ufS/RZMC7esBrvqMMK6pBxr
         r4bX3WKCY2Upx1KUUBg7lt0bvnhGcPf4410TxZ1TMFqsvuVS6WYaN7vKB18I1C2/x/un
         OlPyfhL/dAe3KM7OW8sLsBhHm2J82cM/DWmuGSlml78qeYPUQtU76/L/QtThz0He4RDT
         SKeuS91c4EhbiW/E6vogg/s1pijOlXkVdLdbjMzb0mZMvn3hhC5CiAqvBU3R8DnGXE1U
         jX1VEO+g8kciBTUuLT6QDY5irK1xd1yphIthZADQXaMfkPDi4Af109iaDD2+pszGE+3w
         +Hug==
X-Forwarded-Encrypted: i=1; AJvYcCUAgt3oP6vs54d2L+yNfRC/woM6tVcrp0TqpE861xdDMI1/XXupMps+8xf40Qzx6BRz42SlH/A=@lists.infradead.org
X-Gm-Message-State: AOJu0YwIv74jkXnZuhT7w9+ug2vlgnvdbGKJNme+XSz6ELdr/WVhRirj
	byYASWrPF28PshpwtQKJCwEy8rN3F82eZsL20gn0zpLSs+tfp3GFJIN+O/RhceG46e3cAORIext
	l0cj4di0bDipcwEhyNF+xIjEXaMAIcA+RB+jmLp2hgO4oFIIa2MirvVkEFRNPjnir
X-Gm-Gg: ASbGnctrKUYmi2AhSnunhk1i9D87YGova91I6STfvZ6HpJZxvGfdS6r9zdx4nbeg/R8
	121Cb7F6ufwUpQFY5GGLgtyh8PutWSSqWuGa8zx6OVK29XJNCVmPKUvZ1Po6uK1vz+Osrr3jJPB
	sv16ELUbzeGeQFyyW6u/49gsKw7SqxRobli9kgh8KbRf7eGc/kyR3Q3I4E+fzs9ZxGXzDiR7UOZ
	/v2TH5TMiucTQA8G/LHK/GXBefkesWMuITLXkT7w16VZ6ZAHqsa1SuYLZewmSkkAB7P8r3hKeuz
	/r3IzXJO1AFoEN/2uAxw+5EdzZKX4tZS6QfcOupKu0v8wYQj+9F9cel11cLtO5HZUivVDCus4Wj
	EFLtQicNYM5K9gKKZHhm8Rb0t/DaCGlk3gXyIgs5qHJ/w
X-Received: by 2002:a05:6a21:999a:b0:34e:8864:7952 with SMTP id adf61e73a8af0-34f837ed9b3mr5866647637.2.1762363354805;
        Wed, 05 Nov 2025 09:22:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhtxpt0U6Mdf8qB4LCjblFkBg1cLt9Axqbp/AgV/z0MjgUl5CIsJwY6PTbirUDR60J6qg/9g==
X-Received: by 2002:a05:6a21:999a:b0:34e:8864:7952 with SMTP id adf61e73a8af0-34f837ed9b3mr5866532637.2.1762363353727;
        Wed, 05 Nov 2025 09:22:33 -0800 (PST)
Received: from hu-yuzha-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7af48d83c20sm518014b3a.62.2025.11.05.09.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 09:22:33 -0800 (PST)
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: baochen.qiang@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Subject: [PATCH ath-next v3 4/6] wifi: ath11k: Register relayfs entries for CFR dump
Date: Wed,  5 Nov 2025 09:22:24 -0800
Message-Id: <20251105172226.3182968-5-yu.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251105172226.3182968-1-yu.zhang@oss.qualcomm.com>
References: <20251105172226.3182968-1-yu.zhang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: prcR5zcgW0dZHG9LHvzd538uS_O7dCZl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDEzNSBTYWx0ZWRfXyB2WeuJqhpcK
 R9/TcMoHlYHfQuGnOqGtxq0e/X8LscfBBnZ5u9sT8iGMNAZ1C8R+oQnFgdZ0JaWu+fsWWmnm+Hn
 JTv++tRnb5+EI549NLvsF17jwRfJDbmSS1UOLXCSvoddBhRegeB2naa0s+TFnhjlDgq5FRwASWS
 borNCLzwiEaiME1e+x0DC0bQ22D6Utc7UNhIJ886n/QixTcRSQD/EGhcJr+y9pUZKt8UfH+tdXX
 MzVnvsp+KIIvJ1m44gkkWIxZuVQgd7WV0HmJmzqBSBXzAzAYALL9TacH5pMq7dN+fS/guJMamDP
 1k5EO0YqGX7PkEOTtsQb2PlH2Dn5huNhaW8pQ2ocxhaksY9Bi9ryw0eX+e1Kc7DzN7JCadZu10t
 Y5J5aLjrRiRsFnbW9EMb9g5HJWE9bg==
X-Authority-Analysis: v=2.4 cv=OayVzxTY c=1 sm=1 tr=0 ts=690b87db cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=6mQ44K8ZfP1dJrZg0vYA:9
 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: prcR5zcgW0dZHG9LHvzd538uS_O7dCZl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_092236_993640_C7DCD9CF 
X-CRM114-Status: GOOD (  15.38  )
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

From: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>

Provide a relayfs interface to collect the CFR dump from the user space.

'/sys/kernel/debug/ieee80211/phyX/ath11k/cfr_capture' is exposed to user
space to get CFR data.

CFR format to user space:
 ___________________________________________
| CFR header | CFR payload | CFR tail data |
|____________|_____________|_______________|

CFR header contains the following fields,

* Start magic number 0xDEADBEAF - 4 bytes
* vendor id - 4 bytes
* cfr metadata version - 1 byte
* cfr data version - 1 byte
* device type - 1 byte
* platform type - 1 byte
* CFR metadata length - 4 bytes
* metadata - 92 bytes
        peer mac - 6 bytes
        capture status - 1 byte (1 for success 0 for failure)
        capture_bw - 1 byte
        channel_bw - 1 byte
        phy_mode - 1 byte
        prim20_chan - 2 bytes
        center_freq1 - 2 bytes
        center_freq2 - 2 bytes
        capture_mode - 1 byte
        capture_type - 1 byte
        sts_count - 1 byte
        num_rx_chain - 1 byte
        timestamp - 4 bytes
        length - 4 bytes
        chain_rssi - 32 bytes (4 bytes for each chain)
        chain_phase - 16 bytes (2 bytes for each chain)
        cfo_measurement - 4 bytes
        agc_gain - 8 bytes (1 bytes for each chain)
        rx_start_ts - 4 bytes

CFR payload:

CFR payload contains 8bytes of ucode header followed by the tone
information. Tone order is positive tones, followed by PHY memory
garbage, followed by negative tones. Dummy tones are uploaded to make
number of tones always integer number of 64. Number of tones is not
preamble type dependent.

Each CFR tone has 14-bit I component and 14-bit Q component and is sign
extended to 16-bit I/Q. Two tones are packed into one 64-bit unit as:

[63:0] = [Tone1_Q(63:48) Tone1_I(47:32) Tone0_Q(31:16) Tone0_I(15:0)]

CFR tail: end magic number 0xBEAFDEAD

Tested-on: IPQ8074 hw2.0 PCI IPQ8074 WLAN.HK.2.5.0.1-00991-QCAHKSWPL_SILICONZ-1
Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04685-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1

Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
Co-developed-by: Yu Zhang (Yuriy) <yu.zhang@oss.qualcomm.com>
Signed-off-by: Yu Zhang (Yuriy) <yu.zhang@oss.qualcomm.com>
Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/cfr.c | 35 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/cfr.h |  1 +
 2 files changed, 36 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/cfr.c b/drivers/net/wireless/ath/ath11k/cfr.c
index e22b0151833c..495b2c6742aa 100644
--- a/drivers/net/wireless/ath/ath11k/cfr.c
+++ b/drivers/net/wireless/ath/ath11k/cfr.c
@@ -416,10 +416,45 @@ static void ath11k_cfr_debug_unregister(struct ath11k *ar)
 	ar->cfr.enable_cfr = NULL;
 	debugfs_remove(ar->cfr.cfr_unassoc);
 	ar->cfr.cfr_unassoc = NULL;
+
+	relay_close(ar->cfr.rfs_cfr_capture);
+	ar->cfr.rfs_cfr_capture = NULL;
 }
 
+static struct dentry *ath11k_cfr_create_buf_file_handler(const char *filename,
+							 struct dentry *parent,
+							 umode_t mode,
+							 struct rchan_buf *buf,
+							 int *is_global)
+{
+	struct dentry *buf_file;
+
+	buf_file = debugfs_create_file(filename, mode, parent, buf,
+				       &relay_file_operations);
+	*is_global = 1;
+	return buf_file;
+}
+
+static int ath11k_cfr_remove_buf_file_handler(struct dentry *dentry)
+{
+	debugfs_remove(dentry);
+
+	return 0;
+}
+
+static const struct rchan_callbacks rfs_cfr_capture_cb = {
+	.create_buf_file = ath11k_cfr_create_buf_file_handler,
+	.remove_buf_file = ath11k_cfr_remove_buf_file_handler,
+};
+
 static void ath11k_cfr_debug_register(struct ath11k *ar)
 {
+	ar->cfr.rfs_cfr_capture = relay_open("cfr_capture",
+					     ar->debug.debugfs_pdev,
+					     ar->ab->hw_params.cfr_stream_buf_size,
+					     ar->ab->hw_params.cfr_num_stream_bufs,
+					     &rfs_cfr_capture_cb, NULL);
+
 	ar->cfr.enable_cfr = debugfs_create_file("enable_cfr", 0600,
 						 ar->debug.debugfs_pdev, ar,
 						 &fops_enable_cfr);
diff --git a/drivers/net/wireless/ath/ath11k/cfr.h b/drivers/net/wireless/ath/ath11k/cfr.h
index e7b69e98cbf5..19f136d34c65 100644
--- a/drivers/net/wireless/ath/ath11k/cfr.h
+++ b/drivers/net/wireless/ath/ath11k/cfr.h
@@ -60,6 +60,7 @@ struct ath11k_cfr {
 	struct ath11k_look_up_table *lut;
 	struct dentry *enable_cfr;
 	struct dentry *cfr_unassoc;
+	struct rchan *rfs_cfr_capture;
 	u8 cfr_enabled_peer_cnt;
 	u32 lut_num;
 	u64 tx_evt_cnt;
-- 
2.34.1


