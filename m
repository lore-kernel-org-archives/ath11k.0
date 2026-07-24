Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A73C531D0
	for <ath11k@archiver.kernel.org>; Fri, 24 Jul 2026 01:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5SMXxutj/MIuag2+HC9usTCdJHe0gkRdicMpw/jumME=; b=0M5pWR+1eeiGZ14UajdeX49AGZ
	XVD8rhbANGOIHEy2tbkhAfUg4pZ+Lej8v3Q8KXMi0P41AJLznD4LLWeZNjMQdZFBO6gGtXbwqr9/A
	xqbmnziwITC+h7Tw5NaYRylUViZVNaWnU6WHeyLlflNByjD6SHQj8zlgPl73wkpC/38IAQpwTD18G
	CiMEYRTu5j50j867+0pnJpqxBuaVVxaFiAewgasQBusZXmy+fjaQlb4JkgP4+oNsJhN0ITFR+q1TV
	Hp9te3LomByyg6B0xJwIklt+jo+FppfA5avLeQOrTrUqZFhpKxydQINsvxrL5xE+v2mXD03nvJVuP
	4pSyE2aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn4lE-0000000FLAW-2DKY;
	Fri, 24 Jul 2026 01:31:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn4lB-0000000FL8J-1WaL
	for ath11k@lists.infradead.org;
	Fri, 24 Jul 2026 01:31:35 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NLeCts1069121
	for <ath11k@lists.infradead.org>; Fri, 24 Jul 2026 01:31:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5SMXxutj/MIuag2+HC9usTCdJHe0gkRdicMpw/jumME=; b=XNncgK7vGyN12FIy
	Jfp1Uvjn/a1vIfzZKhxyGZNTDm8wt1OAbouoTB6LjbbOs/G2+zAqteikfF5HSdWQ
	HUkRt3fSpNWIiLrARYserte2y/7hX1/nPwdVSwkTAZ3LmNR1ntPwMK/DlkLQZQjc
	Mv96O4HWFvAuz7Y47MLWfgk91e/gfsgzgfvwXGnnbiy9u5H6gMxks0Ff20D4p4QE
	5sAMEocCCaOJpl1LJzQFutf+Zjuml4IklCiHlgi0s8I7oIcq0wdhyLHhZ2bHKTws
	9ZfZrHwRelldSqbYIr+JqH4U2R1pP66I5gpa43i/92V/BQP83laMATw5lpPfhSHc
	pJ8Qdw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkg523n0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 24 Jul 2026 01:31:32 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso1794217a12.0
        for <ath11k@lists.infradead.org>; Thu, 23 Jul 2026 18:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784856691; x=1785461491; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5SMXxutj/MIuag2+HC9usTCdJHe0gkRdicMpw/jumME=;
        b=RayGKkncMtQ3Vc2uzmh5SiqyRx2xAd0n4Mm5A2U8Wr6oX8LdM8CDkDVBMOJI3jHtmB
         FuMaj9GzMBWxxRWOtOEk2gtQXkMuuoMHgZFN8BIuvNVzSndHSSfKDhgkcW5yqLkQ9p2d
         nCXd74vdm386pawdjPmURa2WMKNiGZNKdV0NQ2VOHEzSGJYUdWusl2YRn47QrorgVIsX
         YijhyTur4kDjwcNByaWcwq/r65HCqKcsMVllE589ERHHNZ/5yssYFqkmFT7h/p7SM/z8
         xPAEIQoU4jxnqiwe7v3nrxnVEzSVIcD3N4crgrwSDEGGunIMQNPVvErNDLKje8V01h3r
         j0Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784856691; x=1785461491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5SMXxutj/MIuag2+HC9usTCdJHe0gkRdicMpw/jumME=;
        b=gMyEFXGNZ8hlWnAtpwPDPOpNcW/sIooKSSuoOfCE5aowy+hqzyTqdxwA4TaWQF9anu
         PmD6Ncu5S134ZJrQ+P2gt9Vl6whCgF6jfUyPRwm9m6rBT2iYywhLqayVB7j7QOQMIFhj
         LnxDTNg/Q66eSEuAa6plMkbzqTOa0VX0/5OPoY9mgJZzDZf33fHdi8MCQl6W4Djw7trr
         Q5uD+LhAOey1fYjE0JmIegQcRFI/GMnCLyTdmBFH5aYwz9fU1Om8vaMn3JHEHRzQHXxz
         raGNGiaS3Wjd8Xs7AJ9jzj/NCSw/WrtDYmSZT2DED8cSIkcmCxK89RiViV3gF59NmabD
         wwJw==
