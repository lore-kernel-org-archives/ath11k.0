Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6ECE9411C
	for <ath11k@archiver.kernel.org>; Tue, 30 Dec 2025 08:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+ef1cvJDfw+aIfjk0PCBncm4cc0cR/WtSOgB/y98fo=; b=j2DabVVkOWqMCO4b+wjV6DENFO
	nOY8mwqei5qvSrEPVLR533fZxbuacOSLzvRigP6S0EdYGWMN/mu4F/U5kr8b/h8QL8v4rhLJ+RYjp
	dn+7hFdZXgJw0r/74gqeT1ot+mbHx3oLS870v1loJpHzw3pnubfdcUmVyzZ8ry5si6d6Uq45Vbfjh
	CXMM9dkTbDyOVtP2Tjamx6ApPgtNYA1i1G1rUdj+tPFu20peMUtGCmRtSY+Wdtb2rlRuhlSRB3qfF
	R12IRUFodHaWrEcaVdzcfuIDHQClK1Ts1QmtAn6JQZSNuaVVVotsQl0t3KvlZSCMVQ8bT+RR64SUY
	i/0zq9QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaV37-00000004Zp5-17Ix;
	Tue, 30 Dec 2025 08:25:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaV32-00000004ZlY-44tt
	for ath11k@lists.infradead.org;
	Tue, 30 Dec 2025 08:25:47 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU1KbHR3115933
	for <ath11k@lists.infradead.org>; Tue, 30 Dec 2025 08:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=a+ef1cvJDfw
	+aIfjk0PCBncm4cc0cR/WtSOgB/y98fo=; b=bPTDtIs/i+NNa5S6tP6ql67wXG4
	S1Pk6rusNGpfIYb+NR3u4g9b7qsEki35cpbkK9dRMtTTaMDCFftJ2+3Lv76unZmZ
	afQ24dPEeovKzr3q3+qOo3AbZLGjZqFt9vz0r1d58xbI/TvzJukfMG/b+GGOaAHl
	ESn/ExJRY8NI6NrXBhBjeERDT+r8YvrMEbtB5yGUnzF1gAx00LSjEZdbRYQ1FVRv
	NHizvnN7ulDUD6t6kbzi6pky3VEmWeIU8L2r7yLA+B8189liA8hAy48vF8PIoX/v
	psZmRgYVdaaVgAuS7msF5DzjaOd7bsTnsJgY0LE7GxD6zEwggd4+kBmTiog==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0skh9bp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 30 Dec 2025 08:25:43 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-bdced916ad0so17977552a12.0
        for <ath11k@lists.infradead.org>; Tue, 30 Dec 2025 00:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767083143; x=1767687943; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+ef1cvJDfw+aIfjk0PCBncm4cc0cR/WtSOgB/y98fo=;
        b=M9Gz67rdSCPCOtlFU0YMvnEyQj4XnbzbKIYwexnOLXvLh36MnSJhT5kLld4kR+57OL
         ITZALEebYLlOsxbBu7WtUn0M73MUCAbXpwWMBraXtBwSFx48LYZmgHhd2nyi869ZLjtq
         /WM9q9BfnGrRdk8AhOjzZYJXcAhuLaYJxfZhsuFPyjtPIL+AN7jIorNMyheirMBGgH/p
         v+uGuai40lPB0uciH/TQl50GK494eie9W6OMddAk1sPZF2dzMRD1AFzYgf5RoW2zVTrX
         p97LdQpW3WQ5L7XoXHSjZYVa3TVtPiM0sd9lDEyIL3Ul9JF8p0UBy7oNSBKlcbm31rG3
         I1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767083143; x=1767687943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a+ef1cvJDfw+aIfjk0PCBncm4cc0cR/WtSOgB/y98fo=;
        b=qHBNzZB8yxMDI8Qn84XD5bo1IqvLAh/Nz+hQ4EgjoVhjNlY3p6/fDqyWqDwtjhtH8H
         /6vb3J9TZEXCYrerYSdqgj+i9qdcmlG9C3tylxk/u7F2HYCpm/t0i9maVaaQFV3Y/CdW
         1bFUMBxsRuTpJjhiqBWvdJT4CiEzVx8rwyy5tn2unO7JT/TaCWPjeoJjS/GHirrMhnDW
         c3ory59emIfBtEAqKDvwYAHwuGunkMFo4hC7vOhaIsYwdDGyyaKHd/gO1RgsGsbxu43S
         +SAVRYJGndda2WUb4BpQanES45FBVt9P5DFdqWTEw2rcUpU+BMWvHzxjfGYkgLpk3wly
         f0Hw==
