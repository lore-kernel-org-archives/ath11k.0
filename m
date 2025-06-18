Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD88C71157
	for <ath11k@archiver.kernel.org>; Wed, 18 Jun 2025 00:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jtsxo71Ss+Fxx3eNA8h7CzAEpCZjWON0qU+YW0EyqVA=; b=qtoswllyWGH/iPN9X6vqvtVwkb
	mPobWHgh5oYEqJmOeGJ7HVBKOdBogUJZncWUbIih0Xb1hpZvNWyMI/4PEIuJVF0V0YJbPDpMHvWpd
	/9DTpKoKa5WbPfIi8B8xOmI21zcNY2Yi2m40X9IQfS98q37rucm7LAwpebE2Xe0jEwNIRbvtxhC84
	rV1eJ8JNnZ+x2UUCQf8/Ci8soXM7e/cAQsVoneM5iGltWww6RrTv4RiaXCGA5V71wRI6emZUaxd49
	wZnJ25VVUj728i8l+FHLVAZLMcI1nkKgnD5YDa/RdJVP1fKBWCQVq3+mhL1SKCDpVed9T2f94DuTX
	ztRUXXHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRgoP-00000008gzV-2vxE;
	Wed, 18 Jun 2025 00:37:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRgoM-00000008gz9-2vPo
	for ath11k@lists.infradead.org;
	Wed, 18 Jun 2025 00:37:56 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HDbbaN014411
	for <ath11k@lists.infradead.org>; Wed, 18 Jun 2025 00:37:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jtsxo71Ss+Fxx3eNA8h7CzAEpCZjWON0qU+YW0EyqVA=; b=aLODXMmRv2zH3N8I
	SDaywaOPsg4IGbq56jOvuTjgBIex0DHemod94S2MMQz6xUNbp3OLzdYz+naoNPLK
	1biYS7Kd5vEL84qzaTVBYLs2E7Sy53f9uReGgCF/twh7k0rhBUcTsJbbwk2qRkZy
	2MWEphLIiNmGDoLkUGPWuO0wFHV7wfhKLcoYpymJKveVGpQVjMLtcNkEVC0iwlDJ
	AZGoBe38IQ1fmopZX+4VRrJCvSesiKI/Z4nvCgzI+b1WDhUR3eWjmIbeafdRo7iG
	svvcJ3CzrBzblRt8jJYWQNTEnH+Je+ZZdJmLVIKYuj1NcgC9ufoDZvUExdMnaMHY
	rzRaVw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791crt0q2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 18 Jun 2025 00:37:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23536f7c2d7so102773275ad.2
        for <ath11k@lists.infradead.org>; Tue, 17 Jun 2025 17:37:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750207072; x=1750811872;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jtsxo71Ss+Fxx3eNA8h7CzAEpCZjWON0qU+YW0EyqVA=;
        b=LtPZ3cn7Ut3DTszt+MCmTQWIUOZKHM90dU5mnV7uVzD3699xXHu+7aWecmLCI+reTv
         imkjVCRm4KJtgshvnyGwDh/xq1Q07XwPkSu5QBtQ1nRzfnH/9iIj3kKtPqLGTNkvImJ+
         Cj3abZt7aBpW8twzA/rA9nbyZkTtE/Fwa30C96defMfsd4YuGxySA5N9He2oF+CJqYiW
         3+k0QxD7OGEogSUE6oLtDxcr6myFygIMPWqqiwCE8lSpuhYaLhLL9PyXQ9iD3jOux3Ab
         x1XrZcOK2DOP2Lg7bu/mttVPUgcSm0T282jRiovm9XcEMQctmCEWkJXzFSXW0DwqKkyc
         rlWg==
X-Forwarded-Encrypted: i=1; AJvYcCVqgEwaD96EFlNnU2y3HFWUR26ZJVtdu7DD6beg6bY1W+eVHxTxBatb1qy3ut4E6wzViWMWFZg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yypznuna7p208E5xeU04PA+58FPmodlqxA4oRMBXy9Flrk6BtO8
	ThIYytbJpKrggQqhRtAeX/EH3Q9/IQGk3nKaFFe3man3WTQLdX0H4h02/B9ulAlzxjO147tCRbr
	BZeIkUGP+X8iObZGBufeXbhHv8acJAxvdmmrcU7JLEChMANC42PAD3jqkmhqft9iV
X-Gm-Gg: ASbGnctGrL+bM70tnwoVNEpZUlsyYofdxXcCthxbP6ilTFkLwKJy0thnHGV+82MsofD
	RIiVmwDhPf/Z9o89eM8qkj3YEPlbdq/AdBcJW2M/UHF/kdKZktZB8ciJYqkOf1/L4t4q+MT5t87
	K915A07wm9xNPrzFlzISqM+f7fX/bV0OD8PsbaB0bhti5h1GXYnhluroO8Po3XFToa0RdlATwir
	ovHT/B9N/dw1JkUED0Fd/8t3Omb+FYglDHizJNe0D166UBEt6D+qEYzM+2xPYval7QILuHU4X5y
	/tsmOYOd4G9gOlZtw0zdvhfyEPycHXGnCTeXabvpscBHcdJ1Il9hbyUX+WOXoxZH91b63n2NK2/
	HhHMvKyGlrPcdGWM=
