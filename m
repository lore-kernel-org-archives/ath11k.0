Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65762CCFA13
	for <ath11k@archiver.kernel.org>; Tue,  4 Nov 2025 16:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LfxL8k9s1PtDxiBzoMjCu5lz16zmZriUmUqyLCu3JYM=; b=JByXrfEYbUgADTgyaC3hf+phs2
	YFJ+FfLg3WPQne6pyKzKzOpYnyehRLoVfg3OQozs4V0L0WkJrEKVzRIM3iEf9F7Xw/d5BCw5kHzq5
	bXoBjVWjcfz8cse2/1SODvuD/NQhkURdwVG8JLYZN6gBZex4DGpgjUmfwydDKnNo5fibwpnkVStB4
	dnyyk9cFs0b44uYCOO4X8Bc5b3VnVsu1Xb6jYcO9q8cgQndqqQW5OPPJjz70tsUm1ROaiPAIBr8XL
	mJtsZgAkbwlMp9l3wwHXQ7IXCDdEGEkDzthyMwERBaQkjBT2oCoOXCmFh+vx25a8njrTHmmeLhcDZ
	AJNWNkaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJrr-0000000CBk5-1U0v;
	Tue, 04 Nov 2025 16:26:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJrn-0000000CBfE-3hOA
	for ath11k@lists.infradead.org;
	Tue, 04 Nov 2025 16:26:45 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4CfveH2049347
	for <ath11k@lists.infradead.org>; Tue, 4 Nov 2025 16:26:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LfxL8k9s1Pt
	DxiBzoMjCu5lz16zmZriUmUqyLCu3JYM=; b=nKKdvBR7UMsVngXDD75IDigx477
	a4XeODVIYzJo4AYz/lvyRvez9o6bH9KXxeunIhZpJDhaGQZs3m+14s9ogYC4yPsw
	nnobY/TTPL5cveywOyxextbAhvStXlgAFKl9zqtRN7ZMLHnMLUrkb4vssyH2BRnf
	3taf7GUx8KZXDXUrpYkBMENeu/IA+eB1pFG4FXOPlLVCi4JDlAYDm66yNYwC5wlC
	1VRZq1WCn0j1Z9+6KfDwdmUZh8ftYcccvwsAL5I4wa1RHBY8mG8HjfX0HaYxYBOT
	/SXqcgpKesPrrRR0LOpRh/CSSdQwT5+RXqxoZlCnzHyTXtpBepXgRc9sZzw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7f25131v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 04 Nov 2025 16:26:42 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-294ecd3fdd4so68408125ad.3
        for <ath11k@lists.infradead.org>; Tue, 04 Nov 2025 08:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762273602; x=1762878402; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LfxL8k9s1PtDxiBzoMjCu5lz16zmZriUmUqyLCu3JYM=;
        b=MBZQsbsmYpw4cByIzuj4vJUDRfEPFcGvkccv3EIXvc5Teb92HJwSM8xhCA4xU/NbT9
         JMBXiBt76yq8WPnwBlEyQzb5a8+VkXKF11LCXNMGt6gB8/qIm9zJvrJ+Eb9HgNtDs/tW
         C/uEdMArKm2dQ8eH4qS3FArORZBak1DR9lOI/U+pYrWdSRChHQ6ZpZi8fI/KuH2hrQrg
         8bJmV5/4M7KSXGilItxSxagZAVBkyRWvdvQkEtq1S38B7CfykcvPPx81lGFX7BCchrbh
         Yq9C+OKsNZb3o1kZcrj+LtYixJrD+PdsNea+wlTlZNeQpwMWQZoGcpNDmZlrXE1wBkKM
         SWXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762273602; x=1762878402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LfxL8k9s1PtDxiBzoMjCu5lz16zmZriUmUqyLCu3JYM=;
        b=FKhSjlQYdCZWa2CzNlxLYBwCVj2/AlZ7eWU46teMNNqygarDkihlYmEo+NmB7yXzT3
         iDVZDn0Np1KCfaBgzl9VYCrrumY/1dIl1BenhWy3e5PUpj5WOsWyk09v0IObVjQh7REZ
         lbtrjtpOIJIYhTTKoOooe8DtguYTN8fEBnhg+x9xo2MoSGcA8nWL7dCRNzg7flTxAqDj
         fEPR3HMzJeUCc+w5xts0wX86WH1COQe0PNWoT6Jj+TAIVLXNtxLpxSthug2PNWoLplf0
         NosJulpYt4d4aWQU8YZQtNj0D8kozyGDKPmqAMmowioM8yDL89g9z44eEKNc6j5R/Qly
         Cqzg==
