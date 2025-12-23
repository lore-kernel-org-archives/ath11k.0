Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9CD3E6F078
	for <ath11k@archiver.kernel.org>; Tue, 23 Dec 2025 09:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hs5288HHVUQFjrv7CSPivVXMjxMWSBhPiX8zU58z2Y4=; b=Q7ckTwY5u2/NE2aq6tedzRQvG+
	j1TYbn0aWwB+erPJG0oZDb3bL3oIwla989m02SxoqIUGCHUkG9Mp/qNOqxyI6EJ+YjwBJYLTNeS7J
	nSaT6BBPTzng1BGSoG7NYGcXu9bMnjFjaKepXWeWJk2gtJKCm9wpFVz3UQsPy2sKwUf51ljlBPu/a
	3sAxTp3fEhWq9PJIZNsEH7udx2dQX1zw5mnnBaWDcI96pZWoZqVwnMqHGkxO4KblVO1tcowlSk58c
	VsmNxno2AvA1lRbqW2+WoeRvHAGKOIbQ8vbGL6VA9rCdZytAwmWQjokyjUD1X9W2BUDt1wp8XOlW4
	liuH6L3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXygJ-0000000Eki6-1BPV;
	Tue, 23 Dec 2025 09:27:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXygG-0000000EkfB-0c6F
	for ath11k@lists.infradead.org;
	Tue, 23 Dec 2025 09:27:49 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN36aVX1894837
	for <ath11k@lists.infradead.org>; Tue, 23 Dec 2025 09:27:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hs5288HHVUQ
	Fjrv7CSPivVXMjxMWSBhPiX8zU58z2Y4=; b=FcYVCA1IbdU6G/HptCx/NU67cuQ
	dauj05M7Xg1LBtl6ihZiSn2fBhoLlYA+tLVYIZXQNoMkogqcXHgm5gtVYjKAtIox
	OzG1IhPE97TIXM2TBRYlLjhHkFVbLyb5BIGY+FCk1+k7vtsiQbDmjM4sSxwtGnfG
	2g7Y8i8FxD/I/BkYAXkoXJ94rs5l0utQN1eHGoLR34ahjZxU9l/TAkU8dsM/Ej+T
	9917fxIZ/5yQ0M2ud/yE+Nqcmv78h/i92me7cF/ilaGVegudPubpn3+sD55zZn1t
	ffnYjusQ61Q8JMpsphMHcH0BjBIgPLYsEiHyx6ky0WY12rDF8PuFy/XacGQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b74takanv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 23 Dec 2025 09:27:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f177f4d02so108726855ad.2
        for <ath11k@lists.infradead.org>; Tue, 23 Dec 2025 01:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766482066; x=1767086866; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hs5288HHVUQFjrv7CSPivVXMjxMWSBhPiX8zU58z2Y4=;
        b=j0klPjML+mDt+O8QpciE+v8duo6ySpfhs3qqcow2fL2C/lrXYvNqnkqFLkAD4IbZ7R
         2SH/Cbeq50ZH17Tv4FBgW307rXN+8fSq+z9Lul1gAsDByRWClanD/7QUcZ9QU526Kq9x
         q6/X6YzLSS8zzwRDZLLac+jaZ1ikIm4LBihAKb/cOGW49qUjh3V1TP6o2ydgiIpruUU3
         tbBEJjSXgTiDVP07byWdkzwI1A1iNiEiIqr7oTJIVXT7IPK3hdVMB1okSA6Bd+2E3uht
         gpEbOF6zB7zKjapUrJu0V/YoguniZKa6uAmQNO1NHU58LVbA5sJsVZxHx1cNBb2MfUAe
         qBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766482066; x=1767086866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hs5288HHVUQFjrv7CSPivVXMjxMWSBhPiX8zU58z2Y4=;
        b=mF8iGnPUsoKUFOiF5Dz2wjwPFSpm065OL11akXQbc+C5wi60rX1Jdt6g/YBo0hUlpL
         BUdaGXmZmm6XG6VSKxcb6kdRjM7Kqdab29BcK93cN9L0hgoOwhpHz7+jCuC+uTtTH7Dg
         A+sNh5I4QBu/Y9+o8DMIwi43rUmrbM37mazM/GI3o2Dx5O90+YXBX84zHGfVOW4QuxM3
         KA9fI4VVXwrTRANGQp5y/3YktdjkCIvqevjgWl/vLVr9B2Fp8RoijmaR8Rgovmgnb+69
         aVDdGXzMET5JeiMIdcFP4S0O9dav2Q7xwLVcOZzap3jLkDDEav93ejpF2hKr2YegV4yG
         x04A==
