Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2A4CD8CB2
	for <ath11k@archiver.kernel.org>; Wed, 10 Jun 2026 05:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ilf9Gb5vywUQDri0aR7Jt3+ZugqsWowi/LJkwrMVpbM=; b=gSPN5i/Yr/3nkzSqNmEZrWd9a2
	WwQ8x594ZDMxDjPIewOhj8F+C1Pm9WLfwO9RVN0qMkiHGeXFMH7AJUCYGJ/nOShhd7sKpwrOuDR4Q
	gTD6gY2ABRG4ep5KhW3gwf/ZohmqRqNMyaW57fx55CjoBJmZSklkBCMhdQz9Zi+fBJDECl05KfE9P
	lSyJcA6dDtc51wzCmugr2EzLl4AsTZYQfe0aq1PQrk3Q/6BamjGOr/OeaNN46YG3pp4YGTPCrSHel
	WazXmteN13YTLRPUaPfuDOw5i25+i9XE2BTFSbDwuwEzf2LtUK2n5yNW/iyiLMEcUSznwYJRE8c+W
	RNnOS6cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXBmP-00000006qGE-2iqY;
	Wed, 10 Jun 2026 05:47:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXBmN-00000006qFt-04Qq
	for ath11k@lists.infradead.org;
	Wed, 10 Jun 2026 05:47:08 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2efMj241014
	for <ath11k@lists.infradead.org>; Wed, 10 Jun 2026 05:47:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ilf9Gb5vywUQDri0aR7Jt3+ZugqsWowi/LJkwrMVpbM=; b=IxVJhcc16SDq3vWb
	AooClzy1YkDqGWsUdXQPISn/pAG+pv2jDjRlrAPG1vtJCNb/CbA5bV3lZiPWQS+I
	HAJCGSQgaLk46oWBPSaweyoB8GJMLF7vaf21eqHMftcdiICNYrc5DZc0MPk0ka3S
	ZSivCAhhp7M9dIeLDvmX5Mjrj7itQUqnAocd/skkzot9kAbZboZPbxpdMVLhoJDn
	JRIPai81kOdlXHXCej5FMbBrZecCWt3gjgLohgRiUCwFpOnQP34HveacwUHpMGne
	nP/cp60m1D1PfTDB3kPURRb99iVlvbdXVPxmDY8PmliWNyic66RAnmc5yLjR32Vp
	H8HOLQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epukesead-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 10 Jun 2026 05:47:05 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36bbcd40642so4855411a91.0
        for <ath11k@lists.infradead.org>; Tue, 09 Jun 2026 22:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781070424; x=1781675224; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ilf9Gb5vywUQDri0aR7Jt3+ZugqsWowi/LJkwrMVpbM=;
        b=WezpgzCyWiqr+ftgEUHNBuS52slI0mudn4vtX02diU54Xas2vmTaJvPNmmUz4XpyG8
         +h3O3gSH5afvtoAaO0vkWIaTGtMsX/OoL9Qn9i2P7OjsejTP0S5gcyoZYC4g8NtBQLF7
         QxjvS8gf8D7j1sgtCDsz+AoUoRhB3J3Ke1FHTgZnJXkHjvgUsFNpzlPuiRlxjec7BBNs
         YzFBUH9LeSRjs65ob7vAzMaAgRKqxPmCWY5qCEtt8oiGAkXutLL66QIywu9vVPb78PZZ
         eJECS4jOrhKzswXCJU1ls+veGVd92S69AEsBg7OrbVIxwxQ7dW9VdBnheJIgneTjjnQr
         b5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781070424; x=1781675224;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ilf9Gb5vywUQDri0aR7Jt3+ZugqsWowi/LJkwrMVpbM=;
        b=Y6dRBbEcJUGJ7awIivyO2IswzHgx7awrXPvYUKyKdtgdwZTk3leoHusGbMxGlGF7f3
         t5zukaTmAgjCUHofpJD+Ann+LLKKLaVNE1F0TDRi+UPdLAi8s5/SzIra89zqxyiSE8y3
         QKkpOB4mv+MzXKOY7P2dkdtfw2DVHZYZbuXoJ5LAOlvu0Eb1ZZNitnfu6ppZUSC672Qt
         +sKRLJFlcYCM2s0CJhevgYgsew4RM+YB45L9YJpWCmzbuF5Cu0oCZkRrc1sGijcP7aof
         CN1lk4/wth5Upx7ZTNK7PmKXGH7GcR1w0+yoHCeH+Mf6NK9WlKH0+U1MsXGg9cZ8O9bL
         +/tg==
X-Forwarded-Encrypted: i=1; AFNElJ/Pu4aaVC3KuNHEATtNxYhj7RdBGHIkKKjZtcrYLij+eQoT7S/MeFc1VXuSBgDDZUIJxisnajo=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywx+bPz4lm1poJYHjtosg10i/v/LnJpaRvE+WV4aB4PdJ9SD5DR
	+ibogsGNHGYpWiBgBhRVJSBz4upnk95ZVvMEW4FRzasu9kK6O98BV2XeIPRi3BfYw5WxYH7weNk
	yWwBOsZIJukA/JWxgroM3MEHEtBnKLgA/w0SFU4Vp1CKXbzKR8ChpcjQ9aBaNkDmA
