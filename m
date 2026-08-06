Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D88C56208
	for <ath11k@archiver.kernel.org>; Thu,  6 Aug 2026 09:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ay8uYOaBQdPle+ZgQFRxfmvrviTk9ovPSjnn5gt1Cuo=; b=F3AFCRzzJt5PYb+gtQMfs7FN9d
	f8SmwEQMSDP6sr1wNmRojDJ0yQPVnpn2coVpl96njtlSaPXv1314A+q4T1HXMnfK0BciQkTeNl9jh
	AketPCcbAevgM4gyqatZwr1k1DXIXK1D2c4KkanrDEQ/nYufqGAF2v9oxoXqON6eTWjM8AZybjxMf
	3Z0skv2nVmTOXrBazTg+XMfGZ3QxcdXZ3nNDUZFs3AVfoT+vfS5CDq9JZdpPeLby0Rw7xRtn+zg0f
	vE/S9G4bNjVdhRfTSRykvH3I+6cCVSK76axMiHAxoA1nbq84ETKoMuoYQGXO8HxaxLJmXOImxV9XX
	uCWZAZPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrupD-00000005Tgb-2Rf6;
	Thu, 06 Aug 2026 09:55:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrupA-00000005Tg1-1X98
	for ath11k@lists.infradead.org;
	Thu, 06 Aug 2026 09:55:41 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nhr61309003
	for <ath11k@lists.infradead.org>; Thu, 6 Aug 2026 09:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ay8uYOaBQdPle+ZgQFRxfmvrviTk9ovPSjnn5gt1Cuo=; b=E/P6DXeugsFXrIZN
	jjk91DBAme5pX4b/55NQU6w/SA3CWGIe5IJEyCfjkFN1KOkhO9fmZE005/F9pU6R
	pn37L+EjvTn3Max0QqzV9n2zhNLXPwOtDbLc/sTxL39bdp8EETrjFS8wYIDH0yut
	Km0qofdAzAdc9PDk+yDjtZhpuVZG2l5wWLE+c/UnUJGL+HOp32l98OccGEvKUT6h
	qQ6c94GgIQ/NActQ0o4UCT6ClL2FX5HcrUdcgZMshzvNLfWc6eW9tc+u2cZa7eDU
	U6NfbY0yH1+00SsxEYkiut9MBebyiX14fjehcFTAarhN7eNJLyrpn5tfH055FLqQ
	eV5DkQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvp728h7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 06 Aug 2026 09:55:38 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8485d853b08so3478370b3a.1
        for <ath11k@lists.infradead.org>; Thu, 06 Aug 2026 02:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786010137; x=1786614937; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ay8uYOaBQdPle+ZgQFRxfmvrviTk9ovPSjnn5gt1Cuo=;
        b=X9Zkcxd0oRoxLF/6bb6vUanubeMePIB+lRPW5WNnGwdBvzfbd1Zb4y3Kqx1wSaBl8z
         9MVnnukc7uGbI+j7Spgqoa32qA9VMOFsH1Z6bKEMxs+O8fVarl1sP+ujA5zrO0DEeinv
         sFvFxi/X5+Sk+CeayT2XWqg7iNT0SMlMbV0gRd/5HN12A8S3cXSzEk/N9yFY+qM5LRYn
         A8HMKxvFkJ8gfMHBO5FiWnylYTO86hT5y90dUSoam2eNDdBJNi5Py8RsRSRnE9B+Yy3X
         3RUrpDVJujBmx/d2K9cbsaajBV66vW+gGIK2ckvGgkNUzOPxwLlWUw0Na2awuJEUfkrv
         YwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786010137; x=1786614937;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ay8uYOaBQdPle+ZgQFRxfmvrviTk9ovPSjnn5gt1Cuo=;
        b=i6zyM7PJqv14QTpoWqng+sPFhhIw53KMrAeGCR+A8+1jdZx3xfn8MTHTwAW7jWpFgO
         gl/2M7Gn0CIfRq+2jF6P63DSk86210VZRd+XLZDa8UBxmJLU2ax0xGsxh2LYm6g0xI2f
         I7Jiil0Q70ALkow/WtXXWQKSK9SpH8nW3c9L4+56hAVgOWVVrhK8yB30b7Ktr6cPI/kT
         UxSbkN3iFWr9YAhPue4w9ZznuMeAylmqkpMVBcDXcyY4zgejababhwZXUMxjrW3d3t2t
         gKCgHuSFOsfsmKSfTNBAt/qVQObZFn0JXVhbCwMP+vacQmrWA9kJG+o7vDHNVqNKmB8D
         R3bQ==
