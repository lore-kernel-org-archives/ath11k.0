Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3A8C44514
	for <ath11k@archiver.kernel.org>; Thu, 16 Jul 2026 20:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LJYuXI+l3H92FDVQZkdHpwi60M9fwa1cK5EJ/lFjmIA=; b=SK/TwhfIMT2wAOlkFUp/ONfrBU
	o2kRxgxz/xtgGPtMwzUTwkiKPizCOtkt5OVOkRTWcM+Cqyru7kv416mDR0XaRs6LagpdArLhJ7lsE
	FJCSvCsTTmp9tNOu/NxJ6SpJd54ugCh1boA4N3d1MZknwviIwOpByoWaJNdex7d+fTImqyDiq/G7k
	V7l7jmmWiFbo4mGfaTV7jgxq0VO0BsBrmUBHzvlhrKSTcIoAMIZQYa5Myp/VkRXE92NVcNACyFORt
	nc541ve7c5408D2pfJ+c6Q9MZn0zT/SG/R5CI/bBl+Of18lWFF4MK95vdUfFM9Uo8dEVAoo9GoF0F
	7iPThxWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkSH6-00000000UlK-3MVR;
	Thu, 16 Jul 2026 20:01:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkSH4-00000000Ukc-05d0
	for ath11k@lists.infradead.org;
	Thu, 16 Jul 2026 20:01:39 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GJom6G3627126
	for <ath11k@lists.infradead.org>; Thu, 16 Jul 2026 20:01:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LJYuXI+l3H92FDVQZkdHpw
	i60M9fwa1cK5EJ/lFjmIA=; b=RCABxmpkxGxT2TEx6LfSYotaaCzJolgaG/ZtKL
	GcyYmgHfQH/8Eb+JJCpL+Cqr6M57URfwVO0a08ECyVjLuurLNOz7MmKwoNnlE8/f
	sOUAxGbO7Q+CF6uCSnVe6WUcA2l3O9M8HP+Jw/YXSi3Oach+sZ6KFsDLAuSH1smV
	M6qJ+kQE2DGLuKhsaV1gZuOjV3JVUwtFk/auIDf7ZcKWV/wr5oALnyDTEjSB1Ks+
	jYVEiBdYgJeWTl1ecNg6cAZWmLNCO0vZFPFp6+z/2nOkCOSPBZ3WR7S7OlE6OkNG
	DoU2eReRsuHmUMbPqyFqYv5+OiKdnU6/iFxr+WnQoajgPkEw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fevkv2sn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 16 Jul 2026 20:01:36 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso16602950a12.3
        for <ath11k@lists.infradead.org>; Thu, 16 Jul 2026 13:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784232096; x=1784836896; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LJYuXI+l3H92FDVQZkdHpwi60M9fwa1cK5EJ/lFjmIA=;
        b=Vnq/avgH3iFtnT9ngG7ObGRPUoHew2d8BM/S5s+vx36aUhl6xvc1jLEuezjYNe+9ge
         N7FGb9LcrufhaFO7jRQ7G2DLV/F3T5ACdQXQm73xLUo5MR9FlVGGii1sEXg0UcOwx4XP
         HWiuunquapCpFEGM/CDwtm3eA32SpKIDb9cRfeUpvEK54wvJlPCaGe8Ki0uV2b/ztQDn
         9PBcE9U0fwivjsSabfgt3JSpy3ELEycDBfqyDURH06/BTLIa5sltxeOh1d9+qlzcV/ed
         E0VVfiNe+qpSfmxKavPiCyH5kf5H2D618YMV0idofnFitYWArv33ALeaEWYIk8dOaVip
         vwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784232096; x=1784836896;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LJYuXI+l3H92FDVQZkdHpwi60M9fwa1cK5EJ/lFjmIA=;
        b=O7ed+B7PuOWNVNcB6uLkD0Km6LiLaF7Xm4eQAQfeuAjL+YjEO7qGDrhSiVRMdyxKRO
         MG3kY1ARz7ZdRyG4zKv7ZvAWuTBtLjqZDGeGXrcusnuAo5wsr1prI6RWZKrpl3AyILi7
         01c90ue8I/ua+L/yxVmXpYoRiklsqGLbW5g15mo3SWKWOJcF2VtnWcraLJwtNyw/YuIv
         +RbKnMVaDMQCaDBbYL4l71UmJiliR8f6ijxYUfqpR2HsfvEyJBw73nTbAgdPt+1F6c0P
         iXrHcnU3WIfYFneoUPTkbIX0qs1zuCldzDmY5LJ+Iu+PKinwhLVkn2ERdZUD+Q54/Gny
         8lnw==
