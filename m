Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7893DC55162
	for <ath11k@archiver.kernel.org>; Mon,  3 Aug 2026 06:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qw0W65FpIA946+bV4CaxyQ5WtsNBLoyMWlGxSArzdJQ=; b=t/N676iVDVIgMoQq36DVzokExa
	OzjhZ0SY5iw9+uHGvxxFCtL9+3ny7R/9jFD3+XQFljLEjmfCH0JYEQZRiBvkTx0o6scujfbAh9laT
	81YnpoIbKm4LyY0UrZv9DWRHoEz+ORnDF2fYxkW66VyY/VkzYo1g0vf6UH526+JzLnB89ZKGiIYQt
	ywQlc5Nux4YOnhS+7xV1VeUtnwtYv34JC6o5nmRVBK7sJWLvJiJptz33ZPjLiG8ZqqTJT+P/bhT4+
	OaO8tnnno4FPmCsjBg9SDRIq7qow3iFwpY81tuPZ2PN3zj9r6BrB5gMDwDdPKZoQvqPzYMf6dISh8
	7W2da80w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqmSW-0000000GTEi-47b2;
	Mon, 03 Aug 2026 06:47:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqmSS-0000000GTEH-1rTw
	for ath11k@lists.infradead.org;
	Mon, 03 Aug 2026 06:47:35 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736SlsO3759185
	for <ath11k@lists.infradead.org>; Mon, 3 Aug 2026 06:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qw0W65FpIA946+bV4CaxyQ5WtsNBLoyMWlGxSArzdJQ=; b=L6PHEK3YJQdw3ylI
	R+Dbq3s1aGW3SsWmYtNA8wHdMqBDaUwbHc9+3CrppPyVLM6Zc3gK8N3bcsLdJUlf
	Rua6wPN3wQ9Wxni6X4l2izk/r2pYaES4P9ifBNoc95C5FBE6tklvLHe0OvS02ZSs
	eWrUwvN1du80Shr9WF9aphocQp3Wm0Q316OGPc9i/4i0qsBH/9RuUWCApG/vzfAh
	pFLVqZMGrddQwdithliac3tF7OsE1kug27WtEB2ALxJVT6/bzNWf831fuwn8i/2p
	z51eK1NQoMnjtrsNwWqe9tgiuMsKfqZGy4DZw1YJpgFVJzKfWgDANpkZxeE2nzMn
	emQ8yg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrnr2em-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 03 Aug 2026 06:47:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cf1c86963bso34549275ad.0
        for <ath11k@lists.infradead.org>; Sun, 02 Aug 2026 23:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785739651; x=1786344451; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qw0W65FpIA946+bV4CaxyQ5WtsNBLoyMWlGxSArzdJQ=;
        b=YMZvuTi+MZ1lqSAwYabHnQ35F/Dg0L5fblBnO5EuIzOu9rFIWe4u8u4BDjkSZQOh88
         OJh0IC1vMft+YKzg0juLPYzh66kbIcpzb0z7VSwuOUuIhohzel1vtKSCsAet3Iy0Hx7V
         uUsWB83cmhx6vO5VMgmQlCq+lZdA6Bw29E1EmAKZVE9h+dmeLcdVPLhnqvDfmj58emhQ
         43eD7WRKvhTX93ZqFkdEw6qAPZbsdGA3Iult78Ek5GypVeTc6Co2eVtKeLSxta7rusuS
         1HbWE/ctcCqXuqhU2UGwrtHYZKRAj7PGL/gNNMW/iEbMdNnu+OI+VEcFxJvrKTnLyYTi
         qZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785739651; x=1786344451;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qw0W65FpIA946+bV4CaxyQ5WtsNBLoyMWlGxSArzdJQ=;
        b=icN3hndqbS9JBihynBW5kyzicGZW/Jnvb1jWi22J7gIxsz8YnnduPdwcrnLY37MCFE
         mogD82TtmjfgFexYLko09AnR9yD/AY7vcyM/yg4B5AxAfeGy5HnYUfpjC0ctQx8Lbng7
         el+p82/dhqLbpV/fAwiuijJ4M9Rjhpi/VPY5CDM/KA0ON1rIXRUxXHuXbZkp9NzotMlw
         x4NDaRUqnOjrI8ReKozGYwEDHHiVc5nysIIYi8JsTOhxEJGHi57/7rzgs1qtTZhGVCv3
         PDomfWgXUHktIFusAA8hktAJmbYuQwGxaH+U0/Wdn87xXYOAOn+X/Qhg1im14gYYyx9C
         iHYA==
