Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 990BEC531C9
	for <ath11k@archiver.kernel.org>; Fri, 24 Jul 2026 05:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LFjNu1XAKmuN7VKnJSfcxCrzh/BqLfdCpDY+znNSwRk=; b=3ykPXiAqd7Vfx/lJx7sBzSB1ci
	3XJfO8OcNXhjVmETc/9FCI9pRW+j18/2AQ/fEs+/He9oNIQiyN8GqL7TXHjJA4S/5dJaOeErsXhme
	+rW3bV8qOO8XHm/PLilGpcwNkv1KsU96BLWCAAYXo/sLJsFK1B7jBXzkwtmSVM3HuWj4ZXsyfyQ2x
	QQr/Zqf0vrXWUDKG9qOR5xdlVhrPFOnF+XiWcM5KTeeLv7A9aiIonI4npBzxkJv0lR/NhzCVEFhtI
	BK3F1vs1tEtrdfjYjbaRzi7p0kcsIBPbN5noaJX282sTmeGMAeJc+QIExggjwUZGwgYw+1GcJteLG
	WJaMvDqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn8SE-0000000FVRh-3oGS;
	Fri, 24 Jul 2026 05:28:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn8SD-0000000FVR4-0AMD
	for ath11k@lists.infradead.org;
	Fri, 24 Jul 2026 05:28:14 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lUVh1510157
	for <ath11k@lists.infradead.org>; Fri, 24 Jul 2026 05:28:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LFjNu1XAKmuN7VKnJSfcxCrzh/BqLfdCpDY+znNSwRk=; b=QoTtO3bCnT420dz5
	C7SF5pA+1l5WwhrUtkbhKUryEVoQsoQbfOXJMUkzARozMW19QCLOSIEDjrGHGRvk
	fumDZaePvFE+OVr27zov9MssxvbrzuG519/K6J7Y6LA2dibjM5K+uh+M5hFMa6Ku
	y1VcvTujZlS55OBO9Vks9LmH/HoM+kRpFDTXDKroc/0Mm6Ju10Lzyh6UE7fqQ9kr
	VEyi4cofXsB52ayUQXQtsPR7TephJ2GQMvvQbpg8KvAFUGXlSxBVFTX0e3NmsQfG
	Z0NPGXXnczICRPThZcQs0xQKglHUEe8rhiO8yF7t2ZcQR7CmcQkW6SorJmiJj1TM
	2YCNjA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkusrs3ge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 24 Jul 2026 05:28:12 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84a251c2e3eso1519319b3a.1
        for <ath11k@lists.infradead.org>; Thu, 23 Jul 2026 22:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784870892; x=1785475692; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LFjNu1XAKmuN7VKnJSfcxCrzh/BqLfdCpDY+znNSwRk=;
        b=bzEKFXebwPNFr5SEO0i/sSr2KeEQk/0lhStYscCRNQ92Hs4ZbxN1G/TBeLLRkkyMOt
         8oKCdyvE6RdZ/+Jq7dbL/I7gWTDxVcMuVuGZQFoKHHX8siZFeHavltQ2V9XqVcwYApVl
         CxGHXtXwD0snhTbt9+Bnnp81Xabxj1Ic2cDDL79+5Xr/tWZgpSk14g0tA1g7SITx/r+8
         qIYGniD/HJXHAhbQDd0nisr+5avtusI/4ixzEpPKn6RrYzMLNApcJ4YFrDgCT7xsaZIV
         Ddv8RVt37sQ1Gj/XDf3GJcLS7suoDbt1GJe62UysvxGIRu7lnXPpx7X5qWRnja2F36EI
         lmiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784870892; x=1785475692;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LFjNu1XAKmuN7VKnJSfcxCrzh/BqLfdCpDY+znNSwRk=;
        b=d2KjXrb3Hdn3zNqgzcC1K4v/dnz2JF5ykTqEVhf8P2w4SGTZClBXTcDP+L+Ltn2Z6J
         GZlJgE2NEMIC0rd2o1FHKlQQBDgr9rdrgfIOnl6sU4/q/yKjITugUmk0cYfWBA1fcdg7
         E9wVtHEJJtYOojIPIdx+Kcd3pqfnFMpgC7HaB3YJS6i0+picdLNOTGSQx/VHdnnb4fhZ
         edQJX1PE3H1NyYXm36HN1c2NiW9AX1rdQ8gv/WO7dQhQxumXRK4LvAwry9RHfdKApQ6i
         GS4Y5POnqWGsyHS0fzrCFzl+8bOorK+ABcDexyC+bRKQM5LRov/THbchaOJ9vX/8iy2A
         WodA==
X-Forwarded-Encrypted: i=1; AHgh+RqLeaQc4DDIAqg8C0x8Hy+xzWvTw4PyF21XddMUQDGHz+qS0nDXtmzVMF46rpvOPWq3Jj3BqRU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxtodw9jPjxWNLVr0LpB5HEgq8M74PCR2ng2xPYryz35XmF7FTr
	xjGHebCEzanxLnde61PgYxTPdopoudW8rdavhXTzca5KfcGRYFku1myo5r5u0c0xKa7FQdTuhFv
	VVRwfru/9EOxcH0UaQOgA42ESiYWnsBsY0ryaucwYn+8P4cFPJrFFCM6VYtHx/QHz
