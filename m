Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACA6C71159
	for <ath11k@archiver.kernel.org>; Thu, 19 Jun 2025 05:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hkLtY1EvcRL1vNox+lIJDsNTt/CTAK5Hg4Fo2ctved4=; b=b87V2VmfZph8b97H02lQtCbiL/
	F8m6+MPUFrIejUDc2H0eM5tW0FHme9gdLr5qx1JeeDZrwTaOqS9/Jcl8pGUxRm/w40tzRQvghnhXD
	io4O5lWngne8Jp3wzcWuENa/zyGHdD1LA/KF4bDvsn4CyiU3l0GozpRnxz6c3n8eVwRqhDuQemQae
	zRB0FwDUdUib7tJj8NF8XSjytn4VyVMdQvimkKHQhCDRMxj3okTLOJxyjlisMEtyca5dCGDi7FDE2
	ylenGv/w4Jd2QlATTtSmdoaXlfAl4vx9yjaKVTPYp+KXOEavkfClACZR/yOHRplCFiXZdszUF2A1v
	hdIJ7gQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS7oU-0000000C3Wb-2GCG;
	Thu, 19 Jun 2025 05:27:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS7oS-0000000C3WA-0vQM
	for ath11k@lists.infradead.org;
	Thu, 19 Jun 2025 05:27:49 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55J4tRS5000891
	for <ath11k@lists.infradead.org>; Thu, 19 Jun 2025 05:27:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hkLtY1EvcRL1vNox+lIJDsNTt/CTAK5Hg4Fo2ctved4=; b=SWU0jgQ0I4mgFOe0
	HR0LMYy6e6+JTHt57VqlznuNnU6fkHtQCKmdr9sz15KW6PIPmcNLClscKxYVkul2
	kPRZMzBiN1A7CC0p8LjkfOErzfYotfCIDkEytQpwgd20mJemyuP7CG0mN/t0TZgz
	MXb1W4nR+YCBX9d5CO8h5WMYjNg0GLs5DwEfIzZKUodCLAIypxEsUGmfeHCsx3+b
	uCSfU6vfylD7JIZZ+r3BOJURgg2pKQe4Q2u0LCDn5d2ahL07t6Rc3Zgxa5q7gTvV
	E0nkgri/Nyz61CgOzvdwWD+3qQPPDL/ZW06sq4NQgM9XJqbnJn/5ah9hGygDUkLX
	uAb7rg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791h9ejg8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 19 Jun 2025 05:27:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-234f1acc707so4483585ad.3
        for <ath11k@lists.infradead.org>; Wed, 18 Jun 2025 22:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750310864; x=1750915664;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hkLtY1EvcRL1vNox+lIJDsNTt/CTAK5Hg4Fo2ctved4=;
        b=bTJmNHIyUTVJ7phWT6q4bllWPYVqm6+2aonhKnoahxJSAOBh6qOzh7JRlF5+0RPSp1
         Ka+Nuc0Wkoxzyp6ixhHRKa5ht0iMR8Km5XXsCHlUNMvr/aIKz4BxVIo1rswvUO/agwNe
         bfpWn7M1g9G8N6JW385tic+C82DUS9+HeHq+jF6k79WPWjAS5sfQT937TASzWdqva2wj
         cMZeLo4odVhx3+0nLlBNWN25OA3tefBTdM5SGMjGn4UYBjIymCDecHVYNOvQsJBxLi7s
         ZaNyEYwh3iQGQZ+WHqvfkNYCud26pxcOK2xSB3cSMP87VTfSFjicDQFQlAz3pgg9/gSo
         02ZA==
X-Forwarded-Encrypted: i=1; AJvYcCVbaz9UFoarLyTdwm6CIAibnw195qAHdeMTgU7nOhdQw3M9dkAvMxoyDchLKSr2wj+0v6USVI0=@lists.infradead.org
X-Gm-Message-State: AOJu0YycKr2zSsaHGrIyuoZ+hXZCK4wa+5RYQ4DiQkpuHzc+/3Eyixsa
	vqsCNvsrsdw8s+x9jvjOlz3k27P20wUEpvRIiAcWT4sT1LQrOpoOAMeSP3wQyY3rnFmlJx+/N+Y
	kNYB8VqqsjvZw1p0LmVp4A2pnTDa6wOPSePOBHBMle4F+UPHOquwcTXI95ityTodF/WtJjscz
