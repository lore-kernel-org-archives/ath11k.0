Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E93C55822
	for <ath11k@archiver.kernel.org>; Wed,  5 Aug 2026 10:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f7TvXrEwxNxYGHqagweuLdI2HuNVd9ApPoKl7MTkzyU=; b=lla630yGJTeO+pbCPfnHjtn/pS
	puesaSvIwZ6TLNlyk8DixpUqd2d6Inh2ajM9ZLOwUav+eiLk8NbBjFHz1k2GmkiDB+of06YuseVI2
	KlYq4/jANCAQhUwVUbdAKo1Wfsr6VXaurdTVzZLCFeh/YxbLVaMsy3vqqnkJPN1c+T3BZKxSMc4fh
	TeRFl3fCOiO2LrhV/XVPniyIU/rF3wrEd5fGlaWKJAiR/7iBV1m9MAE78pUwQ8sH5009/hg8je+FD
	QUiQBUvmFPrkVz0Ur96VRDXUlkNreQPjqHTM7350AOcu2vjm2qlgVkuMIU31JmVELHgrnVWiNW9IP
	//9hmiNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrYXK-00000003gxo-09CX;
	Wed, 05 Aug 2026 10:07:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrYXH-00000003gx4-0FbM
	for ath11k@lists.infradead.org;
	Wed, 05 Aug 2026 10:07:44 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6758d9Ym3540069
	for <ath11k@lists.infradead.org>; Wed, 5 Aug 2026 10:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f7TvXrEwxNxYGHqagweuLdI2HuNVd9ApPoKl7MTkzyU=; b=K7+mtetmpPkwGFpC
	UQJsPX3k2m3A5VIwEfEa1AIJ2ObBPCo2TOm5j7d7VDYyJlA+TLee2feIB3rKZrFT
	X7Be86pOe14DbB3Uj9v6crPfkTlungcBLIkm78pacIkVrkVwVAQKSlpEjHdcvdvN
	cz0oavodhmzcBfHz9ZLFgSsxjqnCnimsSvybG6K9Dboh3yw0X4/EpxfvUClJGwU6
	rOx4PajwdDtGYTU87i0bmhrCHrQ9SUM/CJHBMC9IxjTgFdLPAEVYh6qRMjjHto3M
	NBrU5UtbNIY/7llR4SDWMTOmx4Qj+fA6Ob+aqvQORc/r78iIw1Kx/uSupJ9vv7Ad
	cg+vbg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuu3uj47h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 05 Aug 2026 10:07:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so1312108a91.0
        for <ath11k@lists.infradead.org>; Wed, 05 Aug 2026 03:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785924462; x=1786529262; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f7TvXrEwxNxYGHqagweuLdI2HuNVd9ApPoKl7MTkzyU=;
        b=JJci7WBOhbF7pKZHEkUcNA9+4fzjan4l7/iCEAx/2K+jXP8vVh7WKQ8O3NSdktSIt8
         jfjGZgeYzeOKnu5liSu+9qV5HZCX8qu3LZEXp3a+81cdzZG2bhxf9nRJRyGKJm7giSUg
         fuDmVt61QvpB1DtduSb4Pq2xAizPcB3lTHSIW7+J2mGusr25PkIlNzk7WlDG9hnfppkB
         wSNZQFo1dEh8jJeEeYPgEcI9f1/lJ9aKmeXY3mP4yo+8SyN/ZLq3vPLJFks5P6AvYgRb
         AYjfEGUCDemqA6eH+8tSK1DwGakcLtHJg5iPAhoJMmQXtJJn761SGu+ZcQ/wsdUW8oQ9
         Npcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785924462; x=1786529262;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f7TvXrEwxNxYGHqagweuLdI2HuNVd9ApPoKl7MTkzyU=;
        b=cykkLRWcffskkXGsRfqmnRwrJIUtv3DFP+zuMifD0cpHvSF8hWHpDBQfwvfzeuZWJG
         Jg4jajjhc3wKk0rY3llPeR7gcYAUUi2ldbGK718DIWL048Xkjy5Qh58PVIpl6de8uEGs
         MhMK/k4/J5w/w7RIAm0PfkNxq8yO9vkgY1+uDt1MqAoRBer+TOo/HTv4CDLiYtCCdaex
         vsy1hsdlHe/LAIPgAHSg9wxdA6r4Z7EM/3SRsVXKHekEpGVFI5TWdZGbFf602uJp5Gtz
         xaxfogaCO+72mHqqGO7IRo9l8vNlUJ+Pqm5iPnc9LjOPOB9M6pwn+8w9M7zFOZrHQLGk
         yDYA==
