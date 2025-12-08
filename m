Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482E5D3B7DE
	for <ath11k@archiver.kernel.org>; Mon,  8 Dec 2025 10:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=27ThYATAAINPTWQaE34A2M4rAVZ9HYZXEadsbnAE/DM=; b=2HslPxto6t9TmGpzgxsf7pbhl3
	ulC7TOiw/JaK/FiwT3TB5AQlv2cntRr+1xkFVlMqXpaJWEUxEiCJnPP0p0kMPALAvRV/QM1ig9gWS
	YaLel8Hi9DulabJK6II4PQVwsmieb1F6g/zBUVfMM/KkrNrXRFEOtU/ONO2kqTp/sZsGgvHZca+g/
	DdajgPKqCRsjGXnWNkHI4qC++aJ1nYA/kUvqrotXcSayvu948ad3emaycErxWCQ3QwKmRKWZiQWH/
	hM0JQfqauv+DrYx07jk0RiFqBMMztRb+ppFyI26nYo54K1WWKVpvpTX6Dd4cqbmHrC9j7ln/sCj0+
	7W4GjjdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSYPP-0000000Cwdr-3DPs;
	Mon, 08 Dec 2025 10:23:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSYPN-0000000CwdW-0Pqq
	for ath11k@lists.infradead.org;
	Mon, 08 Dec 2025 10:23:58 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B88VvHI3416185
	for <ath11k@lists.infradead.org>; Mon, 8 Dec 2025 10:23:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	27ThYATAAINPTWQaE34A2M4rAVZ9HYZXEadsbnAE/DM=; b=DSHkygpFDkTJ/8gw
	+2YWyWoxmHQjCOYCObL28jJykWlXTL9WFwSLnOj4yzBUqmyYhCUc2ZEN/3obC88n
	RYd50BelXYrmDdudAoXAV7c+ZRNyYRXmYTVWLSOPxUA5utJya+JpGFca1yTDKIIs
	PACuUzSrDXptBKAzScTliuw6oahEBlYdGJrrkuYxAgpmFxvZaRdbDntp9aGTjzot
	jC7x+VVq3TIjikB6pCr3A1tjqNWLFOvPQgGNH8xRmH8tAab+9iLKTdYp7TjDOSDG
	KNp0IKbzVXK7SBMYxE9NBvOGxCYdpcsVR054z4KfdlvR1nB/oJ/ASHSnjimrsa5b
	rLoY6w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avcv84j74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 08 Dec 2025 10:23:54 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b4933bc4aeso4025604b3a.2
        for <ath11k@lists.infradead.org>; Mon, 08 Dec 2025 02:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765189434; x=1765794234; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=27ThYATAAINPTWQaE34A2M4rAVZ9HYZXEadsbnAE/DM=;
        b=R5SZsrT6H97TP/BxhZoxptCGsUcRiBEZIi0lye6SuMpybAsP1/LXOCoFPVqOM3S4Yh
         JQgbaES/3KmhtbfKzkKS6YTkfzhX6iLhwL3F5GuMgSO0QTkt6w3dXM/OUMqaCa63eSK2
         weOdZk10IsdWvww11MMc1LojeSFG2IyjqfRlnL7298osj8AowlupFSF0iqUfChDUjHk/
         hxtT35CLQgDUNKqAQ6Ir7Tb6V9aw+LR28DF+NkaZ1/zWZ3y9xm833x2j85greaGtbrux
         Xbvh7fwXf5wgrfNjbSjhETrPxNNNXMPES3z55z4Fh9Nb/7z9PFO0H7jeF59Fr0X/50Qr
         P24Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765189434; x=1765794234;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=27ThYATAAINPTWQaE34A2M4rAVZ9HYZXEadsbnAE/DM=;
        b=n1zxWJMHKvcpCBPY30QhK/quqh646OUfoErZGySsvn0VNinj4K/JzmogKVplRr7E5A
         bXsaJpaWZz9Szs13uMsmlck1ZvqovAv+/mghRfA/yvrgG6PJk4reBIxo3KaYPfd1tDVS
         UaIsNU3AQwEcY42y8Wta1Pyi2OAZJ/Ll/nbXpXTrA7QmJFCodS/KJnn/YmECzfidZcU5
         DrRc9oVzL5rI8SvR9Tk8w9U6VDrvMtVGiSlBtzWQGfE6V80/87ZCshSDsZsnJjbvah6M
         /QdV+YodvB+PedKwmIomj4AmerWRgF8lzaA/glNN2Pp6B2QnBRE7i8VFpixvfEThJnsh
         /MBw==
