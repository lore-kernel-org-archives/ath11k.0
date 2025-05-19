Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4328EC54E90
	for <ath11k@archiver.kernel.org>; Mon, 19 May 2025 09:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qRVHI8/PRu42Vqh4HuSgclK2SbkQHWxggBlquWyWIxQ=; b=y1SnrZS4HdGpM/HwqzOoO+WnwW
	QJMG9guBJGtlHtAVMIqE0Hc7D4lbz1z8TmaE2ZyrehrCs51LmhUw1mU/d39waiRy+x/oM/o3vi7G3
	8OQNgfx/NezW1rVCiTa2gzFIMmgO7amC37YEk6wiHIu64I/WfdSRk5JQ6q6VnDOlSR+SCxu0V9/6N
	/KJN3V5ofl4jlN3ipS01MaZeDtoIgBG3a/dbn2oyLjZVmb1Eu/8LhMQv4rzzMrA66v/NdhRfaZ4FW
	Mlt+90x6a3/KckcsqmDZ3LqEDT4qGoTqoAgBgjCZsnyjemM4vyIf7yjqnQuus+Q6IbYw0pedXPiih
	CXHN3stg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGxEW-00000008h0I-2WwV;
	Mon, 19 May 2025 09:56:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGx2I-00000008d7I-1xf9
	for ath11k@lists.infradead.org;
	Mon, 19 May 2025 09:43:55 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54INjSbp008666
	for <ath11k@lists.infradead.org>; Mon, 19 May 2025 09:43:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qRVHI8/PRu42Vqh4HuSgclK2SbkQHWxggBlquWyWIxQ=; b=Cofpnuv/SbPbPmum
	mOg/azUhsuV9+yaOnOWWnXp43mis01mYqJ/AuFutf9LrYHERSJD6HZqK+FAIIoc+
	0dsW3IVCzIBrX4xqZEx4iwcFNvOUcUmmlUTwkCaY7KeK3vydbcj9gVFPr7LoLMMm
	8PpTb8iyq5gKfYDwoooQrOfoAcssj6cxlpjQiJlHwjP/A8TxnyJQLzJxm4VWaorP
	fR8m3uLyoh9mctfKKm0vpL+QTCElfnLatCKGL/NNDkCS8yFsEXB1Gxvfh5zghEA2
	aV9MChn3tpJsjz/mAF+Jpaw2uT05ew/JKG8UtKqVGS74hAMZEElrkd1wQZ6ZhDCm
	y4v1UA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4ku6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 19 May 2025 09:43:52 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7394792f83cso3174650b3a.3
        for <ath11k@lists.infradead.org>; Mon, 19 May 2025 02:43:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747647816; x=1748252616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qRVHI8/PRu42Vqh4HuSgclK2SbkQHWxggBlquWyWIxQ=;
        b=TcBzq1zarMQ4tykvZJgig1CQ13yPUESxEeD1RS96A/J+NGi4eFO4IrgKCSiYQ1PbWE
         D1S1b+hYcoxq7Gs6ttNLlHlzJb5MJCRRyH6eVRe7DMISgv+LowSLzZRwMIpnlUGHDDIa
         ylEPJnOCEW9rfkWj1Jv17DkrvIsBF+1nNnHIGildmxYJSXxpGmWUvMeGp6tptmQPHHpq
         bt/y/5WYGxgVPldeLQEnkDEuFvZNxbpNuiLvYp6W+287TYOouJWD7LDpKMg3CyMAmLWj
         PaT/yVn2NoK8WAAOcu68BjwBGONG7SaPDdZwpYjLFvMWXczD5xf3hSKPLOp9fgCaEveH
         hscg==
X-Forwarded-Encrypted: i=1; AJvYcCXU1V4J/yTqDFIX9J+CK+Uwi2ERS9WsR6cFnW+Kmd1Kn3XxmxKXTbSfuO7PhfSt3QBRbd92BR4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2YytL0JP7cp6b1zlXFYkPbLlxvv8ma6R0YgAheBrvGx8L9/OT
	aYPUsE7pz3N78qOYWz3griszG0rHdJ7p/pI4MDLDOVcKHkQEFFV0MPE2+ip1oftVk4hfkT9afYL
	oZsIOMIKvcTM1ugIUqDxJjYSb5wkKtznypNH5bwLFnVdCSWcgqLC39P2txb+nN7Eg
