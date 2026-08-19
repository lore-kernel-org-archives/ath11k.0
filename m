Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BE6C5DF86
	for <ath11k@archiver.kernel.org>; Wed, 19 Aug 2026 13:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Whq1lvHGKENYAxLuORynt92vSwisujF7CNlKCmDhdoo=; b=J2eQB8dQpHdZ8MwTo5e/CcIC6H
	EBUiNS+cAKt+Ek74wS1oBaWHryO06Hs3jKZ5ep+dkgGtrOFqgYMMORQ+cqbRg04mtv+JgF4tFEegp
	1wtxpeUOC4uTU7VqCc1Cq/6tYFwGoq5/FVP8VWCMo8Msq0Qh1YpnifB/r6SKbmuizVK00ijDCZ3Ys
	V/2lKe7CSrvbVKmrg0sABqAP/ZzdAwkKvpf9MhE+GkME9WEYmTo08ZGMpT0WdQxrCXBIm0Q/Cant4
	GQvQc5P+B6tT1CGhZGORFlFm/ws13C0KO3mOr0YvwJ+HOydnuvWdvw2YXqNG7vQz6xEX1njjLqtx3
	R+hJwKeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwgJf-00000009rwA-1bj8;
	Wed, 19 Aug 2026 13:26:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwgJc-00000009ruV-2ogn
	for ath11k@lists.infradead.org;
	Wed, 19 Aug 2026 13:26:49 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JD0BkQ901357
	for <ath11k@lists.infradead.org>; Wed, 19 Aug 2026 13:26:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Whq1lvHGKENYAxLuORynt92vSwisujF7CNlKCmDhdoo=; b=JdaZdzlKmRVUxQc8
	oDoG2hB6bAgifxfZdD7ZWfa3Pz97kRCLmhgy4VFqOV36nXQBkmGY2hGsOlimrdrP
	m0T5p+n/OoHlLtggrIa6T/TRBDRuOvOAcp7qud580ZmlXlqBwoHyjrh6Xex2LexF
	tW7ykD3VXXP83p9rpzVsg2k1Zw7gtmPZLibteXFY6gSqcipk+BcD7YWeM7GzhLnF
	PFFlDRvzKpKdAwfdvlWc1Y8r14FS811dBnj9Rv9EdLCSJJqLpafPgR4kuo/dTBb4
	RafqeUWOHUKDvUXsz529nRRY4SxOnCWbgR+jq2/DrXwz4x8oLOtgnqK7iyeLPKmW
	AWFY/w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfpubwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 19 Aug 2026 13:26:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e22137fb3so1905851a91.0
        for <ath11k@lists.infradead.org>; Wed, 19 Aug 2026 06:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787146007; x=1787750807; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Whq1lvHGKENYAxLuORynt92vSwisujF7CNlKCmDhdoo=;
        b=YmB1GNSm/gRlV5vQiCEMwXlG/n1Nq3abU5VhXjQy4bvPrE3L2ZGn55N2aCKg7JJOo3
         NpMDa4ceRDCuB0W87Ew491HcWnXl2bKQcj/7tcZpspGzxsmBqnUOWugZdt3bIAQWjG4G
         jtdSQg9UawrqeEtXa0JilJFM0NyfE6T5EnTkgNaKELPGY/52EuFpShYlQG9TAGITat8H
         +8uCEmX5JPZiaXCPqQd76p1ldSS4I5bdIHNQyJ0Q1fe0R5jwqF9RUH+Ika9fk0qtoSEf
         6+yzwfKKfF86bOS66vBwwmLfKMXGu4cBLi7qWyAtVVDtUxWByQsoAkjutRXOw5Ki2x2X
         u1uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787146007; x=1787750807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Whq1lvHGKENYAxLuORynt92vSwisujF7CNlKCmDhdoo=;
        b=qOsM8Xq26pUv/LSdeu4g5ZZFXeRp9KELW8EHz6ZalEFcv/yRBnnsx+JNBap23/y9/a
         cU8mOdkjD3RLFAGjwhVZUc3L0nYLdMJXw/AN1utw8i/iyhEwAzeN7pU2DiPMHX1GleTz
         4z2vCOniGgEm8NuQNhEqdCpl1NMAuNPf2tZ0YbEwhkikuPh1Q9qDyAQw3a3KTmP7tNIP
         9Z7dEH6o3+XTN0BMvTEIAo++pQbsTkONEGqWqhcTojhubHPt631UB8oonKjfHwoxwEI+
         LDpPZqQq96z1zBOY1CahVK5+kC3z5oPg0VREblkcoEsl2+Oji9c2vL3AUvj4Ga5n11o4
         iqGQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq2pwNXS3fscy1KKZiC8meNdasfXCLBrmtiu7xgMB0RoU4REefZZt08LOb7l4/htjhNTCaTovs=@lists.infradead.org
X-Gm-Message-State: AFuF++mMDFufNu4Ar5lk2wX+UEMIyD+Zp9UG9pMyZ0je/jzrI975nkqs
	K9w0o83emrypIOmB3dckJ0Pw9YRVqNYKZFBOM2QdQeMCTA/FT0F0T6LdhiohlmNPArKDGG1szwt
	Tm4fPzVjP2Eo+CCAkc/pQSzpzYKb29riCOb+FaWKpqLN/TV2RV73j5WSK68vKHAua
