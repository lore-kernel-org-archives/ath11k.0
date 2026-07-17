Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5817C44515
	for <ath11k@archiver.kernel.org>; Fri, 17 Jul 2026 03:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eRfFbQSTVRjImeGnvr7MhoODIgLAI9+WzZ3nMX5R2Ds=; b=rtAxXT/Jr88U1R0wuB7Y5SFrfn
	/AbrdY6QzOrKDR8/Y1qpimtJUY7ECIzAqVJ/crehfOQW1ohUE9WVjgcDfKEmItM9h2smYu6QOlWI5
	oPng0V0jSThqnoEk2DK3z8OoE5qSzwA8u/Wu6t1GH1olZKxz1zB7Ai6hGbl7pIiy6p3G7DLhj4pYH
	uNirUESvuTJlglUIHMAY3hSsd1RSWqHwl6CC6qVv/mCfQqO4pi6hgC53g86fBf0yM8fEld1p9yAQI
	Lf82RL6I1VycL/yohHwUXLF1FRmduUfQVE7qu7Y1f9aU4OaDZPcZ+4RrMJZpEzdMWRtROVe3qbkDo
	/iafn2EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkZcU-000000015KR-1XYw;
	Fri, 17 Jul 2026 03:52:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkZcR-000000015Hp-1gTv
	for ath11k@lists.infradead.org;
	Fri, 17 Jul 2026 03:52:12 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H33lma469389
	for <ath11k@lists.infradead.org>; Fri, 17 Jul 2026 03:52:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eRfFbQSTVRjImeGnvr7MhoODIgLAI9+WzZ3nMX5R2Ds=; b=d36uEv1E9y3S9YxT
	4s1lYBgLMdPmWoDW5X2LD5jo5ELkN+YyvLohATfW8xem+v7LKUCWnRY7yx0Y0SMz
	jOTjA6AiG3s3y8RIv4eUD64jD2YSZ7aFi853OdaMqsIcZ6pmmLstS/1/a1oKjISz
	0Qij4HGrBS7XcatAT6CT0rVjtgRMz2QDfRUQXJUt1DQ7Q8rBVp0Nvj1Y+vJlDcSW
	Cj17wCrBWLgdcNMT57+sVq/PIXr+D9oba3XmHjvH7iMe+3hd3V1B1lIqB/EApnMk
	czrCYF7xhEhTjIyD9ghjEX6UB5dFrgmuCkM7wstHPbELi0TEuSDbwyP5eEo4wS+P
	U12LNQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff2f2tbbh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 17 Jul 2026 03:52:10 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38de842a1a9so6691834a91.3
        for <ath11k@lists.infradead.org>; Thu, 16 Jul 2026 20:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784260329; x=1784865129; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eRfFbQSTVRjImeGnvr7MhoODIgLAI9+WzZ3nMX5R2Ds=;
        b=IcR8Ojuh2lles0bKUQNbGnsRdyXKSJZnRpIYjL+9wQ8l6Yw1wcbp4JjPtHWvqtQvJW
         2eSc7uQIUg29Vm3eAlfYS9d9TRjECJGWb8P2HRpQ9thLTjjYMWmKSDaRZuZ1SHOveeLD
         ZpiXrDJD39SHsAoevy8OPH3POBybv9ngU1Js7erXxOEpww6ywHS4bGXO7xVgTOCvyZco
         pyOhHUqH40SrM1pDdM9wwQ913ND3sWKrh6/3rO24zTmV962WtSfZ79x/F5x1Xvd1I7zG
         D1B4MQVB50dBGQbw0FcYURUdpROSsHp114fe29U2YgnJuCdGNRSdVEMnP63R/Kiq/UzJ
         NSrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784260329; x=1784865129;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eRfFbQSTVRjImeGnvr7MhoODIgLAI9+WzZ3nMX5R2Ds=;
        b=tQc4H49a5/tWfG/jIYZkD66lRFmgkq/mJrBN8OZ78yEpmrCrjde6g9IbLHwgFykRf+
         DJOrFk2XNi6rw90haHjaHEtAQWjsH+j5VK8m21dM94aMVOp1tdplqHDksNirAGeBTCd6
         RyRR30J6udKRM3XN/Ix40zuUrzuhttAN/CEXHvdPZ0EYjxSN6gt46dic8eFrsHVL5MbD
         b2FAoOSQiEzuNOhyrJeXw6GxFj5/Rxjfr8muJBYXpXfzYNMWOKlRLamNqD8I3a5clVR/
         IxvEChOgjANU467fTZBfyFj+NtLw6SHcQvdmVG7JawQG56ZhZgBgh/UYOm/YpWa0BtCd
         KfVg==
