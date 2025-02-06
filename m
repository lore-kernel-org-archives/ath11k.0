Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C176C02192
	for <ath11k@archiver.kernel.org>; Thu,  6 Feb 2025 02:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uNhw2J/xyjqjdOjUyPRQyMXcfK+2YhMUJcKSQsAuZXU=; b=Ku7Ht+KODoTYB65PuLC/xuYf6T
	Bxjr+Z66UQhsICj/iRZWVxPGvkmKwyw/aw0Yo1284Nb3vo3oOTcPy3ZdLBKgOSlxnESgVFIobGCt0
	7Lu4aVSUWHz9/qY5nEW5lhOwQDba+pQ6L9uEiUS9ELJ3GNG1eS7P6XB5blvt1thFUMTRkx+9G+n30
	TtonEHd3Cuc3TTiiK4Ns6P4NgQi1LpdrdxFOR5BxoJwSA58S4QM/2BLWWbyEDWLm++fJOMxDiL5J/
	j6kMg94WZkJGMDvSnr2TAQejYPu5gmo28SUAaHNCk6eQGHf9oUStQmwXP8jPhCOfaMAfFMrVE9S0b
	y+6aWvBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfrfr-000000053tz-49aD;
	Thu, 06 Feb 2025 02:31:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfrfp-000000053tT-30aD
	for ath11k@lists.infradead.org;
	Thu, 06 Feb 2025 02:31:27 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5161ijK6029174
	for <ath11k@lists.infradead.org>; Thu, 6 Feb 2025 02:31:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uNhw2J/xyjqjdOjUyPRQyMXcfK+2YhMUJcKSQsAuZXU=; b=BjaoDVFYAdFY3bf6
	FHM//M1LdgHS6uQEzdhUFLkFnLhcXo6PXubR+c0VHCq/ySva73H2wXVFSmjdAalV
	xCj9qAeZkmFcKvt7uRpgACOrdmW9xCKtcsu/+2CvjtmaVQftjhZW9IufzsYJBIJh
	SEdpZt5N1Dyj4A/VpeCkI7ngUHtViRiZx+2GZa5UIp+xXJASWwNrouhf8WdsZ7/z
	Niebf5jTi8ddQ7Ru4rdVBFTqj+f/9nOGJcMyTKegEB6xTL9+K0QGbAFQ/arGg/It
	4V6lULyPRlOI+TbnTG87GBofrmJq3F973ME1YnQhSFB9kvQfnS7+SYtIlVUAyAJe
	UgmlcQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44mkpjr2ss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 06 Feb 2025 02:31:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2f9c5b046d0so860905a91.0
        for <ath11k@lists.infradead.org>; Wed, 05 Feb 2025 18:31:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738809082; x=1739413882;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uNhw2J/xyjqjdOjUyPRQyMXcfK+2YhMUJcKSQsAuZXU=;
        b=mTXdzwklj8R6Sz4Y0kTZ+/f6L08+YA8sAvk9zaZ6hUpa6xO7ZGbX70fKoicle/1qgc
         ODha/QWNo4owbbz3xUgxaci9VzAkFTD5xAWFLIEqK6hsNXDHHpEu5/9Ga7XLOlmFSf7J
         /UBAHwE+ter9Z8Y84uFQK2PcCz0WbIA0vMUoBbTG3aXq9szDPEvdxofB9tVKUzoigdqE
         5BhMTOO7P6rlfqJobjkcChUyIxNDMEufKnW7zmMprC/THX4vx0eZSFsFtubdeE4DEqlM
         VsXyIu/KvjA+WcYRGDC5+OSPRO+QdaWrZjKdGw+fU8NP6h7QtWVk7Xo9xPDAQJxTEVCv
         AzlQ==
X-Gm-Message-State: AOJu0Yy5v2sMA5g5r6bXBAY2EUpTUkSgtmBwjoYpYsVjHw903Epa1CNZ
	D6CRIFznkH/v5sIs4RSS26uzGdDm3QnB+DBMxqwAkCMJfAwHR1sKN++L0oKvQVBhn+hEDS5Nm+o
	9y/PbD+ncCgK/AAjGnKG5yiL/BYUogvCUQWvSkDFBIzjmZ3DWg9KWydDA5BbQ
X-Gm-Gg: ASbGncs31zJ5kbHIjnqGmqFOTgf+dvgNGkaKhRRFAX6fEqI9qh8/kgbzyuReOehIeyT
	JSIpxadnbyCgKz1YGfInzEmaFsgx2IiS5Y8aHyWHJgYKUO/PKkpV94TnE+2wATWh74sNqmnoagT
	TNHAdPjP1KUIkATKhb3ESfaiZwBoc89rFXjavO46U2ma2xyajkD/p9JmJ2Pm2swnUrsTrvegA2e
	JOKlK3ThD8NUg9wx6NgPeVhwq936GqR2OAraqKunMehY+elkdJeUv+TkzRgmgSl0LXCPb5CWjuu
	n4vCvuqkYqMAs+XpNVLopbl8r3e5w4Lg6kT2EjEThY1crutDERAzNmUpKZma/lXi1VqH+R5UuQ=
	=