X-Gm-Message-State: AOJu0YwPX6zLc04casHFiwSaUASiKk6Ois4QDVuHAphbrY7yijLYHXx3
	W7hanbsZN7TOk9AMIW+O39wSi8ORB24RKwf7nfT1U8M5nEKF1Pg38AGBNWWUyX4BgIlHa6aitgj
	jqciTNK5Oy8uin++3CNHOcS3eS0dINqIUk8eT8Ap3w0SL7GRhAKLpNFwoG+ZxZuyo
X-Gm-Gg: AR+sD136hURm80Ylyee4EAhxZ4oAIyk8SozhIzCNekC1W8+EUKZ85UWJjs+s70DgCnB
	yDMiiwn4S4dtFn64hXC6ri1ZoPBBxCtyYHjjCKt7SoOmhhc53xWpNmbjFrP+wd3mgjsjjRQX+TU
	hxM2lqFOIx3P1Vx+muE522OtSQiUZ4PDXwADjlPzTH0a8wgkxjPsQh1iv14jhxKs9TGioGxRI9q
	DyB3QUOLOe2IbMEeMVU8ikaQhcsSaLvGiJ9tVuoRStRJSKNB4gyRwtZ2Gp+5+rFTM+0JMwaJ21h
	A6KJUzNnbJvVkwqMt6wBNdgupIC2Q+1A2f0kvS7Hv89nxhAk9m0TF7h0clzx4LSsvZUbtRQg/YD
	JhoCyTZBCAw4xRJl2PwBym5j+qpVDqvictny4husz
X-Received: by 2002:a17:90b:1c84:b0:38f:1e1a:515e with SMTP id 98e67ed59e1d1-3903c5b1688mr5154535a91.14.1785924461754;
        Wed, 05 Aug 2026 03:07:41 -0700 (PDT)
X-Received: by 2002:a17:90b:1c84:b0:38f:1e1a:515e with SMTP id 98e67ed59e1d1-3903c5b1688mr5154442a91.14.1785924461194;
        Wed, 05 Aug 2026 03:07:41 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca6576b7sm11507202c88.7.2026.08.05.03.07.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 03:07:40 -0700 (PDT)
Message-ID: <3214559e-a9a6-49ea-a421-c41698fc2114@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 15:37:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH ath-current 2/3] wifi: ath11k: fix NULL dereference
 in ahb remove when QMI init incomplete
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260730030948.147892-1-miaoqing.pan@oss.qualcomm.com>
 <20260730030948.147892-3-miaoqing.pan@oss.qualcomm.com>
 <114b5ae4-002a-4f35-8fb1-0ebf44e9250a@oss.qualcomm.com>
 <61e47242-7615-4bc7-af80-c671318b3c0d@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <61e47242-7615-4bc7-af80-c671318b3c0d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA4MCBTYWx0ZWRfX4b+5roITCj0n
 ThpP2SZE5AZ0tqU5MwpIVpa6hvMIhtTO3Xj3813AWcqNhTuVzyANklsEyroAfs2QZzj6MA63k+J
 7UExNhuTpklEWCwDcTUY0QS0ST3SuxA=
X-Proofpoint-GUID: vqMryivRdB8b5D19_ZSxpqJgke5Db1MY
X-Authority-Analysis: v=2.4 cv=B5aJFutM c=1 sm=1 tr=0 ts=6a730b6e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=u_1nGVd5-Qw513d467YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: vqMryivRdB8b5D19_ZSxpqJgke5Db1MY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA4MCBTYWx0ZWRfX+YEzTDWxTSl5
 cwgGI8yu8qKaH5Sed3w+cV9z4rHXH+52F6hC6Tz3PcJYqW7SUNMAS968lhiAbqrei+blltYR8Z+
 wweZqVPk3EoWnJQy4vZBSXgVgLVdzhBUXRp5Bjnrjrvdcs/oeMgLKPKKrZe8krzh9Fe5hWLVW+T
 x7FWylV40TqEcQvasynZLmtntHuiYgJYUmkGciPlrp5rqu7RcWaiI7E4WCwMZET1dQo8Uww5Qi3
 rWOjQlBXXnPhtpGacKYxky+yD4UU9XaEQEijug4eNP5KqzvystDJwfUnt7NvHhzajOzzAoZ8g81
 hYf4moBWktAVd0E0QJvxSwNAfe93rlrAtmVoizsdWmdBpZsC0RfzqsWHU132IRQTQslSitgisLh
 OomzQxR5rLFMY6W6RgSEJ64aEix8weOJJmVyPO3FihjO/9JsnVhnvHgWN8HQ+zeZEC1u4C2ueCi
 n5zCvrjMBs01IZqQgPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_030743_103547_724B4314 
