Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D27DC61DFD
	for <ath11k@archiver.kernel.org>; Mon, 31 Aug 2026 18:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HZHW3hkiKEKh+3lY2MSqr02obqLy+h9PcFgQfJDAbMA=; b=0jTuveYAEBeiFuYfCbvBNP41em
	9NXaHmvoln7cmQCkNK/qx9Jm+kH5c19CAcWXA1Nsh/a0x/80E24Sun0G9pY66/RZfuiqpf3neaaoh
	KFKniGvqidGZ4OTK6/Bai7CI35QLvKsosBlL9n7nC2CfWYG7o253enfXBegeaHylrNVdO0oI1EtcN
	lubKFmxVu1SwJ00ZmM0Zay4srnxEivK4jQ1Mc/5iU3ZjAxdnYgTlWBdSC70F1c5xNVY6HMFiimQ/b
	Ckjmu4JUqAm+NFpLvxxjvnMODANvvDUBTiYTUQa0wj7EJk6HzxZZnR/U0KinpfFic17d+cLuhtyhM
	pHwnMhLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x174i-0000000AJVC-3RHO;
	Mon, 31 Aug 2026 18:49:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x174e-0000000AJT3-0NVt
	for ath11k@lists.infradead.org;
	Mon, 31 Aug 2026 18:49:42 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VIXxep3851278
	for <ath11k@lists.infradead.org>; Mon, 31 Aug 2026 18:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HZHW3hkiKEKh+3lY2MSqr0
	2obqLy+h9PcFgQfJDAbMA=; b=YoaCRXvPl7KaDCHPA/qHOt0UcWyYenPzyXi8Wc
	3y8z5ARu+VNYlcdCpPy8xMrMYnaN6gDHEjv0WmHOLNn3SVPKb1cCR+yxf2Tjukeb
	PiW8D0hAAt6N4rGCenhd4KPwNv0YpG3jB1o5BLLse8Qjh5z8QdUWvyQufvGhUpga
	o67WBhKyTeMAtr08pMHLrpapkNGyf+aqyHEMjlhzw+CsVrtPJdKvKn9o0LRsBZMJ
	BJcYap+dSdswlDeyJ4SaaVyxpDRnPK5CmuQgbyjNf5fFWJi1OzVhuzTjc4WlrR5w
	uDruHSUnefLr/vp+SLCBa4eenRgTAMetInoVof5ARSskZSOw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6ayjs8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 31 Aug 2026 18:49:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so113472a91.2
        for <ath11k@lists.infradead.org>; Mon, 31 Aug 2026 11:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788202178; x=1788806978; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HZHW3hkiKEKh+3lY2MSqr02obqLy+h9PcFgQfJDAbMA=;
        b=FhfDAdgcHXETWGU11dPpeltb/1Uqb7FCdsRSaEiUmNyIHkh0YBAIECgEJt9HSj46tK
         AwoB9AxEZC/0+EkF0OVscsD4MsEGpbKiMPZSzjEqPjKDNSwSGcbtGRMFvaV24mFvOZ4m
         oS1KSt+k8CxtA7KeaMGH6f5g+O3nJjbqWk2GfO7M9vHvOZleZCn7Lc8mNShh0q6mTc9Y
         VR+VlZ7PTAc31R0EuGKJKwZVvcst2fb8r4ROojK+OaSTzPyblu6u8mWvNzSFk8VAoAjV
         dGlfae8CfKDJUr5eSJAzMBCzNfWv5bWeHUENSE2RepR1+7BnP70Of1W8KzLlRVmJc0hm
         cdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788202178; x=1788806978;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HZHW3hkiKEKh+3lY2MSqr02obqLy+h9PcFgQfJDAbMA=;
        b=faa3xNRyjcsl/BpFn+YJmFY2v0mGkcXsMvBROb3OAzVsRTf1P01/1d/EEcYE1SRd8O
         ShBChhXMRvnoVqGq5e/6W5NjtzQyyxw1AfGBa+ey3TZUl7Xc8aXQCigPiGG3o/yFehI4
         +cUC1G4u6QACNzZVLikw7jeR2WMr7Y05kRCXHVFllQL1gW52k7QYV5dpbxHSiwOmU1id
         gYhw+qU3v68WyuRldMlL4DMgnjpKY3/2BdvSsfe68CwprV8OfP0hBW5/HsT9kdCHjVAz
         ulhV/Wv3BI/l4/pRAOqpvvvUCrrrF6lhvxfh6CgxaeJ+cZxook819tJ/1D4HrtcHJ0hC
         03XQ==
X-Forwarded-Encrypted: i=1; AKwUvBxA73GS3md3gQ3a5izGaEgHRH1U1AYdNXnKkuwPjtHXKPBM0V4Yt/iepHkBcfHQlKzxYDGeotA=@lists.infradead.org
X-Gm-Message-State: AFuF++k6s6+itc8djxifv9dzcijRB6eV8RA69PAMQ5lrXAVdXrjY8nc2
	H/Vvpp9Pox8uaz37IRai3vH6MVXHpPOlOs4puZEUogUGZMk1ZIMyc1oeTYz0Sw9Unn7H/CvKyUj
	3P0nJXrmi9zq17cYVFViaGmJplXhHB3MoYN6wCTjty/on0Va6BYrmVZJkQdrAI0k6