X-Received: by 2002:a17:902:cecb:b0:234:b44c:d3c8 with SMTP id d9443c01a7336-2366b3c38e6mr230344345ad.37.1750207072208;
        Tue, 17 Jun 2025 17:37:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkPzSzPmO4tfjjl83hquV3ywd9TVPJ0+3DO+ZDgWpwWJTWPeSP03HZwobSq8Al3QEM0CZfnw==
X-Received: by 2002:a17:902:cecb:b0:234:b44c:d3c8 with SMTP id d9443c01a7336-2366b3c38e6mr230344145ad.37.1750207071856;
        Tue, 17 Jun 2025 17:37:51 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23699a75d65sm14373275ad.91.2025.06.17.17.37.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 17:37:51 -0700 (PDT)
Message-ID: <cbd285e8-9ee2-4825-a0b6-da64fbd6b71e@oss.qualcomm.com>
Date: Tue, 17 Jun 2025 17:37:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3 5/6] wifi: ath11k: choose default PM policy
 for hibernation
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.de>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
References: <20250328-ath11k-bring-hibernation-back-v3-0-23405ae23431@quicinc.com>
 <20250328-ath11k-bring-hibernation-back-v3-5-23405ae23431@quicinc.com>
 <d0cd065c-1cd1-4e56-8c57-60777b1f3664@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d0cd065c-1cd1-4e56-8c57-60777b1f3664@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: E-KiUHQWN_eNet99YETmDOUq-09B77rq
X-Authority-Analysis: v=2.4 cv=BoedwZX5 c=1 sm=1 tr=0 ts=68520a61 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=IUDzS62LCLz5u6N7BFMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=FO4_E8m0qiDe52t0p3_H:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: E-KiUHQWN_eNet99YETmDOUq-09B77rq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDAwMyBTYWx0ZWRfX4+wrElidXNuL
 a0072+7BhO4dWEy5DJnKHyoLybHoy/iCdMUCFf6ZggDZC+c/WdHQ4UnpqUCbOc54NPkvlhVtggD
 cLrWNrs3bNJorXkC5g8Kfmb3iv6NqQkN5rZF+PNhRWpGHi6Q+6CPb8OFsoMCmQeFBiylz0yVXck
 zpVxD3KNpqnxJpglL8e3OKYeRVmri9bJq4XvZc5Xlww+WJmqynqoHdnvKnW7pFt/5M6mWjqJ2wK
 FPXBwMb6s8D4FvchoLk5RdRj6ul1zqcNSQWJPjF97LNYz9Gv8K6l1cqL7WMz0ksT/SA/JgSEnu5
 HmPvxiuvKsOMOZgQ+RfM0s1PO1r33w2inRAXJ7Tv/bX/GWGvdiK8FmeUCMwScXE+oi/ocpLhpLm
 TjxxPx2TuAHPB+2Q/i4+SOj63TmAHS0N2jijWpRqzBxLrmFBe3MKgXrgxFOPysALq+bmBxgS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=698 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506180003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_173754_879994_0D68538F 
X-CRM114-Status: GOOD (  14.53  )
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

On 6/17/2025 5:15 PM, Konrad Dybcio wrote:
> On 3/28/25 6:32 AM, Baochen Qiang wrote:
>> Now WoWLAN mode is chosen for those machines listed in the quirk table.
>> This works for suspend (S3) but breaks for hibernation (S4), because
>> WoWLAN mode requires WLAN power to be sustained, which is not the case
>> during hibernation. For hibernation, the default mode should be used.
>>
>> Register a PM notifier with which kernel can notify us of the actual PM
>> operation: if system is going to suspend, the original PM policy is
>> honored; while if it is hibernation, overwrite it with default policy.
>>
>> To summarize: for suspend (S3), WoWLAN mode is chosen for machines listed
>> in the quirk table, non-WoWLAN mode for others; for hibernation (S4),
>> non-WoWLAN mode is chosen for all.
>>
>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
>>
>> Tested-by: Takashi Iwai <tiwai@suse.de>
>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
>> ---
> 
> I've bisected the following splat to this patch, still happening on
> linux-next/master, WCN6855 + SC8280XP CRD, 100% reproducibility 

This smells a lot like the issue recently fixed in ath12k:
https://msgid.link/20250604055250.1228501-1-miaoqing.pan@oss.qualcomm.com

Baochen, can you look at the applicability of that patch?

/jeff

