Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C94C54FD2
	for <ath11k@archiver.kernel.org>; Thu, 30 Jul 2026 09:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SLtB7ZyF+St8HvEQIEPSXQokiGSbSWKZ1j1xEWjE5uw=; b=E5DPWF0drd38Sddm+6Vz2kV5iM
	dr1N+VWmgLmm1nFxu0dWs+gKO9XRwxRm7p3Fe3ih9DwLYi5SWmUpNjYTYPXq8Ckwlz7MvqU6aCZpf
	g/Zr8pcOGd+6eNf+g2TMoXWJrCLg/fyAODE7LFye6QZzayaQIEPQuepO8JFjVeWXZn8+uvyEQ68HQ
	iUUwC5DMj5gX7W6KTPBC5kxc55Shb77cfEvzSsqrHBKBwT8tnHU6PaNBkx1zRK+q84TSJ3IaATVmF
	epfgyTDuFnEyuLw7uTmUv8rQ113cqyl9R0/ilwc9KKvH50gdTqmR/txeITECh3Qu936f5DNa8rhrE
	2O/5GcYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNFj-0000000A2Ll-3GQN;
	Thu, 30 Jul 2026 09:40:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNFg-0000000A2Kp-17Pj
	for ath11k@lists.infradead.org;
	Thu, 30 Jul 2026 09:40:33 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U9AGQE378516
	for <ath11k@lists.infradead.org>; Thu, 30 Jul 2026 09:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SLtB7ZyF+St8HvEQIEPSXQokiGSbSWKZ1j1xEWjE5uw=; b=bXUIdCHCloInmJzK
	D0RLBMyh5Un81bUrPpV9xp7qOQIT7jsaZ92rqktWj5yUxQkungApBwCZTkyizrHr
	v7MqZvwKOryuilb+H1NwtD8C438Km2BtzyMApw++2TzQzr9qGPHkOlSFxFNZ8zRO
	e2ZabGc9XX/wA3JHtly9RHIiYn7FkWmrc7EWFCO//zf4IFkZfBWHKg8Ohw1uq8zT
	ZgTcBmw7XSElvqh940rZJyuwS/ig/O7TJ/IjnOlozJdiKs7+g8bsqy8zSvLT32FF
	jxLbiScrVQnKtF8i+8beb7/Moe0n8jJd8E3MGQYiBHiX8v0XooV37HcRO/XtWePN
	9OFBWA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3rdg4hp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 30 Jul 2026 09:40:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so36887195ad.3
        for <ath11k@lists.infradead.org>; Thu, 30 Jul 2026 02:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785404417; x=1786009217; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SLtB7ZyF+St8HvEQIEPSXQokiGSbSWKZ1j1xEWjE5uw=;
        b=EuoGqAZ3xJPs7SqRO7/CZhkXIy3R4/aKKnmY7DuvgsGIVsA0zK5m2oztctCrqtJpj6
         lozC/cqrhCo4GTzX0xS9nr6CKfTS3c4YO3rE3Dr5RwmFbZ0Wlr3CXC+Qa47/ulMK2GJ7
         Yz21WunhjVw9QP8fLBTvbrnzEmMPEYAaZRSE0jCk2AFobbOd60eoqM4Ptja+VCDBb7Gx
         OIC5FRaHfTVneeYr3a7fgJuufrKsnFoPBmTG8eanzOXXhE9oNSX89ovkjDQLRtBoYgcm
         FhyUFuSAOopnzj71uf7YRI14Zf9rgWhfHzI+eLMWutZITeHwsVPUhFjj0wwGjKtnNShP
         A6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785404417; x=1786009217;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SLtB7ZyF+St8HvEQIEPSXQokiGSbSWKZ1j1xEWjE5uw=;
        b=aw5UE9Xk3WnVWQqOxrMxWcc37xBHmNHTyIL+by5nXWcdUAkRDPilDULLE6UcSGHDyX
         99DEL/ZnQ0EZBEI8IB0M8noZI0M/+H+S+q9UTXEZmoENhhneqxZk17OlfjdKFpG5W2yQ
         8CPP+WczcQTnaclsI6nf8N8T0nT659WYL5/LgmbQwT0YNVx+FifjxVvRGfPOc1W99PzD
         AP00axQMQ3Mckc3aH5ghSTRMKsQJhCFKAV+5MMjq4ZhK8Ns3VNqtEh9XVqoGTIAWXuyu
         g6UkBKK0Rj3r8sAh0hC2IshMvGnfEcnEtA9lgeXS2o8siJXUFAAGF0G8EitykESmWbbB
         HE6w==