X-Gm-Message-State: AOJu0Yx6T2WOd7SQ1wZ5hjfAR7MrjUFpySbfxzD/boElZTc+S6vzeTUr
	tlvkXOim/icmR0hYbYywchD1syMkBAvIOpBh4SUGovukkvC2e8wkfQLJQ8+nTMZnhtPcIuABSCu
	0gLvv/MJw+zp3KE3MJ2xEuMQvYt7h8WrIUcHHNUlGbRpdoGxtAwDjXT8v3t1a7Q61leejsksiPw
	zlLQ==
X-Gm-Gg: AY/fxX6VKKZY2rl6EE95eImrqu7AvWxlLZlYK9RR2I9nXzXkdlOF9QG5XXJ9H8qf1sp
	TEriZ47Wju7gJmPvS08zMypaOiGlMindQZS0WPeyPO55fj3ga7C4cXxMAYQoU6v7HXyZR562NwV
	+RMg7kXxG3WrE3Qj29IdD0kHJAEN9E/lEf2yRtSO4E7b+bxjyAS/lvId6D7KNIACt9Ta0y/i+X0
	nZrcLXYQGskjvuLSsAEqwHjeY1QORsF6Q2zaOjffoWkWyIAbxtxGCd4Qk9lKj68mtZvSX6pr2Rj
	3VwdS0egWYV2iupadSmbufSMlYLtny7SDEJAmOus/Ql+BzorQhESRd026QQYV9HyeDRclfsuub8
	RHbGjyrfKDjJKnJjq3zfZ/3Fk+IgujQPtZ30=
X-Received: by 2002:a05:7022:2520:b0:11e:1bc:bd9c with SMTP id a92af1059eb24-121722ddfbdmr13701045c88.28.1766482065896;
        Tue, 23 Dec 2025 01:27:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAkedPd5CmtDs4i/PLaxntsgRQTIXk68OfaX5mnTr97GNhRxlKNjAXqg3GYFDKF3g2AIRl+w==
X-Received: by 2002:a05:7022:2520:b0:11e:1bc:bd9c with SMTP id a92af1059eb24-121722ddfbdmr13701026c88.28.1766482065304;
        Tue, 23 Dec 2025 01:27:45 -0800 (PST)
Received: from hu-zhangq-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217243bbe3sm56130940c88.0.2025.12.23.01.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 01:27:45 -0800 (PST)
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Qian Zhang <qian.zhang@oss.qualcomm.com>,
        Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Subject: [PATCH ath-next v4 4/6] wifi: ath11k: Register relayfs entries for CFR dump
Date: Tue, 23 Dec 2025 14:57:26 +0530
Message-Id: <20251223092728.1950017-5-qian.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251223092728.1950017-1-qian.zhang@oss.qualcomm.com>
References: <20251223092728.1950017-1-qian.zhang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DPiCIiNb c=1 sm=1 tr=0 ts=694a6093 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=6mQ44K8ZfP1dJrZg0vYA:9
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: tsoIa7ImgqhkW0MSNrjf-Eu_w5vPnbOh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA3NSBTYWx0ZWRfX+yRe1VQsM6Ek
 n3iWC8SZkYYWnh6f6QAiK7pL8YUiL+9Zp7HULlD2ZkWSAVWBa1Hd/YXHFxxT2yzbdiXnYwrz5MH
 a/1SGIqXipErr0RF1JnakPRf0dPF5Xeviu0ismf99v1hrIwtNu4VFhZEqrrOnP2PAmRzUGmSjGm
 Nwr1BKB9Hh9vPE7EK8TCssaqUbrFx9OwrJMCcRKFeBzPdPBjtFid/gf5yv/o0pzMwdZEH4EHOJx
 SA6d/j3m5oexq/7coW7jP+4Opy1eJgufdTE9wZCrPmVsUljnT2gR/wbbK30szhzIC8bL94zaG6i
 BiF0E2hbBQZpP0AA8JOFHDA1UeSIjJHDS2W3mZfdV2wsF8JtlIlqKyBG7IpdD0dHvsm0Qj3baaK
 dNd7r9KtPga2ZeHbBvG4jBKKDqi3awayJBlaXFm0O91XKZK+7buAdUTpWJerm1Gp1kwcyVCfv2l
 oFDNlmBE7Dno5sD05fA==
X-Proofpoint-ORIG-GUID: tsoIa7ImgqhkW0MSNrjf-Eu_w5vPnbOh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_012748_365579_C8C7919F 
X-CRM114-Status: GOOD (  15.45  )
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