X-Gm-Gg: Acq92OFbWRcqbjQtWWh/110o6cRraM7OLfSF5PzACKk0CgSK5pI5bXe6k93tU50e/O2
	p8cQJniAs4H526cMtLehvAbuQKkakR97HX7jyoQlugTutacqCW/F709SXRAX8BNMHWR4+jr4+4Z
	hmMA2VFqKagqOoKhOGCS3S3h5HX7uR/JROV2paqJ70GTwu2MWMohAiYSiWQvFMTtHy0I8+0tW6c
	CAHNKXDHI/MGkhdXP26BnzJF/EGxF1jdZQjvss6ixrrnzd9f4v8snotuqw5NwkKn1P7+ssRoCeu
	OKBUhmi5IVF8APlxBpMFONMQ5I3lHddQjFFR0wfbMvd18hc4mMVkNr/lVBn5GrjO2ShFDXA7N/Z
	vz/xWOV1+FG/UX+ifTC0It9RgjcYECsXk/Muj7cASd0Cjmy9kaAE97IrZrIGj6Xp9fOAtrN7m
X-Received: by 2002:a17:90b:3f88:b0:36d:e051:7b6a with SMTP id 98e67ed59e1d1-370ef1f3c52mr24237146a91.12.1781070424205;
        Tue, 09 Jun 2026 22:47:04 -0700 (PDT)
X-Received: by 2002:a17:90b:3f88:b0:36d:e051:7b6a with SMTP id 98e67ed59e1d1-370ef1f3c52mr24237088a91.12.1781070423364;
        Tue, 09 Jun 2026 22:47:03 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37621852b31sm1387776a91.6.2026.06.09.22.46.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 22:47:03 -0700 (PDT)
Message-ID: <cc9185b4-741b-4232-8907-a85872c3cf59@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:16:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ath-current] wifi: ath11k: fix NULL pointer dereference in
 ath11k_hal_srng_access_begin
To: Gaole Zhang <gaole.zhang@oss.qualcomm.com>, ath11k@lists.infradead.org,
        linux-wireless@vger.kernel.org
Cc: miaoqing.pan@oss.qualcomm.com, hangtian.zhu@oss.qualcomm.com
References: <20260609090609.4041009-1-gaole.zhang@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260609090609.4041009-1-gaole.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1MSBTYWx0ZWRfX2WwwzKPMpRNG
 98uyebI1fNwwRzWNATOTwrM3zK6A2HuN7MMRZ7VLCcUgOymZKEYHdm8GWf9v8xeknCkxoi9jhYj
 usWKwyIPLejfxfZ8YLinPUZfapEspu4gXF8jXtQ+so6atBDboXvj/WWUbGbVHpRDxjWwKSW5skF
 vs5y5VjppeREYaD7makDux7wPINsD401kqVIlKNI2BLRAZk+JliBewzAcmsB9yK3mSM4JLohKuZ
 9Pk04nDzWkk7AFsaKHq+aauUWdbuLWVVd5s+yA7ly/UvJJGJmChJJkSPeH/ltj1IwBGScYHTMn5
 q+w2rwZid2qrOEKkak78wdOvYE+Xo1YsdmaAdwp3es/lee0jcLwsQIH+7luZtjkqF4Y8JsLPX4W
 7ef84o1XhYiJ4OrSZYKkiqcL9ExsdIpdBekZUZhXopItsji9ecqdihE7owdSsHrb7Lmsr7lcXUO
 omS244+nJIPL97QJ6Pw==
X-Proofpoint-ORIG-GUID: xiHF3d5xcYL5KmEdKrYCwv_NmBT8g4ln
X-Proofpoint-GUID: xiHF3d5xcYL5KmEdKrYCwv_NmBT8g4ln
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a28fa59 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=E4ruc0QeprPoJUAD4lkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_224707_179819_FC3E6878 
X-CRM114-Status: GOOD (  11.00  )
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

On 6/9/2026 2:36 PM, Gaole Zhang wrote:
> In ATH11K_QMI_EVENT_FW_READY, ATH11K_FLAG_REGISTERED is set
> unconditionally even when ath11k_core_qmi_firmware_ready() fails.
> This leaves the driver in an inconsistent state where
> initialization is considered complete although the firmware ready
> handling did not finish successfully. During the subsequent SSR,
> the driver enters the restart path based on this incorrect state
> and dereferences uninitialized srng members, resulting in a NULL
> pointer dereference.
> 
> Call trace:
>    ath11k_hal_srng_access_begin+0xc/0x60 [ath11k] (P)
>    ath11k_ce_cleanup_pipes+0x17c/0x180 [ath11k]
>    ath11k_core_restart+0x40/0x168 [ath11k]
> 
> Fix this by:
> - skipping firmware_ready if ATH11K_FLAG_REGISTERED is already set
> - setting ATH11K_FLAG_REGISTERED only when firmware_ready succeeds
> - setting ATH11K_FLAG_QMI_FAIL and aborting the FW_READY handling
> on error
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.2.0.c2-00204-QCAMSLSWPLZ-1
> 
> Fixes: 6fe62a8cec51c ("wifi: ath11k: Add cold boot calibration support on WCN6750")
> Signed-off-by: Gaole Zhang <gaole.zhang@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

