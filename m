Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95831E94109
	for <ath11k@archiver.kernel.org>; Tue, 30 Dec 2025 08:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ny32iZYA/yl4VlYq+DWcLmvo7EGRIFsGEX4pKQk8Fxk=; b=4Mk0Q45N7gYSOLjIGej9RONDv0
	RYs/Qnt7LLJkmdrx4UzuwWIfUkV4Kn/Qo/a7XAO0yuFV1jm8n7iEOI4j1qw+qefOgiu0KgPJtdq03
	6Inpf3S9jyZ31qqmL2cXDSbIYrVKuWGp/4JcczmAz4E1ejGrKS3yCfeAmSwg91Ri2QV6pkJu/dB+H
	OoVSfzz+Gz4Ad36aYZ7dZKA+MrS1pC2QGi+vicGaqdHmL50jTRMnALdrAc7FHN/4+zTRSAvf9pT2F
	7Ue9xZD72VrgdQLiNIq69y/YHzeXg9J0jRXj3j/CvWLD8J9DXww0Jt/0x2YaZxuZG3BDd+ZhfGFsl
	9j5hnhnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaV30-00000004ZjG-1bI4;
	Tue, 30 Dec 2025 08:25:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaV2w-00000004Zgp-3FBS
	for ath11k@lists.infradead.org;
	Tue, 30 Dec 2025 08:25:40 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU3hg922546972
	for <ath11k@lists.infradead.org>; Tue, 30 Dec 2025 08:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ny32iZYA/yl
	4VlYq+DWcLmvo7EGRIFsGEX4pKQk8Fxk=; b=lZmWGZvxeyFWWk5Ajb3qBAsEc8b
	gfgD1mnAb18e+wJxIJqkDB4k3iHMuFC7bGZAREDAfIfb0WfRrqQyHjfhnggxzNIE
	u+/PisAH9c/m82v1apAAO5eZmIAcBwGUz6gY/ch7nubjMu0yTyCsa6xShXXt3Y3r
	Wzfadp4y2r+OGkdfpXZUaoD2k/7Qj/8u2hLX78ARQtl37Q5psYeCmZDxBztE6zRX
	BQTyMrPpF2/887DNv4FoZYLIz9s+PjxC77M+WXmfDiIjzVaeLVLB4nv7dRrOb2Pp
	xlfPov5NNViTlXD5LinvDGxLpVtN8vJtyEoFrEcRvk3i+4AY6F8ASaDWz0Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc7398k6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 30 Dec 2025 08:25:38 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b993eb2701bso10078138a12.0
        for <ath11k@lists.infradead.org>; Tue, 30 Dec 2025 00:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767083137; x=1767687937; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ny32iZYA/yl4VlYq+DWcLmvo7EGRIFsGEX4pKQk8Fxk=;
        b=Crw6UDlFZ6uDsNImY4bV/nNZeD7sr5r8P30Ln7aZ/kLUwpnuKYiPOQrgr4alOEOBff
         iadLFqp98syO+PjqM44gsSGwT7ruq6YaugXn2O7ccgRK2FQvu1UMAhjc+WVik+Ak8vUM
         aLW09vCm8BsSiHoR6aeNcz5vgi+xgjkSNKrxdoN86jXF8BEo5D3D+WKBskiaYdaodMtV
         swYM6MkcwXbSsC9eM57+RsWnWD2hyyczvCiP6u2Ztw5tM3l9E6JWkM9F6VhOJSxgQe1d
         LwOauaLN6SankpE/7fES7lZjvmZeunIJcFwdshH2gIbY5J+wGIT7vIqiAsuG/wzlqtJb
         v9Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767083137; x=1767687937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ny32iZYA/yl4VlYq+DWcLmvo7EGRIFsGEX4pKQk8Fxk=;
        b=oRCbs6lU/SVGwFlAx3g9ZjWOOnZGTj8XJWUVRN8n7hn6wkLbAw6otF3jnP9L2nz3jm
         RDgjEB8a5mjzmndBbUi7ff0EPBDEkeTnMAUw79u4cWCGyHkJEpkQvylz2gZtUs1auyPz
         xgTQjRBQcFDqiBET1d9cOH5TKKSoyUf7kfdvEQFHrDXqeuA068CdRJ6gOrgFoc/4WY2f
         /q4gsmKaEnouNFogWyNAzEcYMvWyvlRcESKoJNwWFspIwIkRCIAT6uozf4oM6L/tp0W5
         H12WRwifRbxzRofUc1eekxfTSvH6W+UbQGAIipE5QwgtWjzbnMtv0bYhmvEfpnP6yJtU
         ralA==