X-Forwarded-Encrypted: i=1; AJvYcCVzQzNKAkI09p75gSTUzZFznSag5dDqQua8/qLdx9PwdTG2jMbPdOCqwt9eaDLYtZCBUYz1f30=@lists.infradead.org
X-Gm-Message-State: AOJu0YwvQxkLnfE1xdatk81rhI8EtcrL7V7nhxjsxxi6uVHsLATCC6aW
	AYAhi3UNMhzjQkh6Pq1OmtzGG215QPIMYwtXHC9neNxRVdBzsUb1PtkuhUEwc4nqYahzO+FplJz
	a1gR/bFGuUkTXTof9V0AziekIUkna212qmbhyRZBMKLKeubl+rXiJSY5GgCRay8N3
X-Gm-Gg: ASbGncvDtz5FQRhUAjd67SOHulwN6sq0cKL9YR8YgeCpuTbLr6d64rKRCH2uswrsmvE
	cwYttQ7wMSftw0WCs0ImhfwenEu19nXwYtiVDdwjw4Scm00K/ZsObszcNIa2KsSO27FUPAJgoqe
	9egWECxLVY9EOvA9ODEH6SRIBaRj38kHa4EhNNhoCrEqoPQssqF2Bj09dW1YF1ZfgDL6QvUwBtD
	55wsrWK6R4PSFgPyAaDOTj3zI/1cbx6suFjUyqYilhHlRUmmUgNg0fagS5mmMI6RHtwvIErtDm3
	LwZVsuvWwAhHkxAwVeDz7qYd59oYWz/yI7eRRIoRou0oK5WURBh+3AamGQ2E3+kthqWYsYdSUtz
	vLLaQAxk1qXu+IIiYKTYo3fDw4fCem905PnMIPISpGSWFKkKv4MQGTEO6deKoNVZi6PN3xERYWJ
	YnUpfs6EY=
X-Received: by 2002:a05:6a00:2289:b0:7b8:349:1b33 with SMTP id d2e1a72fcca58-7e8bf85ac5emr5847879b3a.5.1765189433948;
        Mon, 08 Dec 2025 02:23:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMB3G/FedvrSHkS55lezyEum2mqkkBO/SByv08yG9sjg39uKLpRoF9PVtP2wH2vTh0IhNkbw==
X-Received: by 2002:a05:6a00:2289:b0:7b8:349:1b33 with SMTP id d2e1a72fcca58-7e8bf85ac5emr5847865b3a.5.1765189433461;
        Mon, 08 Dec 2025 02:23:53 -0800 (PST)
Received: from [10.133.33.160] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e29ff6b56esm12702511b3a.20.2025.12.08.02.23.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 02:23:53 -0800 (PST)
Message-ID: <7ef46837-7799-4ede-9f5e-88a010d5d1d4@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 18:23:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix qmi memory allocation logic for CALDB
 region
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>, jjohnson@kernel.org,
        ath11k@lists.infradead.org, "Rob Herring (Arm)" <robh@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20251206175829.2573256-1-mr.nuke.me@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251206175829.2573256-1-mr.nuke.me@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XlUbLFH6LZNlCtuv8VaEnkSRKC5Qeylw
