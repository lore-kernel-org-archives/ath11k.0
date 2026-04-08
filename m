Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 950FAFD5F7E
	for <ath11k@archiver.kernel.org>; Wed,  8 Apr 2026 06:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v0EWSn6WklXDbV7L1GTeMxyO36jOW5P3v4CqHJu5cpo=; b=DbYc13qymZVoqD49MAT52516CM
	7Chzk4I/tGQmmr3iWeyX1RK8PkjYip3B9e2y2u5HHzQSMoiC/M+C0JdRmiHuapmdllmCZrE5m/Uws
	k8PwFsEpIZeZS8nEL8V7QUXV3oWqIdRDl5lhRXa5ARbflj8EsiwYCHdcqiR+YNl1DAw7XkInBOZay
	MNFC9f8KL5ozkSPEuJVNe+cu5OxZ4eyP1vyvUyMilz2nYkRJfgfma3AvNlhkLMl0f345vGDjfwpP3
	aBB8n2pllfkAfQa4KulUEWUBOtMdnGtTYAFxIp8DeXFVGQGtqSR8tKZ+cD57LjQZMqeawp5FJ/Jk6
	gQGvRPFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAM3H-00000008Jh5-0PRo;
	Wed, 08 Apr 2026 06:06:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAM3E-00000008Jg7-3YaU
	for ath11k@lists.infradead.org;
	Wed, 08 Apr 2026 06:06:10 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637M4MNd2860432
	for <ath11k@lists.infradead.org>; Wed, 8 Apr 2026 06:06:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v0EWSn6WklXDbV7L1GTeMxyO36jOW5P3v4CqHJu5cpo=; b=SCqbc9dbcvjp9zag
	sXcMrMzInXJcsKcg0+8Xl8KK1RqI6vj4HzVBIQAFpmUQ5sjYObWGhR6ZHQwBqHxn
	XMZnOd8HreqbHjJdpx20WwTwZc9MM6ebnh1NoDdJtxMrLrXFHPpnLFUcmWexMZTY
	Sfg7VeKUk4/zmDJrQNlLPIzE/7mjAqXCzPh6Fy+PIqE089lBV6z9RLtbLHJnlLQU
	dyQ9EhlHAH71NWU3vHo6SUSHnbAdzhtUC5w0yYa11k6haFbcRR9vp729x8WkTsbP
	tPq4apZ0DnGjKtOXpBDUJIw64cmNRMLo2HVpXVudLOIfExcVNRnZaqFlKwhQ2mCz
	pMhoGA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddad8s834-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 08 Apr 2026 06:06:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35c1874336aso12804665a91.3
        for <ath11k@lists.infradead.org>; Tue, 07 Apr 2026 23:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775628365; x=1776233165; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v0EWSn6WklXDbV7L1GTeMxyO36jOW5P3v4CqHJu5cpo=;
        b=Dvfx44r/DtrABgPaCkCMTqj527zGrB3+p2EfYR+u4Faf40L4uGcxqa0ZC24EfnfOTX
         pvNhKenRbSd800qMM5pWdeZp3OgloD7ZtkCwMh5lForilhgbuSgJxBRJwu8LAlC3q46b
         vv1JLy+SnipXwS4xo+cmbIiEyalLVz67NplDZUC12XgVGv5Zop471JR9E6IPQXhXfcPY
         /6DzQBuDvHb7RcE4GF91B8mKgocukS3ZFd8dHJA18G2yrJl8BmgLR+6JnEQKSOW3RKGb
         9mmUMqB5JJMqC9ee2f0WKxwf7Prkequ+uwjhQFkVWXPy79kXKWgy4boNmISSKcaEw3N5
         iSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775628365; x=1776233165;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v0EWSn6WklXDbV7L1GTeMxyO36jOW5P3v4CqHJu5cpo=;
        b=C6SwBLn1JUAQON86EC8Zwh3g0y/4GRhKEVmKCocUaALQQZbSJqbTEZF3h0WuORnkX8
         myZf9Y8remjxNM6Fhi0FgWwc1L7BYb7WXrgmv9mq4ep0E0ZjZ3HCDpgNwdQTtnfFdzHm
         Bh8dbFJ5CgwVjEu8HpzCjC0Y60aA4EZWa2FXQ4S3YpLRa7eLbysgZq7WYjQrIWvRJfGG
         MAsdfD57mSsrQeTdnIMHjMVO0dexHd/Cw49huJsTnt9sO02OHYB4K14xVAnJJ4R501QJ
         Fhxl8aF2z7Y019eysLtkHYwn0gFTPZqvRtDQROC0AnnxNR2nMe3YAsBvNZ1Rw7Tme56X
         RRGA==
