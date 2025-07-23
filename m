Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C37C83F17
	for <ath11k@archiver.kernel.org>; Wed, 23 Jul 2025 05:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YzAlWwPyl11DobQ4XCJnSqZiGHQh2UO3s/x4QZ068e8=; b=CuMSsVV02GJlC6azhshdjMlhDM
	xwijJUOzvKIqCXbf7tc7t81cfvtiA6yPSLwhutKGdLrpk6iNQldvSQHjVjOv27vyqphK7I/Q/5sWd
	0JN46ar4yA/QntnQ16tzu5La7Htxk0n+yySOZDnoUAISlA9f4p9jIjqjlKE2DenntY2DQA8gvxwM8
	g6tQ4UioXow8eVIOlo+aJbmUj8qtGLzAhB+RnGMHzyDvCRT1+DwrDBlgPdkLZBPyJ7v/UyilkMRcd
	2UWfnxgGs+8mnhL9yVEWBJoyfjQ4H86zTdv7qvLIYYADnVhNcYsD+3ahwu+tUuzPr8a1OtTITdb1l
	4mvd+DCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueSVR-000000045WK-0VNE;
	Wed, 23 Jul 2025 05:59:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueSUh-000000045R2-1smS
	for ath11k@lists.infradead.org;
	Wed, 23 Jul 2025 05:58:24 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MMOcb0001674
	for <ath11k@lists.infradead.org>; Wed, 23 Jul 2025 05:58:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YzAlWwPyl11DobQ4XCJnSqZiGHQh2UO3s/x4QZ068e8=; b=Pe2dzWi1DlTugsPP
	pMZWzIM+c8dkEzAe9yDdidTgUmvuz2LWfi3Nk//5qaNCjBEOIMYe6c9w3bd/RDED
	49QkjSwFaQ/UFKeQa7WPLOV1FwutBU8y4Z2pk6fo70hItU5YnfvQZm8NbA+GS/Rf
	tVnzMLx4meHly92sZNaOjpVl56Bi9Kb9jdUVM1ntOxY3dRI7ipBsI2vVTEB4sMnU
	4TDU9C3a7j9fSf6y95RmWlS093ZhEcSt+dbQr3eiIUmwZiS84NYjDtszlLFwgF+3
	myFGGDBOM7gSSB1ISGcZprIiVXh4wcs1lXZEKQq6eEyMPTPVI7AUvCAM97cl+nrZ
	itliIQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045w2bpu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 23 Jul 2025 05:58:21 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3132e7266d3so6356549a91.2
        for <ath11k@lists.infradead.org>; Tue, 22 Jul 2025 22:58:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753250301; x=1753855101;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YzAlWwPyl11DobQ4XCJnSqZiGHQh2UO3s/x4QZ068e8=;
        b=DSPCQrUHbU5LY/B1/CCElmeP8tabQK9rgCFH1m6rDdpepR3aSju/4yr4Sm/YN9/yvf
         G13Od9cjhJn4E1T7Od3Pqeggcba9Mun8Tt8bZhc1x35tun5yXgimBwlc2dmiwfjy8BGp
         6Qx9m2fPb5NcBaz4qM/CTMaYUpR9yEw2hgJWiiSQULxJ3TUY2Ua69O3Fm3rdrDa1gNsW
         Horffw2psHeHQ7qOUIeI5zzUbAvQlgtKFqCBQ4VDsK0a6eJth3MFRjJN1++dcXdgqJK1
         8IseqB6jvObMXwN2iFhdxso/ECHRWElG/t8LJmh+EEYG+UVPj7yDEgZREpZhAdezGSxS
         sMlQ==
X-Gm-Message-State: AOJu0YxcvdaoxmMVTGNc5by5WIXI0KxNqfVOHC7cS8JEsf3TkQRyI0c3
	LnQSJMq4tNHn/Mp4OGdgzRC3t0WxlU1KVtk7NyFvSqIvtG9GUcXGPiozONqVjkLMT0FhY9So2oo
	d0PbqnTCs1mI0omF84ZvJoeiNXJL3/rGkT8wIiBAYxLIBaT9CXRXv9jrWIlAH7lw8
X-Gm-Gg: ASbGncsgFrVeR4+x8rcE8ILTyqysH0jiEcH3tgX2edPFng1MFXJ7kV9JoO9+s+JCK6W
	CPVfcNtoYVfOCk8C8cs4R1ap/oegN20k5Jtnx/znHPjaKWYZ/KDYfpIGS/bMN9d50j1nyz4sDNX
	4MLJXMj4cD+zKjEi7fG6ZxDnep2IJR3/5lZx32Wge1hG8KvvJwG9SEzSdrHWDXXPfalv1aIp3HG
	U+/cHgfpm/9Pu8ljssUk/w8zJYycZjoyzQAhQZHXpX41CFeTg1U97gknHpbJO1kwB6iHq2WRDNp
	hz5+Jzr9HhWKTxlkWKSlBSjc6UMHcwo1c76zfz2qtz/5zL/cg3oO6TA8IWb2PvZTxCmm/MyHrW6
	4H015oVJ91HAtgHbtx8RhkVK033TAmS8=
X-Received: by 2002:a17:90b:3f8f:b0:312:639:a058 with SMTP id 98e67ed59e1d1-31e5082e792mr2978019a91.27.1753250300704;
        Tue, 22 Jul 2025 22:58:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+Dllea4dAoEds88TCilmkFnz0an9y6OUH3WvLxWNlLxgWLGEnGgF98AiavG4GsOxkZ4osSQ==
