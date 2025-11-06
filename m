Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22043CCFA05
	for <ath11k@archiver.kernel.org>; Thu,  6 Nov 2025 15:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qoESMWn7PrULWRu14sjXfmZhKckiVnKGNTN25vzvmQs=; b=MKj29ZTElJmk2vS7++3loMY82X
	yAfY/kiMDaJceMPc6D1wjN0p+WY+WFcmQaODHBGssW6HYgDRn6fWgqXwqy6Nx0Tfy694bJs/SmYOa
	I6nOuZ4d1Av/hhv0q6ZG8hhn1EP93bbWzDx5K1+173NHUNq1+mo5Jfxgqyo16vSFKT9W+Qo7J+JTF
	WcxnZu0e0OpIuftSke5OYTJIQO7jx5LBAf1QmAguMpGSZPwzPg4t+7PL9ydVEicntvEQCCjuJH3r2
	PYs7IRR/DlPVtEbLi0puDNWKdcZO8QnLxc88Q7cQn2fB8BcaTSA6FUqwRP5BqfPgRHHrc4TERAtS9
	qWM8u6DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH1ya-0000000Fp8Z-1XCd;
	Thu, 06 Nov 2025 15:32:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH1yS-0000000Fp7y-1akQ
	for ath11k@lists.infradead.org;
	Thu, 06 Nov 2025 15:32:37 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A6ASq163748999
	for <ath11k@lists.infradead.org>; Thu, 6 Nov 2025 15:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qoESMWn7PrULWRu14sjXfmZhKckiVnKGNTN25vzvmQs=; b=fXqMdtr53wOVF3dL
	WK60UNxOi3glB5OA0HxFmC5kgweW+LcmTakEHK8oEzrcjQgFIX0/53KDV2lurSJJ
	OEkd+HzXx0XM9s3P7GJiEcNk2bwLhhpK9FTPf+KPtMR4FWHdiFfhuQwww2cInk/R
	Ou9UrdWUh5fJHHBwrNG/lqwFEyDEz8wUm0iDJ6VOdPMdDliQ3RwenZJiMcZTzGB+
	APmDO1U/GGYYbRLq3yCc/eIpwwj34E57tWmH7GEE5AwQK8143Jrjlu7N9nKyxloc
	1Y1aKRHGSDhhDxCMad7LYZGIoSSPfqR1HLQweIUVn4CJIj3kCN8Eut/fG4r8d2Jt
	mZ7k9Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8sy6guf0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 06 Nov 2025 15:32:30 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b9ceccbd7e8so654043a12.0
        for <ath11k@lists.infradead.org>; Thu, 06 Nov 2025 07:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762443149; x=1763047949; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qoESMWn7PrULWRu14sjXfmZhKckiVnKGNTN25vzvmQs=;
        b=KJaLWLFWQstgd3k34yS2HrQSdgN1cN4CI1HBYf9cDp4eR7sJGubFfpVXj909wc37T3
         Pku9eHw/N2sPEsytg6EnxN7pFfjdfb9ZK28Sq83ssTzb0cl98/Wm7Kbd+Qicah3/nXf6
         aVOmcZ7Q2o89P75QhW6F/2LVd0IKAL0kdLEAqFLeUtYyuXQQh3J5udR5wSKN3jl5bSOo
         F52XqyCI0kBbha7p/yJTUCjHzoRCWfSx5/orEvge+Zq4U0iLM4ripITnp5C9BNkp+4iy
         4ScMQEm/lU0DmJWWPPiISRU4RkTWaiuVMu0l+tIIwkGAxGItApacBDcHqEU5A5j2UYew
         ZKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762443149; x=1763047949;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qoESMWn7PrULWRu14sjXfmZhKckiVnKGNTN25vzvmQs=;
        b=UyPwQyAzqULDPTPo2RvTcu+5Zvtr33olevE8pI3Qlei94ruZp9Cg1TyJGFIcNcWGtr
         fqF8Iw8PgyR3VnSrQUFLjmGJKCGrH+pReb5BgHqoVsgxgx/Gt4DtFNhTdocpNglTA7Oj
         oJmSkA3ZKFbsAoZ/bwnzYhugRjzesvgXzZnz7OXyBaK8Qqh4EdDCaFS9jPa8JeAYPDQo
         OohLgKbtey55FAHBm33m5mBwib7Ih6F2uTK/j8H7pyiyUrL9pkmzZUDxxEP52wsMaugQ
         E5808yzhMiuP4RdjtZHZon9GnynuvR9uKzvrQbIn0P/G7JKjYhpxzBfiyx+G2WEWA3/X
         lTLQ==
