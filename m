Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153E8CF6C17
	for <ath11k@archiver.kernel.org>; Wed,  7 Jan 2026 09:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eMYZdTg34RMH77d5gdBja5Nhi18mHj2wV+z+0Bzfhf4=; b=k38Npw1ItPV/mD4DDTMrQeMKDb
	fhw+LeL/0RihyY/qFqcdnmpWwY4vfijis/dOW4PPyel2onBQpYaD4LJRMLpz7MG3bIEh3mtKhLUng
	pMlgCK7RFlUhAFut568buHladsxuS3v4mCAyOLL123hqadSi66WPvLFDshH7gsnLqRH86Jp8g5v1v
	sXvoVdVqisOMmGzkBSvZiTH2wfooErbfCSXa72sxN83MGli9dV+2PhmB23bsqXV5rGJ3rv75DCNUU
	gyG/GLyENxRhmpblS+rMJA2ki9Lg95PP2Iv9B94ecAl8D/IPBQ8OiDWnM+/wzBNfpU7tEAeyiUHFq
	9WFJdaOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdPv7-0000000EXZe-0wVG;
	Wed, 07 Jan 2026 09:33:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdPv1-0000000EXXG-158e
	for ath11k@lists.infradead.org;
	Wed, 07 Jan 2026 09:33:32 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6076tXFa2379374
	for <ath11k@lists.infradead.org>; Wed, 7 Jan 2026 09:33:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eMYZdTg34RMH77d5gdBja5Nhi18mHj2wV+z+0Bzfhf4=; b=I8mBeAl3zcBMOfBq
	AJAh2EZuFu4Gx0mBem4v9uvcPQBztygh5mlP6pnCP7Ai1zkgMMMwsA2bki4ixVL5
	75HVvLwZAtQOZjLKQ4lvFHLtoKjnYqM89JQTpJmvnJZ3zgx7XknCJoBRTet42SsZ
	Vm/jEwCTjVwHx9aMnfBq3BEI6ZUPbH5jiOP0V6rRnkrGBKB6YtEIAbMFazjmYAfM
	nnck03sz8NmbUt6oUgdEVVKmIejVMaD6kAF6QmLDkBHyHDBARQ8KTQ2dTifXDmOv
	phIqj/WYVGQSThSr//HljY0Yl+Y+S24/wfoJ/6z+RvBIGJJXiG0JR6K6sKTTXGX6
	V5EfiQ==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhjn4rgnh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 07 Jan 2026 09:33:27 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-6446bb04e1eso2980482d50.2
        for <ath11k@lists.infradead.org>; Wed, 07 Jan 2026 01:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767778407; x=1768383207; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMYZdTg34RMH77d5gdBja5Nhi18mHj2wV+z+0Bzfhf4=;
        b=cuHOFtsLVCJCx5hW1Lz5XCrzHZoVZVbZTOwgNhRn4XdxKxQa49vfSqCWLTWt7PxJfr
         FBMJUCxtVqPgvEFDz4YJdSaVs0m7HnwBz6gvOhLjGd84b4fXnzSWr1/Fbdb0Jyoy34K3
         N6pRheEyFiMBy4jrsZ8LXjOpBcuL8+86nQJL5UKq2YZFowfhApzd8AtptbKKwyevOkXl
         D6A4wTmd07Jna96mUbxZ0ok8CmzLw/tthUSpPCr/N7j4UpAY9FrkuQsEx8bHVezib+3u
         /Y/yfleW52EbvjITObDsWwgNyY+ZfEpifYDCrVOqHvrae6BA1Syjzp/9bik0gJOTepbP
         9DaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767778407; x=1768383207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eMYZdTg34RMH77d5gdBja5Nhi18mHj2wV+z+0Bzfhf4=;
        b=acCv+GWb17DwfuDkeUmhhS4IPDGP7FDi8JfugsRtCASaoSG5kkutdnTAwVKwr/UZTK
         CNsZkxHBZSfPUrHoGBC8pZ5tOLmM2GqZDWKAmxjKLbGVnjXxbAQp1gKajrphGRmfbJMn
         bVvfSMeH9q64niaF40+lZhzI9Wo+J6dr36mWM5VRQSkCupL6VyQay8RqDOKpSVJnV096
         lSdP+yfG76sTqgJQ1OJ0Tr+YGtK05U+BSFLOmFqlcB2MfWiuE1xjGUBd92Wbu2TutpOO
         BV1K4hbIIaeh5LztZCghIxFva8lAmfJYz0jpYqLAi9kwmZ1DJcBASHvib06rNak+nelE
         5tVg==