X-Forwarded-Encrypted: i=1; AHgh+Rr2xv8gY6y5Q6YrYFaGXgHX8JXjrng0s5Cf7fWK8yFrCcUx8Xadtp4LEIc5mXaC6Id9u/3Ft/I=@lists.infradead.org
X-Gm-Message-State: AOJu0YwXKDEk//P6CrqAgaQDEt0Ih/o8Kko4FAOdHW5MGNFtlqwFRGN2
	sIeVret8rFRsRE8GA9MoiwU9djh9G9xZyRmgLKapzD0HlF6+9AndOEwL7V40K4cLUnmUbdcQklh
	Hvg0iTHcd28zar7S3Zt6KHz9SaZ4Lm+lnfcIl2kVPdW4ytZ+j1eLp4l/NT6jpvt52
X-Gm-Gg: AfdE7cntg1K10A5AJI38zlgKzotloA6LQ23A59nrET/3adclLF3tI10TQNRW/ApL70/
	k81DeNJpyNtc+9cLNNcQB+z1QR5azJ5yFPiNvMKVfxgLKvBhcKuhxHrxgC1RBhSQsC7rwo/Qz+i
	hnRHdUBzh8/XXkbjX4wU66XPPrTT9+BP21uQ+P5Z3kw+jKQ0ySVbs0uqkx+S4k/ZN/MFw84fAql
	Yd9b1v57NXZlMDtc1XM2fZR9BvHIlnrRgQN+zamZsFpSeP4i+AQip4qbdQ17MZ/n2k0phWusU8n
	SZVFJKzsbL5e9eUMpTq8mlBz6sIrvRBlOKAVplBZE5T33+73XrIdILoH5nKRgg9wvzefWtM+5T4
	cVueUFMbApb5+WvI6Rw6i9QdZemcBK2K2cbmXSKsX0H2rHIGHRU8QFZ4=
X-Received: by 2002:a05:6a21:4882:b0:3c3:7cf0:3874 with SMTP id adf61e73a8af0-3c37cf06741mr6718742637.7.1784232095452;
        Thu, 16 Jul 2026 13:01:35 -0700 (PDT)
X-Received: by 2002:a05:6a21:4882:b0:3c3:7cf0:3874 with SMTP id adf61e73a8af0-3c37cf06741mr6718708637.7.1784232094986;
        Thu, 16 Jul 2026 13:01:34 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6ec32bsm11998196eec.29.2026.07.16.13.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 13:01:34 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 13:01:31 -0700
Subject: [PATCH ath-next] wifi: ath11k: Avoid buffer overread in
 ath11k_wmi_tlv_op_rx()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-ath11k_wmi_tlv_op_rx-overread-v1-1-0b972b3f1368@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJo4WWoC/42NUQ6CMBBEr0L225IuFjB+eQ9DmgqLbBSKba0Yw
 t1tOIE/k0xe5s0KnhyTh3O2gqPInu2UCh4yaAcz3UlwlzoUsqhkjaUwYUB86M/IOjyjtrN2i7C
 RnCPTCUKpjDRl1aKE5Jgd9bzs/iukqZhoCdAkMrAP1n3344g7//MjokChZHEzvTrW6oQX633+e
 ptna8cxTwHNtm0/+YW1edsAAAA=
