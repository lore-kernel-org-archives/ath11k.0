Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F81CCFA13
	for <ath11k@archiver.kernel.org>; Tue,  4 Nov 2025 16:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Vssr73RyQ+FszqtmkVaSpa6VDKHA4NdGYdJks1BQS4=; b=1QXtFdrYOc1G1mzFEY/qYjbP4O
	u26QwlNDkd+cLMvg3wHxqjezOij70j765K1rrC+loIldEzwMGdl4XD77tXj4adLfdmKQJUf3eIbch
	WKUmSeTEOqvH69H/ahWM+SRK02Z5pf00wO4TrlazqOK6nB2T8ApDAyKqyU8fhy8jvFKkm9ul+lyAw
	phCxfV28MQXBM0A6WkuAaL8DYbC7L5nvFO38HjSu101MqEjmVrbZ0LqzTJ6lWjlMFsGzJRHYwWtFO
	YPgkKAPDsb0ALtKgWk/VKSNQAltDKKvaNB+GIniamvR98WfucrAMNFLXlKUU/HgxtwUgcrCwTcL27
	Pj4ALX/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJro-0000000CBgr-1w2k;
	Tue, 04 Nov 2025 16:26:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJrl-0000000CBdX-36ki
	for ath11k@lists.infradead.org;
	Tue, 04 Nov 2025 16:26:42 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4Cg4nt2049600
	for <ath11k@lists.infradead.org>; Tue, 4 Nov 2025 16:26:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5Vssr73RyQ+
	FszqtmkVaSpa6VDKHA4NdGYdJks1BQS4=; b=gse0mVpQzJ7H9T+CYYVtnNuCqZ3
	lL0KaN3MNnmA7TZnXUucjxWbFtZcRzO2725b25NEQTSTcoAoXxvvQMXDZitcQgrW
	Z715FtQ2U0xCeaHGApns8WfjhWC++EnSbkeu9sFq5SXmbq6L0E0QyCOWs0ltNaRw
	fLvhAKcQicU6oPQrR0o6aRqOZsGOeyW//jVAtEKyGSWl0F3i895EaNx2zr0U9Jbm
	ktUpjiqXKnHYiGmG2jVgUyn4NC8neApJm2BDQ4EbSpprkqN9DIJL0TST7ie6zGK/
	TTzM5dudvkuhpu5DfhL5jPa2pcm/iBtwUifRTqED1HpuFFdW8x0zQZOkyiA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7f25131q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 04 Nov 2025 16:26:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2955f0b8895so34128025ad.0
        for <ath11k@lists.infradead.org>; Tue, 04 Nov 2025 08:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762273600; x=1762878400; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Vssr73RyQ+FszqtmkVaSpa6VDKHA4NdGYdJks1BQS4=;
        b=T4jNe1XrVAm49D2Ai1XKj5SxqR2fhSfj2vWBz8HqDIqEOZdVEzWEVzsdk2dm0JK/1v
         OjVzXOv2pbD1GBaB4icsiX5Z3amHcZvMyREiXNk/e3v2+KtNmtHIWT1YWqSssIFO3in4
         W7Gt8UnSliwjt+mjLFpzMeGXMenWOlveBvx46S85i0bZmAAatvT5bKrBJ4JYrUVxLE+j
         hDtUeTvr9ZY6kRWRlBAEwTysIEwgNEOeSUs2mlLXw4OVIOA2c4n/WvbT014T8WQqqmeE
         ZmNpB/Wjp/XDpa2RFZhICjkYDIwhVc9xZgjOyZ515MO4z0faeAfsK9tDau/Lo5uu8RqB
         rMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762273600; x=1762878400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Vssr73RyQ+FszqtmkVaSpa6VDKHA4NdGYdJks1BQS4=;
        b=H4WFvRl9EO+THLAXw2SgZOqn3jEfeiSvysFTXENKe+uHBba2ZD0biQyjRErv6QXERa
         4pb+6b6+t/fwkv5EABtPnI35XrHl8nWXpDN0ZWvElrufu5HCzGVs183MqXKoVwBzD9nF
         u9iJ7RHBecN5RgYhYFwDhqBo4tFUXQgi4Tac+Mo504mDE5az76OJzNHRA9H2b5nOhdRB
         l5sVSrsPOnx+PVODCFv3T9xP28ReS98mk3IFEveVJVz8ikQvmBQLJ4QzcsixYTBSCj3v
         JUIQNcPSTzCegjJP2UF92CcqLCe2YePj/J50jz5YB+Hd+vCPUwSZD/1gUPPu9mffV/Om
         ZPmQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/J0RRRPC1/qgfX4Tzk1MN3XGITeX+sdG/0T5tuOE4NsAs8dy9PPombSMP4mMSvOaAumcYdfs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+sUODSCyAqg1TXQQ0a18zom7SIu5f0BWZ+MviC574f3Hmxpo6
	k2Q69wCOtwvxw3MQHBsVMd/LYpK+Y9YhOdWbgrFEoQ0Fe4P0/UFsfhrEZ46OeOlugy7mqvrAwme
	fL53Ak4UOT+tlfaIujMEZ5hniBE487+wj+yx8jXLbqeTvisz2uY8nlISu+CRev36y