X-Gm-Message-State: AOJu0YxPT+wkCoOhbVqYL/yCQ5KBEsZMjJm+yyDL65kUTbOsgVbtxMEa
	09WUPQDJTryZWIsfmAgOyGJhMCCEikUiJi51GECyyXzktrOSks+OUinRrILx75m3amTWVI8lbFO
	Ihq66B1qoQU6qGrSxPlgGIuJixTQkuJTHewbMgY0iQeMUVKeHeltUDPIh4YoTATX6hWpHUW/AOR
	ucRw==
X-Gm-Gg: AY/fxX4O6b4wWbVuRZOarHeWgSx2VkiGIb4B7pfs+iM/ruFtz+gykbOLxiv2P5PkKQi
	FeSfKTZS2mQgsG2CKRgZOKmkdjp3ZLmz2IUEHZznRebZthyvv4cI234OmSbNfsChtpz9ONrOHZu
	EBK/y7/Tj4T2HO+CVlAJe6hxwxwdWUGjMTU8oALeXGIUhqDPLnYlwAzc21tQOM7e3WRRYn0CulF
	H6X2m1sS0P99MPXQvyBjvNiomdBRDcamM9ZC3pMXKHgwo6+YYiw7dn5oYLCbkAyjBfgdUqcoqAg
	vZqoODi6jPl3TtUTCPdC4KLyMrWCempQULwu9Y2RDM7GvxOAdlwVH0+s86ID8vivrDMYXRWnkfo
	vXkTyaTy8rarxJgjKoM352rQmUO7FSLBZ8x8=
X-Received: by 2002:a05:7301:d89:b0:2ac:2263:dcc0 with SMTP id 5a478bee46e88-2b05ec19181mr34507238eec.19.1767083142552;
        Tue, 30 Dec 2025 00:25:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqW4B1UNtYl5z7/J0hzN1DFSOOlV81mWJv1hQNAqroMEhlZQzAkIbjPT0SJwsQvWujLmKeRw==
X-Received: by 2002:a05:7301:d89:b0:2ac:2263:dcc0 with SMTP id 5a478bee46e88-2b05ec19181mr34507214eec.19.1767083141912;
        Tue, 30 Dec 2025 00:25:41 -0800 (PST)
Received: from hu-zhangq-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05fcfc1b7sm73275620eec.0.2025.12.30.00.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 00:25:41 -0800 (PST)
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Qian Zhang <qian.zhang@oss.qualcomm.com>
Subject: [PATCH ath-next v5 6/6] wifi: ath11k: Register handler for CFR capture event
Date: Tue, 30 Dec 2025 13:55:20 +0530
Message-Id: <20251230082520.3401007-7-qian.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251230082520.3401007-1-qian.zhang@oss.qualcomm.com>
References: <20251230082520.3401007-1-qian.zhang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA3NSBTYWx0ZWRfX8HTi6q6W1CC5
 hAsGYZdnZ9Bb5/Yd1c6XfL/HD+RdjYrgkMMDLJ0u+lQI1L0S8o5I0CDTXg054LQtenLiHQiiiWI
 piLDmbBPROxH7hkLSeYBF55LfKCHwju3ODXpXyph1Ra14fK5faekCLmIbq16tfBCQueKiWtpcjK
 jxVetIQyACFUbJ50FaHMKFL9JpGuipMokCUbmAtYB0YS5kNWSUbpZcHf3/vbRuCbBVkJEUWVyO5
 uhkcSkXQ57ZCN6rzuqnM+UIKzZMjB4pBn5StgrjmUWafxlf9htpjTlHjzMTN78Swp6ditQBaIzs
 P8dr0JQ49UbUfzrPjOXI1chdEOwb+kvv+/2gk487YgkvACUvarOHnEjNnH5ZUdQg6PhaXMD+kkE
 t/5RSmgyl8MJbhoNIJFShVbqnjB4y7tpbQRMLv7YCGbdpanqf47bYjGU8L+wqWW9N84WIGbtg2B
 mT6xvDiJtlsGNdbfVLw==