X-Received: by 2002:a17:90b:3f8f:b0:312:639:a058 with SMTP id 98e67ed59e1d1-31e5082e792mr2977978a91.27.1753250300115;
        Tue, 22 Jul 2025 22:58:20 -0700 (PDT)
Received: from [10.133.33.45] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e51b9337esm756858a91.36.2025.07.22.22.58.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 22:58:19 -0700 (PDT)
Message-ID: <6b411f8f-b4e1-4252-a9a2-04e36043e252@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 13:58:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k_pci: add a soft dependency on qrtr-mhi
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Christoph Hellwig <hch@lst.de>, kvalo@kernel.org, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org
References: <20221202130600.883174-1-hch@lst.de>
 <0b28bb5f-56b3-4be6-b4f4-89ca546a24d0@oss.qualcomm.com>
 <83c62cb2-7d85-4a9e-ba76-63faa27faedf@oss.qualcomm.com>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <83c62cb2-7d85-4a9e-ba76-63faa27faedf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LL1mQIW9 c=1 sm=1 tr=0 ts=688079fd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=7D9JVqTAamdkZGSUpmsA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: sfYT_8Ozkn_4nalCIxXtzMNBunePrh6o
X-Proofpoint-ORIG-GUID: sfYT_8Ozkn_4nalCIxXtzMNBunePrh6o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA0OCBTYWx0ZWRfXyP4eGiXQolth
 nNY4Fkz8Nag9xC2/0M6kRTX2lVIjSeargzkdGsbIN93HYMkDZZYnWi/8QnsVM80OtQUuhQkfheU
 teGo0YFcjYS6ve+3xwv2KbhNfknjSs6VwOCGgU57pjYGTew9nB5ydyLkpd4srGVTuvjHZbvEPyk
 StAnWVnZov/qNF4qQahIbvs5+/aw5rdQqe+5sJTUUH9aga2AH/BMNUx1dobfZpGQrrOYLGCebWq
 GkHyXgmYNpoztIePM/T5AMZmq0Sfbb+hZK45htq7Yp+Wt4WGWPzNNzpJptFpixr6Ta8uRNrhPQL
 8dUtdEnwSdaoH3RKSpQElyV8IMaNcHN730TdzvM9vNoN/QES3N5+/TA9kmAERTQP/hhvGqmoioe
 RNh2GjuHmbw7CgTrm+FrrgH5SEu/+I6xxRA/hceBJZp50ptBUBQaZqWNky4aRQMhy27fN5Mg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 mlxscore=0 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_225823_514959_322133A4 
X-CRM114-Status: GOOD (  25.35  )
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



On 7/22/2025 10:37 PM, Jeff Johnson wrote:
> On 7/22/2025 1:35 AM, Baochen Qiang wrote:
>>
>>
>> On 12/2/2022 9:06 PM, Christoph Hellwig wrote:
>>> While ath11k_pci can load without qrtr-mhi, probing the actual hardware
>>> will fail when qrtr and qrtr-mhi aren't loaded with
>>>
>>>    failed to initialize qmi handle: -517
>>>
>>> Add a MODULE_SOFTDEP statement to bring the module in (and as a hint
>>> for kernel packaging) for those cases where it isn't autoloaded already
>>> for some reason.
>>>
>>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>>> ---
>>>  drivers/net/wireless/ath/ath11k/pci.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
>>> index 99cf3357c66e16..9d58856cbf8a94 100644
>>> --- a/drivers/net/wireless/ath/ath11k/pci.c
>>> +++ b/drivers/net/wireless/ath/ath11k/pci.c
>>> @@ -1037,6 +1037,8 @@ module_exit(ath11k_pci_exit);
>>>  MODULE_DESCRIPTION("Driver support for Qualcomm Technologies 802.11ax WLAN PCIe devices");
>>>  MODULE_LICENSE("Dual BSD/GPL");
>>>  
>>> +MODULE_SOFTDEP("pre: qrtr-mhi");
>>> +
>>>  /* QCA639x 2.0 firmware files */
>>>  MODULE_FIRMWARE(ATH11K_FW_DIR "/QCA6390/hw2.0/" ATH11K_BOARD_API2_FILE);
>>>  MODULE_FIRMWARE(ATH11K_FW_DIR "/QCA6390/hw2.0/" ATH11K_AMSS_FILE);
>>
>> Do we know why this patch is rejected?
> 
> This predates me becoming a maintainer, and I don't see any comment from Kalle
> to the patch, however he did have the following comment in a separate thread
> where the issue was being discussed:
> https://lore.kernel.org/all/87cz8v2xb2.fsf@kernel.org/
> 
>> Though I am happy to take your MODULE_SOFTDEP() patch, just wondering if
>> there is a better way to solve this. For example net/mac80211 (the
>> 802.11 stack) has a lot of crypto dependencies:
>>
>> 	select CRYPTO
>> 	select CRYPTO_LIB_ARC4
>> 	select CRYPTO_AES
>> 	select CRYPTO_CCM
>> 	select CRYPTO_GCM
>> 	select CRYPTO_CMAC
>> 	select CRC32
>>
>> And it's not using MODULE_SOFTDEP() at all.
> 
> So I'm guessing he considered this to be an issue that should be solved
> external to the individual drivers.
> 

Thanks for finding the thread, it really helps.

Hmm, I agree that we should not blame this on the driver as all dependencies have been
clearly documented in the Kconfig file. However seems the userspace tool (e.g. depmod on
Ubuntu) does not care about it but just looks into ko files under /lib/modules. So if we
currently does not have a better solution, maybe we can take the MODULE_SOFTDEP way?

> /jeff