X-Forwarded-Encrypted: i=1; AHgh+RrsjtN5x7WZsRTytGTlXKgywQ+pQsmna4kOpoDGGhhvqfTOFo7GIIvm5VDQZ9+23e7Y/N9JU8E=@lists.infradead.org
X-Gm-Message-State: AOJu0YyPMp2X8YBexp6Da2fnx4hgP1pTwyYvcWpb7qbjepnqi+9FdUzP
	9cV+0mwmE8Xin+vHPTNQ8Fe4LzrhhRRkTN9SzBKd+3Vbo2qRAAMfSQakPTGP956/5SpiDkEPxIs
	dMiHnvfgH4p68aZrbHUJ9+J2Fwf7ZhhtC0aGoEBHGQjUyGuRsJ01qUWmUwBSxJMMA
X-Gm-Gg: AR+sD11MOUbbItD/WJJ5KqLq550wJY9x1FsGD+fWKIuNqSVGG5ASvUsHhGyBk7FQaY8
	xsmp0BIU2jTTxI4VD6Fo0GPOOI0LG7Tqq57XMQ5fq9bddzkLU0ddpp8rMjOzUV0XIvb88kbTJ++
	9L6hHs5RqUjVpzgyBl+fVnVTKFBAgr6ppVnkpu6aa7Wb2iSmQxsYPJnVqQTrgGxFEHnRvYQozjs
	5KfRPNrQpwUgf0nMkSvzw3RsR0JzRvqXsAM+yR+y9/s9RGM+YZc0hGwPURdnMb9LdRdL/z9KybH
	L4+WtIfR2yzgOA0X9refQHoSTSq0No0gshH+9o8BxvoaqNE31YlP8EITJ6o2LhsrXesYmQQm8K3
	KYgsDLv8yzSaMNd2jHeX9npZJORbZMKCOGf/XV/47
X-Received: by 2002:a05:6a20:9151:b0:3b4:605c:2163 with SMTP id adf61e73a8af0-3c9006eec4cmr1947285637.4.1785404416702;
        Thu, 30 Jul 2026 02:40:16 -0700 (PDT)
X-Received: by 2002:a05:6a20:9151:b0:3b4:605c:2163 with SMTP id adf61e73a8af0-3c9006eec4cmr1947260637.4.1785404416274;
        Thu, 30 Jul 2026 02:40:16 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504927a7bsm20870779eec.0.2026.07.30.02.40.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 02:40:15 -0700 (PDT)
Message-ID: <e4577641-45e2-4a2f-ac37-edf35a749f64@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 15:10:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] wifi: ath11k: fix resource leak on error in ext IRQ
 setup
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        ZhaoJinming <zhaojinming@uniontech.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260729020005.219253-1-zhaojinming@uniontech.com>
 <5ba0a5c3-7009-4e9f-b5b0-11ec79469451@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <5ba0a5c3-7009-4e9f-b5b0-11ec79469451@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pcU443K6XtPXcoWuc67RbVG1n7Tu6unf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA3MSBTYWx0ZWRfX9bFRQ2ZCHDc1
 v0NjT/yVxNHDQa7I3ItlK6+K/Ruk51Xghxlsibeq2Oaa4HgbAHlM6LTS61LwW/sFQrWVVahGBf/
 vD4KZAfBZbACyJYLgOe7Y8E7b511Xqc=
