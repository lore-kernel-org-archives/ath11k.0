Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7098BC2BA1B
	for <ath11k@archiver.kernel.org>; Thu, 13 Mar 2025 11:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d9qoisNOG/J+QBYyjCN2S8XuP76MA1VccskcGW+lCGw=; b=C254zU+hiERGV1AmLw6MbB1ACb
	/j/D8ljVYSUpsa/dSWvg0F/9Tn9oNJInmLDWLMhMzX5a4Gncb1o9CcaB7c5RX8glbP5wESbHsxvFF
	+9Ef5kKuiHfqOwxVHn12+99WuiEGGr8zA8NCm21KARE3XittFsWFR+DHp7OkECfLzNbdNCjPv/iSH
	GgmQ8VQ8d3dRfamgLkctl320HQazJocXzysQcFlugg4mO+jtXoa2RXEP0IUiARe4CDGCrcr0IWDOk
	14YceEYWmuRRCV6II2Bsja6D7wFK6f3jevU55UCakLK7FvmUmCGkNopWoEJpCqogU1DWClNN78lcj
	DTJ3yjhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsh2Q-0000000B6OW-0fOm;
	Thu, 13 Mar 2025 11:47:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsgwa-0000000B4iw-1sGj
	for ath11k@lists.infradead.org;
	Thu, 13 Mar 2025 11:41:45 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52D9DgZa017514
	for <ath11k@lists.infradead.org>; Thu, 13 Mar 2025 11:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d9qoisNOG/J+QBYyjCN2S8XuP76MA1VccskcGW+lCGw=; b=FhyFqFtjZKeb7Tme
	9j7nwFU6jIELF+7849JGGhbLgkzQyEYYxfwvnp+6CwsqP2ImuhrQ6IkdhMd/cNzL
	NBEo/2zBc3eIRCeKe778/VPjyF+ixwOLnyOItKkqNQbnEWpe4LM3Ub0XKqXQux9f
	x65A1I+qg+TAX4w12ujZXutnRYgV+Epuv6iELyjZNmF9s9pLkMCGDMdepxOhq10N
	OPOzlfD4YcsJ1xmofyEXTwk88zFpv4YwFUvdmlfnZ9LorYkelan+PSKTjAg3Lhr/
	pdPc+rjWodzuT8RTW+kxMVKmAL9hR7gTELCCw2JvO9hJlACS48osyHHJb1qBuUzV
	Wwg/3g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2nwpxg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 13 Mar 2025 11:41:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff78bd3026so1589736a91.1
        for <ath11k@lists.infradead.org>; Thu, 13 Mar 2025 04:41:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866103; x=1742470903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d9qoisNOG/J+QBYyjCN2S8XuP76MA1VccskcGW+lCGw=;
        b=Q4dUoSs2pr3bt8OHB1yqZkYmXr2BUOJd5TV+9bYZdhL9UHf7rxLXj8bDAbhLs4Kpgr
         aT0cs6FoO56XDFUg/qGv5HUzlUGu5MHxxKim/YplFOBqCrJQOzanVp+iiqLBDJmsiihw
         jFs6OJVeRjf54Ai+MRcU3wblBv8FWsWpPKkheFghIIN/H+6tY0/oKAj7FjbIgIKWIYDl
         WrB64ZHIL3mQERYt8FqYq4YHv8pChxtv0ndKL/mSSoLsPm7SwXO5ZM2jDoyA5RW1yFyG
         Dh7yIB5s6kbgL/oP5xw/hANaDep1Rdv2l6qQLutf/AV+PKjXXrS2DpeVFNuk4TfIB4RY
         28gw==
X-Forwarded-Encrypted: i=1; AJvYcCX0eX0Jh7AGGer6g1h153VeDVTMsGY45L0UHIgiw55sliNoBwBBCTH9Gna1DxpUVgZ/0F6+5tM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxN4t9wWuejp06ypp8NXcFIGeTr7pH41YtSx4EaW+aQlQ/s0oDE
	HBzIvAgbTPZsnBshXPYUFnywnjkLBGKPgYLtfseGGLTsYCXR0Jrj4ScQ829d/lbNBTTWNgbg92J
	gB+ZT5VPn62lwdlZ567mXX/tt2RPMMJ1Lfp4wlQE4kdhNYs1YJMTou3SJsZcV
X-Gm-Gg: ASbGncuD4xDQmlFYQTEnEZ7+FTPAmF2w2P2B8d4EngTddJmaGFIB9T3WrzkJsjUofes
	muRXHDBYnGOW6ZaQRKlde306mlk0AW3YnJChYW1vM0+OkciuopJS3zch1hoO4ZthDx+zYoI4W0M
	p9aqJ5XSzjCXCuHZWuzAV3QNBZf/tu5cbbsO9XDsiEQEDwLANFSj/XJ36wgNLP+EguDIlmjA5Sz
	9HXnw2/8Alpu4dfA4MjFjP7v4/4OvWrwu+ofzmJYMg1FgiPjxEbjFZm1FMEFRU/QbyUzr2zQHdN
	oQeSEa2t1BCknBoJEh3CzMmZx2iFySaPuh8kG3yXcPtjjiz+i7c=