X-Gm-Message-State: AOJu0Yx23qq3kiXyqUTjIHEA1gL3p/4HP4oZDnDs7nw4dud4162CHtwH
	YBDtK54FFW2XuZ3V6S0nZoVHUxI2jZ87tm7St+7/MYz5PvQrzL1kBZ5znIs2yu6rAWTxS+oPpVQ
	RiKqFMQV/u301ZqWjTG4GLVR1riyXigbVt9ac/NZPjT2OCJ7cWPMmWLBp0lrAN4zogDk+WqHUoA
	Q=
X-Gm-Gg: AR+sD13n6s5OWskGebffu/1L+gaMXljY7/FkcYDZdp75OgNzqWZ5eLMyN/JTHhOZ9Yc
	z41kDuJ1+shVgTNFMm1G/6/4Y943Ehf0qv2YCy0weIXxlbtCiC+uDhxW1jrP34X9TlPozpyEZay
	xDH02E7kyw/KhZuKxE63KcYUBhdxKLcqZ/Bkc2Eaq0dZY0xT8uFnDepDK3WV/7fF24oZmsw4PRR
	cU5xkmMVSAVkFhKQX1jSa3E6pEoa0NXDclgEbg4Q1OaaMM1TzUEf3mWy6BuDWt05fRLo+SKrdZI
	/zWLBaQaid4Wxn2acYPq4Qp36jd89Yyiz47YlfCk++mWLYWD5ZgNC8isU+wHT/N/AIu4YoXx2vK
	7X+aSPLrzxSfHZONHPypsoPjKAi5OIjm0g4vz9ZL9R2yLWuQq6hsoPwJYxOF7kD6ePzU3zME=
X-Received: by 2002:a17:902:ebc6:b0:2c6:8d95:fd7e with SMTP id d9443c01a7336-2d047d1e722mr123426815ad.6.1785739651075;
        Sun, 02 Aug 2026 23:47:31 -0700 (PDT)
X-Received: by 2002:a17:902:ebc6:b0:2c6:8d95:fd7e with SMTP id d9443c01a7336-2d047d1e722mr123426635ad.6.1785739650679;
        Sun, 02 Aug 2026 23:47:30 -0700 (PDT)
Received: from [10.133.33.22] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae5ac3dsm33274995ad.23.2026.08.02.23.47.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 23:47:30 -0700 (PDT)
Message-ID: <61e47242-7615-4bc7-af80-c671318b3c0d@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 14:47:27 +0800
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
Content-Language: en-US
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <114b5ae4-002a-4f35-8fb1-0ebf44e9250a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA1OCBTYWx0ZWRfX17HKGaAyXFbP
 HqxFCOfVkPiAUti9KzaTB9WVfT+8RbTW8AyShSgIfQkXvoLpNTNErikYxdXKTq0is7ZjeQUV0sH
 /oSzhLHcKqm+CoR4RtNFksNobaXTCIU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA1OCBTYWx0ZWRfX9bc6tbjUCA7t
 58YqtS7W0sY7HZ7PGMomC8hxabS4t/NMokUAyqRg/z1qaRVaI6d5sfWuINQSuZltORy++GxXZ+M
 mQ9Cbb6b7v9d7VGiWQ+6lsfYiNnC9qLHclVVk4tHVuwmFtSHSQz2wsaCMjWl6mvNcNCuJ8udJuF
 95VtjdclJwJ7MvBJw+tqxU1vNtI/7+8gcTaJZ+hcs4iTWNF+kMVRes87elRj/N5Nor30cJMEFKR
 vic2LlTZbUPH7w4AkGmkfoPL6oHi84mrVz5Ky231OvpEVAs9AoyvOYt5ORfCWwCrPi0KXbvF7o8
 IouQRpwAuH/DDuD1TJFLnzrCkAPc/eE7VK7cut2W0U7NXSGWcz7gk8sjf9vHgt2I0ddVtbB+yDQ
 WMn1rAGaMkOkv5/ojXdphUs3RA9KKQ3Ug34DQZGjaTVRZXi5QzvCp4lyItW3W+ng8BBPRTyUvei
 5B0cSW787PwXMKtGtlQ==
