Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0044DC531F9
	for <ath11k@archiver.kernel.org>; Fri, 24 Jul 2026 01:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u8vVF6hHkGu1xxeXQmSUf7FgyLwedcYDTnsRmaxHtcc=; b=BdmUVF7FABTOreKGOqsW9N5AoG
	Ca/IMyuiGlWh0FarPz3KI4gC5TKxfdEoJvRGaI1Gi8vmOFjhU54HSEu0r/ARmqBHhtdTV0C0vI+rU
	Va7/2e3+EvENJtEjyOnGxZmkFtPoxsyjAHOEECCZrvHMY15RnoEtgB5WZJlv6p5M1TX3QhvwuDz9O
	SSu/c1aNUPLXBoTSNhx7NavGFKp8+1ay1B3XI53qLDaAtr9MxuZAw+zvfIrq9f7+VaZlxVwQbESyB
	gcczfz0LALpxp+ivrnE9r77hs7opTLF4u4ZQcQ+M3upOKo3LmEvsuehKktSDUkCWRpxzeaXQAawbx
	DXCDHNcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn4lF-0000000FLB1-2Cny;
	Fri, 24 Jul 2026 01:31:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn4lC-0000000FL9B-0oHG
	for ath11k@lists.infradead.org;
	Fri, 24 Jul 2026 01:31:35 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NLeFE91216977
	for <ath11k@lists.infradead.org>; Fri, 24 Jul 2026 01:31:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u8vVF6hHkGu1xxeXQmSUf7FgyLwedcYDTnsRmaxHtcc=; b=QCvoq+QgAd28XEsF
	1bijWBEel5NOwmESsCpjNRWLADJHd1iuAZHYFPdDPqYDyy1L0i2bx1Bn0cP9K0QS
	EP3rQZ9vp/q3hrmivt/a+2WWWhU7iBbCjRGLloHmaiVJPAB5RnOzjCcRZqQFVGW9
	P9q+LAB6Z0fLHZx33ocysxm9p6R3L6IqLp+bfFLeVuZWLD7uB/kTZv/4qzA1TMWE
	Na65oAHTZ9ywMSLJFENXXgsV1Ac/ZcDX7ff+LVszhkgUuIbWF3ItMmczCeEYGyQU
	eGxfjDW5PkoNlgqJKz/scDslDCt3s98qHnE/e1ut5hiHa1IMUc+kpHLRpOfKazW+
	nlOP/w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa19hnj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 24 Jul 2026 01:31:33 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb7049fa552so1021565a12.2
        for <ath11k@lists.infradead.org>; Thu, 23 Jul 2026 18:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784856693; x=1785461493; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u8vVF6hHkGu1xxeXQmSUf7FgyLwedcYDTnsRmaxHtcc=;
        b=GqtsLKFFaxOrVeY1X+t0LzjSIy0UOMomojXzXxlaQ/YRR+WwJK7clnswBVw7uw7lxd
         hl6JCLJyV7rrXSFLtzZV7WdQgatfjvgeQ2MU5WBZQp3Q855hy9QqlFYWNJ1/uOd9tEvv
         IsHxRjJn3fY1Thh+PaSp2ExqvKQ9MxS6QknyS9xaLiwfN+mgi1gADnYx0RBHWyUL6QTh
         t1fpUbPNZfvfu/JuQn1a4m0kX5OqTuqxjUBby9d62OLs/WpGxL2ftcAVYggQA4v6ExiY
         ntAGUTPQLk5wm7KhNgkXnxjKpEr3l4AWba4DwqCLHA5vcaEYx4nWQO+M8bBJ/GR07aUd
         KvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784856693; x=1785461493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u8vVF6hHkGu1xxeXQmSUf7FgyLwedcYDTnsRmaxHtcc=;
        b=V6RRXTsL0xWBtBChuPZaVGngsecs2pfboqYV1RC3PfnDdkpLzK0V72PONjRxqmIcC3
         og3giL+7+cVrG5VlEUTrNgrc8LhpG+2MFX1I+EyvCxakXpOSWnLySj0FvAtYwjK7+tHu
         miA/FLl9dFmViJjrgLK8vJhlbziu2XSPXOy9+CYyPZTNuuEKOxlCtnb11aoLq0krkiXo
         sFNylAoGh/snjID8WhU/9vVMvoVji5krKieHcG+KKQ/RN1g1qGQVGAs/jdeDXQYXI6aT
         C8GwjYoMphQ1+aPZFwValxeX7WvNNmPvbXn31+cRCpPn+roVCp/wmdoYvU+IUfBsYPdu
         H1tA==