X-Received: by 2002:a05:6a21:a4a:b0:1f5:769a:a4c0 with SMTP id adf61e73a8af0-1f58cb40d0fmr19674093637.22.1741866103007;
        Thu, 13 Mar 2025 04:41:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4KS059o50FJ3zNErZOLROVvjQZDc2HgJ5OaS3d/rE1XNS/o6bFbi0r6LR6J9lgfSFiRTe6g==
X-Received: by 2002:a05:6a21:a4a:b0:1f5:769a:a4c0 with SMTP id adf61e73a8af0-1f58cb40d0fmr19674070637.22.1741866102667;
        Thu, 13 Mar 2025 04:41:42 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56ea964e3sm1063219a12.76.2025.03.13.04.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:41:42 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 13 Mar 2025 17:10:17 +0530
Subject: [PATCH v2 10/10] wifi: ath11k: add support for MHI bandwidth
 scaling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-mhi_bw_up-v2-10-869ca32170bf@oss.qualcomm.com>
References: <20250313-mhi_bw_up-v2-0-869ca32170bf@oss.qualcomm.com>
In-Reply-To: <20250313-mhi_bw_up-v2-0-869ca32170bf@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        quic_pyarlaga@quicinc.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Miaoqing Pan <quic_miaoqing@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741866038; l=2735;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=UDj4phVy/DG+9hjqxt6EGxZVpcx8i+kJ4nOzNceABAI=;
 b=hqdCuLeJn0OqieMuIehjgOVSVH10bKZwuK9rz+XDm+BSXBAIpRQvbjfXjpv4/+/BYkNxW94aN
 OFUd0jheytFBkp8l/OA96dvuqcapnrWdXf6JwA+9nMflIMTRzatgsbn
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: 8OnKnnqooTbQcQQdGS2QtcHl62sj2rc7
X-Authority-Analysis: v=2.4 cv=ZObXmW7b c=1 sm=1 tr=0 ts=67d2c477 cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=PcFPl4qhhl0nOZx1bFwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 8OnKnnqooTbQcQQdGS2QtcHl62sj2rc7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_05,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_044144_500890_5B6A0B35 
X-CRM114-Status: GOOD (  14.54  )
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

From: Miaoqing Pan <quic_miaoqing@quicinc.com>

Add support for MHI bandwidth scaling, which will reduce power consumption
if WLAN operates with lower bandwidth. This feature is only enabled for
QCA6390.

Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04546-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mhi.c | 41 +++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index 6e45f464a429..74769c0993ae 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -20,6 +20,7 @@
 #define MHI_TIMEOUT_DEFAULT_MS	20000
 #define RDDM_DUMP_SIZE	0x420000
 #define MHI_CB_INVALID	0xff
+#define MHI_BW_SCALE_CHAN_DB 126
 
 static const struct mhi_channel_config ath11k_mhi_channels_qca6390[] = {
 	{
@@ -73,6 +74,17 @@ static struct mhi_event_config ath11k_mhi_events_qca6390[] = {
 		.client_managed = false,
 		.offload_channel = false,
 	},
+	{
+		.num_elements = 8,
+		.irq_moderation_ms = 0,
+		.irq = 1,
+		.mode = MHI_DB_BRST_DISABLE,
+		.data_type = MHI_ER_BW_SCALE,
+		.priority = 2,
+		.hardware_event = false,
+		.client_managed = false,
+		.offload_channel = false,
+	},
 };
 
 static const struct mhi_controller_config ath11k_mhi_config_qca6390 = {
@@ -313,6 +325,33 @@ static void ath11k_mhi_op_write_reg(struct mhi_controller *mhi_cntrl,
 	writel(val, addr);
 }
 
+static int ath11k_mhi_op_get_misc_doorbell(struct mhi_controller *mhi_cntrl,
+					   enum mhi_er_data_type type)
+{
+	if (type == MHI_ER_BW_SCALE)
+		return MHI_BW_SCALE_CHAN_DB;
+
+	return -EINVAL;
+}
+
+static int ath11k_mhi_op_bw_scale(struct mhi_controller *mhi_cntrl,
+				  struct mhi_link_info *link_info)
+{
+	enum pci_bus_speed speed = pci_lnkctl2_bus_speed(link_info->target_link_speed);
+	struct ath11k_base *ab = dev_get_drvdata(mhi_cntrl->cntrl_dev);
+	struct pci_dev *pci_dev = to_pci_dev(ab->dev);
+	struct pci_dev *pdev;
+
+	if (!pci_dev)
+		return -EINVAL;
+
+	pdev = pci_upstream_bridge(pci_dev);
+	if (!pdev)
+		return -ENODEV;
+
+	return pcie_set_target_speed(pdev, speed, true);
+}
+
 static int ath11k_mhi_read_addr_from_dt(struct mhi_controller *mhi_ctrl)
 {
 	struct device_node *np;
@@ -389,6 +428,8 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
 	mhi_ctrl->status_cb = ath11k_mhi_op_status_cb;
 	mhi_ctrl->read_reg = ath11k_mhi_op_read_reg;
 	mhi_ctrl->write_reg = ath11k_mhi_op_write_reg;
+	mhi_ctrl->bw_scale = ath11k_mhi_op_bw_scale;
+	mhi_ctrl->get_misc_doorbell = ath11k_mhi_op_get_misc_doorbell;
 
 	switch (ab->hw_rev) {
 	case ATH11K_HW_QCN9074_HW10:

-- 
2.34.1