X-Authority-Analysis: v=2.4 cv=Zest8MVA c=1 sm=1 tr=0 ts=6a703983 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=NB9-HOlxhKWhaxssQNMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: Obu2_QZvAAQNs-qtVyu-wzWc_7dy4iH0
X-Proofpoint-ORIG-GUID: Obu2_QZvAAQNs-qtVyu-wzWc_7dy4iH0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_234732_495535_911CDB0B 
X-CRM114-Status: GOOD (  22.41  )
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



On 7/31/2026 5:24 PM, Rameshkumar Sundaram wrote:
> On 7/30/2026 8:39 AM, Miaoqing Pan wrote:
>> On WCN6750, if QMI messages never arrive (for example when qrtr_smd
>> is not ready), WLAN initialization stops before the device is fully
>> registered. In this case ATH11K_FLAG_QMI_FAIL is not set because no
>> QMI event handler is executed.
>>
>> When the driver is removed, ath11k_ahb_remove() still calls
>> ath11k_core_deinit(), which eventually triggers
>> ath11k_ce_cleanup_pipes() on uninitialized CE pipes and results in a
>> NULL pointer dereference in ath11k_hal_srng_access_begin():
>>
>>    ath11k_hal_srng_access_begin+0x14/0x68 [ath11k]
>>    ath11k_ce_cleanup_pipes+0x184/0x190 [ath11k]
>>    ath11k_pcic_stop+0x24/0x38 [ath11k]
>>    ath11k_core_deinit+0xfc/0x1c0 [ath11k]
>>    ath11k_ahb_remove+0x38/0xa0 [ath11k_ahb]
>>
>> Fix this by invoking ath11k_ahb_remove_prepare() before the state
>> check and skipping ath11k_core_deinit() when either QMI initialization
>> failed or the device was never registered. If ATH11K_FLAG_REGISTERED
>> is not set, core initialization did not complete and CE pipes may
>> remain uninitialized, making ath11k_core_deinit() unsafe.
>>
>> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.2.0.c2-00204-QCAMSLSWPLZ-1
>>
>> Fixes: 00402f49d26f ("ath11k: Add support for WCN6750 device")
>> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
>> ---
>>   drivers/net/wireless/ath/ath11k/ahb.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/ 
>> wireless/ath/ath11k/ahb.c
>> index fb5640882b98..7f5f5c8d7c56 100644
>> --- a/drivers/net/wireless/ath/ath11k/ahb.c
>> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
>> @@ -1265,14 +1265,16 @@ static void ath11k_ahb_remove(struct 
>> platform_device *pdev)
>>   {
>>       struct ath11k_base *ab = platform_get_drvdata(pdev);
>> -    if (test_bit(ATH11K_FLAG_QMI_FAIL, &ab->dev_flags)) {
>> +    ath11k_ahb_remove_prepare(ab);
>> +
>> +    if (test_bit(ATH11K_FLAG_QMI_FAIL, &ab->dev_flags) ||
>> +        !test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags)) {
> 
> Can we use ATH11K_FLAG_REGISTERED alone to decide the cleanup path? If 
> REGISTERED is set, ath11k_core_qmi_firmware_ready() completed at least 
> once and the normal ath11k_core_deinit() path should run. If QMI failed 
> on recovery (say before FW_READY or INIT_DONE) this should still do 
> core_deinit() isn't ?
> 
> 
During SSR recovery, it is possible for a QMI failure to occur after the 
device has already been registered, which could result in both 
ATH11K_FLAG_REGISTERED and ATH11K_FLAG_QMI_FAIL being set at the same time.
>>           ath11k_ahb_power_down(ab, false);
>>           ath11k_debugfs_soc_destroy(ab);
>>           ath11k_qmi_deinit_service(ab);
>>           goto qmi_fail;
>>       }
>> -    ath11k_ahb_remove_prepare(ab);
>>       ath11k_core_deinit(ab);
>>   qmi_fail:
> 
> 
> 
> -- 
> Ramesh