X-Forwarded-Encrypted: i=1; AJvYcCWmKMwK7TPltkC+KMEDHjeCTleqvlqgeuNCwd5EYWRkGyNVq5xTfAit0skZdfBBX9VihshcNoc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxSPtIsbBCSpYxQxre+3yFWJEWaykvrnnEseXMekFECc5k+hO8/
	FIVKGI9yZji2z/1pmBYFx+CPyM8G1yZBUiYq6xHh8Abg9NDy4IP9lDw4x4pQJVWRmNOLI+Jmyy+
	Tk6EBdkRgl1wf7v4CZvemwzHtPU4yX/mSDCq+2skNJiLnSaG6xBHKJOe7IDtdGFGf
X-Gm-Gg: ASbGncuoCqJQiAwY7FOMNcct6eCE/M5MCO6Ugb+AY/Bdx1ImgXcKMsHq8n/jxkjg/8o
	6/iscI9Nk4znB46IZKtCvPeGkqAxakHoj+ijUuwmVSuI2jEc5eAQ4mOLYXfeA2siuBHkBNffdf1
	JjqG7eNCod1uPesCSiqucZn6Gyfiv5veLeMtAquBd5BrKMku9e+LYRL/nvSjwwgm9+7rYrp8p0/
	zC9M01bGQtInJiR7vV6i9dzYD3iSlv+55Z+vtZmDA/RNVHffYu1uxU4aTe9EoJebbM19FTDKAZB
	m3GY3c/dSc9S3tyhApnnHwcWt0zASZbNLZnSEIAapXc0RA9h4aMe4dWYiXTMMi5GHwsRCAdpEhC
	gqwQjqECfyO2nEArV6ouM02uAt6j0aXN8BKrzpiHOC2lU
X-Received: by 2002:a17:903:2341:b0:295:82b5:73e9 with SMTP id d9443c01a7336-2962ada6b0fmr2405235ad.35.1762273601640;
        Tue, 04 Nov 2025 08:26:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHh5Hs+0YNeqZvomTfGtPezONLdo2oRuuKYVYUrY7Wc+ewG7N762IAr4o8MrLtCWNtdVMOdw==
X-Received: by 2002:a17:903:2341:b0:295:82b5:73e9 with SMTP id d9443c01a7336-2962ada6b0fmr2404905ad.35.1762273601086;
        Tue, 04 Nov 2025 08:26:41 -0800 (PST)
Received: from hu-yuzha-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a7a8a9sm31508435ad.107.2025.11.04.08.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 08:26:40 -0800 (PST)
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: baochen.qiang@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Subject: [PATCH ath-next v2 6/6] wifi: ath11k: Register handler for CFR capture event
Date: Tue,  4 Nov 2025 08:26:33 -0800
Message-Id: <20251104162633.3007874-7-yu.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251104162633.3007874-1-yu.zhang@oss.qualcomm.com>
References: <20251104162633.3007874-1-yu.zhang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dNyrWeZb c=1 sm=1 tr=0 ts=690a2942 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=RXpQw9b9vDifZkLeuRoA:9
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: VO6xuMkW3S9enGgg8KU03_SAwJ1ryfJ-
X-Proofpoint-ORIG-GUID: VO6xuMkW3S9enGgg8KU03_SAwJ1ryfJ-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDEzNyBTYWx0ZWRfX9GDBP20vTaFI
 OR4c5khAOXirFn6J9CxRygNGxYKpD7OO2rGCDnSbFyvWwSPfGoeAk8QVA9XkrK3ZnkBWwn4KiLh
 NnpgpXajJ18AdUBvQmz9hhvVi8XWQ1F+Jtduv0zgCgpjkgiTpEsuyeBKMgMjaI861Sujbs1Hrxv
 UhWKtL4FjZsYk6v1izM6yx4pEKS949LkhCvb9T3r9yXmjk0YE9nHCsZJdUTo4AMBYA7ahfiy+pZ
 kuC9pZJHgECh3RZ1IIaEa3FhOnXsCqeEEAQAcsinnHRigxBQqs404cHUF7vEdNCuk4oBOrzBDPF
 mKF8OcIbjEpdctiMttK09qIYH8F0Anyi5Zqg2uIpvlGbgexEvCuXJWvFDhzQzloDD33SrMjoQdo
 aQtk0aSvEXZZMsD9NQRh5/LqNMdFSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-04_02,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_082644_051570_6AB423CA 