X-Authority-Analysis: v=2.4 cv=KL9XzVFo c=1 sm=1 tr=0 ts=6936a73a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=3EvvSBrUXICK9wu0dFAA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDA4NyBTYWx0ZWRfX1klgCcdFcCTB
 CSHOGlpocGshioPqomvGrp0eomu7Sz+fcsQOV+b30FWCPKaQ5rc5PjWQ7a4wslRinu7Ma3jaI7z
 knSC90L9hfOaZ8gArcBy8DbPjbDjmrADQAn8wYa7pC60WQi52QFlxpURvNY1FszUJ4gmXixTnRk
 SKw/ZuDaE8gsxEUsA1yIrlNaeqmzyogsk4IVki97RUvPr5CktZu57zDgKXJg9sGxjEnzr5G4SmS
 MA3DPhToSmyglTExc4oIgcUgMKOXY4pDx0vQNO2K2WAdSNHcLhWp+EaQAeZZpp7EB8VJIKZC1Wu
 6Z14QjMJfJLKwJ2vug7qzgFS3BN+knLup75AE1isJUUzox1H69FT95oXiJjFfduvL0IQGAcyEiB
 z6ilxvg+ay8q2eN1tIwLPRThiXJBGQ==
X-Proofpoint-GUID: XlUbLFH6LZNlCtuv8VaEnkSRKC5Qeylw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512080087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_022357_291905_6C50A6CB 
X-CRM114-Status: GOOD (  22.19  )
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



On 12/7/2025 1:58 AM, Alexandru Gagniuc wrote:
> Memory region assignment in ath11k_qmi_assign_target_mem_chunk()
> assumes that:
>   1. firmware will make a HOST_DDR_REGION_TYPE request, and
>   2. this request is processed before CALDB_MEM_REGION_TYPE
> 
> In this case CALDB_MEM_REGION_TYPE, can safely be assigned immediately
> after the host region.
> 
> However, if the HOST_DDR_REGION_TYPE request is not made, or the
> reserved-memory node is not present, then res.start and res.end are 0,
> and host_ddr_sz remains uninitialized. The physical address should
> fall back to ATH11K_QMI_CALDB_ADDRESS. That doesn't happen:
> 
> resource_size(&res) returns 1 for an empty resource, and thus the if
> clause never takes the fallback path. ab->qmi.target_mem[idx].paddr
> is assigned the uninitialized value of host_ddr_sz + 0 (res.start).
> 
> Use "if (res.end > res.start)" for the predicate, which correctly
> falls back to ATH11K_QMI_CALDB_ADDRESS.

In addition, does it make sense to do of_reserved_mem_region_to_resource() before the
loop, which may give CALDB_MEM_REGION_TYPE a chance even HOST_DDR_REGION_TYPE request is
not made?

> 
> Fixes: 900730dc4705 ("wifi: ath: Use of_reserved_mem_region_to_resource() for "memory-region"")
> 
> Cc: stable@vger.kernel.org # v6.18
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---
>  drivers/net/wireless/ath/ath11k/qmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
> index aea56c38bf8f3..6cc26d1c1e2a4 100644
> --- a/drivers/net/wireless/ath/ath11k/qmi.c
> +++ b/drivers/net/wireless/ath/ath11k/qmi.c
> @@ -2054,7 +2054,7 @@ static int ath11k_qmi_assign_target_mem_chunk(struct ath11k_base *ab)
>  				return ret;
>  			}
>  
> -			if (res.end - res.start + 1 < ab->qmi.target_mem[i].size) {
> +			if (resource_size(&res) < ab->qmi.target_mem[i].size) {
>  				ath11k_dbg(ab, ATH11K_DBG_QMI,
>  					   "fail to assign memory of sz\n");
>  				return -EINVAL;
> @@ -2086,7 +2086,7 @@ static int ath11k_qmi_assign_target_mem_chunk(struct ath11k_base *ab)
>  			}
>  
>  			if (ath11k_core_coldboot_cal_support(ab)) {
> -				if (resource_size(&res)) {
> +				if (res.end > res.start) {
>  					ab->qmi.target_mem[idx].paddr =
>  							res.start + host_ddr_sz;
>  					ab->qmi.target_mem[idx].iaddr =