X-Forwarded-Encrypted: i=1; AHgh+RqW0hM3wNqQbzvZDSY9/CQKIV84/TdroLWNDdGqgd6dxyoJF8DI3Ud4FeH3TfRO6gXaW+JWhHU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5w1YjfDLnUVJgdclynFI+1brEXTPy3WQK2XcFEZ0vyQCE+2Vm
	kp+EkWDAxAddPNLK1XHgNemu9jUgoKYSC1Unn799gCyVdvMM+rIxHw5x+g7CzlMfCJei4rpt6zp
	gnE6r3OMFgYPYm1gLDHXDkGkB/ojb65EikBhtvaWlpXwZSE4dqAovUiQSGIIuAFtW
X-Gm-Gg: AR+sD108k7kUQATN1dhg0Rg3YAKytSlJjNcPJAtauhldr/2KFvk4BcNzoSkZ2S/D3Dc
	13rwo3X4A8uM410NS8lUcN0WiT3x/HrQkzmn6w2cNAjVJ+2Gg2b8TFTYfVyIkF3KIcGd2xOqPMj
	kqkekmz6uwjwtui1fDP6qHtKeCFfZVQri3oozYuK1lWhF3Lsjn2IOJLamuAbhJ2yA3vWHe+fRRM
	27BJtN0sN7tdjF666LXL568SwfhG8OdYOn+MMiZLHdGH7aF3lq3UqEfEkk4t+14Qqcp6OcPa51Y
	6MW8AcAmRKtqInWLhzw6STOm6iJQU1OpW3kZYdxntG1dKYChj+US2KvL9UYj28pwSGZ0P0uqNYC
	sYez4yqOn+/yMQ7ACg91xJeb/pyfKqRLCDDnDNfdOip5VHcnTD+b04FI=
X-Received: by 2002:a05:6a21:9182:b0:3c3:9df0:2d66 with SMTP id adf61e73a8af0-3c44afcf8bcmr6254462637.6.1784856692680;
        Thu, 23 Jul 2026 18:31:32 -0700 (PDT)
X-Received: by 2002:a05:6a21:9182:b0:3c3:9df0:2d66 with SMTP id adf61e73a8af0-3c44afcf8bcmr6254435637.6.1784856692249;
        Thu, 23 Jul 2026 18:31:32 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147df0ba0asm22655306eec.18.2026.07.23.18.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 18:31:31 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 18:31:25 -0700
Subject: [PATCH ath-next 2/2] wifi: ath11k: fix overreads in
 ath11k_wmi_process_csa_switch_count_event()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-ath12k_wmi_process_csa_switch_count_event-cleanup-v1-2-c01ef10bc6a3@oss.qualcomm.com>
References: <20260723-ath12k_wmi_process_csa_switch_count_event-cleanup-v1-0-c01ef10bc6a3@oss.qualcomm.com>
In-Reply-To: <20260723-ath12k_wmi_process_csa_switch_count_event-cleanup-v1-0-c01ef10bc6a3@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: tHsHXSM9B1DAlwVZdaBGMU3l0daCMY1W
X-Authority-Analysis: v=2.4 cv=L4wtheT8 c=1 sm=1 tr=0 ts=6a62c075 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=hOGj4-57aE1FpqoUBq4A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDAxMiBTYWx0ZWRfXzo5anrTBI36J
 pLGkJaTCq0XZ1fohv0Sq3AXcecbSboGr9hjLnsehBb4gOqNft3NY/iezvFOIRCW/DxHI2eqKJx5
 Pknd8NnHYTFqpfIiKfO73amhxSQrYS4/YbbtGpADqMFPIVp6sd7UTAWPca6/NGWoTJNsLdFvGdW
 i5M0uflMw4ICsjA7kT5V90fa0ZG8hivP93UtmnHu00GQcW9X8IKNqKcXuMzTD0WS08oY80GuMPA
 Y5SBoCOzdPQsE/QN4JiivTdrwcgzMf2rX0Hv575zaC8Hbgb2X+OOCzqMA3BxIzxDhGsEYoUGnpA
 IMmvhL/PifYj0bL+/A8IfNwU9OsCAzB1zZXI6QeEFqCyjtbkQ3qq4/VHtb8CWnB7PZlmuU0azqR
 l70ZBQCCqS03SMPpYxZIOVacctuUbFd3mFmb1iL+qTzy6SHJyT7sSwbzjDNc2nz/9T+ONdPCqKY
 X8N0mZpO3Gxmy5T3+zA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDAxMiBTYWx0ZWRfXy2BIedaC0oCY
 4Ufyl/isSO+8Vqif5yNbHhBoxRNwA0KEUmjvcZeuXPxQ/o+Io4jwKY5arpmFQvZG1nvI6nByWE/
 LxL1BEhCIicGyE5JEsBI7kRApHXOj/Y=
