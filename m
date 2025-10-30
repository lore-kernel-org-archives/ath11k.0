Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8051CCF9F6
	for <ath11k@archiver.kernel.org>; Thu, 30 Oct 2025 04:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+oQ43VnLQFT+FFdFNj69VT4fG+7G9aphoGdp03TwCo=; b=NDMXYyZphvfB1DGktTk0g6vOlg
	Shag/yBNrN9UxgeqCopKMLZxYb4SGe6VYi+1fdLJwrXpntpINyHLyO80j0k4ZCWdj6hssQ7ZAP9SG
	zJCsbhadr/T/jGyfl+fKi9/RRa9+jR/WBmw0GRJCJ45NQH7SVoxyf45a3q9T8FdjAqX3AyhsKEQtZ
	IZWo19yd4vsZfU7Krp8pW2sAvf7KTnIHc4whNJ6XhyAsBtd3nhnkMctJsKbyOjhqxWb/WppG9YQFg
	VBQSDAKVvbxz0LNDQ83EyzelegroaVlipRXZSSFG9fO3kZOaWYXhLHuMMPTS1rF90S3ieQmib3SLu
	EuoiOMZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEKKO-00000003Sh4-1H4U;
	Thu, 30 Oct 2025 04:32:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEKKL-00000003Sdz-2Jvv
	for ath11k@lists.infradead.org;
	Thu, 30 Oct 2025 04:31:58 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TNtvPC810604
	for <ath11k@lists.infradead.org>; Thu, 30 Oct 2025 04:31:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J+oQ43VnLQF
	T+FFdFNj69VT4fG+7G9aphoGdp03TwCo=; b=iPOjkYizbN2tZZcqxT5fM5e9/Z+
	oKxQhD+hnTtVLmGbObJ5t+khW3OIZGITf7oCs/Z0Thfyf4DrRuZBJckeWROMVfY0
	ZG2XVGGdXy1QVuhoDHjZpGM8An2kpN8Eehthl0hyUDaJehRvFUVuksoC3WtWdK2C
	IzXtKBlvdsQOMlEn/jlYqjh2Jb1LiPipu2CnA9B1FjdZMNEjcWOoYZtXwkGuJLzC
	/RjpAlG1DNZ73Wy6jiOVq8LISScuyN+7fMT2NVqlEciGue5TNQ/j7F6bh4rdt25E
	ITLycE0b/o/kRz1/kpa4xEznf5gxuhhNSz0qA+Rbe5FSiscYLP48oXE3j4Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3mvga7tt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 30 Oct 2025 04:31:57 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7a675fbd6c7so224113b3a.2
        for <ath11k@lists.infradead.org>; Wed, 29 Oct 2025 21:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761798716; x=1762403516; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+oQ43VnLQFT+FFdFNj69VT4fG+7G9aphoGdp03TwCo=;
        b=N3yiQ+vgtHkJvuJFbMoEWGCz/C3kEOxCaXXnf97kTww2vGsH1rBDKg3sG0ZWA7gCTH
         9KIX2TlvozGnyFSpoFDHM4qBPT/ahWJRd6QyVkzK5g04Z8O8PFwvunZ3ztIT9kYGC/J8
         hxVHsMUXlIt5aa4CqLUzS5NNEveGqWhj9a5kR9k4URGwUSYlGjgrVKen9VZGtXPZxRgT
         NZFU36cC6u4AW0O3PEXpWBxjQU/sIO9ZhPRz7iwbQacQkjgvHqBczi3F0UyiZE4eds7o
         HSgzd8BmeNBT23+GLwJI6LP+qsBZu1awel/YAgYiX2ty5lO8E/viGWcASMlTeylMIT3z
         t86g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761798716; x=1762403516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J+oQ43VnLQFT+FFdFNj69VT4fG+7G9aphoGdp03TwCo=;
        b=K8GcyWX8YWDfbtpokWwbNsSXCLxIfFPPbFrj+mBxEwDC10yWRTSdUlSZ4XLeccAFrP
         01LnCYH02lLzIrJma2pf1SDxeOkw+Wv6D2UO0amoZOTBw4Tksh6I3MvV1gFfPxQ3nNyW
         GJfb+cv5zWtP+qikIyglgO/nVj/v7HOknHyDpJezVjWsK3GeODuYZlWjk5aQbUBqpVV7
         pyovkdc71EF3iqiSqa8+e4gJsjMoCLKdOLy2Wo6Xur/AvIlbAEZm2PAmI32x9NDQi4Ed
         NIR9pUP+ttKPeSInZTK3mZEAPANeMTKYwSMtVW7eBy534enjTEfwjOgxmwbKPV/rrkB4
         8ZTA==