X-Gm-Message-State: AOJu0YyhD5pu0aorLYtivxYPJqHgOJiee6OpUmqI8zXTouvrITOfaqh1
	hd9MRuxm4s5nHc/6IcgYGOxzsShUstCRFozGRFPU+W3HMQEA24JCiPb9bSFhXcwB/bQnHRJig9K
	T27EGqaQEKzJnEy47RO/6K+wiCEyvV+yxrUDUGPqSK3+1Ytz70lcYTn/FinWzMM09
X-Gm-Gg: AR+sD13ioTKq0kSkkXsjA0Yc0RN5KlHmWStfxXK0oPpjP5dmqyEnA9heueGubihxWY9
	KFTgbVRUwGwyXEHicjlOGMW4U2Ck1stpC8dsxHqwDEaCYYpmaXkJXMYtTlz7ZYr09iM0asph81Y
	J8z/VtI6/GhtepcuEbuReh2IY3hTf8xUSkuQ+4rrspAfqDag52/9zdSy/4dcRwuk/nzUQcymZxu
	I+auI8GwOjnyfZZpQtsOE9QM/eHvbiCY9xeQOvSxJ8JIi+pysAA/FVya3M4IGq9R+etmVqYYNUS
	ebJ29knbU+b9gpZBxTso8RKEO6g8jWhy3h8O0qmV7O48kQ6rXGUcwd8/Nm0vKjon8ICwTRAHXPM
	B4ak7Nc+26rW85z3Ejxttz9oQyvzs36lVnoQTLXwMKWTXVOgAeKRhQ6Sscxtd3gB9caviSHt1
X-Received: by 2002:a05:6a00:3a0f:b0:848:3f07:c5a2 with SMTP id d2e1a72fcca58-84f2dfd0a06mr13523399b3a.4.1786010137053;
        Thu, 06 Aug 2026 02:55:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:3a0f:b0:848:3f07:c5a2 with SMTP id d2e1a72fcca58-84f2dfd0a06mr13523356b3a.4.1786010136540;
        Thu, 06 Aug 2026 02:55:36 -0700 (PDT)
Received: from [10.133.33.160] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f453b0adfsm1062537b3a.15.2026.08.06.02.55.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 02:55:35 -0700 (PDT)
Message-ID: <32516b72-cacb-4c4d-a23b-a8dc6489dea7@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 17:55:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH ath-current 2/3] wifi: ath11k: fix NULL dereference
 in ahb remove when QMI init incomplete
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260730030948.147892-1-miaoqing.pan@oss.qualcomm.com>
 <20260730030948.147892-3-miaoqing.pan@oss.qualcomm.com>
 <114b5ae4-002a-4f35-8fb1-0ebf44e9250a@oss.qualcomm.com>
 <61e47242-7615-4bc7-af80-c671318b3c0d@oss.qualcomm.com>
 <3214559e-a9a6-49ea-a421-c41698fc2114@oss.qualcomm.com>
Content-Language: en-US
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <3214559e-a9a6-49ea-a421-c41698fc2114@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7cViBYhcba3rGXdwL0em03I5irFwPyzR
X-Authority-Analysis: v=2.4 cv=JYCMa0KV c=1 sm=1 tr=0 ts=6a745a1a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=qvQTsly1c9rGXFxJrb0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA3NiBTYWx0ZWRfX7IV1luLBIHLl
 DoISJszPI17/zwP/ffVYblElF/kJWxw6/x0pry1xKyv/Ca8sppbL8oafYfiXpHbaQACOYzFzRJV
 hBfy8yE9p37bAMjQ+/xKSCyy0KQ/ddMcc3UcLWwixIXfoFq7fNLlS3hy1XffQca3pEcdJvKqdHF
 BZ8q4E7tmwCX7D+W1ghGbOyikemllrFjuXSPT8rtQ9H6bJh+j6jusRaDHVgH2RhQbBHpJV3yzlZ
 FKKBTe6A03HljhOokHoc/JkAURwyL3AjeID1QkXz76X9qr88gunxFRWnZRnMYezr+6HvchjMEfK
 Qmb4T6YcV8A8YK7wK+EufJZ1kAqDE4jUG94EK5K1pdZoyo2Nwwfr/qrY5FKZhizA4oQaVe2dHcu
 G7LixMiym8OpSDUrhiQKNeywNzD61n1MeG5JdMh5rdXNl+XGIEp8CEbTB8RSKh7++6Zrg59ox0X
 FkYUvdmNbPrvvLhaydQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA3NiBTYWx0ZWRfX0mcmBMG1Hwkm
 UEWZjPQcLo9HNGm2jtyF7M5rA9qPxFCzREB9FqHQ8Z0f7q7IAgLxuhQFx6NE8c0JJsAI7vObkVS
 YvDsT9NOi4PZ57Nu6i+d5w4EGnMHW0w=