X-Gm-Message-State: AOJu0Yzo5CbpC0fMavD31RvtgCwKYE9Lk8oGjpq1NkU09fe6GB0IMo7R
	rgrnGcJ+HpaN6t/6Y+o2E4XpiX5S+uUIHgZM903Cd+rQ5NHm8s130ypB7sqbVh7zfvyEMKx+7oH
	lhxAu/mQG0aZ5nTiA5g37l9YlQu16OdhfGveUWnGoXz4YVAMo2dL73S/65G9wnIKg/DK41sA5fW
	g/0xkystyYOSv5sSKLC7+XGjimCX+wLo4BnpGUFQw=
X-Gm-Gg: AY/fxX5K/MvUYZ/EB0XmwG9jypn4uGjGRKT+jDxOxSwJszJ1sq6yg/keh7RYbc76EUZ
	xhQqDsz0XUVl9VRIruaYY7OCwqV8eWob1QZ3qt5aCpRBjSp0H1bakX0GlScVDw07kvmzZm09Mff
	yGaHoBpUJTl8+AK0xtTR6JT08/pj2KxnjBQx823Hr7os8VXKqwpVTJjxrzGnU4pqmSEJY=
X-Received: by 2002:a05:690e:c4c:b0:644:3850:9062 with SMTP id 956f58d0204a3-64716c75477mr1636629d50.72.1767778406841;
        Wed, 07 Jan 2026 01:33:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEq1EGKxxOKY9SqQLetB8ui0F5aG3xTK7PeyFnFZYnXgSQufziUQ9lPHo3ZFsDFzoa4TcIswNhJITi/kIsNyyY=
X-Received: by 2002:a05:690e:c4c:b0:644:3850:9062 with SMTP id
 956f58d0204a3-64716c75477mr1636607d50.72.1767778406424; Wed, 07 Jan 2026
 01:33:26 -0800 (PST)
MIME-Version: 1.0
References: <20260107060255.29530-1-qian.zhang@oss.qualcomm.com>
 <bac6e271-5bd8-42be-ac20-6873d88c16a3@oss.qualcomm.com> <51010173-0d95-4a21-88a4-fca1ca23d3fe@oss.qualcomm.com>
In-Reply-To: <51010173-0d95-4a21-88a4-fca1ca23d3fe@oss.qualcomm.com>
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 17:32:49 +0800
X-Gm-Features: AQt7F2q0BkxeSGdfv5GdyURbuY5wr2E8_yiisTEzM6VLbrXj4lPsYZiq_SedRsc
Message-ID: <CALC2J1OYe8RYPhDH1vneFp+F_oFjgDVFMp0i-1wjyzWO=TmJ7Q@mail.gmail.com>
Subject: Re: [PATCH ath-next v1] wifi: ath11k: Fix failure to connect to a 6
 GHz AP
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=LJhrgZW9 c=1 sm=1 tr=0 ts=695e2867 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=-qEL4iWKF586AChQK2UA:9 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA3NyBTYWx0ZWRfX7ntPBbWzOUC7
 mZmcfn4a3z25IEwKRtE6SsVsVRbOPs9VYCXCCyf+wi4FAqMckVV8JJzT7ARw95+IRt95/MxZy0F
 XrZ1w9Bkkx98zR/xXnHU8IhrnDc8KQ5LUK7DtUz6pWx4QALsuCcVeY7Mb1s2YaCJFLMkbNPiQwI
 LkGTTAP6OjIIZ/kysi67+uoHRuw68FqguaJmQ7UzEWWEtE8/FX9Ad6NnNjaOpbBHBqzAtvO+75h
 QnqWQkdfsnzZIO65VT0rzXlKhVeXsvqT8mWblKd2hO4cfiR6QwaYUDSdBNGbRodK+bJuJkAzhx2
 AwMbUyhWMMlI+laB5mfRwEL94l3+frNoK+p511kS2TslqLTl6VUHwPIn5OeNMu/rIh5bseA/TNV
 Qc2DAHFuPCI78I7qX6mfuATgdnIR1MVVHoutUW0zAHP8bkHgPtgGsAKNEXaoKjrlvgcT6JxEM5R
 h0/78TK+8HOcH80UEnQ==