X-Forwarded-Encrypted: i=1; AJvYcCVVFb5d6HXIKpbkHAEy3NlixSKHZPFCoiZAgHN44nROkXzc+zYOwBi//WgDjx/GGp/ebUbA3Dc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxxxpIpBISnohlGTT219kHSvbRz1xtilJaKDnJOq5A2vKULUOnN
	6WlOU6dKOCKP6QJkNYlQAonXDh39+rL9Gg8xUzBRRz2MvHxhjLovirJ26nPyhUyrKh1eHLb7SEQ
	A60NfJw4QGBX7n5IMClKVdOo+BB6tzwU3yzf+j3+uFMC0vmWbFHJFu1okBjEVCoOQdOvPl7iw/Y
	w=
X-Gm-Gg: ASbGncsii/g27u4Fmnfb9e5eezNUIR728E1q/7Oj3HoKzh3xbdgUuhfIdNliinBuKKK
	aM+Dv9pRcJGjcg++xZ9sor+g+iSJ3TigfTciua4Qv58CPd/eR75JSLsJx7sOTIiVXJj3HZvQL1F
	Ei2kXNzWMe8Y470xEK9UDUU1oNIBCXO5JrlswMM6htN8ODdBG0D5EoYkZDufJ1YlEumCAhAD9/R
	d0eo5gv63zdbrgsIPMIRQoJt0+xlbvbYA++cIybDULKLqtz+NNshG1UP4Cgivjj8pprOiByTV3C
	5EnYK3NNo9d2qp0Kc1K859eMOGf4GxG2Pr9tjHoi440JRIsrc3nZP5aE9MxoJ8vTVX4T7K6B3A9
	QbVFh9yKm+xIOQKpbSgZIp94BnYw4Nrbl6Pq/z7NUfsK8
X-Received: by 2002:a05:6a00:c95:b0:781:275a:29e9 with SMTP id d2e1a72fcca58-7a4e47257dfmr5858040b3a.16.1761798716114;
        Wed, 29 Oct 2025 21:31:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPouVDVw2VyvWCm8X0eoZJuWhJoirnxRu7ZoOIPTQ0W4kl7fco+ho3SYmAM7WaEbsmCWOlcQ==
X-Received: by 2002:a05:6a00:c95:b0:781:275a:29e9 with SMTP id d2e1a72fcca58-7a4e47257dfmr5858019b3a.16.1761798715650;
        Wed, 29 Oct 2025 21:31:55 -0700 (PDT)
Received: from hu-yuzha-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41409e456sm16912161b3a.71.2025.10.29.21.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 21:31:55 -0700 (PDT)
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org
Subject: [PATCH ath-next 4/6] wifi: ath11k: Register relayfs entries for CFR dump
Date: Wed, 29 Oct 2025 21:31:48 -0700
Message-Id: <20251030043150.3905086-5-yu.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251030043150.3905086-1-yu.zhang@oss.qualcomm.com>
References: <20251030043150.3905086-1-yu.zhang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDAzNCBTYWx0ZWRfX6C6o7Z+FyEoD
 R1SsT06i5lmteeKCFxVOnx9+7uQfDgUx/mvGmSW+ptIpeP7j9f6OgQH+HgjA7hF1Sh9euve40DC
 8GtPnQorrMXoAkcnTba7qvTQPKTpFsQvMisVknLpLhoIEJvKS4qo0f2yVLIfTZaf63cb5dW4YBt
 7Wltiw06mt93ucWT3MQb97WTEy+zZdRNT7GDjLWn844mp6zKZva33CGKuUPdsRFuj7qPHp86I+A
 4psf5XVjRvvD2Q3ihRvnu8EPnWRfSQ7tALVgnsu3zW7pmdPLagxxL2gLBczmv3+UvVQkFepL+B+
 TTEeCindXCz3/ZJxybVTPL3KDAdXY7N9avrZs1Yld8Ib0RUPyAbR3dlSNA8sdT3QnIkwof8M7hM
 lKyLNZFwlchnWg7mY04WSEMQ1QdiIw==
X-Authority-Analysis: v=2.4 cv=S8XUAYsP c=1 sm=1 tr=0 ts=6902ea3d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=6mQ44K8ZfP1dJrZg0vYA:9
 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: zV3ZR0FWfdZOHsjT08IBHId0rNsKFX1U
X-Proofpoint-ORIG-GUID: zV3ZR0FWfdZOHsjT08IBHId0rNsKFX1U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_213157_595497_EE19CD86 
X-CRM114-Status: GOOD (  16.22  )
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
Co-developed-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
Signed-off-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/cfr.c | 35 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/cfr.h |  1 +
 2 files changed, 36 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/cfr.c b/drivers/net/wireless/ath/ath11k/cfr.c
index 649675e94bab..0a7dcf7b7793 100644
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