X-Change-ID: 20260715-ath11k_wmi_tlv_op_rx-overread-e104a0a56c10
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDIwNCBTYWx0ZWRfX2PsI2YuI6NUO
 PAzythZihX86aVKScoYVpzoEXdMwl3u01PuzoXorGCAL6/0Jx30fvys8UUzpVJW5230HuxTdx+R
 V9nPkLWyW3G4nR5sA2K5P8YEs3IPVSdLlhigY47ZOF7ypXPRBTmSK/IgNNSF2wNK00ucEE3+6RD
 w+b+xYZVP8nlS5WJN8749E5xSzn86faXe0F8AS+nS+SUOLx6IwJ+grZIlaECjVSOPRVaqwmcRiQ
 9t2Kt6PPdayK45GdlithdvaYrzpOAwCX3gFL7clUffxouqT9IqMMxVfVrWksEvEBEPMJMpEs8+y
 x1I7lvD5/eyse9JrrcHHcQ3uwHM1jCqCD050Ubc4YBOlGaTsNGRC+pE0ih9axntCkEWqL64LuqG
 aKIHPeYT3TkCk0EeFvNyUprNTJlYTubd+S0jqu+1sG+lEepd/lUVg7kX7O58cSA3QYXmixvT3lJ
 L6HeFGpuJhmeAnl8PYg==
X-Authority-Analysis: v=2.4 cv=WrEb99fv c=1 sm=1 tr=0 ts=6a5938a0 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Tx--mz5Y_93-EySAq90A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: UMBebHVA_jsdq3f9T3uwT2eELxf2mnYq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDIwNCBTYWx0ZWRfX0SsN9sp/WDVY
 kYrce2aor1OxoKr4hNCICrJGG1R+z4MsyOjJwDeJyZP5BFuB7Qr2jxAeowdGprjhtxqd6mPxxmH
 wk5NJrpj747kovpcF4qohbYnZ7lbr/k=
X-Proofpoint-ORIG-GUID: UMBebHVA_jsdq3f9T3uwT2eELxf2mnYq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_07,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_130138_186583_288E1001 
X-CRM114-Status: GOOD (  13.19  )
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

Currently, in ath11k_wmi_tlv_op_rx(), the firmware buffer is read
without first verifying that the buffer has enough data to hold a
header. This could result in a buffer overread.

Add an upfront length check before dereferencing skb->data as a
wmi_cmd_hdr. The check is placed before the trace_ath11k_wmi_event()
call to preserve the existing trace semantics (tracing the full raw
WMI event including the header), unlike the analogous ath12k fix which
could use skb_pull_data() directly.

Compile tested only.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index dca6e011cc40..b10f0054c81e 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -8895,13 +8895,15 @@ static void ath11k_wmi_tlv_op_rx(struct ath11k_base *ab, struct sk_buff *skb)
 	struct wmi_cmd_hdr *cmd_hdr;
 	enum wmi_tlv_event_id id;
 
+	if (skb->len < sizeof(*cmd_hdr))
+		goto out;
+
 	cmd_hdr = (struct wmi_cmd_hdr *)skb->data;
 	id = FIELD_GET(WMI_CMD_HDR_CMD_ID, (cmd_hdr->cmd_id));
 
 	trace_ath11k_wmi_event(ab, id, skb->data, skb->len);
 
-	if (skb_pull(skb, sizeof(struct wmi_cmd_hdr)) == NULL)
-		goto out;
+	skb_pull(skb, sizeof(*cmd_hdr));
 
 	switch (id) {
 		/* Process all the WMI events here */

---
base-commit: 0ceb105245b5e57f803bdc0e79dc077fc06ff384
change-id: 20260715-ath11k_wmi_tlv_op_rx-overread-e104a0a56c10


