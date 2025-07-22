Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258D2C83F27
	for <ath11k@archiver.kernel.org>; Tue, 22 Jul 2025 15:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YhcCPoO4dmlZ+ZNBZT39IVOE2JZWvvPg9v8aKMa+61k=; b=vfHYaIiFPmDCcmprKANin6U24y
	qtkdxYq71SrZuNkOfqrXw1huPuTKXEqSTsNM4Gd14zgnQZ4IjSpJP4fX6/BqPv22Bj6oNwD98fG/B
	u+CExUSB6td5NSuAlL8eOQCaS2XXrFgXSSFaQZoQoprniJXuwqJCfZ6bbhL5v6JJRKXuplXgyeZOI
	xpkNldzgd5L3He6au925Dpbo0hMsA4hFGOv0RJaPss0JeqWGXPHIhBX/rLKYLIifOaw/gcFCFSBqE
	f1IJCk7KwCBjkzq8MYhqSokHcD5nqjbGkutvvvZ2ggKhA/uoCUFRSNPJPvQeNbfaZRPGF/rOc8Fjf
	KGJl4isg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueEtW-00000002ryl-3c5X;
	Tue, 22 Jul 2025 15:27:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueDez-00000002dsd-0AlA
	for ath11k@lists.infradead.org;
	Tue, 22 Jul 2025 14:08:02 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MD1a7U015724
	for <ath11k@lists.infradead.org>; Tue, 22 Jul 2025 14:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YhcCPoO4dmlZ+ZNBZT39IVOE2JZWvvPg9v8aKMa+61k=; b=pBDPbZuFxK20e/R3
	SloFtloflHthyk/4e3KVSnDhR4+EWpYsHSujNsQq8SSyXq+U39kncRSkuKa8+10x
	IKZNOMMk4nqv2grdmU2x86sJ2eIHSnUMifKywlsVVFQjbQS+22wUzDja0wBMAKzp
	tKsHX5ueN5roBNl5p61DjbUrYrM7F8CMPbCnZJUihGhf+x51lCq1ouReviXmJKgR
	SrCssQUEgYGbO0tMGUaqwGXhFhm60p8XJAMQQTsdrpzC9OE0dmjxE+a1Jnbvc4Ob
	g8KiqJtEHT1s0B+5Za6QTkdfXa19LrFHh6VIxyuR+g6ARtSd/MhV+mLknlHqXNH2
	6kBn3g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 480451hg07-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 22 Jul 2025 14:07:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-31cb5cc3edcso4723936a91.0
        for <ath11k@lists.infradead.org>; Tue, 22 Jul 2025 07:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753193278; x=1753798078;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YhcCPoO4dmlZ+ZNBZT39IVOE2JZWvvPg9v8aKMa+61k=;
        b=pdfrC9SpVNmukv+1IkUQZFvPdTCDbFHFFgvwv7QwVlR9mz2evVhspkOOtJoqer4PJd
         EF8h0r/CFoW5r3YDRFL7IYaulmyqe3FB0sEzn43jzKw4kNtKVviismIiHLYGd9CIi9i0
         qvb7ollagB3QTaJUHNEMgsF4yiBMKs7p12B42+J7ihlj+IsbB+oLzSN0h5HhgdOm93Dn
         EAnt7ANr9uNHeiOU0MmpvGK1u7GT6hjAUnc9GSnb6YWDI0Vc4s6WM+/FLx/0LRc+fKeO
         lvGLKrgpnraviA5KFyjOby7LqE54Wsc2p3/BvysDQjDr5+TkOhq2Hbgn3Gan3kXjnBXf
         4yNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzl7b8JFORmL7J2dXSavCo9pBu7nhYtItadgweZNYwx+AOo9AYrIPKFqebVcPzK2K+CAJj01s=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzxdu2yogPrZRQYTERppw1BYdiTOUZsKTV97hON5/PmVXYeWPrq
	s6MhupZTXbs//qJWjCEC/eoUhav/sF1nHWCtgD8/m3JzuvzV9c9YwMyqTD1k7Z5YQ8NpXCMD7Gu
	Pfo11tlDbhUCkW1kdgXlEZHEc6/oOyb7JtGq3ztj/ZOldwPLokwqZEnDth7ZHPMVK
