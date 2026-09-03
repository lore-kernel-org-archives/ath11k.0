Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561C6C624DA
	for <ath11k@archiver.kernel.org>; Thu,  3 Sep 2026 19:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=otnhIM+6XCfAc1zPwSGd8LxiWb9OVU0zzutrB2IfRWM=; b=44NQKfkVg0T9NupcmC64H1dJM7
	BkacQczfRKC/L4iBRG7jeVsff2BB4rmnbjjxKMl/eaLtbfOmcYGCOPEXUXarwd8LCOyzFdKC9ib+0
	BXT595guBrgdrborC5vDFFlV2mD0YNYGK2TKRqDe1M4QTjhq+S71MxLvDlRZmmByV/MfyYyTOfO8W
	pNAWq52F+S8wK6UKyUW/XUypTyD3K0j/qHpu2ptSjKEmwy4V7kPWWBpmZSdAjehu8foSjkzNQrgPR
	r8AyUDwzdakEuYso916YTHQqT+wwFDTy1CMU/IGKwMGial/WKnX1dG1h2pS6wXu+7UQp0MEoVqbx5
	Sa0mJyDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2CiB-00000000QXQ-30lq;
	Thu, 03 Sep 2026 19:02:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Ci8-00000000QTk-3DPv
	for ath11k@lists.infradead.org;
	Thu, 03 Sep 2026 19:02:58 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G34aH3958086
	for <ath11k@lists.infradead.org>; Thu, 3 Sep 2026 19:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	otnhIM+6XCfAc1zPwSGd8LxiWb9OVU0zzutrB2IfRWM=; b=ZKo1RqrHvRChrokh
	ZV70+7AQ098MKKNJ7fgDITflBLw8XrtkZFNv5g1dNmsP3ZWI9mCem4MBlFAUgxAR
	58JDMKa7WGsJuUZlRZtCGEk4noSjddILxBHMa2TYsZTfKwXqPpDJDLYB5mq1trAn
	jQY8oDcv+ldmUU7/yMKmk0YdpbVHbtdCNx5XNQa+JgWgy9Ug5FpXWyMBK12hQ7bG
	hZK8SlZwZ7HlJY4zXJSGMf24dttNS91wwc838zMb0/QHx2wtakMogwZ1jlSa7Snk
	0j368iebO6l4ACxE9NfYgTmDp8ipJH4t/sxHMvQ55WgHyTUETEtZOoN9txRzdeiY
	MNLOoQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5d12s94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 03 Sep 2026 19:02:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3968dfff779so198182a91.1
        for <ath11k@lists.infradead.org>; Thu, 03 Sep 2026 12:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788462175; x=1789066975; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=otnhIM+6XCfAc1zPwSGd8LxiWb9OVU0zzutrB2IfRWM=;
        b=VZsOgxNKzW880wJdsvezhw7s+BcDclTYnOe/ejbouUpFGQZyLgpC9saaRyXCQQu1Dw
         QrlPJaHWvf0OZ1slb1Lb6rAIkfB2E34/suTw2cillS08xxOD378SY9qA3YYPrBqyho5y
         yz1+/Y9bsrHZGYcp47pK/n08uKG3eGGhIRNVlijfeVqvony0Nf1VnRZAxqSWqCR7EbI8
         N+JT+NslzcQqPpFQH9BlSUO1QrXo3r6x+Ddv1bgRDrt26PLdX8LZFbJITu1eR6JEkJiU
         X58M1eEJTcmlUKIOjEOsV5ueZoq5fWOQPLiazbvvcBkz2qyw6SLkCqEOJM8tGitx5vU5
         TBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788462175; x=1789066975;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=otnhIM+6XCfAc1zPwSGd8LxiWb9OVU0zzutrB2IfRWM=;
        b=HrgExCB/lFKBNfFipRf0ghGW0xTZwwcCdKM5DhvfN5LQRI3y+FpxkbrLjDA4Hw+Ibj
         N9zVUToJ+XQ2ZBmGC4D8ln7znlPIg9wMxFT0ysodgdUx7/vmyrlNClFmv7/HCfJUiYpy
         lbTmprKsgy4xw8ya9fypR4NSZrf4oIAFvyZh2Q/yQVn8RR9GWoVtuNrC5bC0dVisVOL9
         XRdBtw266RpmOwHb0ehiLpp3H06q+dKE2vU2OfSCGFX06RTx2xmfTbn/21TCKKBS1i2d
         5+R5w3MXRDiXWFhAjyPL8SmfWZyKQZgFbClSm4wpopwZhXM/DE7XDmcJG29X391FqYme
         YEgg==
X-Gm-Message-State: AFuF++nofD+dxmOblt5xAxykgCRzECF0SDkv0J1ToDwhaZeLH4yknSc/
	Zb7BsbJtKKvySY4+d4gtfT3ZWfvoyWru5iOdZUTWlRzzl/TvNFJ6PcyfJNasMtmjd6xSAPFdTjt
	E0ZyNFdOLYmN1QEfJuTrxFQnQjCwI6ka/PjqXsq5zResqfcMFKzW5s27lmySJAWR2vp/VzPzN