X-Gm-Gg: ASbGncv/WMyN4JlnIPjgheA+w6pqMf2BZ11VKzeTCBS4fVjJQYX0N7prFJW4SBzZmle
	9M5noCXhF/7DQN5qrSkyOFu6bs3VlS2Y4sat14c60GI+HfWT+wi57hHJ2Lz9N+DnuNBCdgeRqfQ
	3GIBPOG8NQSDv/zg5wSgWU4NRd5a+HbvkU5yog0QaLMH/hG0xl4OHLYKxFNUI+TwjibnsE0idRi
	6E3FYaz5FSUEYZPSOAmf+ogztInZXH64z4VUqje8YTW4tbpXrbE7CS7+DwmhnX/lCFE3v9NyUEH
	MXxGHMM/IjbKOgQ0I5lAxiKjz2y+93LQksgRT9G66RfuDEk=
X-Received: by 2002:a05:6a20:258e:b0:1f5:7fcb:397d with SMTP id adf61e73a8af0-2162189eedemr17085533637.16.1747647815817;
        Mon, 19 May 2025 02:43:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBn3YQuItzmOTeDJuwyBkkScPtNvgmsDQnEm68ODCFtCJxD6yFeqm20eMNewUKrXrunStz3Q==
X-Received: by 2002:a05:6a20:258e:b0:1f5:7fcb:397d with SMTP id adf61e73a8af0-2162189eedemr17085507637.16.1747647815410;
        Mon, 19 May 2025 02:43:35 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a97398f8sm5809092b3a.78.2025.05.19.02.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 02:43:35 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 19 May 2025 15:12:24 +0530
Subject: [PATCH v3 11/11] wifi: ath11k: Add support for MHI bandwidth
 scaling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-mhi_bw_up-v3-11-3acd4a17bbb5@oss.qualcomm.com>
References: <20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com>
In-Reply-To: <20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Miaoqing Pan <quic_miaoqing@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747647743; l=3170;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=iRU0Yv6S7aDJfgJ0sXHZ6i8h1thDD71OEAeHK48lWWg=;
 b=pXC6t6KaeeBZiubaUAqowVVgtQcd663spifrqVy/Jik6wxRwizcXUr66OHogqm7b7P17DWCKX
 VrPMhEfEqf+B12YjfPKGzQBoQhF857+WH09MfRydBuondK7ulCXpE33
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: igqqGYxPulP4g9-pWQjxXhXwvoFHNBuA
X-Authority-Analysis: v=2.4 cv=C4bpyRP+ c=1 sm=1 tr=0 ts=682afd58 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=262QNBeyodYRG1lUGOYA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: igqqGYxPulP4g9-pWQjxXhXwvoFHNBuA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA5MiBTYWx0ZWRfX1u7B+o3FrUzH
 e5ykf1dMU41ofPKsG3vl7KvoHTS9BJ/ZclSaW30vnrw0Wup/bzebh9LzMDAxIyZsoyarFf7ZRRx
 kC5Qj8djim7HaJ/nKKO+SeaVmromvO/55q9pm/C4oIMIKRQdJB9fAFa1+mp3SVGqMj0vkRDCHkX
 /fpGX21pcti2gYAya1y3JP9mnLHUGM180MDgRQhCerQPvyPyD0p/e20rRJ1sG8N1U0R4Jz5bNw+
 0rJe5YWVSEvNNlfzbEmQpZleryAEGPO5pfmJYQcRcvXQ+TeiATkLMbv3efzRSnMkm6pHyAxZ/Od
 GkN+oAu2u6XMwu0DfMN13nOpamHYys+T7Y81+j0TmEdYseAK/smnzKGVgZeYJU4A12ZQNL+0UVK
 QcHuXCS4C+ikBANmP2BxWxAH/Qh37KUexMN+mqATB1JdlSs+SUS7imOA3NRAzOgNoTKEchX3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_024354_629623_78BB0067 
X-CRM114-Status: GOOD (  15.66  )
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

Bandwidth scaling is initiated by the endpoint firmware based upon the
bandwidth requirements, if there is high bandwidth data endpoint requests
for higher data rates or if there is less bandwidth they request for lower
data rates to reduce power. Endpoint initiates this through MHI protocol.

Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04546-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1

Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/mhi.c | 41 +++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index fc77eac83e953148b96cad096d26b32222157b24..8057031d654d794f9e882a975f99083c193e492c 100644
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