X-Gm-Gg: ASbGnctL6cK3ts8joXJh0aJb27K1xHJoP5AkC2qp4ToXdzjLfORZJ/f9iN58LeM4Uw9
	NTE6btiZewcw+hP82m6YsomM/vFDN9LuhciDmz4gseyK2/u6SFE5DBCzQfH9Tatgg3CQgW7y2GL
	Y60U/S6fWtZbz3Urx81E6WiiBDV1jTQBSX62RWL38mNqAYtHq2zJz5jtDUbXbWCK2JgAMeMS5o5
	mst+Qw60LmG50zqQ2Q20z+1eeDtlxeb8qZncLSgVUQYTx6hhJT1XACoa5FAC+alkMTWYfrEaINz
	ownyjTU3yidSSyoF6auOusd3/6umrja6XbwDpqJ3AGAE3CFcSPt3OiS3M+WEHLVvLViq0xo1ab0
	NYtNntHKqeLjopMU+NVY4e77qP4zjsl20
X-Received: by 2002:a17:902:ecd0:b0:235:2799:640 with SMTP id d9443c01a7336-23e2572fffamr302404785ad.25.1753193278482;
        Tue, 22 Jul 2025 07:07:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQ6PTrMuYd/lsu07Wt16SKi2Zds45iU2lJz4tGyH81i1eCRKNI5dS/lyAorKJy4cfJ7lPrrA==
X-Received: by 2002:a17:902:ecd0:b0:235:2799:640 with SMTP id d9443c01a7336-23e2572fffamr302404405ad.25.1753193277972;
        Tue, 22 Jul 2025 07:07:57 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6b48a2sm77221245ad.108.2025.07.22.07.07.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 07:07:57 -0700 (PDT)
Message-ID: <ab5af5b9-d5a7-434c-938d-3f9aac388542@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 07:07:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] wifi: ath11k: HAL SRNG: don't deinitialize and
 re-initialize again
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Kalle Valo <kvalo@kernel.org>
Cc: kernel@collabora.com, stable@vger.kernel.org,
        Muna Sinada <quic_msinada@quicinc.com>,
        Anilkumar Kolli <quic_akolli@quicinc.com>,
        Miles Hu <milehu@codeaurora.org>, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Julia Lawall <julia.lawall@lip6.fr>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
        Jeff Johnson <jjohnson@kernel.org>, kbuild test robot <lkp@intel.com>,
        Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
        Sven Eckelmann <sven@narfation.org>
References: <20250722053121.1145001-1-usama.anjum@collabora.com>
 <1598d25d-e254-410e-ac5c-66d5450fd686@oss.qualcomm.com>
 <ae7a08cb-af73-4a27-aad4-c852be5f77aa@collabora.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ae7a08cb-af73-4a27-aad4-c852be5f77aa@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EIMG00ZC c=1 sm=1 tr=0 ts=687f9b3f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=QX4gbG5DAAAA:8 a=kCYrOAKyVCnItiLis7sA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: KOesP64Nb_ICcaPCMnRe9UL6MNK52N9n