X-Gm-Message-State: AOJu0YydbGIxUEGKQ76EgZNZYg+QRviOIibaWKPuTlInSyUFh8RWg3OZ
	Oh2s0fv47K1kDKHhAkCIsO4yVti2XjS1msEwXE5szNYoZRZMZXNrtwgM81mGaOJhZwE0GuSCMpJ
	mun/VkA7PIBHT/qrhHTwgO5qUiF07l/dCQOyRL84jLboGPVNQ96dVajXK50hPUgjF
X-Gm-Gg: ASbGncsAvRDtzw7BPc9tBUGSXtpBgl6KB4rCDIQSlruvvzAhsjbo42qMVoCBMvTMNPm
	D2WLcY25r6pqtl9cnIIvwkF1lqajxswk3PA28IWxoqXuxQ8YEbqLucaFJA7zT5pCEDNmTPjDqag
	aIn2H2gdZwbIVI/6Kn57oDczTFtBivSuOEaxHDb31u0+x7VZwEatNk72Emn/VjJ6pR4RqUUUfy1
	JJESm9Whz3B99j0CkP82/6JvxATmgbuRlPPLj87GH36h6PSgIsgEp/B6+Pd5LQUleEnPgIaadKH
	iFhV7QQAg64kYjqwImoJKHc5Ve27T8CgbZE1u0AN1gve2HVeNFWRl345xjlzHeB1KdjpLcIXItJ
	xtELYqlJ/H3AGCa+o7wwrSxGqLLzcnVezUMM=
X-Received: by 2002:a17:90b:198c:b0:341:8c15:959e with SMTP id 98e67ed59e1d1-341a6dd6981mr7910664a91.17.1762443148939;
        Thu, 06 Nov 2025 07:32:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXcCOwxhywFFmIqy4/If8FuyWQ+DC4C3swH4/tyjEm7gs+eBSnZVs5l2xisqNftHNSyFuzuQ==
X-Received: by 2002:a17:90b:198c:b0:341:8c15:959e with SMTP id 98e67ed59e1d1-341a6dd6981mr7910641a91.17.1762443148373;
        Thu, 06 Nov 2025 07:32:28 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a696f15asm6619916a91.12.2025.11.06.07.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 07:32:28 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath11k@lists.infradead.org, Nicolas Escande <nico.escande@gmail.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20251104083957.717825-1-nico.escande@gmail.com>
References: <20251104083957.717825-1-nico.escande@gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath11k: zero init info->status in
 wmi_process_mgmt_tx_comp()
Message-Id: <176244314778.1820261.5998504841196098963.b4-ty@oss.qualcomm.com>
Date: Thu, 06 Nov 2025 07:32:27 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=AYu83nXG c=1 sm=1 tr=0 ts=690cbf8e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=HIa3pkW2VRZaOz2dKSoA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDEyMyBTYWx0ZWRfXy7osmKTvlF8T
 3r/JSAcqbBZ5oePR+GwIcBYDO+w831j3+vjM39W3gSfLs1p8aAEa04ZJ7TXHT9JHmEb04jBVSka
 m+p2+hQFo4RMN65JpSKfT+KDJ3Abi/lEje/Om8IOMTVjE97qRKeOD+Q7KiR14uLfEtpki2Rl65h
 yvE+2EsgRNQfPa8eu5tM25jkaMc334vvPx5Dxxiej5kr9AYBLYMBVBxfOHRCJ8rwNKjcG3KNx6t
 VUCzpImjm32fmd4gxI7mFe5e30H9kmBKKYseDk5LKHmTvC4Wmxut/TLCKnMIgAy1PhTBrxgR/KF
 t3VjSm/V5XDGRwEzx+8hZ8YGKg9L9RGEBKOF7kvV787G0HIKrsURlddT6FPzPpLzC/J/Es/agND
 MICxs0sfH/WBrO+yHN3YibgIkqz4eg==
X-Proofpoint-ORIG-GUID: 5b9bLPMpal4s4gf-jIt-Nuw5elGxmV62
X-Proofpoint-GUID: 5b9bLPMpal4s4gf-jIt-Nuw5elGxmV62
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_073232_581934_6E0BDCA4 
X-CRM114-Status: GOOD (  10.51  )
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


On Tue, 04 Nov 2025 09:39:57 +0100, Nicolas Escande wrote:
> When reporting tx completion using ieee80211_tx_status_xxx() familly of
> functions, the status part of the struct ieee80211_tx_info nested in the
> skb is used to report things like transmit rates & retry count to mac80211
> 
> On the TX data path, this is correctly memset to 0 before calling
> ieee80211_tx_status_ext(), but on the tx mgmt path this was not done.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: zero init info->status in wmi_process_mgmt_tx_comp()
      commit: 9065b968752334f972e0d48e50c4463a172fc2a7

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


