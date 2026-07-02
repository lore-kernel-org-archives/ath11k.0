Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7205EC43458
	for <ath11k@archiver.kernel.org>; Thu,  2 Jul 2026 21:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p/1NGIPaCdcLKXQm5TogjGYwY+n0zVHtZoyJXhDy83o=; b=GXjr+aWYjQ8zbrtfkdVsg+K4Ab
	knMDcoQOn73pcko88mXmNXYSijEnTuGA3X253oQzN/RbQfsAcGIHSTtM0JCxCesWkdJuv8Yg4wKvL
	jgo+ncmypxPGbbSgwR7ixeJo6wiMB3dm5ouepRXowi60ZVeeqBcjEvxlIW/jOoLLQEGbEjZ/3lHCr
	u+IYj53ZBfJFDtc4PNds3N5/ottkILCsuihAukm+XT/xdgxLPLVRoPOirS1inzE1nz69mZ7QdXnaP
	H9kxafmn6h4pqmjYKa+1pDkkc21EIeIz6GHmiK8HWluCOFIUNbo/7gFxtUIpEy0roQXnxRsUz48sk
	Sj/S0bkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfOck-00000005Uqc-3gjV;
	Thu, 02 Jul 2026 21:07:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfOci-00000005UqD-0UP9
	for ath11k@lists.infradead.org;
	Thu, 02 Jul 2026 21:07:05 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662Iups71379457
	for <ath11k@lists.infradead.org>; Thu, 2 Jul 2026 21:07:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p/1NGIPaCdcLKXQm5TogjGYwY+n0zVHtZoyJXhDy83o=; b=T9bNQpFLZG4avL94
	jFbkJzhyV5qwNz90dr/qEFkLLiXj4IvLfdLXurJd+cI7ZrfKRV3z3wnON2UYHfN6
	nXKR4f8kKQ+St2XeKmKcgzUeEln6EsRrg9FGX2KCb1pM4h9M+SW9cnFBto/1OMbl
	+C3ybjrJJSfOs3fJASW0giNZ/cx0JB86bCEUaM0lTmIjL5HPzdxQdEoFPR8b4A9D
	XLNTkw9fZt21+uhx7vQu3ibnlCpkdM8MpqZkkIyIHXDqtuCHgO+GRpPw+O391V1i
	4d6hRKK32EFsvdFCDBI5cxK6OE9+c0YRT162oJdVmPhg/Ef9DZNcykzlbYYXkziW
	/SxzsA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qnpa799-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 02 Jul 2026 21:07:01 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8478e603285so1284873b3a.0
        for <ath11k@lists.infradead.org>; Thu, 02 Jul 2026 14:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783026420; x=1783631220; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/1NGIPaCdcLKXQm5TogjGYwY+n0zVHtZoyJXhDy83o=;
        b=dcaCHZIU/Y3QDuxeVpIWXxxLolamVEy/+hLpouR64Rg20rPzMElNw7GRBCZrBO0+Nz
         5De+a4BIvNpL6BXZZTZmzV4tacBU4PimXQO6HxrtNXI5y+i+SUqKWhz/n+OMS/EBBDu0
         iVF3zUrLguRhbq/xCcW3+6BJwG7UR5KGUyXqLoKs9s2FEf2tTiw0VEWIjS1Z7z5CV2CI
         1OLvo66m205PDbciCfE+E0PDPcrkOtYfoAE/R3YK+ieYZGR05Ey1g+llenvZ5wwhecfA
         /RrGV7gB+v5w3zq0aPVIQe7ULfga4yMUEkJvgijCheZpJHKezSmxNj/wEOYpqhS6BQYr
         /Khw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783026420; x=1783631220;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p/1NGIPaCdcLKXQm5TogjGYwY+n0zVHtZoyJXhDy83o=;
        b=s24ShDq1rJO7icFyIJ6d4KrySPs6GbFcB9GyMEMUAj1fpmznRhkXRv9+f12sqC5vQc
         mcjLGKZsFOKLWgip6QY4Is1M3h/C8MhOIaDqX7IRRbruAZCsmpecoHXbDJtnIvlrc3TC
         KT+VuYelhl9nk+DovFfWX71raJgRX9yTnI/kHJEp2kX1BTrWuUnpBDUd6yPDVK8I+myn
         oKomCHcGLZwp+YMgpO4FNdi6v8zI/kvJe5ovJDuUdyDt+VuKb3tUOir0dS62QstEnwAK
         Sl13HuZzU2jHpdYUqVGRnOoQxhH9Yz5zb2Tzqg7f4W7p4j68IVk3+nWAL75evP95a9yd
         TmTw==
X-Gm-Message-State: AOJu0YzLUCzWqhCJHWSvmD3nSMDYFo7R+kQd/xrlTxuWGER7+HiD9ii8
	zbRpOyXhCrx3O2FPStNHap+3dh7/na5MPmA4RmPCrQURjBEK8Fqu33wbXKmOLViJIMJh2sn+26q
	SE9TxkBJOdoPIYcE9LYNFhXXBZ8UBcT0A/rgFtaPUERqpZ3orRFcu3p/UUFBMBEYyIPMaGy9k