X-Gm-Gg: AR+sD1241njGFfbUwaFP4bRoT7Py0sDpQZxHHjU1n5YmpCol3BgjjO9nQkkJK6PGJ3F
	4B6gM9TKl0mZPxwh7MINmhfywOmfUaYOt4FxrzuPTNxljkckw8Oqn+biHVhfJYbotUPgvGdewb5
	dofjYHk3/bZYIuN4AxClN3d0BtS/JV+veVTr0jyO5XOY6Q2JceUx7bKU4JzuTTQMWViwOIKHJb3
	r0G+MM8+SrEGhix/xcrZrtb3Gsi/kVxufP5NITBV5jbQioOOVSkvtTIv2mRqlGo+/C8R354D0/Q
	yQTdwz54NrZjc5klDvapo+agyvrDnlhbc1ZtnLlZzg4Cksu8Nw7WoxJKnu7r24KzUr/wqhTud6x
	KXZYrGiu8rNv3t2LrVH4M2kapr/3/WQA3Ebw=
X-Received: by 2002:a17:90b:544f:b0:381:152b:d596 with SMTP id 98e67ed59e1d1-3958108a4b0mr8964624a91.11.1787146007289;
        Wed, 19 Aug 2026 06:26:47 -0700 (PDT)
X-Received: by 2002:a17:90b:544f:b0:381:152b:d596 with SMTP id 98e67ed59e1d1-3958108a4b0mr8964492a91.11.1787146006768;
        Wed, 19 Aug 2026 06:26:46 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327c2a92406sm6126465eec.11.2026.08.19.06.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 06:26:46 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:55:56 +0530
Subject: [PATCH v5 5/6] wifi: ath11k: Add support for MHI bandwidth scaling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-bwscale-v5-5-6dea79786b37@oss.qualcomm.com>
References: <20260819-bwscale-v5-0-6dea79786b37@oss.qualcomm.com>
In-Reply-To: <20260819-bwscale-v5-0-6dea79786b37@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Miaoqing Pan <quic_miaoqing@quicinc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787145973; l=3078;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Wrtck8GXON4XPaYha2Uzh6nxCEmpOddneb93cQLxgLo=;
 b=cSBT2URPwVrqsDuy5hGWyBdZp1hI/lSkcFAI5vkjPChdqQ+eyTWSwxSKthBc4kuovh0RtguJ0
 tsFFUp5Qw5zDY6l0/yEEIi3zTQhV/bG++sSU3KrykPB1Nj4wLSR66MY
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: PpXZYOOlf6kL4bUp2gLhjgr87yG6hx_8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwNCBTYWx0ZWRfX5vd3aLCIWKyZ
 llrbERMgZYZZThaeSOl0tS3oJrBGoXlmZygL8rWnzipVAaQoGGwuBm9d/ciA+UGuOo3ejsW+D3C
 3Hhc0yq+Vldwq5QFbsQe0A9RMBUtAPmzcFco7S/YM5kl0nGmBfToeEhbHMUufq+M+8au7YYtyyp
 fEXikm9xsVpHGBgG5tuipOH2fyAdzlixi9PrrAJkl1JJ1EzE05T1ucbeKZh4CcibAiyWLkgYTDt
 y/+tSfYvLIpgBV+vxOUtOEBtAqD5uqAH4bz8ercCyRNFJtZgMxRYZ39caLfyne2h9ksZVEVwGSJ
 crkCEqIwLV9iqFhgY6dkC3JKV5FMv/KAXEjICzy94lwkVGKmcbG0auiQfadBPTlazceRK6ky2Qy
 Hswgz7rtnWl39Ac8qBa4DajpPJYgAeEIZmuJZGlSulXXerAZEradkCbMMieCgaZNqB0DRSxw7SO
 v5dWKZkJERlDzCF9heQ==
X-Authority-Analysis: v=2.4 cv=aMrAb79m c=1 sm=1 tr=0 ts=6a85af18 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=262QNBeyodYRG1lUGOYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: PpXZYOOlf6kL4bUp2gLhjgr87yG6hx_8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwNCBTYWx0ZWRfX2RFTu15wHUSI
 Wyyx6OFwLvWO0ZqfSgsgvPWVKAOoga7k7HY/p0kbtRMRk4iRGP0MLSbbCYqH1Zxmj84hc59JX1l
 uYaVTUMczkdKpe0L3E278YoqjyBYb4Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_062648_725345_6D073379 
X-CRM114-Status: GOOD (  14.03  )
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
 drivers/net/wireless/ath/ath11k/mhi.c | 38 +++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index a6c9ff112c68..9bff4c4bca3b 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -20,6 +20,7 @@
 #define MHI_TIMEOUT_DEFAULT_MS	20000
 #define RDDM_DUMP_SIZE	0x420000
 #define MHI_CB_INVALID	0xff
+#define MHI_BW_SCALE_CHAN_DB 126
 
 static const struct mhi_channel_config ath11k_mhi_channels_qca6390[] = {
 	{
@@ -71,6 +72,17 @@ static struct mhi_event_config ath11k_mhi_events_qca6390[] = {
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
@@ -311,6 +323,30 @@ static void ath11k_mhi_op_write_reg(struct mhi_controller *mhi_cntrl,
 	writel(val, addr);
 }
 
+static int ath11k_mhi_op_get_misc_doorbell(struct mhi_controller *mhi_cntrl,
+					   enum mhi_er_data_type type)
+{
+	if (type == MHI_ER_BW_SCALE)
+		return MHI_BW_SCALE_CHAN_DB;
+
+	return -EOPNOTSUPP;
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
@@ -387,6 +423,8 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
 	mhi_ctrl->status_cb = ath11k_mhi_op_status_cb;
 	mhi_ctrl->read_reg = ath11k_mhi_op_read_reg;
 	mhi_ctrl->write_reg = ath11k_mhi_op_write_reg;
+	mhi_ctrl->bw_scale = ath11k_mhi_op_bw_scale;
+	mhi_ctrl->get_misc_doorbell = ath11k_mhi_op_get_misc_doorbell;
 
 	switch (ab->hw_rev) {
 	case ATH11K_HW_QCN9074_HW10:

-- 
2.34.1


