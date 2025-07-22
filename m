Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A72FC83F1A
	for <ath11k@archiver.kernel.org>; Tue, 22 Jul 2025 15:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R8R1wAZwL02u+Cgf4TNMtyfaka474kDZXFvf2HapMfg=; b=i+32Yo1YKokjlwCmCnbQrTRd7c
	ZnwOATKH4MPt5/hKA4j7mr0kAhoMCyzXVYJy4vv/IHgnCXvhgb1YZrt5bAa4pvFH/VijzFRi0qBdQ
	qYg51rcxAmbEPUmQq/9Zopq9bdW/gzadNiXt0zoLjnC6hV4cwT6/cQQTeUZGgotaQwhpG+6De6X6E
	yOHea+f+sGa5OVArRgkXUBLmYSjdnwD0Q6O15YPggkreQq3pFSTRnAprUwVudCG4UFEdq+h6hPqcE
	v8YELpM8IBfbNebTOPiONQD1VT19aBjL6sLr/9SSGI4ckxB6URy6Bu6i/EqwG9QudvNXrjf63aoUI
	zYM+ryng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFO1-00000002vzr-0c3J;
	Tue, 22 Jul 2025 15:58:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueE7B-00000002jMs-0xON
	for ath11k@lists.infradead.org;
	Tue, 22 Jul 2025 14:37:10 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M83xnR010607
	for <ath11k@lists.infradead.org>; Tue, 22 Jul 2025 14:37:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R8R1wAZwL02u+Cgf4TNMtyfaka474kDZXFvf2HapMfg=; b=ccuwPdlH3EwTqfPU
	N01lm3dbw8ct+OlY475e89Ce6UGQjn2mMBNWua8YiVUDGoP3zENJL3Jbbla/wyH0
	JmzPe19yYc3IR+LEl4nfNhs974Ha2YFAOimRLijgrJBJfywiWQ8Rv6066kqTCuW3
	1gOIbTZreTVLP2B3KvtREzrQ2MMjwv2l9AUd3+Hq+0mxy/TbtoNA9hiVzMXutuGO
	Z2YPdxVC4DFsHsW4XLcw+75Xdh34z2fkghkGDFIjRM31eO7A/2odiivsLOfNEEmm
	iO5AhW42Aw3MldZvc+r1ZRuUqhKL1nKUQiNg0NN8kzcoG+gT53iAeraViEBzAcBm
	5MU9TQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4826t194pu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 22 Jul 2025 14:37:07 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-748f13ef248so5191006b3a.3
        for <ath11k@lists.infradead.org>; Tue, 22 Jul 2025 07:37:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753195026; x=1753799826;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R8R1wAZwL02u+Cgf4TNMtyfaka474kDZXFvf2HapMfg=;
        b=adwGMAlDBWp4wXOJUVrHnc8CGsYr8XSqX54euCHYU3VtmdG1Y/o5PosVpXmX1WGhwJ
         BUdFSrEC/dkzXhxz/Z2ae69iKhD38/0lZmwIfBEk7NijnNruXx1kQeFdWQlfbwNUOH9I
         9C7rOOCitRajdLADyxuGRwlaLgolpNA9LDIY2DfpezcSCzq6+7id98j5jkP4eYumW+TT
         qqLsAoT3dwozEcr85R34czkhN05ziYaroyDrxRTgULw9Q0BHcvAR7ffXNK7yWADh/rH6
         s9NQJfW09QfOqjIkdzmLTppatecxxO8TItBPldeHiBclZtESN6fT/Y0wjulSP+EcCjfr
         7RvA==
X-Gm-Message-State: AOJu0YzXgWb/hVIIXbQ8TOqCf8KZj3Jc+NZ311n/OwXM64l92llY6bBj
	DHqcz/rWXMu/86OgQAPgZ8GtnQj42KJoqa1mvjf1HFuXyqk2UvDXvjYvo6Dr9XA4PoN6HYbgJsq
	eVMZwIIgezHHrhi18TXuLd2IXefSByXVtYl6fzIewYtbLtKJUIpOnnJYxrrcWZ1aH
X-Gm-Gg: ASbGnctpMbKZ8bneBWty9Fvsi7YpExVZC9ef7z2o0aTMoNYoqJKMzl7/Jy2hIAST/s9
	fZml0WsiBGKaBpEr4kPE3bcJ1EsZhqLRBD1CEh4j6ZPQLmas/TvwoMZJtMLkHWc7rIIsExu6NhS
	r3Nc6oXmx7s8tyJ5TPSDxEhTPcqQIWnqKDCkZh+lzFIfwTtisPSlRlbj4wJtkJbmVZ35grW7ED8
	Jpm/MymIZFr659vu//NMsZWkvbgAg2Pt76oKMiecdU4LX/5nvqqACO7a/Yp7m7pGSXjXmzg0nfS
	zU6VDLzKl1QTmPMqfrTel2iYCHtTuJpTjsJM+9rR4yOrt/ecdb+DkltLTRib/XE/ckirzPnAlmd
	sHXFFNmjMLmWEI+yz9Uogg+l8mSFjgrzq