X-Gm-Message-State: AOJu0YygMmS6+UDXvKO3rpjXa/V5bNtzwIdG/gl27foTW7h5eGikgEcw
	gizDJahGtIjGlbEcEXm0BmnJRgdkW+YPwRjzHZz0lftOGFiyhbTvUvTaq943rN8pObTqESie85b
	BK1pc5+QpG9swoiOV1xvpxRmWj3qTgomIqlIKTaBmCcRxgZXZrhEyhXzba0mWXGYBR8DnCu1XfW
	xuqw==
X-Gm-Gg: AY/fxX6TtqyitRzRKcAKZRTp9aEI6zFvKICxJMg8K/Bpk7XpmmaXSLLW+fYcpa4Mb39
	sTRugrNhy9KVDZgC3C915L/OWbzVQgylbDPly0OV+LjLUZzc/6kqrholX711B02UPnHThBEy0fa
	K0qWl922fr/iX3XV1QBpo9rMJUJ38QyA2EJAUOaFCi5GebhouWjyfjNBeVJjn66FHhh01C7urW8
	4cS+iCKgB7YAzdJJrkK4fCTEjmewq9iOy5IQvZ+HKobicklG9f5k7Lls/FExRpn9vrRBdXajPB9
	HUNHVsR2gdvvirw7W/a2NNjAOeVnSxDVuQ1xpottII80jXQUeWvceJquarb5GXVc3JAmNhsLPfB
	wd7/U2l7ogyhfaLGyDu5OHyixv6GpDB4OdiM=
X-Received: by 2002:a05:7300:ce89:b0:2ae:5d5e:9b1c with SMTP id 5a478bee46e88-2b05ebd0c26mr23527929eec.2.1767083137119;
        Tue, 30 Dec 2025 00:25:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUtaCk85HguGlaof9KgU0N4DhWzNr7qc5liJLhVf0XqQK5wr8V6lSlUSxvKxY2lovcgKfpmQ==
X-Received: by 2002:a05:7300:ce89:b0:2ae:5d5e:9b1c with SMTP id 5a478bee46e88-2b05ebd0c26mr23527922eec.2.1767083136523;
        Tue, 30 Dec 2025 00:25:36 -0800 (PST)
Received: from hu-zhangq-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05fcfc1b7sm73275620eec.0.2025.12.30.00.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 00:25:36 -0800 (PST)
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Qian Zhang <qian.zhang@oss.qualcomm.com>
Subject: [PATCH ath-next v5 4/6] wifi: ath11k: Register relayfs entries for CFR dump
Date: Tue, 30 Dec 2025 13:55:18 +0530
Message-Id: <20251230082520.3401007-5-qian.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251230082520.3401007-1-qian.zhang@oss.qualcomm.com>
References: <20251230082520.3401007-1-qian.zhang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dUuMyST-KdXPzcTEVGBknGdzDHGuTlbA
X-Authority-Analysis: v=2.4 cv=HrV72kTS c=1 sm=1 tr=0 ts=69538c82 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=6mQ44K8ZfP1dJrZg0vYA:9
 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA3NSBTYWx0ZWRfX+VatOdJXi3qd
 P8XDQX7q9XBCMGIO3uM/j4pEuHrmfRQRuND/GD3bzVRh0m0i7hZgDQ/J3W/qxZwKVQ20Z0Or5WH
 2EWbwlIuSoKXUUIrRoMflYT2IuHXC1Mb84E5MOTf3a5+cWXcLUDdj350WXY33/6r3HeouS5YoCV
 C2f9KThpNZGLYtk9P9KF3fNIzOHbSQ8mSwPrkJI1vS/sVnU4dBH9dX3prTfjG/vUVslVB9Vq/ky
 YEEo0B7hLRF03zdTPTwrrgYZAt2e64WtQJvD/REbYjiU3CFKWMtxmNcTIch2Go2J0gL8Qr1IVXR
 qyVQnhQfO8RntUtZRvZZyKIhYkgY15gghXRPnJyuTEPdeVHwgUqyJnfsnHFVdvJKdr9c+6sf4GP
 g3Z8qhFYTrtlWcw2wXYzQXTfCg94z5ujvoO6o2F+ZmwYSl8UPsuihi79jU9OQs6Ru9MEkx6zqF0
 IeRGFWXGMUxQIarjorw==
X-Proofpoint-ORIG-GUID: dUuMyST-KdXPzcTEVGBknGdzDHGuTlbA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_002539_849640_AA63C150 
X-CRM114-Status: GOOD (  15.50  )
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
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Signed-off-by: Qian Zhang <qian.zhang@oss.qualcomm.com>
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


