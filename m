Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6F8CD5BD1
	for <ath11k@archiver.kernel.org>; Mon,  1 Jun 2026 13:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JEmjlgCDRIf/yZc6sCfPxlrwhqDhj3LtIw0r7cYtkgk=; b=QAh+MN1jo3FJGmVB1Uf1xohAUO
	D1i4UiRDcYxT8wE4RWoo7f/DwKF2/4sUZgwgilcPWcmrJVjEhnYKUhs9uOyuNzFDZh8ZKv60V0Z3o
	3WXQ0+dlFfZ+EjDJVkKuq9BXBxygzryXoGEh9YPIdSocN7NLJfEUlFXh40HnQ+6mLdIIt+CMFWexT
	WX+tKrYyEOnD6MqYg2UNUdPM0U/jYirHNkUfYKNta9yu98cOBkVIKc32I3iqmP2f9Wv4dMet38qD2
	/tYD7Pjd35blNhJFFjAZsWdl7GFsHaQjJkgb3/KhvqtyUcY6+NGqbmjNIrKQUHtNsIMmF+jehp/7c
	Pwyq0Lgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU2V8-0000000BC1x-06X4;
	Mon, 01 Jun 2026 13:16:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU2V5-0000000BC0M-19mi
	for ath11k@lists.infradead.org;
	Mon, 01 Jun 2026 13:16:16 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518fdp64065896
	for <ath11k@lists.infradead.org>; Mon, 1 Jun 2026 13:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JEmjlgCDRIf/yZc6sCfPxlrwhqDhj3LtIw0r7cYtkgk=; b=G1/DQvDlzBawTqJE
	STsUb8yuGwn/aretIIz52SxVuKYKK8gb6j6gnUtqde7VX0G5c0j6FpzGFdAI/mB7
	KAhF54ndq/yeh9jGBY4lkP3rOPlg9jOgI38a/8R1EabDEUmMmZHaVYuRbd/ggZPh
	fyjkAJPurdsq1Y+L81wkXesi+ig1W5uasf8Vka2a26MK1FhYDfEBMxUngyxnCKpK
	LBMerQUruZPDEO/zNZj9vBrnd7dy4ikhrhDWJpDsyu6AK7MyrFUwcOBtQ9Ba4a/T
	NPF0ZZSATH5U1esGQ8QDBjvKUUNg0BU7b+nJHyu0u8Nxz1CwF4TNMzNuO0S9iBNW
	yQ5Zng==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6sws36d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 01 Jun 2026 13:16:14 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8596e4272aso2009764a12.2
        for <ath11k@lists.infradead.org>; Mon, 01 Jun 2026 06:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780319773; x=1780924573; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JEmjlgCDRIf/yZc6sCfPxlrwhqDhj3LtIw0r7cYtkgk=;
        b=aYowpleHsgSkpktQ+vNfQrelFHI2Az6lRX2OihUKog/+z/6fEzBA+cgQsEydrKIAWe
         vsmrmKcsFPIPTWvjPvQ2lsntXxtDTEG5lUNMON8EDIkSGEbr4xJhl70u0CH8ZFudQIk6
         Ux58d95enkdCbxaPWBK++x+1a+gKaOvD1c3aYJ0J91ySW5gFgUbifKXsa2dDFwX31YWb
         nhxlxraqIFM9BEFEGjwzykH/Pd3+aWTJ+9o+VtnuqDCOy2WCUW3ZWMLbRs2mLyG5yP/E
         mWy5rq79eftdkAU+vJCmKZj5hhXzC3D5cvLhl5AyyohA7PPyBcjZ2SsLv1kQF37oWuFJ
         V2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780319773; x=1780924573;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JEmjlgCDRIf/yZc6sCfPxlrwhqDhj3LtIw0r7cYtkgk=;
        b=b+CEPXjB53NfUTSxNyVPRokDUTFFtx0/8llWyS7keXwCgdb0z9HiMIrBalg+5RPmtn
         ACVLit6uYfdqU8oe2yR81XgTxdDq7BVQSXRsmVkLK07MZkq8e1j1NGzv0bX3Q7JYCVhD
         DRzyAOf8opYThOiAX2Ajgx+Y0qPqafzBRwiPNtI4ST28AUXm31cQhVTu/yBUlYTo5+c+
         dSpl5Mwtx+TqJiV17VZoXMq8am0ZFsoosJBywlcgNK3INmXCapp4pVwo9J8Yp6QwZNmi
         Ejj216vlbXmLOqvMu3JgDjQ8Oey6310rwd1SN9JSio21bUc/9oY/XkYiJuxJQstqKD8u
         ydsw==