X-Gm-Gg: AfdE7cmsK8EpzNu2XIdjq4NA3gA2LUqFP2EcFBtpb+rRM4N0AlU1Yy64arm4Y3GvUEz
	DAxMOXcYN/CGNQukORmOULqYCp9/PzpNkblJIVeR2sv/unbqjbqjtjxk880EmruELuMMZOclfUB
	ksVkKCP9QY2i4Pc+dt+jB598fKfKPUHuy8gE2FcBboH8vN5FQD6GjxB3z9FU7Ohcaom9Gx3BEOK
	XPTH7jWc2m19ADdNsdbFDQGdhOOQWyuks9rYKwg6PVyt03nnRtlo+GrXKCtXqrCsgBYsYi3/mPH
	yTpcgCmaxceQL3D3Aohwp0lsPM2tRbKdVPcMvksmh6s+Hq76aNc2vEXcJFdnQOc9Vrh4EFHmqVz
	Lt4t+hdb6wfZyUMRO+7+1Nk1O7mRDjBXUacUiAqPqY+A3atKdwfPP4d/sYg2J5fDCxw==
X-Received: by 2002:a05:6a20:e211:b0:3bf:990d:3fc7 with SMTP id adf61e73a8af0-3c01caacd28mr1555419637.20.1783026420326;
        Thu, 02 Jul 2026 14:07:00 -0700 (PDT)
X-Received: by 2002:a05:6a20:e211:b0:3bf:990d:3fc7 with SMTP id adf61e73a8af0-3c01caacd28mr1555379637.20.1783026419712;
        Thu, 02 Jul 2026 14:06:59 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7bb8fasm12300233eec.1.2026.07.02.14.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 14:06:40 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        Gaole Zhang <gaole.zhang@oss.qualcomm.com>
Cc: miaoqing.pan@oss.qualcomm.com, hangtian.zhu@oss.qualcomm.com
In-Reply-To: <20260609090609.4041009-1-gaole.zhang@oss.qualcomm.com>
References: <20260609090609.4041009-1-gaole.zhang@oss.qualcomm.com>
Subject: Re: [ath-current] wifi: ath11k: fix NULL pointer dereference in
 ath11k_hal_srng_access_begin
Message-Id: <178302639997.4076904.10675261367629725510.b4-ty@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 14:06:39 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDIyMCBTYWx0ZWRfX/8BOASa/qbYU
 bdD+ckuZ/k2iwatltU+vsy8X35KJDZoI44jZcaitDTa6gZ/GtpR61o7cgh7NGw79vL3DmsMe7j/
 6zrtZ8lWxEQA54QtbtSAQ3kB0mWSc7w=
X-Authority-Analysis: v=2.4 cv=FoI1OWrq c=1 sm=1 tr=0 ts=6a46d2f5 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=C-AIHKxbatL2aXLaNDIA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDIyMCBTYWx0ZWRfX+65Z8XzcyqQq
 yXz+3NEc4imKogLu9sBPOZFO5yKck+e3S3ZuZRtq28vmAfDZamGgy4/a0ko7bs+MGkqcYylikwZ
 Gk79rDRN6z1eF9aJnsWaMkTrmUqzsF2N7AlXqTY24yd6eqeOASPeFIKT4piO2YS2+mqLlowp6zE
 OKcmSrQKqkqTv73ci976mAS3bxw/2/Dq6oeDsiDSQL3TgLXuj9uMllOKqqaHmpCzeUr6ANqCj9T
 uZJ6b0ATewNzwBWZfgC3sjh7E8rU/CbxcH/p6D3Zmk+W0bHjz8cZAKQzmHDBwPAoA4EzU8ugPgJ
 XJeIBBcUr6vEshEZQTCXbfaB7y0AXEx2a3o6k0uG/6hlL/GmB+TJe2+NyQXTpMDPoWcHDV71DZm
 mlpiYKRV1mcOKeIbOsttdpX4lxBCFzP6rA8EhN1cqD36nloeaHWtAGHW2k9ajIHgBpsuPs4PFGf
 F+/nMtFewv8T89e7BXw==
X-Proofpoint-ORIG-GUID: Uiit3wkrPaIr3V6ShuSzQOldm0PZwuAG
X-Proofpoint-GUID: Uiit3wkrPaIr3V6ShuSzQOldm0PZwuAG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607020220
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_140704_332696_B550A37F 
X-CRM114-Status: UNSURE (   9.55  )
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


On Tue, 09 Jun 2026 17:06:09 +0800, Gaole Zhang wrote:
> In ATH11K_QMI_EVENT_FW_READY, ATH11K_FLAG_REGISTERED is set
> unconditionally even when ath11k_core_qmi_firmware_ready() fails.
> This leaves the driver in an inconsistent state where
> initialization is considered complete although the firmware ready
> handling did not finish successfully. During the subsequent SSR,
> the driver enters the restart path based on this incorrect state
> and dereferences uninitialized srng members, resulting in a NULL
> pointer dereference.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: fix NULL pointer dereference in ath11k_hal_srng_access_begin
      commit: e8d85672dd7e2523f774caafba8f858384e18df7

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