X-Received: by 2002:a05:6a00:1252:b0:740:a023:5d60 with SMTP id d2e1a72fcca58-7572427b8fdmr36738867b3a.19.1753195025747;
        Tue, 22 Jul 2025 07:37:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSPhGKEhB0JgMYruRFjOhVDxgydpK42cBLpYkOMPpgZ1BkxU5wACmfS4bw+XPwlWlvSmBTxg==
X-Received: by 2002:a05:6a00:1252:b0:740:a023:5d60 with SMTP id d2e1a72fcca58-7572427b8fdmr36738827b3a.19.1753195025199;
        Tue, 22 Jul 2025 07:37:05 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c89cfb3dsm7692085b3a.34.2025.07.22.07.37.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 07:37:04 -0700 (PDT)
Message-ID: <83c62cb2-7d85-4a9e-ba76-63faa27faedf@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 07:37:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k_pci: add a soft dependency on qrtr-mhi
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Christoph Hellwig <hch@lst.de>, kvalo@kernel.org, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org
References: <20221202130600.883174-1-hch@lst.de>
 <0b28bb5f-56b3-4be6-b4f4-89ca546a24d0@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <0b28bb5f-56b3-4be6-b4f4-89ca546a24d0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8BQKBqSuSVtiCU5BCp0sN310zFDHE-BZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDEyMSBTYWx0ZWRfX0vWhZwzMiEae
 X/F6qoDafon9mIZRwBavFb3D/EbKXLrGB1AidS+oJjyxRjo4KvdoGH92PiLOUndkhtbHognDYWS
 KlMTNhDdsrkGqnwQMyoJAjb916V6BbDAhFoCpfe7/S6FQ5MEsRIT4Cz3iCFN+SHQx75VapU09+y
 hfhTIeubZYG873bZlz9Ob8IdWpkEYuFjk9oaJJ8JFyOM1uEcg0C0D4UkgQV//EiHGw72/C2tTHs
 G3lWzV5sm0P1Vu96xocYxl3SI6AhRdND3VKdmbk9QQw5e5H5l2QyBK0F3YDg3Yi+4L5u9KzEfCm
 PnpA+sMfj7P0AUajkIzpV1sYvrarUR/dBBswTaGyu9HcOwmkxDxnJjnIG9IcdtT+Z4wKmXTMUS2
 EpP8OVKu6jL1YZ2jp86vtDAMQ/rWHdrf7piBAziKe+i3ip5V/3XWEf80bzQb12O2jRjo0bKT
X-Authority-Analysis: v=2.4 cv=E8/Npbdl c=1 sm=1 tr=0 ts=687fa213 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=Kj1WHezUp4T6SZPGUyIA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 8BQKBqSuSVtiCU5BCp0sN310zFDHE-BZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_073709_394653_4FC10A46 
X-CRM114-Status: GOOD (  23.20  )
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

On 7/22/2025 1:35 AM, Baochen Qiang wrote:
> 
> 
> On 12/2/2022 9:06 PM, Christoph Hellwig wrote:
>> While ath11k_pci can load without qrtr-mhi, probing the actual hardware
>> will fail when qrtr and qrtr-mhi aren't loaded with
>>
>>    failed to initialize qmi handle: -517
>>
>> Add a MODULE_SOFTDEP statement to bring the module in (and as a hint
>> for kernel packaging) for those cases where it isn't autoloaded already
>> for some reason.
>>
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>> ---
>>  drivers/net/wireless/ath/ath11k/pci.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
>> index 99cf3357c66e16..9d58856cbf8a94 100644
>> --- a/drivers/net/wireless/ath/ath11k/pci.c
>> +++ b/drivers/net/wireless/ath/ath11k/pci.c
>> @@ -1037,6 +1037,8 @@ module_exit(ath11k_pci_exit);
>>  MODULE_DESCRIPTION("Driver support for Qualcomm Technologies 802.11ax WLAN PCIe devices");
>>  MODULE_LICENSE("Dual BSD/GPL");
>>  
>> +MODULE_SOFTDEP("pre: qrtr-mhi");
>> +
>>  /* QCA639x 2.0 firmware files */
>>  MODULE_FIRMWARE(ATH11K_FW_DIR "/QCA6390/hw2.0/" ATH11K_BOARD_API2_FILE);
>>  MODULE_FIRMWARE(ATH11K_FW_DIR "/QCA6390/hw2.0/" ATH11K_AMSS_FILE);
> 
> Do we know why this patch is rejected?

This predates me becoming a maintainer, and I don't see any comment from Kalle
to the patch, however he did have the following comment in a separate thread
where the issue was being discussed:
https://lore.kernel.org/all/87cz8v2xb2.fsf@kernel.org/

> Though I am happy to take your MODULE_SOFTDEP() patch, just wondering if
> there is a better way to solve this. For example net/mac80211 (the
> 802.11 stack) has a lot of crypto dependencies:
>
> 	select CRYPTO
> 	select CRYPTO_LIB_ARC4
> 	select CRYPTO_AES
> 	select CRYPTO_CCM
> 	select CRYPTO_GCM
> 	select CRYPTO_CMAC
> 	select CRC32
>
> And it's not using MODULE_SOFTDEP() at all.

So I'm guessing he considered this to be an issue that should be solved
external to the individual drivers.

/jeff

