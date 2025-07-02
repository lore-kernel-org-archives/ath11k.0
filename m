Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415BBC83F04
	for <ath11k@archiver.kernel.org>; Wed,  2 Jul 2025 17:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZyYTlWdSGjfbQpzDv1VK2XsfyDqeUoKt+82ACxQjtA=; b=PAlIbmlPgEL6iAUoMMeV/bhkzW
	mT86gheZ9CyLZafT/GgXqg9mWQ5TOdvY00fXd8q9vnobjA4u+lnmfyl0iU76YwRvU3CEYVF1vJX6t
	Dp1Lr7Vjg4QcNKkMi+pH/GbYBqF2OSTufcb66IHPGesTUmxDtYc7SexW2BJFu28R5gw90G8qC/g7z
	wZwj+125deyP3BkXLNU0QsuUrOAAmnUR37KnQUGUszzjXsTLk2ZyVYlyjZ/lBIeSJHJUP5m0x+0kV
	otHk07jI62Dfl+v0ek/G/e8NmkyNZOEyp++qbN/xzrAKDnXxCZO+sXnzoMFC/h/nRkTAWYirIALFV
	D0HWPI7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX1ZS-00000009Aee-3qQS;
	Wed, 02 Jul 2025 17:48:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX1Cs-000000097ru-1ciu
	for ath11k@lists.infradead.org;
	Wed, 02 Jul 2025 17:25:16 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562Evuvn032762
	for <ath11k@lists.infradead.org>; Wed, 2 Jul 2025 17:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WZyYTlWdSGjfbQpzDv1VK2XsfyDqeUoKt+82ACxQjtA=; b=QI7URzgIoK97WDeU
	W7XfEdAkMALd2S9JLF7oFTq42JWw60Uf4B7wVXDym1R04OBPUAMbW69dS+/XPfFW
	ymM0Pe6IVAethNd43a2dPwLwJEAQIY0MRZyvMgfhwLnAKRsn7OaJcq+VI9fKWGgX
	6zANcbxt51nX1fS32u1P0Ej3xEXbVn1rJbKtEYtCTu3/HvsKjXJF8T8TZrYUehUa
	jaJ0w6/QcNm1fAe9gGJjnL1MLFehJlGVbzBtLd5/V1eIEnsoaL7l3cAVvT/U+T+b
	05e6ySKYb4RO1/vHqevrVNWv6rrbeqemzKR6ZVlflSFhrNcL/5Ck4bQpBGL1KxTv
	o+cwug==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qmdcb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 02 Jul 2025 17:25:12 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-748e6457567so81121b3a.1
        for <ath11k@lists.infradead.org>; Wed, 02 Jul 2025 10:25:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751477111; x=1752081911;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WZyYTlWdSGjfbQpzDv1VK2XsfyDqeUoKt+82ACxQjtA=;
        b=bxNITJ4emQPs5uBHwN7kFgTkMrfoPlHhKhYXA8RlvuO4OrzraYo87weh4NWdvzjfQn
         qrDvihUBrcefbcfP1d3AnD7tvNiiGmWMuNvYC3rviwsJSRBTWHSlZW31kfC2Sf6UFvvf
         /JrNnDIEy5TfhhHe4rrRyNTXsskUXTzRiRYS5XQ5b6uSwg+7y666jp5ykM9QpnXhixoN
         v/B7McqGrTMHQeb9KE1TsVVLfdtk7gCHG6BHDEjyqLlKOw8Pu3+aJw6ATxxF5Ja5QvWH
         3h8Sw76F63QknAmSOKd7kqwzfNT1wRT7eCOw0G9vo8Y8FvfqcSk3Ql3jYyrdyUJkm1Nd
         9gYA==
X-Forwarded-Encrypted: i=1; AJvYcCWicLEEUJJGQ9LuLY/hwVuGx/OcCGpAAtiQRIkezthX/rY45RfpEMy9UTdY4hFuFuwAA3KHQYo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyTV4pxsf2boviZrpPqsNVLcFs4t7Ee7TPWn3kl1mhf4gXCrZwF
	IyNideGcowpmyA+sHIeLFRf7IbIbDSo6UDjWIRyEuur01NxxgbV4rjz1jukIKsP8Dc4H8cdAihC
	r+GGuWBdD2Q09a90PUFtr5g0dLXkHw3vatlqICcM68nzkVl6RRGPEeuzATQRjUO5Y