X-Forwarded-Encrypted: i=1; AHgh+RqANupVAT4RRx+baBQH9onaRGkSxsl3FfT+PA7eCFzKfn6Rl7rmEqaYFGaeAckngX01MFs062A=@lists.infradead.org
X-Gm-Message-State: AOJu0YwFCcWmwACV8TzpczYPx8uVuqSkQrRCYnMtewcZ8Bnmr5dPCqyq
	G6yIoPmUa597ZJ6Qg8nxJupzmbPfAAyg59vyriNJEhYscY3jkAbs2eA/QPWBs4kT/2hXKijEO13
	RSlBy+kjdjtpdhWzhgNme+LeRwGcIaNOuTC0bp/6ghmusOvhMLqEZROB10vJX2csu
X-Gm-Gg: AfdE7cmo/yghW5WhYerzUOPItz8sAMe2uEZklc/e24QfYpQcqlPuOpe8Dt3Ggz/v0el
	r3OtHkOIJOcazUa/yxdSm8o+DDt7FsFjOioiRSsvt7IS+nCmaFZqHd6PQSrE2V1l76IURCdpYGw
	2HfssWjI7L3GTjSjhWjU9s+4YEuvnHWkBT34+rLvT95ODHokMKnxXlZ+ORNBazW3B9AV12Vwgd8
	FqXKk/aI0JRGKzOW+agD8e8yzR5216LJJHN6GUFMfFTVhIkwWvtxMivzQBg6qGbF8vl8Kt2MdK+
	S6jd4KZ8M3P6TfcI5XF8SG2SED75JnyF5JK6Y7EO4/91pCc8Upz4ZSHoanLT32vrZx69fYU/tDK
	GbMZU2ZtC7HlhOQKvkUiYl110FwGStcklVGKdPJbm
X-Received: by 2002:a17:90b:2692:b0:38e:79f:76ad with SMTP id 98e67ed59e1d1-38e4b52efd9mr821520a91.23.1784260329424;
        Thu, 16 Jul 2026 20:52:09 -0700 (PDT)
X-Received: by 2002:a17:90b:2692:b0:38e:79f:76ad with SMTP id 98e67ed59e1d1-38e4b52efd9mr821493a91.23.1784260329013;
        Thu, 16 Jul 2026 20:52:09 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20b1f3sm1640072eec.26.2026.07.16.20.52.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 20:52:08 -0700 (PDT)
Message-ID: <428bfacf-1ab0-4c7d-ae5e-6311c7ac0882@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 09:21:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath11k: Avoid buffer overread in
 ath11k_wmi_tlv_op_rx()
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260716-ath11k_wmi_tlv_op_rx-overread-v1-1-0b972b3f1368@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260716-ath11k_wmi_tlv_op_rx-overread-v1-1-0b972b3f1368@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: D3FOk17-el6Rwg09hJscmKcUNgd6FCdb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAzMiBTYWx0ZWRfXxTNzukQujADH
 HudsXRekBw3loqMFw/y+lXemAFjY/v+a2Zc7xcpzxYUPlqMX2yPCR3feBd49prnAp6GxZ1Qhtx8
 OTPBgEzI0QuWgARa91upvO6313PyD6A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAzMiBTYWx0ZWRfX7isWkflpyLUX
 s/Pw1aLGt69uHLrfMlYkUzD+Q95GFYFGyZPcQlSt8zodkxbZM01b4YjEHJOaCMF4hhCQyPt7FO0
 xvFwUxY2VzaRW8Ekw895RjpM8Jn0kEaHruBF8pNQAsmF6irzpQaUiJjzclaI/T7aui0ZydURlAB
 BOejx+ZPlT7VOcwnd0trBCSmXR5Ivxwo17dMy2/jK4PAlgLcwsIOMBXLiodTtvCd0K8nRZcL88M
 AWZsz1mIs1CihARNt6x8dVdQDEgI3GiC4+TvoYl6o7Tf4pkWNI+xBaIakvgzWe5y2kDFJ8cqtPS
 t/30JvaUtEl3CdvDNYXxqARdxbXflVPPzamqf1kSNohQGJpQ60hssU16BaOo/qklQoRBrFMjoTG
 SW9sSecjb2q9OxvhljLtC6IF/+4J5wh6mcIPE4rmIzhSIWvVJNpSgwsIPIl1SDrd8roMDNjs8Ti
 vdo797s/xafTgS8l8vg==
X-Authority-Analysis: v=2.4 cv=NcTWEWD4 c=1 sm=1 tr=0 ts=6a59a6ea cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Lj7BFKMBFr4BX5uBSNYA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: D3FOk17-el6Rwg09hJscmKcUNgd6FCdb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_205211_593902_1EBC3974 
X-CRM114-Status: GOOD (  11.64  )
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

On 7/17/2026 1:31 AM, Jeff Johnson wrote:
> Currently, in ath11k_wmi_tlv_op_rx(), the firmware buffer is read
> without first verifying that the buffer has enough data to hold a
> header. This could result in a buffer overread.
> 
> Add an upfront length check before dereferencing skb->data as a
> wmi_cmd_hdr. The check is placed before the trace_ath11k_wmi_event()
> call to preserve the existing trace semantics (tracing the full raw
> WMI event including the header), unlike the analogous ath12k fix which
> could use skb_pull_data() directly.
> 
> Compile tested only.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Assisted-by: Claude:claude-sonnet-4-6
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

