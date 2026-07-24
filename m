Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F11C53216
	for <ath11k@archiver.kernel.org>; Fri, 24 Jul 2026 15:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SRwsegGQKk4SAG9Z4lzF8xh53Y8v5nzSjwOE25DwPT4=; b=kIh/QgGGxRfSejkGS28wdztpbi
	pjj0VKCf6s+AfQ84ZMyBhawgNpPwHJX4Z0Zetks5r8+iZQlmVFyI9GqPOLqizacT48QXD0fj0sjl8
	32U19wUM5gNG1Hdr/vFW4LBONe8k06J5/sMeMiNeVkg7vyIjNOcXuZjIQf2Xa1ytkbR1fHc1nP8e8
	ztwbZVb4Rq/t1d8LAWh3fXM2vgW/JN83Aofq7W9GsYGN99Pqv+aYH/cwd0owb43NdqwqXwbDPlpt/
	fR45Es9KKvLdKwAYcb3e/m9yyxwYhPccIY+YA6/9fEnhuztDzaY5+asmxN6CyGZNXprJ7yNHl2odt
	ann+b9dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIGB-0000000Glgn-1Zhd;
	Fri, 24 Jul 2026 15:56:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIGA-0000000Glfd-0CZj
	for ath11k@bombadil.infradead.org;
	Fri, 24 Jul 2026 15:56:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=SRwsegGQKk4SAG9Z4lzF8xh53Y8v5nzSjwOE25DwPT4=; b=SWMRNUa1Hl23Blrb0OtG8DFO6f
	9dOo0ajljsF5ZUDZG21Z5pQ/ycYEFUgPU2Rsy9w9WB0EO6Sod/xAdXcCrP+z7qBo2dWQUfh9IVDli
	+TwmfCMTnP1sAO1HyhW3uxL5Q+BTXxPs22614/YvSJ8l1w6sA4h5jiLOS69MgGrDCKGwLuiLg7JGA
	jOJiPkJeIS/yX7CKRc3sYujhla6XrPtlLtnRMo9x9970OKVSNfsrHBbLmPXBw6KbpueX/XcOdPrEe
	HdNun3wNwAdzppbYH9qiMcGPma5nmHr3JSuL0FbZvTJOvkJVBhq0kJxc3Jkw5x1JrwGeKZylEbsMP
	xg9e952Q==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wnIG6-00000002jYQ-3ov6
	for ath11k@lists.infradead.org;
	Fri, 24 Jul 2026 15:56:24 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbNvj3335787
	for <ath11k@lists.infradead.org>; Fri, 24 Jul 2026 15:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SRwsegGQKk4SAG9Z4lzF8xh53Y8v5nzSjwOE25DwPT4=; b=SVYo7tiAI95+TcoU
	0beyV5ls8kb4o7GBtEC0KiPnW8jRk7R7Qj8/6vKiozh3nRNKcTDGGx9QTZeOC0wU
	at7W8j9pO5gaUmUzyQQ9WcYpLnXb7qLBdPMQIqNZNJ4ONPV4URXFqD5gz19VP7z+
	rCC17lfJ0gP/cE3xE6jzTlKRn+4xNoGgXfeu9M/E7wwM6e4rcvRrU+pfTW8M7TRF
	mb/aPVEcy0sKZEqV0qOf0DNHTCTyegdhs7uLApYPfgeav7iBV8Ms4LGlp1d/f5uK
	cdwFHVcOmcUywRwaSZcn26l3f19WE/qCIyPxWFm8XwzGrIDA/nTrFyR6Q0i9HiSF
	J648CA==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5bysem0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 24 Jul 2026 15:56:19 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6a17dafd042so367704eaf.2
        for <ath11k@lists.infradead.org>; Fri, 24 Jul 2026 08:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784908579; x=1785513379; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SRwsegGQKk4SAG9Z4lzF8xh53Y8v5nzSjwOE25DwPT4=;
        b=BnUwFz1/GhDTz4Szsi8+IBbUq1Ez+/mqZK2mT/2Pe3G3WBR3QA9uIXQQ6a5gVSpSb4
         ixtbDn149r8KarQ48Bw0i1Mdw+AtSISrH9jZs6bAnhfL+zKDRwG9Qmn4eOaBew0+bPeG
         zNmJLmTbDq18Fpcu9FomGzkJkIBFNFl/w5Q2jnwD4KsegNZcadKwTi5r9pcFTWVUKDHs
         ODh5/tiiEKDaneHLA38eB4NEUdUiDKdXHgJgtGR6SaMvJvkHUA3ntsXgTIQLBuDdAH4N
         Y6YY25E9WARzsOs+r5UIvEEmOhPGrcV0uRPGboMIJqCI2TL0Abx0HyWBmew6YxKYafeg
         0NQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784908579; x=1785513379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SRwsegGQKk4SAG9Z4lzF8xh53Y8v5nzSjwOE25DwPT4=;
        b=nGKtAifMpz5RQ4ZYcTDMofCtCAUv+9PsjgDxjKMtfrsNxbn+Gf1Z8/hEk2M054REET
         cToEEhyFGe7tJtyo5DdE/8wXrFlDUPlUybm4auqMXi7jgtSGjhmjxZKHzy5Yk9+bG14m
         9I11Hamapd3wwdnbsTJv9479tVjfQtBKbVY3UmZArNcDpL7e+JPu63qOesV2dmM9i1NA
         TOVufMNSJkSeikvCy7NXSO2+BUwBDPO/UHQc7xWIpqRDXadib6xdMt7bTXRgJzi38B7B
         rsoUR2LhY4kTXdNXmHeXWlT8YoDWzJ3xyRMoDyMziw1KA5SXK5O8ppN6aFbt0gQoPREm
         sBOg==