X-Proofpoint-ORIG-GUID: Z-DH8-S6OelGn1EROaY31iGXpFipBi49
X-Proofpoint-GUID: Z-DH8-S6OelGn1EROaY31iGXpFipBi49
X-Authority-Analysis: v=2.4 cv=FJ0WBuos c=1 sm=1 tr=0 ts=69538c87 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=n3wQ3jxUt39sdYGcamUA:9
 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_002545_171923_EA5D3299 
X-CRM114-Status: GOOD (  22.04  )
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

Firmware sends CFR meta data through the WMI event
WMI_PEER_CFR_CAPTURE_EVENT. Parse the meta data coming from the firmware
and invoke correlate_and_relay function to correlate the CFR meta data
with the CFR payload coming from the other WMI event
WMI_PDEV_DMA_RING_BUF_RELEASE_EVENT.

Release the buffer to user space once correlate and relay return
success.

Tested-on: IPQ8074 hw2.0 PCI IPQ8074 WLAN.HK.2.5.0.1-00991-QCAHKSWPL_SILICONZ-1
Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04685-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1

Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
Co-developed-by: Yu Zhang (Yuriy) <yu.zhang@oss.qualcomm.com>
Signed-off-by: Yu Zhang (Yuriy) <yu.zhang@oss.qualcomm.com>
Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Signed-off-by: Qian Zhang <qian.zhang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/cfr.c | 160 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/cfr.h |  70 ++++++++++-
 drivers/net/wireless/ath/ath11k/mac.c |   2 +
 drivers/net/wireless/ath/ath11k/wmi.c |  90 +++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.h |  44 +++++++
 5 files changed, 364 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/cfr.c b/drivers/net/wireless/ath/ath11k/cfr.c
index ee7626bd4b1a..6568edd5d600 100644
--- a/drivers/net/wireless/ath/ath11k/cfr.c
+++ b/drivers/net/wireless/ath/ath11k/cfr.c
@@ -252,6 +252,160 @@ static int ath11k_cfr_process_data(struct ath11k *ar,
 	return status;
 }
 