X-CRM114-Status: GOOD (  22.54  )
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
---
 drivers/net/wireless/ath/ath11k/cfr.c | 144 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/cfr.h |  62 ++++++++++-
 drivers/net/wireless/ath/ath11k/wmi.c |  90 ++++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.h |  44 ++++++++
 4 files changed, 339 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/cfr.c b/drivers/net/wireless/ath/ath11k/cfr.c
index 0b02c038693e..b26d336533ae 100644
--- a/drivers/net/wireless/ath/ath11k/cfr.c
+++ b/drivers/net/wireless/ath/ath11k/cfr.c
@@ -250,6 +250,150 @@ static int ath11k_cfr_process_data(struct ath11k *ar,
 	return status;
 }
 
+static void ath11k_cfr_fill_hdr_info(struct ath11k *ar,
+				     struct ath11k_csi_cfr_header *header,
+				     struct ath11k_cfr_peer_tx_param *params)
+{
+	header->cfr_metadata_version = ATH11K_CFR_META_VERSION_4;
+	header->cfr_data_version = ATH11K_CFR_DATA_VERSION_1;
+	header->cfr_metadata_len = sizeof(struct cfr_metadata);
+	header->chip_type = ar->ab->hw_rev;
+	header->meta_data.status = FIELD_GET(WMI_CFR_PEER_CAPTURE_STATUS,
+					     params->status);
+	header->meta_data.capture_bw = params->bandwidth;
+	header->meta_data.phy_mode = params->phy_mode;
+	header->meta_data.prim20_chan = params->primary_20mhz_chan;
+	header->meta_data.center_freq1 = params->band_center_freq1;
+	header->meta_data.center_freq2 = params->band_center_freq2;
+
+	/* CFR capture is triggered by the ACK of a QoS Null frame:
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
diff --git a/drivers/net/wireless/ath/ath11k/cfr.h b/drivers/net/wireless/ath/ath11k/cfr.h
index e8b5c23b15cc..0129f9a924e2 100644
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
 
@@ -180,6 +231,8 @@ int ath11k_cfr_send_peer_cfr_capture_cmd(struct ath11k *ar,
 					 const u8 *peer_mac);
 struct ath11k_dbring *ath11k_cfr_get_dbring(struct ath11k *ar);
 void ath11k_cfr_release_lut_entry(struct ath11k_look_up_table *lut);
+int ath11k_process_cfr_capture_event(struct ath11k_base *ab,
+				     struct ath11k_cfr_peer_tx_param *params);
 
 #else
 static inline int ath11k_cfr_init(struct ath11k_base *ab)
@@ -237,5 +290,12 @@ struct ath11k_dbring *ath11k_cfr_get_dbring(struct ath11k *ar)
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
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 0b4cc943c290..65f084524855 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -8802,6 +8802,93 @@ static void ath11k_wmi_p2p_noa_event(struct ath11k_base *ab,
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
@@ -8932,6 +9019,9 @@ static void ath11k_wmi_tlv_op_rx(struct ath11k_base *ab, struct sk_buff *skb)
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