X-Gm-Gg: ASbGncv5MaFjWcS+wJTKEM/y3VovprdmRGIMD1VnvQWRyPeRHf8Z0t392c11Vzw/xLL
	Hx8RtFVsTXa1Iet/RUZatESgGFmR6IDwNRKbLuz0PKyQKL8C0a71z7W3LGLH6bfJByNR6q1Lsjt
	gB2B2jPte5U+TzA+mIrqOk4F/DGbCU+hatb/1cBz33+SAU01FNVOSJMGZdqgrv+a67a1sEbkkWc
	b/oOQiUt8g/Hqs5g429b1xJSMphKnpuOSQGpeDDFhiVYy0omxwKrjyCgeFmGsPb7ms0MsnKWD6o
	zRu4uB9/IoepA6r8el/2gkkJXJo4uGnDji7Qm1x0TuaeL3WxxWDnZ5bizB6uHX18SGJ2oxN0rRV
	kw8Dy5cu3bgBhpRY=
X-Received: by 2002:a05:6a00:1488:b0:736:4e14:8ec5 with SMTP id d2e1a72fcca58-74c998b115bmr395825b3a.11.1751477110647;
        Wed, 02 Jul 2025 10:25:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNL+mjpubj8oTFu+kPvG+vg07PpxKV0Dl1sFm81HYHH53fukGuY5jdbk7k4o7/GpFwTLHvZg==
X-Received: by 2002:a05:6a00:1488:b0:736:4e14:8ec5 with SMTP id d2e1a72fcca58-74c998b115bmr395756b3a.11.1751477109849;
        Wed, 02 Jul 2025 10:25:09 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74b548a1fbbsm2105715b3a.81.2025.07.02.10.25.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 10:25:09 -0700 (PDT)
Message-ID: <e38dc5db-7c7b-413d-9ef8-8dfae7feeb2e@oss.qualcomm.com>
Date: Wed, 2 Jul 2025 10:25:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] bus: mhi: don't deinitialize and re-initialize again
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Youssef Samir <quic_yabdulra@quicinc.com>,
        Matthew Leung <quic_mattleun@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
        Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Alex Elder <elder@kernel.org>, Kunwu Chan <chentao@kylinos.cn>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Siddartha Mohanadoss <smohanad@codeaurora.org>,
        Sujeev Dias <sdias@codeaurora.org>,
        Julia Lawall <julia.lawall@lip6.fr>, John Crispin <john@phrozen.org>,
        Muna Sinada <quic_msinada@quicinc.com>,
        Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
        Maharaja Kennadyrajan <quic_mkenna@quicinc.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Cc: kernel@collabora.com
References: <20250630074330.253867-1-usama.anjum@collabora.com>
 <20250630074330.253867-3-usama.anjum@collabora.com>
 <855ae20a-3675-4cce-b87d-6f25fb69e0a8@oss.qualcomm.com>
 <defad9df-e248-48d2-a3b6-3f057c6f0b76@collabora.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <defad9df-e248-48d2-a3b6-3f057c6f0b76@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=68656b78 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=7FD9jUKyMsHjXuVnl2EA:9
 a=QEXdDO2ut3YA:10 a=Sn0URPYyO7IA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: oDvjI9SlKYDpHgUxcwUX52UJxkr4oXHi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE0MyBTYWx0ZWRfX+7Kw4vMsxt9o
 bpEtsyIHr36/ddHjL1e+LYEUTrWOjxnMWRgUYvqb6kDKIHGxKtHOPrJ0mjVuq7bCM18SPLIrMh1
 y2q3SHb8rT3WyNFj/O1j1o9FokLvYTFnsiA7yT9tEwUj8tTZMO9aqgC7Jt2uokAB/FK74fpEeQe
 kpeDELG28P7uIerrRY0DiEkO/uIhMAZd80X2EIYEPY0Rz32F5ZhkBIs0GVfKwDU4JokUDd74vIk
 6g2yXug1sAZIXEUPCDzS93dQW4qMw7Zcuk+zgrBXmOCykMweeRW1tom07tAmWL6m64xzET6WlRm
 1mAaJb1kkwg45HkxMpn/0hPoo1nuKzNBZm+q8TQNB3oCbxDdL8hwSQqwK+qRxL/XPr7fW9d7QYq
 aFesh3udHH6CFBGFT7n8fNuOUuoRv8RsBpix2e2RaGyiY28QsK/VaCQyiVMffBtgfrFGoF1V
X-Proofpoint-GUID: oDvjI9SlKYDpHgUxcwUX52UJxkr4oXHi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_02,2025-07-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=792
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_102514_557182_576F5073 
X-CRM114-Status: GOOD (  11.19  )
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

On 7/2/2025 8:28 AM, Muhammad Usama Anjum wrote:
> On 7/1/25 7:49 PM, Jeff Johnson wrote:
>> On 6/30/2025 12:43 AM, Muhammad Usama Anjum wrote:
>>> the same memory allocated from dma when there is high memory pressure.
>>>
>>> Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
>>
>> not quite the right format since it is missing hw version and bus
> I've been using the same tag from last accepted patches. How to construct the
> correct patch?

https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath12k/submittingpatches.html#tested-on-tag