+static void ath11k_cfr_fill_hdr_info(struct ath11k *ar,
+				     struct ath11k_csi_cfr_header *header,
+				     struct ath11k_cfr_peer_tx_param *params)
+{
+	struct ath11k_cfr *cfr;
+
+	cfr = &ar->cfr;
+	header->cfr_metadata_version = ATH11K_CFR_META_VERSION_4;
+	header->cfr_data_version = ATH11K_CFR_DATA_VERSION_1;
+	header->cfr_metadata_len = sizeof(struct cfr_metadata);
+	header->chip_type = ar->ab->hw_rev;
+	header->meta_data.status = FIELD_GET(WMI_CFR_PEER_CAPTURE_STATUS,
+					     params->status);
+	header->meta_data.capture_bw = params->bandwidth;
+
+	/*
+	 * FW reports phymode will always be HE mode.
+	 * Replace it with cached phy mode during peer assoc
+	 */
+	header->meta_data.phy_mode = cfr->phymode;
+
+	header->meta_data.prim20_chan = params->primary_20mhz_chan;
+	header->meta_data.center_freq1 = params->band_center_freq1;
+	header->meta_data.center_freq2 = params->band_center_freq2;
+
+	/*
+	 * CFR capture is triggered by the ACK of a QoS Null frame:
+	 * - 20 MHz: Legacy ACK
+	 * - 40/80/160 MHz: DUP Legacy ACK
+	 */
+	header->meta_data.capture_mode = params->bandwidth ?
+		ATH11K_CFR_CAPTURE_DUP_LEGACY_ACK : ATH11K_CFR_CAPTURE_LEGACY_ACK;
+	header->meta_data.capture_type = params->capture_method;
+	header->meta_data.num_rx_chain = ar->num_rx_chains;
+	header->meta_data.sts_count = params->spatial_streams;
+	header->meta_data.timestamp = params->timestamp_us;
+	ether_addr_copy(header->meta_data.peer_addr, params->peer_mac_addr);
+	memcpy(header->meta_data.chain_rssi, params->chain_rssi,
+	       sizeof(params->chain_rssi));
+	memcpy(header->meta_data.chain_phase, params->chain_phase,
+	       sizeof(params->chain_phase));
+	memcpy(header->meta_data.agc_gain, params->agc_gain,
+	       sizeof(params->agc_gain));
+}
+
+int ath11k_process_cfr_capture_event(struct ath11k_base *ab,
+				     struct ath11k_cfr_peer_tx_param *params)
+{
+	struct ath11k_look_up_table *lut = NULL;
+	u32 end_magic = ATH11K_CFR_END_MAGIC;
+	struct ath11k_csi_cfr_header *header;
+	struct ath11k_dbring_element *buff;
+	struct ath11k_cfr *cfr;
+	dma_addr_t buf_addr;
+	struct ath11k *ar;
+	u8 tx_status;
+	int status;
+	int i;
+
+	rcu_read_lock();
+	ar = ath11k_mac_get_ar_by_vdev_id(ab, params->vdev_id);
+	if (!ar) {
+		rcu_read_unlock();
+		ath11k_warn(ab, "Failed to get ar for vdev id %d\n",
+			    params->vdev_id);
+		return -ENOENT;
+	}
+
+	cfr = &ar->cfr;
+	rcu_read_unlock();
+
+	if (WMI_CFR_CAPTURE_STATUS_PEER_PS & params->status) {
+		ath11k_warn(ab, "CFR capture failed as peer %pM is in powersave",
+			    params->peer_mac_addr);
+		return -EINVAL;
+	}
+
+	if (!(WMI_CFR_PEER_CAPTURE_STATUS & params->status)) {
+		ath11k_warn(ab, "CFR capture failed for the peer : %pM",
+			    params->peer_mac_addr);
+		cfr->tx_peer_status_cfr_fail++;
+		return -EINVAL;
+	}
+
+	tx_status = FIELD_GET(WMI_CFR_FRAME_TX_STATUS, params->status);
+	if (tx_status != WMI_FRAME_TX_STATUS_OK) {
+		ath11k_warn(ab, "WMI tx status %d for the peer %pM",
+			    tx_status, params->peer_mac_addr);
+		cfr->tx_evt_status_cfr_fail++;
+		return -EINVAL;
+	}
+
+	buf_addr = (((u64)FIELD_GET(WMI_CFR_CORRELATION_INFO2_BUF_ADDR_HIGH,
+				    params->correlation_info_2)) << 32) |
+		   params->correlation_info_1;
+
+	spin_lock_bh(&cfr->lut_lock);
+
+	if (!cfr->lut) {
+		spin_unlock_bh(&cfr->lut_lock);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < cfr->lut_num; i++) {
+		struct ath11k_look_up_table *temp = &cfr->lut[i];
+
+		if (temp->dbr_address == buf_addr) {
+			lut = &cfr->lut[i];
+			break;
+		}
+	}
+
+	if (!lut) {
+		spin_unlock_bh(&cfr->lut_lock);
+		ath11k_warn(ab, "lut failure to process tx event\n");
+		cfr->tx_dbr_lookup_fail++;
+		return -EINVAL;
+	}
+
+	lut->tx_ppdu_id = FIELD_GET(WMI_CFR_CORRELATION_INFO2_PPDU_ID,
+				    params->correlation_info_2);
+	lut->txrx_tstamp = jiffies;
+
+	header = &lut->header;
+	header->start_magic_num = ATH11K_CFR_START_MAGIC;
+	header->vendorid = VENDOR_QCA;
+	header->platform_type = PLATFORM_TYPE_ARM;
+
+	ath11k_cfr_fill_hdr_info(ar, header, params);
+
+	status = ath11k_cfr_correlate_and_relay(ar, lut,
+						ATH11K_CORRELATE_TX_EVENT);
+	if (status == ATH11K_CORRELATE_STATUS_RELEASE) {
+		ath11k_dbg(ab, ATH11K_DBG_CFR,
+			   "Releasing CFR data to user space");
+		ath11k_cfr_rfs_write(ar, &lut->header,
+				     sizeof(struct ath11k_csi_cfr_header),
+				     lut->data, lut->data_len,
+				     &end_magic, sizeof(u32));
+		buff = lut->buff;
+		ath11k_cfr_release_lut_entry(lut);
+
+		ath11k_dbring_bufs_replenish(ar, &cfr->rx_ring, buff,
+					     WMI_DIRECT_BUF_CFR);
+	} else if (status == ATH11K_CORRELATE_STATUS_HOLD) {
+		ath11k_dbg(ab, ATH11K_DBG_CFR,
+			   "dbr event is not yet received holding buf\n");
+	}
+
+	spin_unlock_bh(&cfr->lut_lock);
+
+	return 0;
+}
+
 /* Helper function to check whether the given peer mac address
  * is in unassociated peer pool or not.
  */