X-Gm-Gg: AR+sD13XsfcfFoSOL5Vpx9NBMe6He166DVxOQ965vZsvVvphZwP2DdwJzdSKnT2Q23n
	NM+14IBGFoTGVxwUkwUPJZSVBoyYgWD83bF/VgVHgAJZX+abx7NxD/N1c9s4z7fzKFn39NbxkoL
	ycUMZHmsleDlEY/iEz7keYjs9ql7+X6+wayGg4eh8nI8lUcPo+NgGPP1eKYHuB3gzs0RtV6PYi3
	0BMWhhwqZwsTEo0tqVho7f98+aVDzVSB+TFTnpLBGNsPcmKZv4D9B3gp+PAoI8p3o56OND4bnDG
	hamM4LaeebmdunHKZKURrqep76j33q37AY+oH3Jev9lNsgVal3eG8Lx3OQTbyDaWtAfy9O8NpQQ
	f/144fjRQPDfqMg8rCbCvDTb53qvUcMlgr0P88mOpqhk7uhmCD2/Hm8bhi7xRYcAdSybFUnne
X-Received: by 2002:a05:6a00:12ca:b0:845:d2e3:b9c8 with SMTP id d2e1a72fcca58-84e2e8aa3a8mr5755456b3a.28.1784870891718;
        Thu, 23 Jul 2026 22:28:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:12ca:b0:845:d2e3:b9c8 with SMTP id d2e1a72fcca58-84e2e8aa3a8mr5755431b3a.28.1784870891322;
        Thu, 23 Jul 2026 22:28:11 -0700 (PDT)
Received: from [10.133.33.45] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e172984b0sm4081194b3a.27.2026.07.23.22.28.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 22:28:10 -0700 (PDT)
Message-ID: <4daa2ff3-f6e1-4cab-8c99-9c9fd0e61055@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 13:28:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath: Fix buffer overreads in CSA
 switch count event processing
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org
References: <20260723-ath12k_wmi_process_csa_switch_count_event-cleanup-v1-0-c01ef10bc6a3@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260723-ath12k_wmi_process_csa_switch_count_event-cleanup-v1-0-c01ef10bc6a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA0NyBTYWx0ZWRfX8d12TU4TLIzX
 AqyccO0lmz+5rHYMzXrlreZ43ChVCrQay8N1SVd/5yHSnl9OZCK+koYb6vMoKZUKQOZtEyJ1LKL
 74O+Vl9qYlRbVzLDOGeYp7w8aIN1fZI=
X-Proofpoint-ORIG-GUID: C8HeZLYKzlbLQXspgPmXVOxsDj9SNtHP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA0NyBTYWx0ZWRfX45W2KcVjFsh8
 dBlFOqsqjS6CCrZYsfe2hDV6sLJrj+z4mD0YsngPFuEbWPZzc/iJjguFUyY2ja5n0K8J1JJ+FIP
 AOT/p2xjASjrAP754ugVMkxAE5tAkTv2k8I7mzTdCnn4EDG+X3N3J/d78R78yOo6IFmqkzgoNSz
 HOOVn8IR1Bma7/+wiTZ5JsYMZH1ca03DI3r0jf3LBL2KX+JLqY0CGyPYRdkxUzvpg/I2fUnLv/y
 dpn/PnnzRM/+BnlZbj6PjAUpgsC6O8xwMEmGpnKDuo7/H38hznI+b0E2OxJ7b92DNQ+9RZwmPqZ
 IesjqTRQ9mxa4tRQEWPQJ0NO+G/B+2Krr3aAE+b36luRBsd0fcHbUJGQ8aH99F2GWTn9xOGoTa8
 QN8s4ktlCj+L6FX+AYknhEDlo7dW1vh8AZS1GJmK3DKG4A5r/7ji08WQPBFCC0hQmzvDXgJqVDF
 1Pn+r3dNuWxIwhYxLRA==
X-Authority-Analysis: v=2.4 cv=PtejqQM3 c=1 sm=1 tr=0 ts=6a62f7ec cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=2apCv5pjgjHDBs81cwIA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: C8HeZLYKzlbLQXspgPmXVOxsDj9SNtHP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_222813_110629_D43ED63E 
X-CRM114-Status: UNSURE (   9.38  )
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



On 7/24/2026 9:31 AM, Jeff Johnson wrote:
> Both ath11k and ath12k fail to properly sanitize the CSA switch count
> event.
> 
> ---
> Jeff Johnson (2):
>       wifi: ath12k: fix overreads in ath12k_wmi_process_csa_switch_count_event()
>       wifi: ath11k: fix overreads in ath11k_wmi_process_csa_switch_count_event()
> 
>  drivers/net/wireless/ath/ath11k/wmi.c | 21 +++++++++++++++++++--
>  drivers/net/wireless/ath/ath12k/wmi.c | 16 ++++++++++++++++
>  2 files changed, 35 insertions(+), 2 deletions(-)
> ---
> base-commit: 0ceb105245b5e57f803bdc0e79dc077fc06ff384
> change-id: 20260716-ath12k_wmi_process_csa_switch_count_event-cleanup-7fb191b7d7d3
> 
> 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