X-Proofpoint-GUID: ikoLUpZN3XbaDncYMnu0IJU-3C2XqAN3
X-Proofpoint-ORIG-GUID: ikoLUpZN3XbaDncYMnu0IJU-3C2XqAN3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_013331_303564_3587FD98 
X-CRM114-Status: GOOD (  26.32  )
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

On Wed, Jan 7, 2026 at 4:31=E2=80=AFPM Baochen Qiang
<baochen.qiang@oss.qualcomm.com> wrote:
>
>
>
> On 1/7/2026 4:23 PM, Baochen Qiang wrote:
> >
> >
> > On 1/7/2026 2:02 PM, Qian Zhang wrote:
> >> STA fails to connect to a 6 GHz AP with the following errors:
> >>  ath11k_pci 0000:01:00.0: failed to handle chan list with power type 1
> >>  wlp1s0: deauthenticating from c8:a3:e8:dd:41:e3 by local choice (Reas=
on: 3=3DDEAUTH_LEAVING)
> >>
> >> ath11k_reg_handle_chan_list() treats the update as redundant and
> >> returns -EINVAL. That causes the connection attempt to fail.
> >>
> >> Avoid unnecessary validation during association. Apply the regulatory
> >> redundant check only when the power type is IEEE80211_REG_UNSET_AP,
> >> which only occurs during core initialization.
> >>
> >> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILIC=
ONZ_LITE-3.6510.41
> >>
> >> Signed-off-by: Qian Zhang <qian.zhang@oss.qualcomm.com>
> >> ---
> >>  drivers/net/wireless/ath/ath11k/reg.c | 9 ++++++---
> >>  1 file changed, 6 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/net/wireless/ath/ath11k/reg.c b/drivers/net/wirel=
ess/ath/ath11k/reg.c
> >> index d62a2014315a..8786ca3870fc 100644
> >> --- a/drivers/net/wireless/ath/ath11k/reg.c
> >> +++ b/drivers/net/wireless/ath/ath11k/reg.c
> >> @@ -1,7 +1,7 @@
> >>  // SPDX-License-Identifier: BSD-3-Clause-Clear
> >>  /*
> >>   * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
> >> - * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All right=
s reserved.
> >> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >>   */
> >>  #include <linux/rtnetlink.h>
> >>
> >> @@ -926,8 +926,11 @@ int ath11k_reg_handle_chan_list(struct ath11k_bas=
e *ab,
> >>       */
> >>      if (ab->default_regd[pdev_idx] && !ab->new_regd[pdev_idx] &&
> >>          !memcmp((char *)ab->default_regd[pdev_idx]->alpha2,
> >> -                (char *)reg_info->alpha2, 2))
> >> -            goto retfail;
> >> +                (char *)reg_info->alpha2, 2)) {
> >> +            if (power_type =3D=3D IEEE80211_REG_UNSET_AP)
> >> +                    ath11k_reg_reset_info(reg_info);
> >> +            return 0;
> >> +    }
> >>
> >>      /* Intersect new rules with default regd if a new country setting=
 was
> >>       * requested, i.e a default regd was already set during initializ=
ation
> >>
> >> base-commit: e33fc1c6d54ee1569a57255e11c2978ba9a42ffc
> >
> > Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
>
> Withdraw my above tag as the code has some issues.
>
> We should only return in IEEE80211_REG_UNSET_AP cases. For other types we=
 should go on to
> build a new regdomain.
>
Will fix the issue in a new patch.

Thanks,
Qian
> >
>