X-Forwarded-Encrypted: i=1; AHgh+Ro++AuQKkzBs+Aya8Qc6LG3R9lSYCnYJIRgdgQ1bmRucEJzQmX84oQmrBP4lFmZdh2fdT0mtgA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzEP6VL1yCjE4SKSotfj/TvBDeRI1cEIS0PT+ZPi7ztxi8UIz4N
	1UtXEOAL0kIy6imKGQBQRGK2scL72U/BBvSYfT7v2q4QHD3xnByICoahU9jDKjdkaK1gwP0VovJ
	CyYWO9Lm7lreBGAihfJXzOLCZTSeDRTElSHRO6KNymhzY3imZEEPwakNaZ881MVUe
X-Gm-Gg: AR+sD10WcHCfeyv29fSbpja1I+JX5VxjMABoSTpU1HIBas2wHXILDIYxDrcETm2AUoy
	V+poJ3RCSFxpV6MJ/Dk/Mr4A1QXBBrE9LCiY+bxnPRz4uMObN+b3NhgPmr7WTpXz7Vq8mKd6EFB
	6NXjzd9R9cNvjqvZ67AtOUHWg2O2AFEOKjLSDzjV19YIklJd/nM9yIdjTaLJWI21txbO9EDHuqT
	0OCTTux3fbweKL5x4RttzbJmU+5kmACkmih9t1HYRcNoJQjpF+BFWLkiIg3iuJOVdSrkaPxDqM/
	3gN40ovZuuz+1mnwUnSVw+DOjVd/SlvzlY3XyuqvhEL1a6mK7KKOTW2eB21xwZRsjzRE8DVzqV+
	ujRIVxOH8ruFwM9qBrVnmFXhRbFlCfTqtvft8PJ0Dd8dbcXiMVUWx0ps=
X-Received: by 2002:a05:6820:a05:b0:6aa:2fbf:bf4f with SMTP id 006d021491bc7-6aad4148874mr3737944eaf.44.1784908579100;
        Fri, 24 Jul 2026 08:56:19 -0700 (PDT)
X-Received: by 2002:a05:6820:a05:b0:6aa:2fbf:bf4f with SMTP id 006d021491bc7-6aad4148874mr3737914eaf.44.1784908578674;
        Fri, 24 Jul 2026 08:56:18 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aaf9385b35sm134591eaf.7.2026.07.24.08.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:56:18 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 08:56:14 -0700
Subject: [PATCH ath-next v2 2/2] wifi: ath11k: fix overreads in
 ath11k_wmi_process_csa_switch_count_event()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-ath12k_wmi_process_csa_switch_count_event-cleanup-v2-2-02a45d7246c0@oss.qualcomm.com>
References: <20260724-ath12k_wmi_process_csa_switch_count_event-cleanup-v2-0-02a45d7246c0@oss.qualcomm.com>
In-Reply-To: <20260724-ath12k_wmi_process_csa_switch_count_event-cleanup-v2-0-02a45d7246c0@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: ftbvXYXzcHPltvcfDjUvD-ep0i7OxNYC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE0MyBTYWx0ZWRfX6YaUoQ0srJcJ
 0uoBylhSq2O9e/nXsrkrAZis2rpvcIxc+bF8t69UL7sdABRQO5UME9PLRW37B7lKycw4s4BdqoF
 9oHAMK7/KIaDX+T7QBADbUquFoYLtLU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE0MyBTYWx0ZWRfX3yUpUSU5SwQ1
 rVfsO3PebIRQLXHCCXw53OW1FQAarATdF/PVaaRoc74AbnOp0PuJz8U+SzcgsFU+6KlgDKO7hfW
 NGNYolPHyonXrm+phpaU97163Hv0sqgJc5N51SWreGNNQQJxK/hnq5goFHc/So+L65VeODxtFL3
 CNNQ4U2jcFbo/HCfGYzlPHWOApmwxiFAsnO09khTcVQW8rCOtF7QcbOfaYB3/4kd3W6sJ51QpeC
 AdLjEJ7eaEPYmkUYsrT0aKFgnuKVutY5/aB/bGVl6bj2ycQbIVU31zcsP8Ktnps3cRsNswpuikR
 ZD16PMk/X6ARxTaigCCuh9A2ba/HW8/cAKKhEEB77UZTDVfrwMlRSOTnetbzcbhEDqbaZcYXQi8
 2bxNOC2VF0poFUyGPM3eBeJwc5K8phu6DYoPz5xIEyFQwVurdqyt4T/8IqLJnIIO4xA1UHjLK0T
 3tS0rAG5mT/ExUfW9nQ==
X-Proofpoint-GUID: ftbvXYXzcHPltvcfDjUvD-ep0i7OxNYC
X-Authority-Analysis: v=2.4 cv=GMA41ONK c=1 sm=1 tr=0 ts=6a638b23 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=hOGj4-57aE1FpqoUBq4A:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_165623_261082_747F46D8 
X-CRM114-Status: GOOD (  17.21  )
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

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Assisted-by: Claude:claude-sonnet-4-6
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
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