X-Gm-Gg: ASbGncsJ043/fS9lnbcP8CDVUhBoFYb0tuQF06JkBSVrgUpJAwlyUakGe+GLo53EKjg
	2v5MakFCW0dm/t/zm+fdVBrKUzgmt85w54CV3i/bq1+vt3NNakKxzAAOhW2IbQITeP/iisOmqyW
	6ngxCMGfZbJuAGtznHXl7xGgaU1iCNVAnbJiInxWr03FZ+dCgfmv+k3oa+EoYDbOnRPI4JtTNMY
	/oHVph9ZsEPSLLEgjv8oFB7IZm7buQPwtm5Z1l1UtbZrZ7IkLV+muFPx+HG6UdsDiQmshDjhErd
	/akRbcjBWQ9sGuse47ltpV+oHs5cHuSsjdXbHpUOvQQHmqHfqwo9VvW6mW6rHtS6v401dz78wh/
	sHNkWNGaCq2Hzgs5D1UAYSF0sVylBBiv+RyJ8xBjaKdzY
X-Received: by 2002:a17:902:db08:b0:294:fc13:7e8c with SMTP id d9443c01a7336-2962ad41aa1mr3110055ad.13.1762273599588;
        Tue, 04 Nov 2025 08:26:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFNZs7Qx9rkasOM8xWADo/sxz4Q2imfM3mJR8YCwuWSazJuiOsuh4+13f7zKN4iISctrbrl1g==
X-Received: by 2002:a17:902:db08:b0:294:fc13:7e8c with SMTP id d9443c01a7336-2962ad41aa1mr3109615ad.13.1762273599075;
        Tue, 04 Nov 2025 08:26:39 -0800 (PST)
Received: from hu-yuzha-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a7a8a9sm31508435ad.107.2025.11.04.08.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 08:26:38 -0800 (PST)
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: baochen.qiang@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Subject: [PATCH ath-next v2 4/6] wifi: ath11k: Register relayfs entries for CFR dump
Date: Tue,  4 Nov 2025 08:26:31 -0800
Message-Id: <20251104162633.3007874-5-yu.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251104162633.3007874-1-yu.zhang@oss.qualcomm.com>
References: <20251104162633.3007874-1-yu.zhang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dNyrWeZb c=1 sm=1 tr=0 ts=690a2940 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=6mQ44K8ZfP1dJrZg0vYA:9
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: BjHtNaS9AZEPZlx8dme6K41shhlXTnYU
X-Proofpoint-ORIG-GUID: BjHtNaS9AZEPZlx8dme6K41shhlXTnYU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDEzNyBTYWx0ZWRfX+KEwuicnDMLG
 9hufZCp3Q2YWlcX7R46096WvVJ8lJxO2nnMf4EHNo2ZiuPdv4pIQNpj05W55M5sP1t6EWSYoDIT
 asVEVWTPU56iR/CMK37eMK3zaNjNEqStMEcxoOyGsx2IaJUEIQqDAaRdSgDddhgviPM8/OrvyFM
 1H4WTIhIq8jWproxSdH+clQnKASyjJES+Ef9NJkdegDFw9APn79gupgOODU1+8OGQbcCjJ3snzt
 WPnqANnkGuu7KEV6FXXnz5HpHC8TZKwrszjrCsPd4TfScX2wSklA4PoCz3jihQD9pZAJLmYZCU3
 QUyqrfUd0fvX9KxM+I0Kw+8cFF+e1onJUjeXYLFaWLhwp25M1rOIXOtDzTcgjW0m0DeDxkeJpqb
 xDViWymY1jOPEFyuFT7dSijxnM83KA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-04_02,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_082641_896509_53CAD389 
X-CRM114-Status: GOOD (  16.00  )
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
index 0fa81c939860..861e457ec5bf 100644
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
index fa9d98cc72b7..4653b04c30de 100644
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


