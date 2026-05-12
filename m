Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C48BCD484E
	for <ath11k@archiver.kernel.org>; Tue, 12 May 2026 02:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=036Lv6cF0PVz0F6Xudk21JbDMRzEenikh7GX3NZQ5lo=; b=eXpVwhG/sEcuqzjq0ihiANyfBb
	ya2Pjkm8ircdduFR9w++3tk7c2PQgjjkO1oWUCxhKzrkxk1kRbU2GR5S/7seexICsmc2D1XyTE3J7
	SM285m9WJ1sbYY/40ibTcsICi6KhdkfDxTbg/bThrzW4ra7J4Ntv3l2lfl53Uydq+WQzclKW1+TPG
	cWo+ZEjg9n75cLWAKVPuhl5914IeV4oFvUB0hzOGHJzA0de4FT9cvCd8Fnq1QXnicLwgMvs0KQtSj
	xz1ZyHRYpwVwU8K0J1ivRewOvmH65jVJ3pq+PPbnyW6cTC7DKPpiOHHOjg9GLRyk8lWlmA2zZ04GK
	rZ/UPlZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMcn1-0000000FGN5-17BE;
	Tue, 12 May 2026 02:24:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMcmy-0000000FGKs-2LwB
	for ath11k@lists.infradead.org;
	Tue, 12 May 2026 02:24:05 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK7sxB2172407
	for <ath11k@lists.infradead.org>; Tue, 12 May 2026 02:24:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=036Lv6cF0PV
	z0F6Xudk21JbDMRzEenikh7GX3NZQ5lo=; b=Ar/aVTTLNkaXYOShCjKifxRPeaf
	5ePAtsIXGA6Z24CRsxRHW926YDFHDPRyH0b435DXDPaJc+TjmJ6qGEFCvI4D4Jqu
	usqCNkcqhLEkF74JZR4cXVd/7Ng+FaEOSwkuVmpKsJSq1X3TqNTIOLsYdsLWHayY
	3qjbaovyhAdWISRSj0wbnyn/llAN/FycRGCG2LtOTXYVEUNaCW2wHsZYTjXvJryf
	xjItF9JkqPYWoFB8UhCYgXH7JD/3qXud3SY8IIXr3dbTKIk5LcGmPyFMXwZRhdpe
	vbWRRAwy4cIe3uozpT2BDA6M8GrtpUWt8+c7f4z2hHuCEQMf7ehkWXd4vVA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nvj93en-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 12 May 2026 02:24:03 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-835444b6ce1so3506554b3a.1
        for <ath11k@lists.infradead.org>; Mon, 11 May 2026 19:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778552642; x=1779157442; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=036Lv6cF0PVz0F6Xudk21JbDMRzEenikh7GX3NZQ5lo=;
        b=hA9Wy9qvE/4O6+kdjPR6Tc2Ecc+jcnWdBhBwxlugKQbOcfcKwdOCFqj52UVfBW9U3t
         PNm8A9ozDpzVdX6Dg4/eYt55pQGLiJzBkgdyoiv/nRg223wBpY+Lr2nNYnjfP7xYFesH
         F3jMwxhQrV1X9n9IBWWSnXWjZ6NakQHZNPYz9ureI351AGLRGkW1Q0nfbuoBpXwNK6Pc
         blDbCOt475k20DbdGKvmYBv53mlzERJG+aFtEGio+3gmF+1yDfhi7BtbT57JhGH58y3S
         VE5p5elQSfzipH1K/7JAKm1rwOhPcaewiLzbFmEtzeE0Ul09PQPkKUf/1gkGAjnHVtou
         FxDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778552642; x=1779157442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=036Lv6cF0PVz0F6Xudk21JbDMRzEenikh7GX3NZQ5lo=;
        b=JPBVAFQuhipmsj8hR8+aJNt4Z8BJc0gZG9bWrqkJSnhaRPBfntTbFm7o4d7+U3riqC
         4/9ZeBIkwV8W13KhwupvlHbDbQEX7hVhSeJ/Ge2EpxDidpZSsqsMBp7mRsy2UcyIh8Yx
         L8qIKo2vj5sz9hvvw+dFXEZS8jvxp6TMJfXwcR7DP+d0LuP6ZU2+IiAELF9RDGwJ08vJ
         QQhodnyJPIKDRrJ/zvfqxWUJOeguPxILQUQdokN3LqwDL1DDgLBgWw6Dgu/3OQEQYab7
         sJ3UdSsXqEX1+BXgTdlBlIHmWuRkKQZyCX3e9MLYjs3NHCpC3ajQ6xsMfw59fq+M0O15
         flNw==
X-Gm-Message-State: AOJu0YysCvOGLgDRFJr8vVqWmUBm1ULOqjJ+bSvn9pyZvxWQra3nYwMc
	J0efkYu9w/TnKHVLf/+nvEJVkVCOYFyh0wztKYdo5T+THkKcA2jaqjlKpsiD7O1FrFXmLabKlbn
	VNlwfEYlaS9dVgl6iO2G8t1tbDkcxieVo/Qq1SmEaAOy0K7lC8j0z39MxR16Jhvd1