X-Forwarded-Encrypted: i=1; AHgh+Rrm5b/9wdKlfdH3FtQ7jgP4TOTWyJwhuExhPA2NxfcTcw+RYIwyTAL5JITfwlXEfA3UAWqGk0Q=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0ypvUkeQ5RxD3NbaY7JQMo3f6r+3yCNGD3ZH9nx3lpe66EBU7
	29diHNELNwlX1HIAzVRSCzCGrN2aOB26UEVJ4lIpV1dcSFBI18St401R3W0WaPrUP8yTN56T143
	ZB7A2YvobdAbFsGynMQM6pOIaol+GoZr3VhChH0rwjXuYBnU4HiU5UhgNULogHfZVzKs1FCCt
X-Gm-Gg: AR+sD12HJtHIEyz4zuwJke4gSLcjp1VigKlxjyWqHfmBaFbSbSymqmjjlSvN2VsYoLg
	Ya2vaayWYxvmnfmBSDVK/d++1Pi/BjGF2ZNZ9d3E6O3c4Pr6P5sjqvPzySs//gWCRAUxziX8GCk
	OVxrqXkPrN8kaOrvYwOnZYNs2d21yBeEMEHpJYc3Yio9CxAUn/hnRTq6iT6GtmalpnnARVqhALa
	knR2ppHy5ViBQoPKZ9lTLammH0jDt/LZMeQKPqT6oXzf+w2guiprTNkzjVktjpxuO2fk/0kWPL5
	/Du4YR3bCn1Lfnac2Cx8uA09AZzOPVQSSFZuPPr4ZaIdLPcFlP3+VlnTtAj2foTt/X1rF/zinmO
	WFaCGbXnIjTxH7s+Y+sa4rxL02tH6Z3B+4+BiaD3Epv+5uq8ba7d/4gA=
X-Received: by 2002:a05:6300:95:b0:3c3:a1ed:3c23 with SMTP id adf61e73a8af0-3c44b00675emr6588601637.23.1784856691319;
        Thu, 23 Jul 2026 18:31:31 -0700 (PDT)
X-Received: by 2002:a05:6300:95:b0:3c3:a1ed:3c23 with SMTP id adf61e73a8af0-3c44b00675emr6588558637.23.1784856690772;
        Thu, 23 Jul 2026 18:31:30 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147df0ba0asm22655306eec.18.2026.07.23.18.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 18:31:29 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 18:31:24 -0700
Subject: [PATCH ath-next 1/2] wifi: ath12k: fix overreads in
 ath12k_wmi_process_csa_switch_count_event()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-ath12k_wmi_process_csa_switch_count_event-cleanup-v1-1-c01ef10bc6a3@oss.qualcomm.com>
References: <20260723-ath12k_wmi_process_csa_switch_count_event-cleanup-v1-0-c01ef10bc6a3@oss.qualcomm.com>
In-Reply-To: <20260723-ath12k_wmi_process_csa_switch_count_event-cleanup-v1-0-c01ef10bc6a3@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=DtZmPm/+ c=1 sm=1 tr=0 ts=6a62c074 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=G0XfPlja2fIICZ3D3WwA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDAxMiBTYWx0ZWRfX3Xb+WpUWRWPW
 jz5XN637MOS4na+6/+k2Y2oZyXBaGfq04mY/motv7V6wvXLyMOkRKxeZni3ndq12eczKeYfS0Qt
 9hlOzCAwVNfBgQXLkvHXCAQm1gpkeLA=