X-Gm-Gg: ASbGncsFv4YnC0DnMboOF4isgqoZ0Uk/bFatRltOib5FY1CTNis6ZeIL70LW8yfwfr2
	9Re6L9Ou9n1y5l7CBSkFCO8e9ADlGbBEDqfW0TkJbTFp4VE9lQ+KnVQjcHuPs+nj5ND/GwlB7R3
	m4no6x82AXdLxhctXgU6+Cv74Np/K4nuj5BlOShDLeypOIQvGGq5EVPerDeR6IXm5raU9uf3ALa
	qHqpUGD9XYO0j8HKcUwNUo/Zlgm5GNzPUUWeK5wHsMY2fg0m5xip4k7W4E5Ly9O8S1ILKZsKl2b
	3yQ9er8OMi6e+gTHgoGbJVV8u3TGI5aWFzRL7z9V+FxKy7Zi5mXiwZ2LFJBh1IsytyBkaaX3OrF
	az3IG4eMW5GMabmg=
X-Received: by 2002:a17:902:f551:b0:234:ef42:5d69 with SMTP id d9443c01a7336-2366b32cc99mr264842935ad.13.1750310864151;
        Wed, 18 Jun 2025 22:27:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXnYxKoU4DZ28JuX3ZTfKsndaa2Q4xJTU6aH8rVJzZGOuzvZuUU0R2oDXxrblvMfJQnzwimw==
X-Received: by 2002:a17:902:f551:b0:234:ef42:5d69 with SMTP id d9443c01a7336-2366b32cc99mr264842675ad.13.1750310863693;
        Wed, 18 Jun 2025 22:27:43 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d8a4278sm111465615ad.78.2025.06.18.22.27.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 22:27:43 -0700 (PDT)
Message-ID: <311686ba-d0d4-4e9b-a0e4-02a1652bbdbf@oss.qualcomm.com>
Date: Wed, 18 Jun 2025 22:27:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv3] wifi: ath11k: clear initialized flag for deinit-ed srng
 lists
To: Baochen Qiang <quic_bqiang@quicinc.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250612084551.702803-1-senozhatsky@chromium.org>
 <73c6cd0a-9c15-421e-afa4-27fe173bb428@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <73c6cd0a-9c15-421e-afa4-27fe173bb428@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4ca-DcvupHSxaiN89sWUqYtzis37QzyD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDA0NCBTYWx0ZWRfX3YMrjYLCzGFW
 kGWM2SLM9h1aS3BoNIqzVUufFK1TJFGn2AD+CmWjsmyS22BKfcuXo+TkOioyZR1THb5GE1ST37v
 byrbF+PADsKOEC2NYNM+VE4ZS2chcmhY4fL8KqpTAhchZw5z/dmey7B5wax54hNr7JUKtlhJSIw
 ASsukE3Nyj4Ycic/KZJoTvEUUDa/xdHLEGtI9Keo0WPEbmkI3miZBgikZAH+xLohBIKLOG7sa7F
 G74vNyd0pt/XAFaRdSWVokV/K+uZZ2yICLHsBi3ZMJ6JpZ9d8R/pkPh0YYtV1a1CNlHQbhq5UJw
 7XiVMENBX+rGz0dxS5+M3np/gvl7kQsuCy76pn+UboYdHWSPDIHf7Il6d2P6qidXDolKYebAO6L
 4T1N51aC8aQA05iLHicHNXzGyWRVRgCSXFv0/VHZP/kZLFIo6lc0hHypbRRoxyWpF6JZNvj4
X-Authority-Analysis: v=2.4 cv=UL/dHDfy c=1 sm=1 tr=0 ts=68539fd1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=cm27Pg_UAAAA:8 a=COk6AnOGAAAA:8
 a=UqphAtYn3tvgA1B2ULoA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 4ca-DcvupHSxaiN89sWUqYtzis37QzyD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_02,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506190044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_222748_387659_1713D893 
X-CRM114-Status: GOOD (  18.07  )
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