X-Gm-Message-State: AOJu0YyBPWwvAx8J/B0+C9gO7giqCwERwr0Jcd50+zgFeJddU5eLQ5TM
	ACMzlfjg4MPD8ygAIK6fbwot8PkM4/1Op7V7AzV2HM2NitSSsdek+PixeETpmZTKG6vaUaEbN/P
	RYiiiw7qj624bd26f3OX2K3xL97/uPUQn1LclInfSnQSMt6+bnZrYWbwqjwccOVubY0sMdosc
X-Gm-Gg: Acq92OHmOnL3LM0iU+Ivc0eVPW+dKJznf8PlThllVP2h5nc5aHS9cGYAalNk/BOb2wf
	VYo58ue/GXKZOyY+JRWr8qpnxu00CE6oJG9ghmJ8LneYL9/vAtTpjmc+0waLrYTLpXSqtlCuYsC
	K8bjTJBogOAYakiw5dJkAD4uF6RGTQxKdQHAX41dAoy1Uqkwsnwij9jxoobpXElBGUqeotZlxE7
	MIT8R6vJBjSTLzogEHO684V+aLWOe+A8vS4lwn3cwb/1whqlxl3G2hCS2wNNlZQePyOMSgNG9ZM
	+wxlxKhTy5K4vpnIKMTfELaIAIuxz58snK6oLhOs5kvX5xk8bEP4jb358hQdH6X0wnVMiBx9sMn
	g5SVgWY8xmP3neQjsG82IXmphO+Oe4sxro8xi/Gswy5h3tXCCBT5nFEMDSUbLjy9NXPHGTdFK3K
	Wn
X-Received: by 2002:a05:6a20:4303:b0:3b3:223f:d3fc with SMTP id adf61e73a8af0-3b42826287dmr11259984637.45.1780319772930;
        Mon, 01 Jun 2026 06:16:12 -0700 (PDT)
X-Received: by 2002:a05:6a20:4303:b0:3b3:223f:d3fc with SMTP id adf61e73a8af0-3b42826287dmr11259951637.45.1780319772537;
        Mon, 01 Jun 2026 06:16:12 -0700 (PDT)
Received: from [192.168.11.104] ([124.123.82.179])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8591b76862sm6464766a12.3.2026.06.01.06.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 06:16:11 -0700 (PDT)
Message-ID: <271bd9ed-bc77-4910-81d9-7f1f1f077def@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 18:46:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath11k: dp rx sanity checks for
 invalid length in error paths
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260512022351.2033155-1-miaoqing.pan@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260512022351.2033155-1-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a1d861e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZCREz13nqshT/on6E9YcPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=IFtaPKmWozPZQlw0T4YA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 0X3enE083nzwdJZzp3ewiZGgOJrYrLcf
X-Proofpoint-ORIG-GUID: 0X3enE083nzwdJZzp3ewiZGgOJrYrLcf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDEzMyBTYWx0ZWRfXztlNJmXvVn7J
 oz0rFJoCFTIqQVmaYZsXIuHwJsKz2b68AhLGBccQdzcGXjal25pXaZy16xIrUxnzBZnoRbgSxZZ
 wJS6vxzCTbdhGqul9VuESD4mYe2kBn1HVYenDsZM38Fzfj7rC+RzK940zW9FFhgeGm29lIk01UY
 2s9ZitDwl4Xm37qjVjIT93/zQ3L22xoEOeNVh5mA8rtDEtqyBRyzBKYTFwDyB/gigQWqhxhF7k7
 2sRQbXrAzLc68CNKIISwCcxhkISSpp6ze1eM+BnBSRhdr86Hsm7a6yI9qgOn1jlQAdO+kj2XW3v
 uvyR1NrpN9HrHyRoImhFJZkQHvUEg/C/RftQ2pziuHqmJXSgP/MnVknVdyhRJJrsH1UKzjLWtb6
 udkoshcEs/vqoQX0MBxNntifoT2S0G4vxY7ZTIwmOWhSG63BQx6mjR5qr4ZPsWcbNgmM4klEBOE
 WMFj+o/G1/7GJ32jgfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_061615_481090_F13C4D5D 
X-CRM114-Status: GOOD (  11.71  )
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

On 5/12/2026 7:53 AM, Miaoqing Pan wrote:
> This patch series adds two defensive sanity checks in ath11k DP RX
> handling to prevent invalid memory access when hardware/descriptor
> contents are unexpected, especially in WBM error scenarios.
> 
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> ---
> Miaoqing Pan (2):
>    wifi: ath11k: fix invalid data access in ath11k_dp_rx_h_undecap_nwifi
>    wifi: ath11k: add MSDU length validation for TKIP MIC error
> 
>   drivers/net/wireless/ath/ath11k/dp_rx.c | 59 +++++++++++++++++++++++--
>   1 file changed, 56 insertions(+), 3 deletions(-)
> 
> 
> base-commit: 7b25796f571fc09a7aa6fe7efb23edccd326917d

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