X-CRM114-Status: GOOD (  20.17  )
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

On 8/3/2026 12:17 PM, Miaoqing Pan wrote:
> 
> 
> On 7/31/2026 5:24 PM, Rameshkumar Sundaram wrote:
>> On 7/30/2026 8:39 AM, Miaoqing Pan wrote:
>>> On WCN6750, if QMI messages never arrive (for example when qrtr_smd
>>> is not ready), WLAN initialization stops before the device is fully
>>> registered. In this case ATH11K_FLAG_QMI_FAIL is not set because no
>>> QMI event handler is executed.
>>>
>>> When the driver is removed, ath11k_ahb_remove() still calls
>>> ath11k_core_deinit(), which eventually triggers
>>> ath11k_ce_cleanup_pipes() on uninitialized CE pipes and results in a
>>> NULL pointer dereference in ath11k_hal_srng_access_begin():
>>>
>>>    ath11k_hal_srng_access_begin+0x14/0x68 [ath11k]
>>>    ath11k_ce_cleanup_pipes+0x184/0x190 [ath11k]
>>>    ath11k_pcic_stop+0x24/0x38 [ath11k]
>>>    ath11k_core_deinit+0xfc/0x1c0 [ath11k]
>>>    ath11k_ahb_remove+0x38/0xa0 [ath11k_ahb]
>>>
>>> Fix this by invoking ath11k_ahb_remove_prepare() before the state
>>> check and skipping ath11k_core_deinit() when either QMI initialization
>>> failed or the device was never registered. If ATH11K_FLAG_REGISTERED
>>> is not set, core initialization did not complete and CE pipes may
>>> remain uninitialized, making ath11k_core_deinit() unsafe.
>>>
>>> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.2.0.c2-00204-QCAMSLSWPLZ-1
>>>
>>> Fixes: 00402f49d26f ("ath11k: Add support for WCN6750 device")
>>> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
>>> ---
>>>   drivers/net/wireless/ath/ath11k/ahb.c | 6 ++++--
>>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/ 
>>> wireless/ath/ath11k/ahb.c
>>> index fb5640882b98..7f5f5c8d7c56 100644
>>> --- a/drivers/net/wireless/ath/ath11k/ahb.c
>>> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
>>> @@ -1265,14 +1265,16 @@ static void ath11k_ahb_remove(struct 
>>> platform_device *pdev)
>>>   {
>>>       struct ath11k_base *ab = platform_get_drvdata(pdev);
>>> -    if (test_bit(ATH11K_FLAG_QMI_FAIL, &ab->dev_flags)) {
>>> +    ath11k_ahb_remove_prepare(ab);
>>> +
>>> +    if (test_bit(ATH11K_FLAG_QMI_FAIL, &ab->dev_flags) ||
>>> +        !test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags)) {
>>
>> Can we use ATH11K_FLAG_REGISTERED alone to decide the cleanup path? If 
>> REGISTERED is set, ath11k_core_qmi_firmware_ready() completed at least 
>> once and the normal ath11k_core_deinit() path should run. If QMI 
>> failed on recovery (say before FW_READY or INIT_DONE) this should 
>> still do core_deinit() isn't ?
>>
>>
> During SSR recovery, it is possible for a QMI failure to occur after the 
> device has already been registered, which could result in both 
> ATH11K_FLAG_REGISTERED and ATH11K_FLAG_QMI_FAIL being set at the same time.

Yeah so in that case current code will skip core_deinit() which should 
actually run isn't ? Though the QMI has failed on recovery the core was 
already initialized and should be torn down.

>>>           ath11k_ahb_power_down(ab, false);
>>>           ath11k_debugfs_soc_destroy(ab);
>>>           ath11k_qmi_deinit_service(ab);
>>>           goto qmi_fail;
>>>       }
>>> -    ath11k_ahb_remove_prepare(ab);
>>>       ath11k_core_deinit(ab);
>>>   qmi_fail:
>>

--
Ramesh