X-Authority-Analysis: v=2.4 cv=UNjt2ify c=1 sm=1 tr=0 ts=6a6b1c01 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=GtBE_Bw5yehhu0ekGRIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: pcU443K6XtPXcoWuc67RbVG1n7Tu6unf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA3MSBTYWx0ZWRfX4anGzRl/Ij1z
 rWiXZbuEBXObg+rKgnoiG14T84/us9TLxG1HLxBs62IMcPbkInqz3FY06jVwBvMgdLVfGZ7WE2Z
 kY07ovSCFBGSj/U6fUrhUZ4TEynXaLYJYwW4pQY2tfJFwCKL1M4mTgLuh6SajCxRHaGQleqDFG+
 Ve0dBuJhSzPWLTI1B2LRNnRpW8iWWt+LNEMExSGQ3wmL6UfOLF+9xfvicXzO6KhfSoE+9nHlLHA
 deIfWpCHGa2VW+EJhX90aqETAtbF50WlU3zgq42d5jsZO6mNu2tt9Mn4fRWr/pSnyjHiA3rnQgX
 IzlAWDIE52hAye9Q56PLTtN3OiHgxnuj1CW92f9TPcYSZQevWaXl9dlwzPzZN4gK6yD/ac66FNr
 2r4/vyX86s4m+OhW01eVG8VY/e8F8xbo/rUtZyRneYlvk1CZUaTj6p8TlXgMjKqIVWtowjazKIe
 WUBWOeOMR17aJMnYbrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_024032_452512_FEE60168 
X-CRM114-Status: GOOD (  28.87  )
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

On 7/30/2026 6:54 AM, Jeff Johnson wrote:
> On 7/28/2026 7:00 PM, ZhaoJinming wrote:
>> In ath11k_ahb_config_irq(), when a CE request_irq() fails, the function
>> returns the error immediately without freeing the CE IRQs that were
>> successfully registered in previous loop iterations. The probe error
>> path does not call ath11k_ahb_free_irq() either, so the previously
>> registered CE IRQ handlers remain attached to the interrupt lines and
>> are never released.
>>
>> In ath11k_ahb_config_ext_irq(), when an external request_irq() fails,
>> the error is only logged and the loop continues. The function then
>> returns 0 indicating success, leaving the device in a partially
>> configured state where some external IRQs are not registered. This
>> causes enable_irq()/disable_irq()/free_irq() to be called on
>> unregistered IRQs during runtime and remove/shutdown, triggering
>> WARN_ON(!desc->action), and missing interrupt handlers lead to data
>> loss.
>>
>> Additionally, if alloc_netdev_dummy() fails for a later IRQ group, the
>> function returns -ENOMEM without freeing the ext IRQs and napi_ndev
>> that were successfully set up for earlier groups.
>>
>> Fix all three issues: propagate the error up to the caller and unwind
>> all successfully registered IRQs and allocated resources on failure.
>> Also move ab->irq_num[irq_idx] assignment after request_irq() succeeds
>> in the ext IRQ path to match the CE IRQ path and avoid storing a stale
>> IRQ number on failure.
>>
> 
> Is there a reason you didn't carry forward Baochen's Reviewed-by: tag?
> 
> He first gave the the tag for v4
> 
> In v5 the code was unchanged, and Baochen commented:
> I have given my Reviewed-by: tag in the v4 review. Since v5 is identical to v4
> you should pick it.
> 
> once again:
> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> 
> v6 was a trivial change in code. If you had applied his Reviewed-by then I
> would have maintained it for v6. if it had been a bigger diff then it might be
> ok to drop the Reviewed-by, but you'd then want to mention that in the commit
> history
> 
> v7 was unchanged from v6 so it should have had Baochen's RB.
> code in v8 was unchanged from v7 so it should have had Baochen's RB.
> 
> This is another good reason to use b4 for patch maintenance.
> "b4 trailers -u" will accumulate any tags and update your patch.
> 
> That is all advice for next time.
> 
> You don't need to post another version to pick up the RB tag.
> Running b4 in maintainer mode will pick up the one I just added above.
> 
> Baochen, no need to re-review.
> Ramesh, would like you to review.


Looks like my RB was already present on v6. Nevertheless, I've added it 
to v8 as well.


--
Ramesh