X-Proofpoint-GUID: KOesP64Nb_ICcaPCMnRe9UL6MNK52N9n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDExNyBTYWx0ZWRfXyfx57CHOucWJ
 qEOAZLgVkhYpV5WCeMk9h6L+GqGtHgIRgOPhsvIOTnGL6zqipax9bB73z4IYFE5AYpWnnNYxHmd
 Q41Kq4wwtO2DRIdh4iaNiGfo9fuK60YJMJ0NRzuk0Zhl0L2idMeqanPW4Ij7BHT/fT6j24dOP0l
 mL3jcMPtkx6Z109OTGbqNlimXtFbHqDd+qdMtjj2HNXgrpgmpbBelg0KETMyWd3V5qyARVth2Fz
 NpTuBldkYQwj5phLBM+cBC6ZupOjVe3MaXnBR+KAgnDTEOem3onYGBBlvnCldPtLvJb7qWSCdv3
 N2SCU9p82lYtpkxdtdxHPzRgzTKm8yedcz6Mnp5o8MiW0CeCLpu07WZy/3ajb9ArT24a4uVa2p/
 88vS3LUwgf6GvvlBE+5rvCcdxvnrLQ/yxRs5akg3pYtqKq8+EFLPPB3sjFHemyulvi/BTxTb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_070801_206417_D6A94399 
X-CRM114-Status: GOOD (  20.46  )
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

On 7/22/2025 4:23 AM, Muhammad Usama Anjum wrote:
> Hi Kalle,

Kalle is no longer a maintainer -- I am currently the only ath11k maintainer.

> 
> On 7/22/25 2:47 PM, Baochen Qiang wrote:
>>
>>
>> On 7/22/2025 1:31 PM, Muhammad Usama Anjum wrote:
>>> Don't deinitialize and reinitialize the HAL helpers. The dma memory is
>>> deallocated and there is high possibility that we'll not be able to get
>>> the same memory allocated from dma when there is high memory pressure.
>>>
>>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
>>>
>>> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
>>> Cc: stable@vger.kernel.org
>>> Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
>>> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
>>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
>>> ---
>>> Changes since v1:
>>> - Cc stable and fix tested on tag
>>> - Clear essential fields as they may have stale data
>>>
>>> Changes since v2:
>>> - Add comment and reviewed by tag
>>> ---
>>>  drivers/net/wireless/ath/ath11k/core.c |  6 +-----
>>>  drivers/net/wireless/ath/ath11k/hal.c  | 16 ++++++++++++++++
>>>  drivers/net/wireless/ath/ath11k/hal.h  |  1 +
>>>  3 files changed, 18 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
>>> index 4488e4cdc5e9e..34b27711ed00f 100644
>>> --- a/drivers/net/wireless/ath/ath11k/core.c
>>> +++ b/drivers/net/wireless/ath/ath11k/core.c
>>> @@ -2213,14 +2213,10 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
>>>  	mutex_unlock(&ab->core_lock);
>>>  
>>>  	ath11k_dp_free(ab);
>>> -	ath11k_hal_srng_deinit(ab);
>>> +	ath11k_hal_srng_clear(ab);
>>>  
>>>  	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS(ab))) - 1;
>>>  
>>> -	ret = ath11k_hal_srng_init(ab);
>>> -	if (ret)
>>> -		return ret;
>>> -
>>>  	clear_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
>>>  
>>>  	ret = ath11k_core_qmi_firmware_ready(ab);
>>> diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
>>> index b32de563d453a..e8ebf963f195c 100644
>>> --- a/drivers/net/wireless/ath/ath11k/hal.c
>>> +++ b/drivers/net/wireless/ath/ath11k/hal.c
>>> @@ -1359,6 +1359,22 @@ void ath11k_hal_srng_deinit(struct ath11k_base *ab)
>>>  }
>>>  EXPORT_SYMBOL(ath11k_hal_srng_deinit);
>>>  
>>> +void ath11k_hal_srng_clear(struct ath11k_base *ab)
>>> +{
>>> +	/* No need to memset rdp and wrp memory since each individual
>>> +	 * segment would get cleared ath11k_hal_srng_src_hw_init() and
>>
>> nit: s/cleared /cleared in/
> Please can you make this change while applying the patch?

I can make this change when I pull the patch into the pending branch.
I'd like to see a public Reviewed-by before doing so.

Also note that, except for anything critical, I'm not taking any patches into
ath-next until the upcoming v6.17 merge window closes and all changes made to
Linus' tree have been backmerged via net-next => wireless-next => ath-next.

/jeff