X-Proofpoint-GUID: a8eOxAVk-678N34J8KD4oRQ18P4-EDC_
X-Proofpoint-ORIG-GUID: a8eOxAVk-678N34J8KD4oRQ18P4-EDC_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDAxMiBTYWx0ZWRfX4A3UCbltRBIH
 koezSO7+W7U2PkqRMIRkPiJRtSxe/jxVzpFNFHSLaeawyKVnvORsrkDlAi3ORmtbn2Vy0zA1IKm
 4hFcd5B+1d9aM1lNtbzpWIfJFkt+zBnGBm98RciXN5rihiUq+E29Vlnnfu/BiDHiXXKbh2x9M+T
 iSf6oF2GYGXtB/lhRqqWPMHCOHsARfH3mCwwJ4dt9XDQggR3IdiS6JNWwJRbtX0KKL3hJEQtaTu
 hIaF+JRbAz1lk3KwTA/j97Mb7js3v/vLt0vtq9RIaekuocVdEHO8AVVfTFjUqA5ftV/HpI/EyQ/
 c6ohW7/X75sPmwF/U4SOIJFezPCJBZAWx7VHxpzYiZ4Aq+Y2RhgjFvPaMZcLs7w4y4YamaCTL0i
 VX1qUf4HrUZuluqvrrsKelTPACkgsdNko4vcNzfikzKHXBy0MW8AZi2kbK1VwlCGKGwKa4GIVB8
 7wu/l6qXGgR8Glj+sLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_07,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_183133_536472_005D6629 
X-CRM114-Status: GOOD (  15.35  )
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
struct. Add a helper ath12k_wmi_tlv_data_len() to recover the payload
length of a parsed TLV from the header preceding its data pointer. Use it
in ath12k_wmi_process_csa_switch_count_event() to bound num_vdevs before
the loop.

Compile tested only.

Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index ad739bffcf88..62a86f2069f3 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -207,6 +207,8 @@ static const struct ath12k_wmi_tlv_policy ath12k_wmi_tlv_policies[] = {
 		.min_len = sizeof(struct wmi_per_chain_rssi_stat_params) },
 	[WMI_TAG_OBSS_COLOR_COLLISION_EVT] = {
 		.min_len = sizeof(struct wmi_obss_color_collision_event) },
+	[WMI_TAG_PDEV_CSA_SWITCH_COUNT_STATUS_EVENT] = {
+		.min_len = sizeof(struct ath12k_wmi_pdev_csa_event) },
 };
 
 __le32 ath12k_wmi_tlv_hdr(u32 cmd, u32 len)
@@ -374,6 +376,13 @@ ath12k_wmi_tlv_parse(struct ath12k_base *ab, struct sk_buff *skb)
 	return tb;
 }
 
+static u32 ath12k_wmi_tlv_data_len(const void *data)
+{
+	const struct wmi_tlv *tlv = (const struct wmi_tlv *)data - 1;
+
+	return le32_get_bits(tlv->header, WMI_TLV_LEN);
+}
+
 static int ath12k_wmi_cmd_send_nowait(struct ath12k_wmi_pdev *wmi, struct sk_buff *skb,
 				      u32 cmd_id)
 {
@@ -9057,12 +9066,19 @@ ath12k_wmi_process_csa_switch_count_event(struct ath12k_base *ab,
 					  const u32 *vdev_ids)
 {
 	u32 current_switch_count = le32_to_cpu(ev->current_switch_count);
+	u32 vdev_ids_len = ath12k_wmi_tlv_data_len(vdev_ids);
 	u32 num_vdevs = le32_to_cpu(ev->num_vdevs);
 	struct ieee80211_bss_conf *conf;
 	struct ath12k_link_vif *arvif;
 	struct ath12k_vif *ahvif;
 	int i;
 
+	if (num_vdevs > vdev_ids_len / sizeof(*vdev_ids)) {
+		ath12k_warn(ab, "csa switch count num_vdevs %u exceeds tlv array length %u\n",
+			    num_vdevs, vdev_ids_len);
+		return;
+	}
+
 	rcu_read_lock();
 	for (i = 0; i < num_vdevs; i++) {
 		arvif = ath12k_mac_get_arvif_by_vdev_id(ab, vdev_ids[i]);

-- 
2.43.0