X-Gm-Gg: Acq92OE2RsLID3DNKFLKK90e/6UyscwKZN0E8WLIQhJr9Uxer3p7Y35DkG/CmDt3T1r
	Z1rHpUEgDjeiuEXa1tLx75UXTtQRCxm4nhEhtatzqor3ltcx3KIPNaplDjxhJVEC6JyE/KVNhQv
	fpS5lqVuWPzlDjE8dRdrPNE7hKC2L7WR5EM3A/ujS5Yl6udw7KET8zaB31EYXdac6coAcu52Z97
	nDaQtG+gs/ULeWytssLdiJgI1B5Fn67o3TXNbzxQA5b3CrrEe8uH096JsF7uuF2/Clt1yzflF6I
	dgfRGwT/f6Whvj3oLJ4yqTACaB2ygdFLQ1KlI3ZjYFUvpEWxm+N9tE6LJ3IeiFP5jxqaXt4geJl
	in2q03CI3BZScyvMt8K5xMdVWs5hJF7PGxKzTbaQK7m9CVUYYlDUBkMZac7qNcd3KkxqRP7fMh5
	nDbq8E
X-Received: by 2002:a05:6a00:1bc9:b0:82c:d7c4:4c5c with SMTP id d2e1a72fcca58-83a5bae02b6mr24671156b3a.20.1778552642085;
        Mon, 11 May 2026 19:24:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:1bc9:b0:82c:d7c4:4c5c with SMTP id d2e1a72fcca58-83a5bae02b6mr24671129b3a.20.1778552641599;
        Mon, 11 May 2026 19:24:01 -0700 (PDT)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbcf16sm25199256b3a.40.2026.05.11.19.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 19:24:01 -0700 (PDT)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next 2/2] wifi: ath11k: add MSDU length validation for TKIP MIC error
Date: Tue, 12 May 2026 10:23:51 +0800
Message-Id: <20260512022351.2033155-3-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260512022351.2033155-1-miaoqing.pan@oss.qualcomm.com>
References: <20260512022351.2033155-1-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mxgFTqORl_RCL8k6GN1wWplvIyZaQ58V
X-Proofpoint-GUID: mxgFTqORl_RCL8k6GN1wWplvIyZaQ58V
X-Authority-Analysis: v=2.4 cv=H8brBeYi c=1 sm=1 tr=0 ts=6a028f43 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7QbXSr-hkXkeXhD5LnUA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDAyMCBTYWx0ZWRfXxJPVvSxNkUiT
 UltcIhUbytM/dHMxFhrB48rPR1+bZDZF9nQgCDp2YsG4Kinh5YlLvuToO8xKJhVOsLHM3blHLkt
 VOXePBDwoOTri1zsy5IMfyFxHF7DlxuxsNW88hlDc0IEspsyTdFAN4ulI/D6V+YCnNfWBAhmmCQ
 eWGcKcUHWC5mK9mLJFl2uasASkFnkot7pz0csLeEgo8WMU6AvCkBjqhsqlSV6geQ8vNVrMuhegY
 yMuvbkHEVkTIUZWTqf+jPS7YQfzHQvPLlNWcVSGDqewanhycxsXj6mU21BBH9biNPUELIjuTh6B
 GkesOPV8ux7EwdzmOTwqj0ueXcmAVTxXna85wmIEvgCQYOTrAvJw7NtKe2n+d334eAhT0/kmskR
 FRrxVJBy0EPF9GpcYV1Ql5zMuikF204AZCR5GkbblmD4HpygpsMSHBN/7r3XFlsNn4LFBwm4ah/
 7QxtkkCvTOBSafnG95w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_192404_722602_5F8CE2E7 
X-CRM114-Status: GOOD (  11.05  )
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

In the WBM error path, while processing TKIP MIC errors, MSDU length
is fetched from the hal_rx_desc's msdu_end. This MSDU length is
directly passed to skb_put() without validation. In stress test
scenarios, the WBM error ring may receive invalid descriptors, which
could lead to an invalid MSDU length.

To fix this, add a check to drop the skb when the calculated MSDU
length is greater than the skb size.

This is adapted from the discussion/patch of the ath12k driver [1].

Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04685-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1

Link: https://lore.kernel.org/linux-wireless/20250416021903.3178962-1-nithyanantham.paramasivam@oss.qualcomm.com/ # [1]
Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index fbe2061a544d..9c31bb7efcc8 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -4050,6 +4050,15 @@ static bool ath11k_dp_rx_h_tkip_mic_err(struct ath11k *ar, struct sk_buff *msdu,
 
 	l3pad_bytes = ath11k_dp_rx_h_msdu_end_l3pad(ar->ab, desc);
 	msdu_len = ath11k_dp_rx_h_msdu_start_msdu_len(ar->ab, desc);
+
+	if (unlikely(hal_rx_desc_sz + l3pad_bytes + msdu_len > DP_RX_BUFFER_SIZE)) {
+		ath11k_dbg(ab, ATH11K_DBG_DATA,
+			   "invalid msdu len in tkip mic err %u\n", msdu_len);
+		ath11k_dbg_dump(ab, ATH11K_DBG_DATA, NULL, "", desc,
+				sizeof(*desc));
+		return true;
+	}
+
 	skb_put(msdu, hal_rx_desc_sz + l3pad_bytes + msdu_len);
 	skb_pull(msdu, hal_rx_desc_sz + l3pad_bytes);
 
-- 
2.34.1