X-Gm-Gg: AYBFou0UHOOqvQddfQteXln9ZgCvIQu60ktxpP97T38kDwLwYyIWHcy8Uc+l3wkkEvU
	k1367rKxevb3qJra9oar9gAnmiSmtlEvjanlMuojk1JBSSMLtDp/KNEZ6NvkkMV/R8NiivgsqhO
	UaJfoUsJantDKqlNGliU6h5M3MVlosjK++3O6BtG5CzN63Z+2pzC3TBf3x7sm3ipB+lTkHjBaGr
	kbynE+uYSZvwDptGoIAUn5rAAvjJoVoEUJCjLp0Tb0ff223vwkEh9sqIFKAm7ea0CS1nxedG4dp
	ot/8ddARkb6YfQcbPD9hnyVefRMC8+KrOIwh9M42T/YEpkqBRLC6wiFCrwWTzd5jFxIvuLRKgo6
	W+2Y1ilCwGIoJy6D1vJyUURQOi8WlTevgncGNN4vZqUDn2o/Ac+fhXaU=
X-Received: by 2002:a17:90b:4c4e:b0:38e:a52e:a3c9 with SMTP id 98e67ed59e1d1-39b07fe9dd8mr8558860a91.8.1788462175052;
        Thu, 03 Sep 2026 12:02:55 -0700 (PDT)
X-Received: by 2002:a17:90b:4c4e:b0:38e:a52e:a3c9 with SMTP id 98e67ed59e1d1-39b07fe9dd8mr8558773a91.8.1788462174324;
        Thu, 03 Sep 2026 12:02:54 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243bfbe3sm1230164c88.11.2026.09.03.12.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 12:02:53 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260806101331.484063-1-miaoqing.pan@oss.qualcomm.com>
References: <20260806101331.484063-1-miaoqing.pan@oss.qualcomm.com>
Subject: Re: [PATCH ath-current v2 0/3] wifi: ath11k: fix QRTR readiness
 related WLAN initialization failures
Message-Id: <178846217281.824911.2908930479578290631.b4-ty@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 12:02:52 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NiBTYWx0ZWRfX6nMFPQZXLS8D
 4hZSGYbuQcnQreSlqhFEBH+JyLLZTMkxf1y5FWbEbHZjtkoS5HEfl2FicColeznmBwRtjolbJ+m
 MoMPZLHK194lC+38CMgzwA+K9uh/Q7h7FdT/QHpTnlkhpxSPy14hTE/QWgmtFgf/XlLlxgnUY0O
 zWo8+n/1n1fTmy4ZkTXB7MmtNsojQ/FFxjzjNv2S18hg64I4xdJESUqZRRJPU22Elxnj7Zv81ka
 bni8klS3Ishl7YgRes8NwQd+nycn1XtNq/lemnEn050DKU9ci24kkP4DV0jFBweuO5UjcLQVlVF
 8Alyj2zYhWePdCO8YmuLMSOrml/uWbowHxT+yGzrK/cWh4qTnpgUkuwt4PKqke3pym42cRob9Kv
 IK1afR/PCjffYayaZ6H5ix2X9PEeTN/o5RzzmjLXHiUWYPrj0e/ndYosEPwfY1RseoU6UwSX8uQ
 hS7u63YlDVm/rryc8Yg==
X-Proofpoint-ORIG-GUID: sWYD8LBcBWWQXArudEwIK1mTrLNC1D0J
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NiBTYWx0ZWRfXxpPsrPJZbNOu
 Drdmuuv2ikb8XGZ4mgtQBKUnV2LzHSJvcfxujKwPCi9sP206BUo6AHoBiwM48hwyvmMAaXJTtFd
 YHgQFzPWlD7x5mnQxq8Yzui6Lfuq9rU=
X-Proofpoint-GUID: sWYD8LBcBWWQXArudEwIK1mTrLNC1D0J
X-Authority-Analysis: v=2.4 cv=J4GaKgnS c=1 sm=1 tr=0 ts=6a99c460 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=w-KnMKhEo8LdWayTJ-wA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_120256_829751_3B43B6D2 
X-CRM114-Status: UNSURE (   8.38  )
X-CRM114-Notice: Please train this message.
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


On Thu, 06 Aug 2026 18:13:28 +0800, Miaoqing Pan wrote:
> On WCN6750 platforms, QRTR SMD may not be available when ath11k starts
> during boot. If QMI messages never arrive, WLAN initialization can stall,
> leaving firmware running but no wireless interface created.
> 
> It also hardens the cleanup path to avoid crashes when deinitializing
> partially initialized devices after QMI setup failures.
> 
> [...]

Applied, thanks!

[1/3] wifi: ath11k: fix sporadic WLAN initialization failures
      commit: 32ec8488d75d122768b1977501bcb5ec799230c4
[2/3] wifi: ath11k: fix NULL dereference in ahb remove when QMI init incomplete
      commit: 1a7bcf5324c8e2de6512eca5b028b6b283181d3f
[3/3] wifi: ath11k: unregister PM notifier on QMI init failure path
      commit: 1d8e73163ef933624341075f576e2f36ef9133f7

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