On 6/12/2025 3:49 AM, Baochen Qiang wrote:
> 
> 
> On 6/12/2025 4:45 PM, Sergey Senozhatsky wrote:
>> In a number of cases we see kernel panics on resume due
>> to ath11k kernel page fault, which happens under the
>> following circumstances:
>>
>> 1) First ath11k_hal_dump_srng_stats() call
>>
>>  Last interrupt received for each group:
>>  ath11k_pci 0000:01:00.0: group_id 0 22511ms before
>>  ath11k_pci 0000:01:00.0: group_id 1 14440788ms before
>>  [..]
>>  ath11k_pci 0000:01:00.0: failed to receive control response completion, polling..
>>  ath11k_pci 0000:01:00.0: Service connect timeout
>>  ath11k_pci 0000:01:00.0: failed to connect to HTT: -110
>>  ath11k_pci 0000:01:00.0: failed to start core: -110
>>  ath11k_pci 0000:01:00.0: firmware crashed: MHI_CB_EE_RDDM
>>  ath11k_pci 0000:01:00.0: already resetting count 2
>>  ath11k_pci 0000:01:00.0: failed to wait wlan mode request (mode 4): -110
>>  ath11k_pci 0000:01:00.0: qmi failed to send wlan mode off: -110
>>  ath11k_pci 0000:01:00.0: failed to reconfigure driver on crash recovery
>>  [..]
>>
>> 2) At this point reconfiguration fails (we have 2 resets) and
>>   ath11k_core_reconfigure_on_crash() calls ath11k_hal_srng_deinit()
>>   which destroys srng lists.  However, it does not reset per-list
>>   ->initialized flag.
>>
>> 3) Second ath11k_hal_dump_srng_stats() call sees stale ->initialized
>>   flag and attempts to dump srng stats:
>>
>>  Last interrupt received for each group:
>>  ath11k_pci 0000:01:00.0: group_id 0 66785ms before
>>  ath11k_pci 0000:01:00.0: group_id 1 14485062ms before
>>  ath11k_pci 0000:01:00.0: group_id 2 14485062ms before
>>  ath11k_pci 0000:01:00.0: group_id 3 14485062ms before
>>  ath11k_pci 0000:01:00.0: group_id 4 14780845ms before
>>  ath11k_pci 0000:01:00.0: group_id 5 14780845ms before
>>  ath11k_pci 0000:01:00.0: group_id 6 14485062ms before
>>  ath11k_pci 0000:01:00.0: group_id 7 66814ms before
>>  ath11k_pci 0000:01:00.0: group_id 8 68997ms before
>>  ath11k_pci 0000:01:00.0: group_id 9 67588ms before
>>  ath11k_pci 0000:01:00.0: group_id 10 69511ms before
>>  BUG: unable to handle page fault for address: ffffa007404eb010
>>  #PF: supervisor read access in kernel mode
>>  #PF: error_code(0x0000) - not-present page
>>  PGD 100000067 P4D 100000067 PUD 10022d067 PMD 100b01067 PTE 0
>>  Oops: 0000 [#1] PREEMPT SMP NOPTI
>>  RIP: 0010:ath11k_hal_dump_srng_stats+0x2b4/0x3b0 [ath11k]
>>  Call Trace:
>>  <TASK>
>>  ? __die_body+0xae/0xb0
>>  ? page_fault_oops+0x381/0x3e0
>>  ? exc_page_fault+0x69/0xa0
>>  ? asm_exc_page_fault+0x22/0x30
>>  ? ath11k_hal_dump_srng_stats+0x2b4/0x3b0 [ath11k (HASH:6cea 4)]
>>  ath11k_qmi_driver_event_work+0xbd/0x1050 [ath11k (HASH:6cea 4)]
>>  worker_thread+0x389/0x930
>>  kthread+0x149/0x170
>>
>> Clear per-list ->initialized flag in ath11k_hal_srng_deinit().
>>
>> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
>> ---
>>
>> v3:
>> - updated commit message and subject line (Baochen Qiang)
>>
>>  drivers/net/wireless/ath/ath11k/hal.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
>> index 8cb1505a5a0c..cab11a35f911 100644
>> --- a/drivers/net/wireless/ath/ath11k/hal.c
>> +++ b/drivers/net/wireless/ath/ath11k/hal.c
>> @@ -1346,6 +1346,10 @@ EXPORT_SYMBOL(ath11k_hal_srng_init);
>>  void ath11k_hal_srng_deinit(struct ath11k_base *ab)
>>  {
>>  	struct ath11k_hal *hal = &ab->hal;
>> +	int i;
>> +
>> +	for (i = 0; i < HAL_SRNG_RING_ID_MAX; i++)
>> +		ab->hal.srng_list[i].initialized = 0;
>>  
>>  	ath11k_hal_unregister_srng_key(ab);
>>  	ath11k_hal_free_cont_rdp(ab);
> 
> Reviewed-by: Baochen Qiang <quic_bqiang@quicinc.com>

Baochen, should there be a Fixes: tag? If so, can you provide it?

/jeff