X-Proofpoint-GUID: 7cViBYhcba3rGXdwL0em03I5irFwPyzR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_025540_523800_B989E121 
X-CRM114-Status: GOOD (  22.02  )
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



On 8/5/2026 6:07 PM, Rameshkumar Sundaram wrote:
> On 8/3/2026 12:17 PM, Miaoqing Pan wrote:
>>
>>
>> On 7/31/2026 5:24 PM, Rameshkumar Sundaram wrote:
>>> On 7/30/2026 8:39 AM, Miaoqing Pan wrote:
>>>> On WCN6750, if QMI messages never arrive (for example when qrtr_smd
>>>> is not ready), WLAN initialization stops before the device is fully
>>>> registered. In this case ATH11K_FLAG_QMI_FAIL is not set because no
>>>> QMI event handler is executed.
>>>>
>>>> When the driver is removed, ath11k_ahb_remove() still calls
>>>> ath11k_core_deinit(), which eventually triggers
>>>> ath11k_ce_cleanup_pipes() on uninitialized CE pipes and results in a
>>>> NULL pointer dereference in ath11k_hal_srng_access_begin():
>>>>
>>>>    ath11k_hal_srng_access_begin+0x14/0x68 [ath11k]
>>>>    ath11k_ce_cleanup_pipes+0x184/0x190 [ath11k]
>>>>    ath11k_pcic_stop+0x24/0x38 [ath11k]
>>>>    ath11k_core_deinit+0xfc/0x1c0 [ath11k]
>>>>    ath11k_ahb_remove+0x38/0xa0 [ath11k_ahb]
>>>>
>>>> Fix this by invoking ath11k_ahb_remove_prepare() before the state
>>>> check and skipping ath11k_core_deinit() when either QMI initialization
>>>> failed or the device was never registered. If ATH11K_FLAG_REGISTERED
>>>> is not set, core initialization did not complete and CE pipes may
>>>> remain uninitialized, making ath11k_core_deinit() unsafe.
>>>>
>>>> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.2.0.c2-00204-QCAMSLSWPLZ-1
>>>>
>>>> Fixes: 00402f49d26f ("ath11k: Add support for WCN6750 device")
>>>> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
>>>> ---
>>>>   drivers/net/wireless/ath/ath11k/ahb.c | 6 ++++--
>>>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/ 
>>>> wireless/ath/ath11k/ahb.c
>>>> index fb5640882b98..7f5f5c8d7c56 100644
>>>> --- a/drivers/net/wireless/ath/ath11k/ahb.c
>>>> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
>>>> @@ -1265,14 +1265,16 @@ static void ath11k_ahb_remove(struct 
>>>> platform_device *pdev)
>>>>   {
>>>>       struct ath11k_base *ab = platform_get_drvdata(pdev);
>>>> -    if (test_bit(ATH11K_FLAG_QMI_FAIL, &ab->dev_flags)) {
>>>> +    ath11k_ahb_remove_prepare(ab);
>>>> +
>>>> +    if (test_bit(ATH11K_FLAG_QMI_FAIL, &ab->dev_flags) ||
>>>> +        !test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags)) {
>>>
>>> Can we use ATH11K_FLAG_REGISTERED alone to decide the cleanup path? 
>>> If REGISTERED is set, ath11k_core_qmi_firmware_ready() completed at 
>>> least once and the normal ath11k_core_deinit() path should run. If 
>>> QMI failed on recovery (say before FW_READY or INIT_DONE) this should 
>>> still do core_deinit() isn't ?
>>>
>>>
>> During SSR recovery, it is possible for a QMI failure to occur after 
>> the device has already been registered, which could result in both 
>> ATH11K_FLAG_REGISTERED and ATH11K_FLAG_QMI_FAIL being set at the same 
>> time.
> 
> Yeah so in that case current code will skip core_deinit() which should 
> actually run isn't ? Though the QMI has failed on recovery the core was 
> already initialized and should be torn down.
> 

Thanks for the review.

You are right. During SSR, if QMI fails after the device is already 
registered, core_deinit() should still run for proper cleanup. Will send v2.

>>>>           ath11k_ahb_power_down(ab, false);
>>>>           ath11k_debugfs_soc_destroy(ab);
>>>>           ath11k_qmi_deinit_service(ab);
>>>>           goto qmi_fail;
>>>>       }
>>>> -    ath11k_ahb_remove_prepare(ab);
>>>>       ath11k_core_deinit(ab);
>>>>   qmi_fail:
>>>
> 
> -- 
> Ramesh