@@ -711,6 +865,12 @@ void ath11k_cfr_lut_update_paddr(struct ath11k *ar, dma_addr_t paddr,
 		cfr->lut[buf_id].dbr_address = paddr;
 }
 
+void ath11k_cfr_update_phymode(struct ath11k *ar, enum wmi_phy_mode phymode)
+{
+	struct ath11k_cfr *cfr = &ar->cfr;
+	cfr->phymode = phymode;
+}
+
 static void ath11k_cfr_ring_free(struct ath11k *ar)
 {
 	struct ath11k_cfr *cfr = &ar->cfr;
diff --git a/drivers/net/wireless/ath/ath11k/cfr.h b/drivers/net/wireless/ath/ath11k/cfr.h
index c8e5086674d2..94fcb706f2ef 100644
--- a/drivers/net/wireless/ath/ath11k/cfr.h
+++ b/drivers/net/wireless/ath/ath11k/cfr.h
@@ -27,8 +27,37 @@ enum ath11k_cfr_correlate_event_type {
 struct ath11k_sta;
 struct ath11k_per_peer_cfr_capture;
 
+#define ATH11K_CFR_START_MAGIC 0xDEADBEAF
 #define ATH11K_CFR_END_MAGIC 0xBEAFDEAD
 
+#define VENDOR_QCA 0x8cfdf0
+#define PLATFORM_TYPE_ARM 2
+
+enum ath11k_cfr_meta_version {
+	ATH11K_CFR_META_VERSION_NONE,
+	ATH11K_CFR_META_VERSION_1,
+	ATH11K_CFR_META_VERSION_2,
+	ATH11K_CFR_META_VERSION_3,
+	ATH11K_CFR_META_VERSION_4,
+	ATH11K_CFR_META_VERSION_MAX = 0xFF,
+};
+
+enum ath11k_cfr_data_version {
+	ATH11K_CFR_DATA_VERSION_NONE,
+	ATH11K_CFR_DATA_VERSION_1,
+	ATH11K_CFR_DATA_VERSION_MAX = 0xFF,
+};
+
+enum ath11k_cfr_capture_ack_mode {
+	ATH11K_CFR_CAPTURE_LEGACY_ACK,
+	ATH11K_CFR_CAPTURE_DUP_LEGACY_ACK,
+	ATH11K_CFR_CAPTURE_HT_ACK,
+	ATH11K_CFR_CAPTURE_VHT_ACK,
+
+	/*Always keep this at last*/
+	ATH11K_CFR_CAPTURE_INVALID_ACK
+};
+
 enum ath11k_cfr_correlate_status {
 	ATH11K_CORRELATE_STATUS_RELEASE,
 	ATH11K_CORRELATE_STATUS_HOLD,
@@ -41,6 +70,28 @@ enum ath11k_cfr_preamble_type {
 	ATH11K_CFR_PREAMBLE_TYPE_VHT,
 };
 
+struct ath11k_cfr_peer_tx_param {
+	u32 capture_method;
+	u32 vdev_id;
+	u8 peer_mac_addr[ETH_ALEN];
+	u32 primary_20mhz_chan;
+	u32 bandwidth;
+	u32 phy_mode;
+	u32 band_center_freq1;
+	u32 band_center_freq2;
+	u32 spatial_streams;
+	u32 correlation_info_1;
+	u32 correlation_info_2;
+	u32 status;
+	u32 timestamp_us;
+	u32 counter;
+	u32 chain_rssi[WMI_MAX_CHAINS];
+	u16 chain_phase[WMI_MAX_CHAINS];
+	u32 cfo_measurement;
+	u8 agc_gain[HOST_MAX_CHAINS];
+	u32 rx_start_ts;
+};
+
 struct cfr_metadata {
 	u8 peer_addr[ETH_ALEN];
 	u8 status;
@@ -70,7 +121,7 @@ struct ath11k_csi_cfr_header {
 	u8 cfr_data_version;
 	u8 chip_type;
 	u8 platform_type;
-	u32 reserved;
+	u32 cfr_metadata_len;
 	struct cfr_metadata meta_data;
 } __packed;
 
@@ -144,6 +195,7 @@ struct ath11k_cfr {
 	u64 clear_txrx_event;
 	u64 cfr_dma_aborts;
 	bool enabled;
+	enum wmi_phy_mode phymode;
 	struct cfr_unassoc_pool_entry unassoc_pool[ATH11K_MAX_CFR_ENABLED_CLIENTS];
 };
 
@@ -181,8 +233,15 @@ int ath11k_cfr_send_peer_cfr_capture_cmd(struct ath11k *ar,
 					 const u8 *peer_mac);
 struct ath11k_dbring *ath11k_cfr_get_dbring(struct ath11k *ar);
 void ath11k_cfr_release_lut_entry(struct ath11k_look_up_table *lut);
-
+int ath11k_process_cfr_capture_event(struct ath11k_base *ab,
+				     struct ath11k_cfr_peer_tx_param *params);
+void ath11k_cfr_update_phymode(struct ath11k *ar, enum wmi_phy_mode phymode);
 #else
+static inline void ath11k_cfr_update_phymode(struct ath11k *ar,
+					     enum wmi_phy_mode phymode)
+{
+}
+
 static inline int ath11k_cfr_init(struct ath11k_base *ab)
 {
 	return 0;
@@ -238,5 +297,12 @@ struct ath11k_dbring *ath11k_cfr_get_dbring(struct ath11k *ar)
 {
 	return NULL;
 }
+
+static inline
+int ath11k_process_cfr_capture_event(struct ath11k_base *ab,
+				     struct ath11k_cfr_peer_tx_param *params)
+{
+	return 0;
+}
 #endif /* CONFIG_ATH11K_CFR */
 #endif /* ATH11K_CFR_H */
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index aeea58f3fac0..1b5a39113872 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -2911,6 +2911,8 @@ static void ath11k_peer_assoc_h_phymode(struct ath11k *ar,
 
 	arg->peer_phymode = phymode;
 	WARN_ON(phymode == MODE_UNKNOWN);
+
+	ath11k_cfr_update_phymode(ar, phymode);
 }
 
 static void ath11k_peer_assoc_prepare(struct ath11k *ar,
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index b40a31414a47..451cc4c719ae 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -8805,6 +8805,93 @@ static void ath11k_wmi_p2p_noa_event(struct ath11k_base *ab,
 	kfree(tb);
 }
 
+static void ath11k_wmi_tlv_cfr_capture_event_fixed_param(const void *ptr,
+							 void *data)
+{
+	struct ath11k_cfr_peer_tx_param *tx_params = data;
+	const struct ath11k_wmi_cfr_peer_tx_event_param *params = ptr;
+
+	tx_params->capture_method = params->capture_method;
+	tx_params->vdev_id = params->vdev_id;
+	ether_addr_copy(tx_params->peer_mac_addr, params->mac_addr.addr);
+	tx_params->primary_20mhz_chan = params->chan_mhz;
+	tx_params->bandwidth = params->bandwidth;
+	tx_params->phy_mode = params->phy_mode;
+	tx_params->band_center_freq1 = params->band_center_freq1;
+	tx_params->band_center_freq2 = params->band_center_freq2;
+	tx_params->spatial_streams = params->sts_count;
+	tx_params->correlation_info_1 = params->correlation_info_1;
+	tx_params->correlation_info_2 = params->correlation_info_2;
+	tx_params->status = params->status;
+	tx_params->timestamp_us = params->timestamp_us;
+	tx_params->counter = params->counter;
+	tx_params->rx_start_ts = params->rx_start_ts;
+
+	memcpy(tx_params->chain_rssi, params->chain_rssi,
+	       sizeof(tx_params->chain_rssi));
+
+	if (WMI_CFR_CFO_MEASUREMENT_VALID & params->cfo_measurement)
+		tx_params->cfo_measurement = FIELD_GET(WMI_CFR_CFO_MEASUREMENT_RAW_DATA,
+						       params->cfo_measurement);
+}
+
+static void ath11k_wmi_tlv_cfr_capture_phase_fixed_param(const void *ptr,
+							 void *data)
+{
+	struct ath11k_cfr_peer_tx_param *tx_params = data;
+	const struct ath11k_wmi_cfr_peer_tx_event_phase_param *params = ptr;
+	int i;
+
+	for (i = 0; i < WMI_MAX_CHAINS; i++) {
+		tx_params->chain_phase[i] = params->chain_phase[i];
+		tx_params->agc_gain[i] = params->agc_gain[i];
+	}
+}
+
+static int ath11k_wmi_tlv_cfr_capture_evt_parse(struct ath11k_base *ab,
+						u16 tag, u16 len,
+						const void *ptr, void *data)
+{
+	switch (tag) {
+	case WMI_TAG_PEER_CFR_CAPTURE_EVENT:
+		ath11k_wmi_tlv_cfr_capture_event_fixed_param(ptr, data);
+		break;
+	case WMI_TAG_CFR_CAPTURE_PHASE_PARAM:
+		ath11k_wmi_tlv_cfr_capture_phase_fixed_param(ptr, data);
+		break;
+	default:
+		ath11k_warn(ab, "Invalid tag received tag %d len %d\n",
+			    tag, len);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void ath11k_wmi_parse_cfr_capture_event(struct ath11k_base *ab,
+					       struct sk_buff *skb)
+{
+	struct ath11k_cfr_peer_tx_param params = {};
+	int ret;
+
+	ath11k_dbg_dump(ab, ATH11K_DBG_CFR_DUMP, "cfr_dump:", "",
+			skb->data, skb->len);
+
+	ret = ath11k_wmi_tlv_iter(ab, skb->data, skb->len,
+				  ath11k_wmi_tlv_cfr_capture_evt_parse,
+				  &params);
+	if (ret) {
+		ath11k_warn(ab, "failed to parse cfr capture event tlv %d\n",
+			    ret);
+		return;
+	}
+
+	ret = ath11k_process_cfr_capture_event(ab, &params);
+	if (ret)
+		ath11k_dbg(ab, ATH11K_DBG_CFR,
+			   "failed to process cfr capture ret = %d\n", ret);
+}
+
 static void ath11k_wmi_tlv_op_rx(struct ath11k_base *ab, struct sk_buff *skb)
 {
 	struct wmi_cmd_hdr *cmd_hdr;
@@ -8935,6 +9022,9 @@ static void ath11k_wmi_tlv_op_rx(struct ath11k_base *ab, struct sk_buff *skb)
 	case WMI_P2P_NOA_EVENTID:
 		ath11k_wmi_p2p_noa_event(ab, skb);
 		break;
+	case WMI_PEER_CFR_CAPTURE_EVENTID:
+		ath11k_wmi_parse_cfr_capture_event(ab, skb);
+		break;
 	default:
 		ath11k_dbg(ab, ATH11K_DBG_WMI, "unsupported event id 0x%x\n", id);
 		break;
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index afc78fa4389b..baed501b640b 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -1889,6 +1889,8 @@ enum wmi_tlv_tag {
 	WMI_TAG_NDP_EVENT,
 	WMI_TAG_PDEV_PEER_PKTLOG_FILTER_CMD = 0x301,
 	WMI_TAG_PDEV_PEER_PKTLOG_FILTER_INFO,
+	WMI_TAG_PEER_CFR_CAPTURE_EVENT = 0x317,
+	WMI_TAG_CFR_CAPTURE_PHASE_PARAM = 0x33b,
 	WMI_TAG_FILS_DISCOVERY_TMPL_CMD = 0x344,
 	WMI_TAG_PDEV_SRG_BSS_COLOR_BITMAP_CMD = 0x37b,
 	WMI_TAG_PDEV_SRG_PARTIAL_BSSID_BITMAP_CMD,
@@ -4237,6 +4239,48 @@ enum ath11k_wmi_cfr_capture_method {
 	WMI_CFR_CAPTURE_METHOD_MAX,
 };
 
+#define WMI_CFR_FRAME_TX_STATUS GENMASK(1, 0)
+#define WMI_CFR_CAPTURE_STATUS_PEER_PS BIT(30)
+#define WMI_CFR_PEER_CAPTURE_STATUS BIT(31)
+
+#define WMI_CFR_CORRELATION_INFO2_BUF_ADDR_HIGH GENMASK(3, 0)
+#define WMI_CFR_CORRELATION_INFO2_PPDU_ID GENMASK(31, 16)
+
+#define WMI_CFR_CFO_MEASUREMENT_VALID BIT(0)
+#define WMI_CFR_CFO_MEASUREMENT_RAW_DATA GENMASK(14, 1)
+
+struct ath11k_wmi_cfr_peer_tx_event_param {
+	u32 capture_method;
+	u32 vdev_id;
+	struct wmi_mac_addr mac_addr;
+	u32 chan_mhz;
+	u32 bandwidth;
+	u32 phy_mode;
+	u32 band_center_freq1;
+	u32 band_center_freq2;
+	u32 sts_count;
+	u32 correlation_info_1;
+	u32 correlation_info_2;
+	u32 status;
+	u32 timestamp_us;
+	u32 counter;
+	u32 chain_rssi[WMI_MAX_CHAINS];
+	u32 cfo_measurement;
+	u32 rx_start_ts;
+} __packed;
+
+struct ath11k_wmi_cfr_peer_tx_event_phase_param {
+	u32 chain_phase[WMI_MAX_CHAINS];
+	u8 agc_gain[WMI_MAX_CHAINS];
+} __packed;
+
+enum ath11k_wmi_frame_tx_status {
+	WMI_FRAME_TX_STATUS_OK,
+	WMI_FRAME_TX_STATUS_XRETRY,
+	WMI_FRAME_TX_STATUS_DROP,
+	WMI_FRAME_TX_STATUS_FILTERED,
+};
+
 struct wmi_peer_cfr_capture_conf_arg {
 	enum ath11k_wmi_cfr_capture_bw bw;
 	enum ath11k_wmi_cfr_capture_method method;
-- 
2.34.1