X-Received: by 2002:a17:90b:2786:b0:2ee:3cc1:793a with SMTP id 98e67ed59e1d1-2f9e083442fmr8233453a91.29.1738809081781;
        Wed, 05 Feb 2025 18:31:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEWMPD7hnEHC91pQ2nu7ERpofi5s0j/vpsIN2CiwpyBtEg149vBO9L0UXMNuN6O09Qoy//y2g==
X-Received: by 2002:a17:90b:2786:b0:2ee:3cc1:793a with SMTP id 98e67ed59e1d1-2f9e083442fmr8233421a91.29.1738809081332;
        Wed, 05 Feb 2025 18:31:21 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09b3e8e9sm136155a91.37.2025.02.05.18.31.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 18:31:20 -0800 (PST)
Message-ID: <075e8192-09bf-41c5-863b-5543d7cd4dbe@oss.qualcomm.com>
Date: Wed, 5 Feb 2025 18:31:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k-firmware: WCN6750: hw1.0: Qualcomm Robotics RB3gen2 BDF,
 v2
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: ath11k@lists.infradead.org, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>
References: <CAA8EJpq=QRbWe6KTxcmHkHp20rgEgLZeGYV7+Hy2Qkfo_MyV1g@mail.gmail.com>
 <f7818536-4aff-4320-a9eb-9d755b86d6d8@oss.qualcomm.com>
 <CAA8EJpoEpbtEDU1kC8xMEM8dxGzG31vSf3wFsaG8+CZky4sanA@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAA8EJpoEpbtEDU1kC8xMEM8dxGzG31vSf3wFsaG8+CZky4sanA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: w_4Vfh6oNGIx4i2UfZlpJ5NiGYGq9Kko
X-Proofpoint-GUID: w_4Vfh6oNGIx4i2UfZlpJ5NiGYGq9Kko
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_01,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=982 lowpriorityscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_183125_890791_8A8D42EA 
X-CRM114-Status: GOOD (  20.06  )
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

On 2/5/2025 2:12 PM, Dmitry Baryshkov wrote:
> On Wed, 5 Feb 2025 at 20:46, Jeff Johnson <jeff.johnson@oss.qualcomm.com> wrote:
>>
>> On 2/4/2025 3:05 PM, Dmitry Baryshkov wrote:
>>> Hello,
>>>
>>> With the hopes of getting this into the February linux-firmware release:
>>> Please add the following BDF file to the archive.
>>>
>>> Changes since v1: added regdb from the same archive
>>>
>>> * description for what hardware this is
>>>   - Qualcomm Robotics RB3 gen2 platform
>>>   - WCN6750 WiFi/BT chip controlled via the remoteproc (DSP)
>>> * origin of the board file
>>>   - It has been provided by Qualcomm as a part of the RB3gen2 firmware
>>> release, licenced under LICENSE.qcom
>>> * ids to be used with the board file
>>>   - WCN6750 / hw 1.0
>>>      bus=ahb,qmi-chip-id=1,qmi-board-id=25,variant=Qualcomm_rb3gen2
>>> * md5sum of each new board file to add
>>>
>>> 39b270f43cb6d733cde607bf2b23e2be
>>> bus=ahb,qmi-chip-id=1,qmi-board-id=25,variant=Qualcomm_rb3gen2.bin
>>> bfbd247fe961dffc4e7fb413703fb284
>>> regdb-bus=ahb,qmi-chip-id=1,qmi-board-id=25,variant=Qualcomm_rb3gen2.bin
>>>
>>>
>>
>> staged...
>> https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware/-/commit/ae4407c02a434534590dec3e0ef26b371fd7888b
> 
> It's proably not worth it now, but it might be nice to have a
> changelog of any kind. Like 'added BDF for Foo Bar' / 'updated BDF for
> Foo Baz'. If that's not too troublesome ;-)
> 

The problem is that our workflow from CLO to our ath fork of linux-firmware
doesn't maintain any history, so any description in CLO would not show up in
linux-wireless. I actually had a descriptive commit message for the CLO patch,
but I was convinced to drop it in favor of the boilerplate messages that our
tooling produces.

I'm thinking that in the future for community-contributed patches that I'll
insert myself into the workflow and rewrite the commit text before pushing to
ath/linux-wireless.

/jeff