X-Forwarded-Encrypted: i=1; AJvYcCWsVSXk8F/jm9wfim8rb/BTLuNbU4aLzUvJVexd1KUkz1f/0PPZH7IulXs4kNXDxcvorwBXn18=@lists.infradead.org
X-Gm-Message-State: AOJu0YxStzUs3uniQCGll6odGoTiAU9HUlV6OG/sGp4X8U1gzPBkoOR+
	mHzBmkZVgYqSgv6s+CTxOIRohqeN9EmwRtL9+jkEvZv0KBz0fAzPwlNZyIdP5R20i8Hwpa21dt0
	q895ybH8p1wSPvn6ucBGgc7FE9qtaDBp1bAEcDyhV9YxUBYpgAuLhjlCs14ZiUaGM
X-Gm-Gg: AeBDietqhw1dEXNsMTFy0WjaHSUrpzdD2592gI3jmarIXqpwmj4jwCI+G5Xl/0lXME+
	aiOikE0FMOYrnSH711I6U0ppQa74SJketEshqmjf+NoEvwpE5uKsOhhKXKUAkzKFcM7QlwgELTr
	m5+v0SkFc0D5cplUmbZ7s0zmOv2kJsuuVWjeMsE9B7iXQZckPkE8xWNmzp8MKXeRGitEh5AefKV
	vY3APWsmGsjygyS9J5FC17wOH1As3v+k3Xj6aExXecPCOPJyc9bABQbTcKW8RDrXlBYuzgWzYKc
	HjG7C0oLUXmEIR8DUa7iZDQGMH/mLvQnmOXjQIoN/Fi0hrHmJWsFdhi8mQ7JMgTKKxrkIR683mW
	3Wh/yz/u7k9S/DYf/wDzKGtnjr3iWR/SbYhLXcU0WC+MkBbKUc18SdSpVY/prGR8hD4Qupeu7DV
	2AB7ITZ2YyqN1xE3l+woI=
X-Received: by 2002:a17:90a:d005:b0:35d:9d28:e897 with SMTP id 98e67ed59e1d1-35de699f483mr18753247a91.28.1775628365486;
        Tue, 07 Apr 2026 23:06:05 -0700 (PDT)
X-Received: by 2002:a17:90a:d005:b0:35d:9d28:e897 with SMTP id 98e67ed59e1d1-35de699f483mr18753218a91.28.1775628365004;
        Tue, 07 Apr 2026 23:06:05 -0700 (PDT)
Received: from [10.133.33.204] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd36a1d04sm25128122a91.17.2026.04.07.23.06.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 23:06:04 -0700 (PDT)
Message-ID: <ff11954f-345f-4865-a86e-759aa167768d@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 14:06:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] wifi: ath: Use static calibration variant table for
 devicetree platforms
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Johannes Berg
 <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