X-Proofpoint-GUID: tHsHXSM9B1DAlwVZdaBGMU3l0daCMY1W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_07,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_183134_239981_F1BD1975 
X-CRM114-Status: GOOD (  17.03  )
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

There is no policy entry for WMI_TAG_PDEV_CSA_SWITCH_COUNT_STATUS_EVENT, so
the parse infrastructure does not enforce a minimum length for the event
struct. Additionally, the num_vdevs field is taken directly from firmware
and used as a loop bound over the vdev_ids array without checking that it
fits within the TLV payload. Either condition can cause an out-of-bounds
read.

Add a TLV policy entry for WMI_TAG_PDEV_CSA_SWITCH_COUNT_STATUS_EVENT so
the parse infrastructure enforces a minimum length for the fixed-size event
struct. Add a helper ath11k_wmi_tlv_data_len() to recover the payload
length of a parsed TLV from the header preceding its data pointer. Use it
in ath11k_wmi_process_csa_switch_count_event() to bound num_vdevs before
the loop.

Compile tested only.

Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index dca6e011cc40..feb0a0b29c81 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -159,6 +159,8 @@ static const struct wmi_tlv_policy wmi_tlv_policies[] = {
 		.min_len = sizeof(struct ath11k_wmi_p2p_noa_info) },
 	[WMI_TAG_P2P_NOA_EVENT] = {
 		.min_len = sizeof(struct wmi_p2p_noa_event) },
+	[WMI_TAG_PDEV_CSA_SWITCH_COUNT_STATUS_EVENT] = {
+		.min_len = sizeof(struct wmi_pdev_csa_switch_ev) },
 };
 
 #define PRIMAP(_hw_mode_) \
@@ -262,6 +264,13 @@ const void **ath11k_wmi_tlv_parse_alloc(struct ath11k_base *ab,
 	return tb;
 }
 
+static u32 ath11k_wmi_tlv_data_len(const void *data)
+{
+	const struct wmi_tlv *tlv = (const struct wmi_tlv *)data - 1;
+
+	return FIELD_GET(WMI_TLV_LEN, tlv->header);
+}
+
 static int ath11k_wmi_cmd_send_nowait(struct ath11k_pdev_wmi *wmi, struct sk_buff *skb,
 				      u32 cmd_id)
 {
@@ -8353,15 +8362,23 @@ ath11k_wmi_process_csa_switch_count_event(struct ath11k_base *ab,
 					  const struct wmi_pdev_csa_switch_ev *ev,
 					  const u32 *vdev_ids)
 {
-	int i;
+	u32 vdev_ids_len = ath11k_wmi_tlv_data_len(vdev_ids);
+	u32 num_vdevs = ev->num_vdevs;
 	struct ath11k_vif *arvif;
+	int i;
 
 	/* Finish CSA once the switch count becomes NULL */
 	if (ev->current_switch_count)
 		return;
 
+	if (num_vdevs > vdev_ids_len / sizeof(*vdev_ids)) {
+		ath11k_warn(ab, "csa switch count num_vdevs %u exceeds tlv array length %u\n",
+			    num_vdevs, vdev_ids_len);
+		return;
+	}
+
 	rcu_read_lock();
-	for (i = 0; i < ev->num_vdevs; i++) {
+	for (i = 0; i < num_vdevs; i++) {
 		arvif = ath11k_mac_get_arvif_by_vdev_id(ab, vdev_ids[i]);
 
 		if (!arvif) {

-- 
2.43.0