X-Gm-Gg: AYBFou2kznk4aU4XDCiamNV8Yz40ekLBtyl6j28i/N/4Abt4/E0Zc3D2KVuZgRer52o
	NFz8HKFJMa8NHEyAIbkY4aRN15FGOsM0LB5aITbIjPGcJwImnYLv+iTYqB9cP88aTZqakem4L7/
	6yAITVGHOrXHm4bvTTip56+ZyynUcifHGknsgDel9mfS0wikdjiu5fyRLbaTsP9YOKvmIcThDsI
	qIVeoqYYCU6gcKTYhEzrx0damnb4RUpXFD0onVVnG3daySPCOFlhRi2RoX/6d2aCLHf1/5OnK+f
	PFQfvqzH2GMPymkiQrgfiWmkYSPF5CRXwQXFHioNQjw4Cuoe5aekbKQ25W4Nz0K6z0UL3w3KIdI
	S4sy2q/LVna/sd4yL8Y6KfqbJQTY3OBALoibE
X-Received: by 2002:a17:90b:2d82:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-396d0f2f709mr43742493a91.11.1788202177914;
        Mon, 31 Aug 2026 11:49:37 -0700 (PDT)
X-Received: by 2002:a17:90b:2d82:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-396d0f2f709mr43742416a91.11.1788202177338;
        Mon, 31 Aug 2026 11:49:37 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0bf8a13sm44942268c88.0.2026.08.31.11.49.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 11:49:36 -0700 (PDT)
Message-ID: <a1b69517-a18c-49ba-8ef3-9b5de089eba5@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 11:49:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260831
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE2MiBTYWx0ZWRfX5SzWQIaeW2X6
 A8T4qPMF5q3v9HyiJbMb0tJ00vlt7fIrIV1m1eTJYRm3/CqStm2z+N6BBND2WvoDQl84sNUG3Gt
 3EBi6qA0fvPKM8l0DOfzlDgCjKxGOLQ=
X-Proofpoint-GUID: QUV3elu6raeJ40xmFUVc0kJFF6XluFHj
X-Authority-Analysis: v=2.4 cv=CYE4Irrl c=1 sm=1 tr=0 ts=6a95ccc3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=-bKND4alXjPcxD5Ql1gA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: QUV3elu6raeJ40xmFUVc0kJFF6XluFHj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE2MiBTYWx0ZWRfXytdL2lq/libQ
 EOuAgSzglFFQYzt+PIPYavNQPEmvagwr9fzipBX5DUxNcXjg5ttnoAQ/BiK3kfbJ47BgXnNNthI
 9d+iLe5C1qGvRxsnLHzqIOe4S/WdDprArlYFcHfmvmnmcJgfaMLj4orDHUryH+s+c7w50FCWJSM
 mwJUejLH5l1kwW1a+jmREVK5MlZItaPDUZ8+s7/sPXlp7KiiFo+ky4ELY86BT51OrSLY5mUVxkK
 vYDC1NRb0huzJP926fX0A6u7c0I0RstbMddlDLTtMdRPMQ1TToEhKSQl74rbGeHT5IuLXkrPsjO
 ekuUBmmdC003RY1m3ymLNFQdVqGmvTu7FjAwJSETVF6+UBkE2R2UJshnwgdI/lCwQvGVLvH3w43
 dFOnhI9yJefcpviVSRaR3hqaZzIgGy7SmctvbCAMqVwcxt4xs93ZAWDZXJ8634sbR7GU4FqsNFC
 yIQOQpKaP1jYenPS/Dw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_06,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_114940_284574_098DF6CD 
X-CRM114-Status: GOOD (  10.49  )
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

Hi,
Here's a new pull request for ath10k, ath11k and ath12k firmware.

There are no changes for ath10k or ath11k.

For ath12k, update the QCC2072 hw1.0 firmware to WLAN.COL.1.0.c2-00228.
This version enables Multi-link Operation (MLO).

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------

The following changes since commit e981caea6ed33c48d25b7dbf473327dbd01df163:

  Merge branch 'inf43455' into 'main' (2026-08-31 12:35:31 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260831

for you to fetch changes up to 59005d7898134a2898c5a17f37a9f629a3bc6807:

  ath12k: QCC2072 hw1.0: update to WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1 (2026-08-31 11:44:42 -0700)

----------------------------------------------------------------
Jeff Johnson (1):
      ath12k: QCC2072 hw1.0: update to WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1

 WHENCE                              |   2 +-
 ath12k/QCC2072/hw1.0/firmware-2.bin | Bin 7148724 -> 7148724 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)