References: <20251114-ath-variant-tbl-v1-0-a9adfc49e3f3@oss.qualcomm.com>
 <2fd84ab2-2e3e-4d05-add5-17930a35fedf@oss.qualcomm.com>
 <jnggqxqv3rjzhyevovnnxzplfhl3t6auhhvmoz7wxmsf6awgdx@dusdgxwsxvts>
 <b8277024-f9d4-4f17-946f-c2c390669067@oss.qualcomm.com>
 <exfmj52dqu3uctwsb2gopcjg7744vq5avlkahtmgfw4opw4mfl@t2svrln72u53>
 <f853d9b2-47f8-47b5-a02d-6aa8f12a4283@oss.qualcomm.com>
 <trr5j57vwk2dhoibdgdxnlkftnmfcmjkwmicsiltmhybxanjaf@tzaeeqcyz56l>
 <fasihmiu2szj6m2r3qef5slvzlvdjo2ajhrd6xyqsa5cajrbzq@a5dyulg2dnac>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <fasihmiu2szj6m2r3qef5slvzlvdjo2ajhrd6xyqsa5cajrbzq@a5dyulg2dnac>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: FtB-bjhAayrSz1J8rO9Pu0_HV1Fx6WoZ
X-Proofpoint-GUID: FtB-bjhAayrSz1J8rO9Pu0_HV1Fx6WoZ
X-Authority-Analysis: v=2.4 cv=EoDiaycA c=1 sm=1 tr=0 ts=69d5f04e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=eKx4iS3zDsI69C-aG7AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA1MyBTYWx0ZWRfX1/pXkjsj4p+L
 WiyVS9E3HsiC8jrFzsCEGkW7OULwud4exg58Rz4nTcXoNDlMCSHS5yDa3s9+fAcPsTW9HH6iKyU
 pEFC43ok9nJ6lI0vM/2vqVY/ngdBxMVrLhtqHpUhKXe9DmGQb1FoOBu/E0CnzgiYNEhbaM2o9rN
 zSXS00072mCZcjegsBp1CggPcC2/XWym2YzrKlx/XAucnjCBx/aOxtaxm7hMr/jR4q8h3UTvjpB
 JbpTGB1WB8MlpPWkDUuswVf7fM5WmQQ+mtnjlngRwXqKXd+MIOPhuKHY0QhardBZDx8LOuWucLx
 YRhvrFuUCKE7d7XgLtW94sUpF1MbBxjVul29K6jwBdnQ64nzW1Pubc6LqzOp9Jfth9vrb1owJTv
 WtNWEVt5hlUIPZ95SMOk730733phVsQYeByc8zoaVeVezKCrROOdlZx17AO3MAGrbIahyGbrw90
 rgVsay1KsyA9ux+NNrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_02,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_230609_004739_75B142D3 
X-CRM114-Status: GOOD (  22.70  )
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



On 11/25/2025 5:57 PM, Ernest Van Hoecke wrote:
> On Tue, Nov 18, 2025 at 12:23:20PM +0530, Manivannan Sadhasivam wrote:
>>
>> ath12k doesn't seem to require a calibration variant. But even if the user
>> replaces ath11k chipset with ath10k one, the calibration variant should be the
>> same as it is platform specific except for WSI.
>>
>> - Mani
>>
>> -- 
>> மணிவண்ணன் சதாசிவம்
>>
> 
> Hi all,
> 
> Jumping in on this thread to ask about how we should handle variants.
> 
> We are using the WCN7850 device with the ath12k driver and received three
> board files for this from Silex, signed by Qualcomm. All three support the
> same board (SX-PCEBE), where one is the board file to be used for the
> US/EU/JP and the other two are one for higher emissions in the UK/CA and
> one for lower emissions in the UK/CA.
> 
> Since these are needed for regulatory differences but support the same
> board, we were wondering about your views on how to handle that in
> mainline. I see that there is no support for the board file selection in
> the device tree for ath12k, and that there is some discussion on how to
> handle variants in general. We are using a device tree-based setup and no
> ACPI.

does your machine has different 'model' property for different BDFs ?
does the existing ath11k 'calibration' property based mechanism satisfy your requirement?

> 
> Thanks!
> 
> Kind regards,
> Ernest


